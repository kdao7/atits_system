Imports System.Data

Partial Class calendarCourse
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim chk As String = ControlMethod.checkLogin(Session)
        If chk <> Nothing Then
            Response.Write(chk)
            Exit Sub
        End If
    End Sub

    Protected Sub courseCalendar_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles courseCalendar.DayRender
        Dim strSql As String = "select cl.Class_Start,co.CourseName,co.Course_Id,cl.Class_Id from Class cl,Course co where cl.Class_Start ='" & e.Day.Date.Year.ToString & "-" & e.Day.Date.Month.ToString & "-" & e.Day.Date.Day.ToString & "'  and co.Course_Id = cl.Course_Id"
        Dim dt As DataTable = DBClass.SqlGet(strSql, "get").Tables(0)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                e.Cell.Text = e.Day.Date.Day.ToString & "<br /><a href=viewCourse.aspx?id=" & dt.Rows(i)("Course_Id") & " title='คลิกเพื่อดูรายละเอียดหลักสูตร' >" & dt.Rows(i)("CourseName") & "</a>"
                e.Cell.Font.Bold = True
                If Session("position") = "admin" Then
                    'e.Cell.Text &= "<br /><a href=viewCourse.aspx?id=" & dt.Rows(i)("Class_Id") & " title='คลิกเพื่อแก้ไขตารางอบรม' >[แก้ไข]</a>"
                End If
            Next
        End If
        If e.Day.Date = Date.Today.Date Then
            e.Cell.Text = e.Day.Date.Day.ToString & "<br />[วันนี้]"
        End If
    End Sub
End Class
