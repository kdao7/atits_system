Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_course_delete
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLogin(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        Dim cmd As String = Request.QueryString("cmd")
        Dim rid As String = Request.QueryString("id")
        If cmd = Nothing Or rid = Nothing Then
            Response.Write("<script type='text/javascript'> history.back(); </script>")
        ElseIf cmd = "bookview" Then
            DBClass.SqlExecute("DELETE FROM [Class_Student] WHERE Cs_Id = " & rid)
            Response.Redirect("dataBooking.aspx")
        ElseIf cmd = "bookcancel" Then
            DBClass.SqlExecute("DELETE FROM [Class_Student] WHERE Cs_Id = " & rid)
            Response.Redirect("dataBookingCancel.aspx")
        ElseIf cmd = "signview" Then
            DBClass.SqlExecute("DELETE FROM [Class_Student] WHERE Cs_Id = " & rid)
            Response.Redirect("dataSignin.aspx")
        ElseIf cmd = "signcancel" Then
            DBClass.SqlExecute("DELETE FROM [Class_Student] WHERE Cs_Id = " & rid)
            Response.Redirect("dataSigninCancel.aspx")
        ElseIf cmd = "coursecancel" Then
            DBClass.SqlExecute("DELETE FROM [Class_Student] WHERE Cs_Id = " & rid)
            Response.Redirect(ResolveClientUrl("~/courseList.aspx"))
       End If
    End Sub
End Class
