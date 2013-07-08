Imports System.Data
Imports System.Data.SqlClient
Partial Class alertTranfer
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim chk As String = ControlMethod.checkLogin(Session)
        If chk <> Nothing Then
            Response.Write(chk)
            Exit Sub
        End If
    End Sub
End Class
