
Partial Class courseHistory
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>tooltip();</script>", False)
        If IsPostBack Then
            Exit Sub
        End If
        Response.Write(ControlMethod.checkLogin(Session))
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim book As Label = CType(e.Row.FindControl("lblStart"), Label)
        Dim csid As Label = CType(e.Row.FindControl("lblCsId"), Label)
        Dim payid As Label = CType(e.Row.FindControl("lblIdPay"), Label)
        Dim imgTax As ImageButton = CType(e.Row.FindControl("imgTax"), ImageButton)
        If Not IsNothing(book) Then
            ControlMethod.changeSqlMonth(book)
        End If
        If Not IsNothing(csid) Then
            imgTax.ImageUrl = ResolveClientUrl("~/admin/report/img/pdf-icon-small.gif")
            imgTax.Enabled = True
            imgTax.ToolTip = "ดาวโหลดใบเสร็จ"
            imgTax.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=tax&id=" & csid.Text) & "';"
        End If
    End Sub
End Class
