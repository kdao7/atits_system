Imports System.Data
Partial Class index
    Inherits System.Web.UI.Page
    
    Protected Sub ListView1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles ListView1.ItemDataBound
        If IsPostBack Then
            Exit Sub
        End If
        Dim start As Label = CType(e.Item.FindControl("Class_StartLabel"), Label)
        ControlMethod.changeSqlMonth(start)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strSql As String = "SELECT [e_id],[e_subject],[e_content] FROM [Event]"
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getEvent").Tables(0)
        If dt.Rows.Count > 0 Then
            For i As Integer = 0 To dt.Rows.Count - 1
                lblEvent.Text &= "<p><img alt='' src='img/new_icon.gif' style='width: 30px; height: 10px' /><a href='#' title='คลิกเพื่อดูรายละเอียด'> " & dt.Rows(i)("e_subject").ToString & "</a></p>"
            Next
        End If
    End Sub
End Class
