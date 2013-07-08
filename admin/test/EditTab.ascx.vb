Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_test_EditTab
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTab.SelectedIndexChanged
        Try
            Dim dt As DataTable = DBClass.SqlGet("SELECT Tab_Detail FROM Tab WHERE Tab_Id=" & ddlTab.SelectedValue, "getData").Tables(0)
            EditTab.Html = dt.Rows(0)("Tab_Detail")
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim strSql As String = "UPDATE [Tab] SET [Tab_Detail] = '" & EditTab.Html & "' WHERE Tab_Id=" & ddlTab.SelectedValue
        DBClass.SqlExecute(strSql)
    End Sub

End Class
