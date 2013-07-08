Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_report_checkClass
    Inherits System.Web.UI.Page

    Sub checkClass(ByVal classId As String)
        Dim strSql As String = "SELECT Class_Start  FROM Class WHERE Class_Start > GETDATE() and Class_Id = " & classId
        Dim dt As DataTable = DBClass.SqlGet(strSql, "checkClass").Tables(0)
        If dt.Rows.Count = 0 Then
            Response.Write(True)
        Else
            Response.Write(False)
        End If
    End Sub
    Sub checkIdCard(ByVal idcard As String)
        Dim sum, count As Integer
        sum = 0
        For count = 1 To 12
            sum = sum + Val(Mid(idcard, count, 1)) * (14 - count)
        Next

        If Microsoft.VisualBasic.Right(idcard, 1) <> Microsoft.VisualBasic.Right(Str(11 - (sum Mod 11)), 1) Then
            Response.Write(False)
            Exit Sub
        Else
            Dim ds As DataSet = DBClass.SqlGet("SELECT Idcard FROM Student WHERE IdCard = '" & idcard & "' SELECT Idcard FROM Lecturer WHERE IdCard = '" & idcard & "'", "checkIdCard")
            If ds.Tables(0).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            ElseIf ds.Tables(1).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            Else
                Response.Write(True)
            End If
        End If
    End Sub
    Sub checkEmail(ByVal email As String)
        If (email.Contains("@") = 0 Or email.Contains("@") > 1 Or email.Contains(".") = 0) Then
            Response.Write(False)
        Else
            Dim ds As DataSet = DBClass.SqlGet("SELECT Email FROM Student WHERE Email = '" & email & "' SELECT Email FROM Lecturer WHERE Email = '" & email & "'", "checkMail")
            If ds.Tables(0).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            ElseIf ds.Tables(1).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            Else
                Response.Write(True)
            End If
        End If
    End Sub

    Sub checkUser(ByVal username As String)
        If username.Length < 6 Then
            Response.Write(False)
            Exit Sub
        Else
            Dim ds As DataSet = DBClass.SqlGet("SELECT Username FROM Student WHERE Username = '" & username & "' SELECT Username FROM Lecturer WHERE Username = '" & username & "'", "checkUser")
            If ds.Tables(0).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            ElseIf ds.Tables(1).Rows.Count = 1 Then
                Response.Write(False)
                Exit Sub
            Else
                Response.Write(True)
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmd As String = Request.Form("cmd")
        Dim txt As String = Request.Form("txt")
        If cmd = Nothing Then
            Exit Sub
        ElseIf cmd = "classid" Then
            checkClass(txt)
        ElseIf cmd = "idcard" Then
            checkIdCard(txt)
        ElseIf cmd = "email" Then
            checkEmail(txt)
        ElseIf cmd = "username" Then
            checkUser(txt)
        End If
    End Sub
End Class
