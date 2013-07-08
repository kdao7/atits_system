
Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") <> Nothing Then
            Response.Redirect("index.aspx")
        End If
    End Sub
End Class
