Imports System.Data
Imports System.Data.SqlClient
Partial Class viewCourse
    Inherits System.Web.UI.Page

    Sub viewCourse(ByVal id As String)
        Dim dt As DataTable = DBClass.SqlGet("SELECT [Course_Id],[CourseName],[CourseTypeName],[CourseDetail],[Duration],[Price],[File1],[File2],[File3] FROM [Course],[Course_Type] WHERE Course_Type.CourseType_Id = Course.CourseType_Id and Course.Course_Id=" & id, "getCourse").Tables("getCourse")
        lblCourseName.Text = dt.Rows(0)("CourseName")
        lblCourseType.Text = dt.Rows(0)("CourseTypeName")
        lblCourseDetail.Text = dt.Rows(0)("CourseDetail")
        lblCourseDuration.Text = dt.Rows(0)("Duration") & " ชั่วโมง"
        lblCoursePrice.Text = dt.Rows(0)("Price") & " บาท"
        Dim file As String = Nothing
        For i As Integer = 1 To 3
            If IsDBNull(dt.Rows(0)("File" & i)) Then
                Exit For
            Else
                file = file & "- <a href=" & dt.Rows(0)("File" & i) & ">" & System.IO.Path.GetFileName(dt.Rows(0)("File" & i)) & "</a></br>"
            End If
        Next
        lblCourseFile.Text = file
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim id As String = Request.QueryString("id")
        If id = Nothing Then
            Response.Write("<script type='text/javascript'>  history.back(); </script>")
        Else
            viewCourse(id)
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>tooltip();</script>", False)
        End If

    End Sub

    Protected Sub btnBooking_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBooking.Click
        Response.Redirect("booking.aspx?cid=" & Request.QueryString("id").ToString)
    End Sub
End Class
