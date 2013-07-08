Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_general_addBank
    Inherits System.Web.UI.Page

    Sub addBank()
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        Dim strSql As String = "INSERT INTO [Bank] ([B_Name],[B_Number],[B_Acc],[B_Branch]) VALUES (@bname,@bnum,@bacc,@bbranch)"
        param.AddWithValue("@bname", bankPresented(ddlBankName.SelectedValue))
        param.AddWithValue("@bnum", txtNumber.Text)
        param.AddWithValue("@bacc", txtAccName.Text)
        param.AddWithValue("@bbranch", txtBranch.Text)
        DBClass.SqlExecute(strSql, param)
    End Sub
    Function bankPresented(ByVal bankName As String) As String
        Dim strSql As String = "SELECT B_Name FROM Bank WHERE B_Name like '" & bankName & "%'"
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getBack").Tables(0)
        If dt.Rows.Count = 0 Then
            Return bankName
        Else
            Return bankName & " (" & (dt.Rows.Count + 1).ToString & ")"
        End If
    End Function

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

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        If ControlMethod.NothingTextBox(pBank) = False Then
            Exit Sub
        ElseIf txtNumber.Text.Length < 10 Then
            txtNumber.Focus()
            Exit Sub
        Else
            addBank()
            GridView2.DataBind()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showUpdate();</script>", False)
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim accNum As Label = CType(e.Row.FindControl("lblAccNum"), Label)
        If Not IsNothing(accNum) Then
            accNum.Text = accNum.Text.Substring(0, 3) & "-" & accNum.Text.Substring(3, 1) & "-" & accNum.Text.Substring(4, 5) & "-" & accNum.Text.Substring(9, 1)
        End If
    End Sub
End Class
