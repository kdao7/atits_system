
Partial Class admin_course_dataCourse
    Inherits System.Web.UI.Page
    Dim urlView As String = Nothing
    Sub addType()
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlType, "CourseTypeName", "CourseType_Id")
        ddlType.Items.Insert(0, New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        addType()
    End Sub

    Protected Sub ddlType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlType.SelectedIndexChanged
        ddlType.Items.Remove(New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>slideGrid('hideGrid');</script>", False)
        'GridView2.Visible = True
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim cid As Label = CType(e.Row.FindControl("lblCourseId"), Label)
        Dim img As ImageButton = CType(e.Row.FindControl("imgView"), ImageButton)
        If Not IsNothing(cid) Then
            img.OnClientClick = "return location='../../viewCourse.aspx?id=" & cid.Text & "';"
        End If
    End Sub

End Class
