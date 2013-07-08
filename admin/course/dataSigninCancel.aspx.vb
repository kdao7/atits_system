
Partial Class admin_course_dataSigninCancel
    Inherits System.Web.UI.Page
    Dim sumReceive As Decimal = 0
    Dim detail As String = Nothing

    Sub allUpdate()
        Dim ddl As DropDownList
        Dim lblCsId As Label
        Dim strSql As String = Nothing
        Dim i As Integer
        For i = 0 To GridView2.Rows.Count - 1
            ddl = GridView2.Rows(i).FindControl("ddlStatus")
            lblCsId = GridView2.Rows(i).FindControl("lblCsId")
            strSql &= "UPDATE [Class_Student] SET [Paid] = '" & ddl.SelectedValue & "' WHERE Cs_Id = '" & lblCsId.Text & "'" & Chr(13)
        Next
        If strSql = Nothing Then
            Exit Sub
        End If
        DBClass.SqlExecute(strSql)
        GridView2.DataBind()
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
        ControlMethod.ddlAddValue("SELECT [Paid],[Status] FROM [PayStatus] WHERE (Paid=3 or Paid=5)", ddlPaid, "Status", "Paid")
        ddlPaid.Items.Insert(0, New ListItem("กรุณาเลือกสถานะการชำระเงิน", [String].Empty))
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim price As Label = CType(e.Row.FindControl("lblReceive"), Label)
        Dim course As Label = CType(e.Row.FindControl("lblCourse"), Label)
        Dim user As Label = CType(e.Row.FindControl("lblUser"), Label)
        Dim csid As Label = CType(e.Row.FindControl("lblCsId"), Label)
        Dim img As ImageButton = CType(e.Row.FindControl("imgDelete"), ImageButton)
        Dim start As Label = CType(e.Row.FindControl("lblStart"), Label)
        If Not IsNothing(price) Then
            price.Text = price.Text & " บาท"
        End If
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
        If Not IsNothing(csid) Then
            detail = "หลักสูตรที่ท่านเลือกคือ : " & course.Text & "\nผู้ลงทะเบียนคือ : " & user.Text & "\n\nยืนยันการลบข้อมูล"
            img.OnClientClick = "if (confirm('" & detail & "')) {location='delete.aspx?cmd=signcancel&id=" & csid.Text & "';} else{return false;}"
        End If
    End Sub

    Protected Sub ddlPaid_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPaid.SelectedIndexChanged
        ddlPaid.Items.Remove(New ListItem("กรุณาเลือกสถานะการชำระเงิน", [String].Empty))
        btnUpdate.Enabled = True
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>slideGrid('hideGrid');</script>", False)
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        allUpdate()
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>slideGrid('hideGrid');</script>", False)
    End Sub

End Class
