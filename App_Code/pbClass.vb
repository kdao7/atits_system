Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Public Class freeValue
    Public Shared fromTable As String = String.Empty
    Public Shared rePage As String = "<script type='text/javascript'>  window.location='" & VirtualPathUtility.ToAbsolute("~/index.aspx") & "'; </script>"
End Class
Public Class ConnectDB
    'ประกาศ Connection String
    Public Function SqlStrCon() As SqlConnection
        Return New SqlConnection(ConfigurationManager.ConnectionStrings("ConString").ConnectionString)
    End Function
End Class

    'SQLSERVER Class (Select,Insert,Update)
Public Class DBClass
    'SQL Select
    Public Shared Function SqlGet(ByVal sql As String, ByVal tblName As String) As DataSet
        Dim conn As SqlConnection = New ConnectDB().SqlStrCon()
        Dim da As New SqlDataAdapter(sql, conn)
        Dim ds As New DataSet()
        da.Fill(ds, tblName)
        Return ds
    End Function
    'SQL Select แบบมี parameter
    Public Shared Function SqlGet(ByVal sql As String, ByVal tblName As String, ByVal parameters As SqlParameterCollection) As DataSet
        Dim conn As SqlConnection = New ConnectDB().SqlStrCon()
        Dim da As New SqlDataAdapter(sql, conn)
        Dim ds As New DataSet()
        For Each param As SqlParameter In parameters
            da.SelectCommand.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value
        Next
        da.Fill(ds, tblName)
        Return ds
    End Function
    'SQL INSERT UPDATE DELETE
    Public Shared Function SqlExecute(ByVal sql As String) As Integer
        Dim i As Integer
        Dim conn As SqlConnection = New ConnectDB().SqlStrCon()
        Dim cmd As New SqlCommand(sql, conn)
        conn.Open()
        i = cmd.ExecuteNonQuery()
        conn.Close()
        Return i
    End Function
    'SQL INSERT UPDATE DELETE แบบมี parameter
    Public Shared Function SqlExecute(ByVal sql As String, ByVal parameters As SqlParameterCollection) As Integer
        Dim i As Integer
        Dim conn As SqlConnection = New ConnectDB().SqlStrCon()
        Dim cmd As New SqlCommand(sql, conn)
        For Each param As SqlParameter In parameters
            cmd.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value
        Next
        conn.Open()
        i = cmd.ExecuteNonQuery()
        conn.Close()
        Return i
    End Function

    Public Shared Function SqlExcSto(ByVal stpName As String, ByVal tblName As String, ByVal parameters As SqlParameterCollection) As DataSet
        Dim conn As SqlConnection = New ConnectDB().SqlStrCon()
        Dim cmd As New SqlCommand()
        cmd.Connection = conn
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = stpName
        For Each param As SqlParameter In parameters
            cmd.Parameters.AddWithValue(param.ParameterName, param.SqlDbType).Value = param.Value
        Next
        Dim da As New SqlDataAdapter(cmd)
        Dim ds As New DataSet()
        da.Fill(ds, tblName)
        Return ds
    End Function
End Class

