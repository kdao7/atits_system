
Partial Class bookingCancel
    Inherits System.Web.UI.Page
    Dim sumAmount As Decimal = 0
    Dim sumReceive As Decimal = 0
    Dim detail As String = Nothing
    Dim payBack As String = Nothing

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim price As Label = CType(e.Row.FindControl("lblPrice"), Label)
        Dim csId As Label = CType(e.Row.FindControl("lblCsId"), Label)
        Dim book As Label = CType(e.Row.FindControl("lblDateBook"), Label)
        Dim start As Label = CType(e.Row.FindControl("lblDateStart"), Label)
        Dim imgPay As ImageButton = CType(e.Row.FindControl("imgPay"), ImageButton)
        Dim name As Label = CType(e.Row.FindControl("lblCourseName"), Label)
        Dim imgDel As ImageButton = CType(e.Row.FindControl("imgDelete"), ImageButton)
        If Not IsNothing(price) Then
            price.Text = price.Text & " บาท"
        End If
        If Not IsNothing(book) Then
            ControlMethod.changeSqlMonth(book)
        End If
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
        If Not IsNothing(name) Then
            detail = "หลักสูตรที่ท่านต้องการยกเลิก คือ :\n" & name.Text & "\n\nกรุณายืนยันการทำรายการ"
            imgDel.OnClientClick = "return confirm('" & detail & "');"
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            'บวกสะสมค่า
            sumAmount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(4).Text = sumAmount.ToString & " บาท"
        End If
        If Not IsNothing(csId) Then
            imgPay.OnClientClick = "location='payment.aspx?csid=" & csId.Text.ToString & "';"
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim price As Label = CType(e.Row.FindControl("lblReceive"), Label)
        Dim book As Label = CType(e.Row.FindControl("lblStart"), Label)
        Dim course As Label = CType(e.Row.FindControl("lblCourse"), Label)
        Dim status As Label = CType(e.Row.FindControl("lblPaid"), Label)
        Dim sid As Label = CType(e.Row.FindControl("lblChkId"), Label)
        Dim csid As Label = CType(e.Row.FindControl("lblCsId"), Label)
        Dim img As ImageButton = CType(e.Row.FindControl("imgSign"), ImageButton)
        Dim imgTax As ImageButton = CType(e.Row.FindControl("imgTax"), ImageButton)
        If Not IsNothing(price) Then
            price.Text = price.Text & " บาท"
        End If
        If Not IsNothing(book) Then
            ControlMethod.changeSqlMonth(book)
        End If
        If Not IsNothing(status) Then
            If status.Text.ToString = "2" Then
                img.ImageUrl = ResolveClientUrl("~/img/minus-icon-disable.png")
                img.Enabled = False
            ElseIf status.Text.ToString = "3" Then
                imgTax.ImageUrl = ResolveClientUrl("~/admin/report/img/pdf-icon-small.gif")
                imgTax.Enabled = True
                imgTax.ToolTip = "ดาวโหลดใบเสร็จ"
                imgTax.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=tax&id=" & csid.Text) & "';"
            End If
        End If
        If Not IsNothing(course) Then
            If sid.Text = "2" Then
                payBack = "\n\nท่านจะไม่ได้รับเงินคืนในกรณีที่ท่านชำระเงินแบบมัดจำ"
                detail = "หลักสูตรที่ท่านต้องการยกเลิกการลงทะเบียน คือ :\n" & course.Text & payBack & "\n\nกรุณายืนยันการทำรายการ"
                img.OnClientClick = "if (confirm('" & detail & "?')) {location='" & ResolveClientUrl("~/admin/course/delete.aspx?cmd=coursecancel&id=" & csid.Text) & "';} else{return false;}"
            ElseIf sid.Text = "1" Then
                payBack = "\n\nท่านจะได้รับเงินคืนเป็นจำนวน " & (Val(price.Text) / 2).ToString & " บาท"
                detail = "หลักสูตรที่ท่านต้องการยกเลิกการลงทะเบียน คือ :\n" & course.Text & payBack & "\n\nกรุณายืนยันการทำรายการ"
                img.OnClientClick = "return confirm('" & detail & "');"
            End If

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Response.Write(ControlMethod.checkLogin(Session))
    End Sub

End Class
