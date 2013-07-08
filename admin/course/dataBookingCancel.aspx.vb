
Partial Class admin_course_dataBookingCancel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim cid As Label = CType(e.Row.FindControl("lblCourseId"), Label)
        Dim img As ImageButton = CType(e.Row.FindControl("imgDelete"), ImageButton)
        If Not IsNothing(cid) Then
            img.OnClientClick = "if (confirm('ท่านต้องการลบข้อมูลนี้?')) {location='delete.aspx?cmd=bookcancel&id=" & cid.Text & "';} else{return false;}"
        End If
    End Sub
End Class
