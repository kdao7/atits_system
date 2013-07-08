Imports System.Data
Imports System.Data.SqlClient
Partial Class forget
    Inherits System.Web.UI.Page

    Sub forgetPass()
        Dim strSql As String = "SELECT Username,Question,Answer,Email FROM Student WHERE Username=@User and Question=@Ques and Answer=@Ans"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@User", txtUname.Text)
        param.AddWithValue("@Ans", txtAnswer.Text)
        param.AddWithValue("@Ques", ddlQuestion.SelectedValue)
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getQuest", param).Tables(0)
        If dt.Rows.Count = 0 Then
            ControlMethod.ClearTextBox(pForget)
            txtUname.Focus()
            lblX.Visible = True
            pSuccess.Visible = False
            pForget.Visible = True
        Else
            lblX.Visible = False
            pSuccess.Visible = True
            pForget.Visible = False
        End If
    End Sub
    Sub loadJava()
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>textStyle(); showToolTip();</script>", False)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            loadJava()
            Exit Sub
        End If
        loadJava()
        txtUname.Focus()
    End Sub

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        If ControlMethod.NothingTextBox(pForget) = False Then
            Exit Sub
        Else
            forgetPass()
        End If
    End Sub
End Class
