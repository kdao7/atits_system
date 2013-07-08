
Partial Class admin_Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        If Session("position") = "lecturer" Then
            hlClass.Visible = False
            hlBookDetail.Visible = False
            hlSignin.Visible = False
            hlSigninCancel.Visible = False
            hlAddClass.Visible = False
            hlAddCourse.Visible = False
            hlAddBankTranfer.Visible = False
        End If
    End Sub
End Class
