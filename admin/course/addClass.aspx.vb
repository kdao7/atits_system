Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class lecturer_addClass
    Inherits System.Web.UI.Page
    '////////// ALL SUB //////////'
    Sub getDateStart(ByVal cd As RJS.Web.WebControl.PopCalendar)
        cd.From.Date = Date.Today
    End Sub
    Sub addClass()
        Dim strSql As String = "INSERT INTO [Class] ([Course_Id],[Class_Start],[Class_End],[Class_Min],[Class_Max]) VALUES(@CourseId,@Start,@End,@Min,@Max)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@CourseId", ddlCourse.SelectedValue)
        param.AddWithValue("@Start", txtStart.Text)
        param.AddWithValue("@End", txtEnd.Text)
        param.AddWithValue("@Min", txtMin.Text)
        param.AddWithValue("@Max", txtMax.Text)
        DBClass.SqlExecute(strSql, param)
        Response.Write("<script type='text/javascript'> window.alert('เพิ่มตารางฝึกอบรมเรียบร้อยแล้ว'); window.location='addClass.aspx'; </script>")
    End Sub
    Sub addType()
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlType, "CourseTypeName", "CourseType_Id")
        ddlType.Items.Insert(0, New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
    End Sub
    Sub viewCourse()
        If ddlCourse.SelectedValue <> Nothing Then
            lbViewCourse.Visible = True
            lbViewCourse.OnClientClick = "window.location='" & ResolveClientUrl("~/viewCourse.aspx?id=" & ddlCourse.SelectedValue) & "';"
            Else
            lbViewCourse.Visible = False
        End If
    End Sub
    '////////// END ALL SUB //////////'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            PopCalendarStart.From.Date = Date.Today
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        getDateStart(PopCalendarStart)
        addType()
    End Sub

    Protected Sub PopCalendarStart_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PopCalendarStart.SelectionChanged
        getDateStart(PopCalendarStart)
        PopCalendarEnd.Enabled = True
        txtEnd.Text = Nothing
        PopCalendarEnd.From.Date = PopCalendarStart.SelectedDate
    End Sub

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        If Val(txtMin.Text) > Val(txtMax.Text) Then
            lblMinMax.Visible = True
        Else
            addClass()
            Response.Redirect("dataClass.aspx")
        End If
    End Sub

    Protected Sub ddlType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlType.SelectedIndexChanged
        ControlMethod.ddlAddValue("SELECT [Course_Id],[CourseName] FROM [Course] WHERE CourseType_Id = " & ddlType.SelectedValue, ddlCourse, "CourseName", "Course_Id")
        ddlType.Items.Remove(New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        viewCourse()
    End Sub

    Protected Sub ddlCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCourse.SelectedIndexChanged
        viewCourse()
    End Sub

    Sub sendmail(ByVal msg As String)
        Dim myMail As New MailMessage()
        Dim Cred As New System.Net.NetworkCredential("bassnigro@gmail.com", "thongbor")

        myMail.To.Add("koy.z@hotmail.com,bassnigro@gmail.com")
        myMail.Subject = "Test send mail message"

        myMail.From = New System.Net.Mail.MailAddress("webmaster@atit.com")
        myMail.IsBodyHtml = True
        myMail.Body = msg

        Dim SmtpMail As New System.Net.Mail.SmtpClient("smtp.gmail.com")
        SmtpMail.UseDefaultCredentials = False
        SmtpMail.EnableSsl = True
        SmtpMail.Credentials = Cred
        SmtpMail.Port = 587
        SmtpMail.Send(myMail)

        myMail = Nothing

        MsgBox("Mail Sending.")

    End Sub

End Class

