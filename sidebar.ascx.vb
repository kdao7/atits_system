Imports System.Data
Imports System.Data.SqlClient
Partial Class sidebar
    Inherits System.Web.UI.UserControl
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim strSelect As String = "SELECT Username, Password"
        Dim sqlWhere As String = " WHERE Username = '" & txtUser.Text & "' and Password = '" & txtPass.Text & "'"
        Dim dt As DataTable = DBClass.SqlGet(strSelect & ", S_Id FROM Student" & sqlWhere, "checkLog").Tables(0)
        If dt.Rows.Count = 1 Then
            InOut(txtUser.Text, "student", dt.Rows(0)("S_Id").ToString)
            freeValue.fromTable = "student"
            Dim re As String = checkBooking(dt.Rows(0)("S_Id").ToString)
            Response.Write(re)
            Exit Sub
        Else
            dt = Nothing
            dt = DBClass.SqlGet(strSelect & ", Position,FirstName,LastName " & "FROM Lecturer" & sqlWhere & " and Comfirm = 'True'", "checkLog").Tables(0)
            If dt.Rows.Count = 1 Then
                InOut(dt.Rows(0)("Username"), dt.Rows(0)("Position"), Nothing)
                Session("Author") = dt.Rows(0)("FirstName").ToString & "  " & dt.Rows(0)("LastName").ToString
                freeValue.fromTable = "lecturer"
                Response.Write("<script type='text/javascript'> location='" & ResolveClientUrl("~/admin") & "'; </script>")
            Else
                lblWrong.Text = "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง.."
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = Nothing Then
            Plogin.Visible = True
        Else
            Plogout.Visible = True
        End If
        If Session("position") = "admin" Or Session("position") = "lecturer" Then
            hlAlert.Visible = False
            hlCancel.Visible = False
            hlBooking.Visible = False
            hlCourseHistory.Visible = False
            Plec.Visible = True
        End If
        If Session("position") = "lecturer" Then
            hlClass.Visible = False
            hlBookDetail.Visible = False
            hlSignin.Visible = False
            hlSigninCancel.Visible = False
            hlAddClass.Visible = False
            hlAddCourse.Visible = False
            hlAddBankTranfer.Visible = False
        End If
    End Sub

    Sub InOut(ByVal status As String, ByVal position As String, ByVal sid As String)
        Session.Timeout = 15
        Session("username") = status
        Session("position") = position
        Session("sid") = sid
    End Sub
    Function checkBooking(ByVal sid As String) As String
        If freeValue.fromTable = "lecturer" Then
            Return "<script type='text/javascript'> window.location='" & ResolveClientUrl("~/profile.aspx") & "'; </script>"
            Exit Function
        Else
            Dim strSql As String = "SELECT Class_Student.*,[Course].CourseName, [Course].Price FROM [Class_Student],[Class] ,[Course] WHERE Paid=1 and [Class_Student].Class_Id = [Class].Class_Id and [Course].Course_Id = [Class].Course_Id and S_Id=@sid and DATEDIFF(d,RegisDate,GETDATE()) < 15"
            Dim param As SqlParameterCollection = New SqlCommand().Parameters
            param.AddWithValue("@sid", sid)
            Dim dt As DataTable = DBClass.SqlGet(strSql, "getBooking", param).Tables(0)
            If dt.Rows.Count = 0 Then
                Return "<script type='text/javascript'> location='" & ResolveClientUrl("~/profile.aspx") & "'; </script>"
                Exit Function
            Else
                Dim alret As String = "ท่านมีรายการที่ยังไม่ได้ชำระเงินจำนวน " & dt.Rows.Count & " รายการ ได้แก่\n"
                For i As Integer = 0 To dt.Rows.Count - 1
                    alret &= "\n" & (i + 1).ToString & ". " & dt.Rows(i)("CourseName") & " เป็นจำนวนเงิน " & dt.Rows(i)("Price") & " บาท"
                Next
                alret &= "\n\nกรุณาชำระเงินภายในวันที่กำหนด ขอบคุณครับ/ค่ะ"
                Return "<script type='text/javascript'> window.alert('" & alret & "'); window.location='profile.aspx'; </script>"
            End If
        End If
    End Function

    Protected Sub courseCalendar_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles courseCalendar.DayRender
        If Plogin.Visible = False Then
            Exit Sub
        End If
        Dim strSql As String = "select co.CourseName,cl.Class_Start,co.Course_Id,cl.Class_Id from Class cl,Course co where cl.Class_Start ='" & e.Day.Date.Year.ToString & "-" & e.Day.Date.Month.ToString & "-" & e.Day.Date.Day.ToString & "'  and co.Course_Id = cl.Course_Id"
        Dim dt As DataTable = DBClass.SqlGet(strSql, "get").Tables(0)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                e.Cell.Text = "<a href=viewCourse.aspx?id=" & dt.Rows(i)("Course_Id") & " title='" & dt.Rows(i)("CourseName") & "' >" & e.Day.Date.Day.ToString & "</a>"
                e.Cell.Font.Bold = True
            Next
        End If
    End Sub
End Class