Public Class ControlMethod
    'Clear Textbox
    Public Shared Sub ClearTextBox(ByVal root As Control)
        For Each ctrl As Control In root.Controls
            If TypeOf ctrl Is TextBox Then
                CType(ctrl, TextBox).Text = String.Empty
            End If
        Next ctrl
    End Sub
    'ค้นหา Textbox ที่ว่าง
    Public Shared Function NothingTextBox(ByVal root As Control) As Boolean
        For Each ctrl As Control In root.Controls
            'NothingTextBox(ctrl)
            If TypeOf ctrl Is TextBox Then
                If CType(ctrl, TextBox).Text = Nothing Then
                    CType(ctrl, TextBox).Focus() 'เมื่อเจอ Textbox ว่างให้ Cursor Focus ที่ Textbox
                    Return False
                    Exit Function
                End If
            End If
        Next ctrl
        Return True
    End Function
    'Check Login with Session
    Public Shared Function checkLogin(ByVal status As SessionState.HttpSessionState) As String
        If status("username") = Nothing Then
            Return freeValue.rePage
        Else
            Return Nothing
        End If
    End Function

    Public Shared Function checkLecturer(ByVal status As SessionState.HttpSessionState) As String
        If status("username") = Nothing Then
            Return freeValue.rePage
        ElseIf status("position") = Nothing Then
            Return freeValue.rePage
        ElseIf status("position") = "student" Then
            Return freeValue.rePage
        ElseIf status("position") = "lecturer" Or status("position") = "admin" Then
            Return Nothing
        Else
            Return freeValue.rePage
        End If
    End Function

    Public Shared Sub ddlAddValue(ByVal sql As String, ByVal ddl As DropDownList, ByVal TextField As String, ByVal ValueField As String)
        Dim dt As DataTable = DBClass.SqlGet(sql, "getValue").Tables(0)
        With ddl
            .DataSource = dt
            .DataTextField = TextField
            .DataValueField = ValueField
            .DataBind()
        End With
    End Sub

    Public Shared Sub changeSqlMonth(ByVal lbl As Label)
        If lbl.Text.Contains("-01-") Then
            lbl.Text = lbl.Text.Replace("-01-", " ม.ค. ")
        ElseIf lbl.Text.Contains("-02-") Then
            lbl.Text = lbl.Text.Replace("-02-", " ก.พ. ")
        ElseIf lbl.Text.Contains("-03-") Then
            lbl.Text = lbl.Text.Replace("-03-", " มี.ค. ")
        ElseIf lbl.Text.Contains("-04-") Then
            lbl.Text = lbl.Text.Replace("-04-", " เม.ย. ")
        ElseIf lbl.Text.Contains("-05-") Then
            lbl.Text = lbl.Text.Replace("-05-", " พ.ค. ")
        ElseIf lbl.Text.Contains("-06-") Then
            lbl.Text = lbl.Text.Replace("-06-", " มิ.ย. ")
        ElseIf lbl.Text.Contains("-07-") Then
            lbl.Text = lbl.Text.Replace("-07-", " ก.ค. ")
        ElseIf lbl.Text.Contains("-08-") Then
            lbl.Text = lbl.Text.Replace("-08-", " ส.ค. ")
        ElseIf lbl.Text.Contains("-09-") Then
            lbl.Text = lbl.Text.Replace("-09-", " ก.ย. ")
        ElseIf lbl.Text.Contains("-10-") Then
            lbl.Text = lbl.Text.Replace("-10-", " ต.ค. ")
        ElseIf lbl.Text.Contains("-11-") Then
            lbl.Text = lbl.Text.Replace("-11-", " พ.ย. ")
        ElseIf lbl.Text.Contains("-12-") Then
            lbl.Text = lbl.Text.Replace("-12-", " ธ.ค. ")
        End If
    End Sub
    Public Shared Function ThaiBaht(ByVal pAmount As Double) As String
        If pAmount = 0 Then
            Return "ศูนย์บาทถ้วน"
        End If

        Dim _integerValue As String ' จำนวนเต็ม
        Dim _decimalValue As String ' ทศนิยม
        Dim _integerTranslatedText As String ' จำนวนเต็ม ภาษาไทย
        Dim _decimalTranslatedText As String ' ทศนิยมภาษาไทย

        _integerValue = Format(pAmount, "####.00") ' จัด Format ค่าเงินเป็นตัวเลข 2 หลัก
        _decimalValue = Mid(_integerValue, Len(_integerValue) - 1, 2) ' ทศนิยม
        _integerValue = Mid(_integerValue, 1, Len(_integerValue) - 3) ' จำนวนเต็ม

        ' แปลง จำนวนเต็ม เป็น ภาษาไทย
        _integerTranslatedText = NumberToText(CDbl(_integerValue))

        ' แปลง ทศนิยม เป็น ภาษาไทย
        If CDbl(_decimalValue) <> 0 Then
            _decimalTranslatedText = NumberToText(CDbl(_decimalValue))
        Else
            _decimalTranslatedText = ""
        End If

        ' ถ้าไม่มีทศนิม
        If _decimalTranslatedText.Trim = "" Then
            _integerTranslatedText += "บาทถ้วน"
        Else
            _integerTranslatedText += "บาท" & _decimalTranslatedText & "สตางค์"
        End If

        Return _integerTranslatedText
    End Function
    Private Shared Function NumberToText(ByVal pAmount As Double) As String
        ' ตัวอักษร
        Dim _numberText() As String = {"", "หนึ่ง", "สอง", "สาม", "สี่", "ห้า", "หก", "เจ็ด", "แปด", "เก้า", "สิบ"}

        ' หลัก หน่วย สิบ ร้อย พัน ...
        Dim _digit() As String = {"", "สิบ", "ร้อย", "พัน", "หมื่น", "แสน", "ล้าน"}
        Dim _value As String, _aWord As String, _text As String
        Dim _numberTranslatedText As String = ""
        Dim _length, _digitPosition As Integer

        _value = pAmount.ToString
        _length = Len(_value) ' ขนาดของ ข้อมูลที่ต้องการแปลง เช่น 122200 มีขนาด เท่ากับ 6

        For i As Integer = 0 To _length - 1 ' วนลูป เริ่มจาก 0 จนถึง (ขนาด - 1)
            ' ตำแหน่งของ หลัก (digit) ของตัวเลข
            ' เช่น
            ' ตำแหน่งหลักที่0 (หลักหน่วย)
            ' ตำแหน่งหลักที่1 (หลักสิบ)
            ' ตำแหน่งหลักที่2 (หลักร้อย)
            ' ถ้าเป็นข้อมูล i = 7 ตำแหน่งหลักจะเท่ากับ 1 (หลักสิบ)
            ' ถ้าเป็นข้อมูล i = 9 ตำแหน่งหลักจะเท่ากับ 3 (หลักพัน)
            ' ถ้าเป็นข้อมูล i = 13 ตำแหน่งหลักจะเท่ากับ 1 (หลักสิบ)
            _digitPosition = i - (6 * ((i - 1) \ 6))
            _aWord = Mid(_value, Len(_value) - i, 1)
            _text = ""
            Select Case _digitPosition
                Case 0 ' หลักหน่วย
                    If _aWord = "1" And _length > 1 Then
                        ' ถ้าเป็นเลข 1 และมีขนาดมากกว่า 1 ให้มีค่าเท่ากับ "เอ็ด"
                        _text = "เอ็ด"
                    ElseIf _aWord <> "0" Then
                        ' ถ้าไม่ใช่เลข 0 ให้หา ตัวอักษร ใน _numberText()
                        _text = _numberText(CInt(_aWord))
                    End If
                Case 1 ' หลักสิบ
                    If _aWord = "1" Then
                        ' ถ้าเป็นเลข 1 ไม่ต้องมี ตัวอักษร อื่นอีก นอกจากคำว่า "สิบ"
                        '_numberTranslatedText = "สิบ" & _numberTranslatedText
                        _text = _digit(_digitPosition)
                    ElseIf _aWord = "2" Then
                        ' ถ้าเป็นเลข 2 ให้ตัวอักษรคือ "ยี่สิบ"
                        _text = "ยี่" & _digit(_digitPosition)
                    ElseIf _aWord <> "0" Then
                        ' ถ้าไม่ใช่เลข 0 ให้หา ตัวอักษร ใน _numberText() และหาหลัก(digit) ใน _digit()
                        _text = _numberText(CInt(_aWord)) & _digit(_digitPosition)
                    End If
                Case 2, 3, 4, 5 ' หลักร้อย ถึง แสน
                    If _aWord <> "0" Then
                        _text = _numberText(CInt(_aWord)) & _digit(_digitPosition)
                    End If
                Case 6 ' หลักล้าน
                    If _aWord = "0" Then
                        _text = "ล้าน"
                    ElseIf _aWord = "1" And _length - 1 > i Then
                        _text = "เอ็ดล้าน"
                    Else
                        _text = _numberText(CInt(_aWord)) & _digit(_digitPosition)
                    End If
            End Select
            _numberTranslatedText = _text & _numberTranslatedText
        Next

        Return _numberTranslatedText
    End Function

    'Sub listFileAndFolderName()
    '    
    '    Dim myDirInfo As DirectoryInfo
    '    Dim arrFileInfo As Array
    '    Dim arrFolderInfo As Array
    '    Dim myFileInfo As FileInfo
    '    myDirInfo = New DirectoryInfo(Server.MapPath("admin/"))
    '    arrFolderInfo = myDirInfo.GetDirectories
    '    arrFileInfo = myDirInfo.GetFiles("*.*")
    '    For Each myFolderInfo In arrFolderInfo
    '        Me.lblText.Text = Me.lblText.Text & (myFolderInfo.Name & "<br>")
    '    Next myFolderInfo
    '    For Each myFileInfo In arrFileInfo
    '        Me.lblText.Text = Me.lblText.Text & (myFileInfo.Name & "<br>")
    '    Next myFileInfo
    '    myDirInfo = Nothing
    'End Sub

End Class