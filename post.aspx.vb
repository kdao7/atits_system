Imports System.Data
Imports System.Data.SqlClient
Partial Class post
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmd As String = Request.Form("cmd")
        Dim data As String = Request.Form("data")
        Dim img As String = "<img alt='arrow' src='Scripts/images/arrow-tip.png' />"
        Response.Write(img)
        If cmd = "email" Then
            Response.Write(email(data))
        End If
    End Sub

    Function email(ByVal data As String) As String
        If (data.Contains("@") = 0 Or data.Contains(".") = 0) Then
            Return "รูปแบบอีเมลล์ไม่ถูกต้อง"
        ElseIf DBClass.SqlGet("SELECT Email FROM Student WHERE Email = '" & data & "'", "checkMail").Tables(0).Rows.Count = 1 Then
            Return "ไม่สามารถใช้อีเมลล์นี้ได้"
        ElseIf DBClass.SqlGet("SELECT Email FROM Lecturer WHERE Email = '" & data & "'", "checkMail").Tables(0).Rows.Count = 1 Then
            Return "ไม่สามารถใช้อีเมลล์นี้ได้"
        Else
            Return "ท่านสามารถใช้อีเมลล์นี้ได้"
        End If
    End Function
End Class
