
Partial Class admin_general_dataAlert
    Inherits System.Web.UI.Page
    Dim sumAmount As Decimal = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        txtDate.Text = Date.Today.Date
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim Tdate As Label = CType(e.Row.FindControl("lblDate"), Label)
        Dim Adate As Label = CType(e.Row.FindControl("lblDateAdd"), Label)
        If Not IsNothing(Tdate) Then
            ControlMethod.changeSqlMonth(Tdate)
        End If
        If Not IsNothing(Adate) Then
            ControlMethod.changeSqlMonth(Adate)
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            'บวกสะสมค่า
            sumAmount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Amount"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(5).Text = sumAmount.ToString & " บาท"
        End If
    End Sub

End Class
