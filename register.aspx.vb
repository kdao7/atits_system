Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Globalization
Partial Class register
    Inherits System.Web.UI.Page
    '////////// ALL SUB //////////'
    Sub checkRegis()
        If rdoLu.Checked = True Then
            Plecturer.Visible = True
            Dim year As String = Date.Today.Year.ToString
            For i As Integer = 1970 To Val(year)
                ddlYearSuccess.Items.Add(i)
            Next
            ddlYearSuccess.SelectedValue = year
        Else
            Plecturer.Visible = False
        End If
    End Sub
    Sub register()
        Dim str As String = "INSERT INTO [Student] ([Username],[Password],[Question],[Answer],[FirstName],[LastName],[Idcard],[Birth],[Gender],[Address],[Province],[City],[District],[Postcode],[Tel],[Mobile],[Email]) " & _
        "VALUES (@User,@Pass,@Ques,@Ans,@FName,@LName,@Idcard,@Birth,@Gender,@Address,@Province,@City,@District,@Postcode,@Tel,@Mobile,@Email)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@User", txtUser.Text)
        param.AddWithValue("@Pass", txtPass.Text)
        param.AddWithValue("@Ques", ddlQuestion.SelectedValue)
        param.AddWithValue("@Ans", txtAns.Text)
        param.AddWithValue("@FName", txtFname.Text)
        param.AddWithValue("@LName", txtLname.Text)
        param.AddWithValue("@Idcard", txtIdCard.Text)
        param.AddWithValue("@Birth", txtBirth.Text)
        param.AddWithValue("@Gender", ddlSex.SelectedValue)
        param.AddWithValue("@Address", txtAddress.Text)
        param.AddWithValue("@Province", ddlProvince.SelectedValue)
        param.AddWithValue("@City", ddlCity.SelectedValue)
        param.AddWithValue("@District", ddlDistrict.SelectedValue)
        param.AddWithValue("@Postcode", ddlPostCode.SelectedValue)
        param.AddWithValue("@Tel", txtTel.Text)
        param.AddWithValue("@Mobile", txtMobile.Text)
        param.AddWithValue("@Email", txtEmail.Text)
        If rdoMember.Checked = True Then
            DBClass.SqlExecute(str, param)
            Dim dt As DataTable = DBClass.SqlGet("SELECT S_Id,Username FROM Student WHERE Username='" & txtUser.Text & "'", "getID").Tables(0)
            Session("username") = dt.Rows(0)("Username")
            Session("position") = "student"
            Session("sid") = dt.Rows(0)("S_Id")
            freeValue.fromTable = "student"
            Response.Write("<script type='text/javascript'> window.alert('สมัครสมาชิกเสร็จสมบูรณ์...'); window.location='profile.aspx'; </script>")
            Exit Sub
        Else
            Dim strLec As String = "INSERT INTO [Lecturer] ([Username],[Password],[Question],[Answer],[FirstName],[LastName],[Idcard],[Birth],[Gender],[Address],[Province],[City],[District],[Postcode],[Tel],[Mobile],[Email],[Qual_degree],[Qual_fromUni],[Qual_branch],[Qual_suc],[Qual_gpa],[Exp_detail],[Exp_course],[Exp_from],[Salary],[Position],[Comfirm]) VALUES (@User,@Pass,@Ques,@Ans,@FName,@LName,@Idcard,@Birth,@Gender,@Address,@Province,@City,@District,@Postcode,@Tel,@Mobile,@Email,@QualDegree,@QualfromUni,@QualBranch,@QualSuc,@QualGpa,@ExpDetail,@ExpCourse,@ExpFrom,@Salary,@Position,@Comfirm)"
            param.AddWithValue("@QualDegree", ddlDegree.SelectedValue)
            param.AddWithValue("@QualGpa", ddlGpa.SelectedValue & "." & txtGpa.Text)
            param.AddWithValue("@QualfromUni", txtFromUni.Text)
            param.AddWithValue("@QualBranch", txtBranch.Text)
            param.AddWithValue("@QualSuc", ddlYearSuccess.SelectedValue)
            param.AddWithValue("@ExpDetail", replaceNull(chkExp, txtExp, ddlYeaExp))
            param.AddWithValue("@ExpCourse", replaceNull(txtCourse.Text))
            param.AddWithValue("@ExpFrom", replaceNull(txtTrainFrom.Text))
            param.AddWithValue("@Salary", txtSalary.Text)
            param.AddWithValue("@Position", "lecturer")
            param.AddWithValue("@Comfirm", False)
            DBClass.SqlExecute(strLec, param)
            Response.Write("<script type='text/javascript'> window.alert('บันทึกข้อมูลแล้ว... กรุณารอการติดต่อกลับจากเจ้าหน้าที่'); window.location='index.aspx'; </script>")
        End If
    End Sub
    Sub checkLenText(ByVal txt As TextBox, ByVal lbl As Label, ByVal str As String, ByVal len As Integer)
        If txt.Text.Length < len Then
            lbl.Text = str
        Else
            lbl.Text = Nothing
        End If
    End Sub
    Sub minmaxDatePopup(ByVal popupDate As RJS.Web.WebControl.PopCalendar)
        Dim year As Integer = Date.Today.Year - 18
        popupDate.To.Date = year.ToString & "-" & Date.Today.Month.ToString & "-" & Date.Today.Day.ToString
        popupDate.From.Date = (year - 60).ToString & "-" & Date.Today.Month.ToString & "-" & Date.Today.Day.ToString
    End Sub
    Sub checkIdCard()
        Dim sum, count As Integer
        sum = 0
        For count = 1 To 12
            sum = sum + Val(Mid(txtIdCard.Text, count, 1)) * (14 - count)
        Next

        If Microsoft.VisualBasic.Right(txtIdCard.Text, 1) <> Microsoft.VisualBasic.Right(Str(11 - (sum Mod 11)), 1) Then
            txtIdCard.Text = Nothing
            lblIdCard.Text = "หมายเลขบัตรประชาชนไม่ถูกต้อง.."
            Exit Sub
        ElseIf DBClass.SqlGet("SELECT Idcard FROM Student WHERE IdCard = '" & txtIdCard.Text & "'", "checkIdCard").Tables(0).Rows.Count = 1 Then
            txtIdCard.Text = Nothing
            lblIdCard.Text = "ไม่สามารถใช้หมายเลขบัตรประชาชนนี้ได้.."
            Exit Sub
        ElseIf DBClass.SqlGet("SELECT Idcard FROM Lecturer WHERE IdCard = '" & txtIdCard.Text & "'", "checkIdCard").Tables(0).Rows.Count = 1 Then
            txtIdCard.Text = Nothing
            lblIdCard.Text = "ไม่สามารถใช้หมายเลขบัตรประชาชนนี้ได้.."
            Exit Sub
        Else
            lblIdCard.Text = Nothing
        End If
    End Sub
    Sub yearSuccess()
        Dim YearSuc As Integer = Date.Today.Year
        For i As Integer = 1 To 42
            ddlYearSuccess.Items.Add(YearSuc.ToString)
            YearSuc = YearSuc - 1
        Next
    End Sub
    Function replaceNull(ByVal x As String) As String
        If x = Nothing Then
            Return DBNull.Value.ToString
        Else
            Return x
        End If
    End Function
    Function replaceNull(ByVal chk As CheckBox, ByVal txt As TextBox, ByVal ddl As DropDownList) As String
        If chk.Checked = True Then
            Return ddl.SelectedValue & " " & txt.Text
        Else
            Return DBNull.Value.ToString
        End If
    End Function
    Sub checkInput()
        If ControlMethod.NothingTextBox(Pmember) = False Then
            Exit Sub
        ElseIf ControlMethod.NothingTextBox(PSystemLogin) = False Then
            Exit Sub
        ElseIf txtIdCard.Text.Length < 13 Then
            txtIdCard.Focus()
            Exit Sub
        ElseIf ddlProvince.SelectedIndex = 0 Then
            ddlProvince.Focus()
            Exit Sub
        ElseIf ddlDistrict.Items.Count = 0 Then
            ddlDistrict.Focus()
            Exit Sub
        ElseIf txtMobile.Text.Length < 10 Then
            txtMobile.Focus()
            Exit Sub
        ElseIf (txtEmail.Text.Contains("@") = 0 Or txtEmail.Text.Contains(".") = 0) Then
            txtEmail.Focus()
            Exit Sub
        ElseIf txtUser.Text.Length < 6 Then
            txtUser.Focus()
            Exit Sub
        ElseIf txtPass.Text <> txtPassComfirm.Text Or (txtPass.Text.Length < 6 And txtPassComfirm.Text.Length < 6) Then
            lblPass.Text = "Password ต้องมีความยาวระหว่าง 6-20 ตัวอักษร"
            txtPass.Focus()
            Exit Sub
        Else
            register()
        End If
    End Sub
    '////////// END ALL SUB //////////'

    Protected Sub rdoLu_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoLu.CheckedChanged
        checkRegis()
        yearSuccess()
    End Sub

    Protected Sub rdoMember_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoMember.CheckedChanged
        checkRegis()
    End Sub

    Protected Sub btnSummit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSummit.Click
        checkInput()
    End Sub
    
    Protected Sub txtIdCard_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtIdCard.TextChanged
        'If txtIdCard.Text = "" OrElse Len(txtIdCard.Text) < 13 Then
        '    lblIdCard.Text = "กรุณากรอกหมายเลขบัตรประชาชนให้ครบทั้ง 13 หลัก"
        '    Exit Sub
        'Else
        '    checkIdCard()
        'End If
    End Sub

    Protected Sub txtEmail_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtEmail.TextChanged
        'If (txtEmail.Text.Contains("@") = 0 Or txtEmail.Text.Contains(".") = 0) Then
        '    lblEmail.Text = "รูปแบบอีเมลล์ไม่ถูกต้อง"
        'ElseIf DBClass.SqlGet("SELECT Email FROM Student WHERE Email = '" & txtEmail.Text & "'", "checkMail").Tables(0).Rows.Count = 1 Then
        '    txtEmail.Text = Nothing
        '    lblEmail.Text = "ไม่สามารถใช้ E-mail นี้ได้.."
        '    Exit Sub
        'ElseIf DBClass.SqlGet("SELECT Email FROM Lecturer WHERE Email = '" & txtEmail.Text & "'", "checkMail").Tables(0).Rows.Count = 1 Then
        '    txtEmail.Text = Nothing
        '    lblEmail.Text = "ไม่สามารถใช้ E-mail นี้ได้.."
        '    Exit Sub
        'Else
        '    lblEmail.Text = Nothing
        'End If
    End Sub

    Protected Sub txtUser_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtUser.TextChanged
        'checkLenText(txtUser, lblUser, "Username ต้องมีความยาวระหว่าง 6-20 ตัวอักษร", 6)
        'If DBClass.SqlGet("SELECT Username FROM Student WHERE Username = '" & txtUser.Text & "'", "checkUser").Tables(0).Rows.Count = 1 Then
        '    txtUser.Text = Nothing
        '    lblUser.Text = "ไม่สามารถใช้ Username นี้ได้.."
        '    Exit Sub
        'ElseIf DBClass.SqlGet("SELECT Username FROM Lecturer WHERE Username = '" & txtUser.Text & "'", "checkUser").Tables(0).Rows.Count = 1 Then
        '    txtUser.Text = Nothing
        '    lblUser.Text = "ไม่สามารถใช้ Username นี้ได้.."
        '    Exit Sub
        'Else
        '    lblUser.Text = Nothing
        '    txtPass.Focus()
        'End If
    End Sub

    Protected Sub txtMobile_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtMobile.TextChanged
        checkLenText(txtMobile, lblMobile, "กรุณากรอกหมายเลขโทรศัพท์ให้ครบ 10 หลัก", 10)
        txtEmail.Focus()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>textStyle(); showToolTip();</script>", False)
            Exit Sub
        End If
        If Session("username") <> Nothing Then
            Response.Redirect("index.aspx")
        End If
        Dim cmd As String = Request.QueryString("r")
        If cmd = "lec" Then
            rdoLu.Checked = True
            checkRegis()
        Else
            rdoMember.Checked = True
            checkRegis()
        End If
        minmaxDatePopup(PopCalendar1)
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>textStyle(); showToolTip();</script>", False)
        txtFname.Focus()
    End Sub

    Protected Sub ddlGpa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlGpa.SelectedIndexChanged
        If ddlGpa.SelectedValue = 4 Then
            txtGpa.Text = "00"
            txtGpa.Enabled = False
        Else
            txtGpa.Text = Nothing
            txtGpa.Focus()
            txtGpa.Enabled = True
        End If
    End Sub

    Protected Sub chkExp_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkExp.CheckedChanged
        If chkExp.Checked = True Then
            txtExp.Visible = True
            ddlYeaExp.Visible = True
            txtExp.Text = Nothing
            ddlYeaExp.Focus()
            lblExp.Text = "กรอกรายละเอียดการทำงาน เช่น ชื่อหรือสถานที่ทำงาน ,ตำแหน่ง ,เงินเดือน"
        Else
            txtExp.Visible = False
            ddlYeaExp.Visible = False
            lblExp.Text = Nothing
        End If
    End Sub

    Protected Sub chkTrain_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkTrain.CheckedChanged
        If chkTrain.Checked = True Then
            PTrain.Visible = True
            txtCourse.Text = Nothing
            txtCourse.Focus()
            txtTrainFrom.Text = Nothing
        Else
            PTrain.Visible = False
        End If
    End Sub

    Protected Sub ddlProvince_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProvince.SelectedIndexChanged
        ddlDistrict.Items.Clear()
        ddlPostCode.Items.Clear()
    End Sub

    Protected Sub btnReset_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReset.Click
        ControlMethod.ClearTextBox(PExp)
        ControlMethod.ClearTextBox(Plecturer)
        ControlMethod.ClearTextBox(Pmember)
        ControlMethod.ClearTextBox(PTel)
        ControlMethod.ClearTextBox(PTrain)
        ControlMethod.NothingTextBox(Pmember)
    End Sub

End Class
