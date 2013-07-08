Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_test_showTab
    Inherits System.Web.UI.UserControl

    Sub getTab()
        Dim dt As DataTable = DBClass.SqlGet("SELECT Tab_Subject,Tab_Detail  FROM Tab", "getTab").Tables(0)
        Response.Write("<div id='Tab1' class='TabbedPanels'>")
        Response.Write("<ul class='TabbedPanelsTabGroup'>")
        For i As Integer = 0 To dt.Rows.Count - 1
            Response.Write("<li class='TabbedPanelsTab' tabindex='0'>" & dt.Rows(i)("Tab_Subject").ToString & "</li>")
        Next
        Response.Write("</ul>")
        Response.Write("<div class='TabbedPanelsContentGroup'>")
        For i As Integer = 0 To dt.Rows.Count - 1
            Response.Write("<div class='TabbedPanelsContent'>" & dt.Rows(i)("Tab_Detail").ToString & "</div>")
        Next
        Response.Write("</div>")
        Response.Write("</div>")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        getTab()
    End Sub
End Class
