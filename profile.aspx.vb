Imports System.Data
Imports System.Data.SqlClient
Partial Class profile
    Inherits System.Web.UI.Page
    Dim strSelect As String = "SELECT FirstName, LastName, Idcard, Gender, Address, Province, City, District, Postcode, Tel, Mobile, Email FROM "
    Dim sqlWhere As String = " WHERE Username = @user"
    Dim fromTable As String = freeValue.fromTable
    Dim strSql As String = strSelect & fromTable & sqlWhere
    Dim email As String
    '////////// ALL SUB //////////'
    Sub getData()
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@user", Session("username"))
        Dim dt As DataTable = DBClass.SqlGet(strSql, "profile", param).Tables(0)
        txtFname.Text = dt.Rows(0)("FirstName")
        txtLname.Text = dt.Rows(0)("LastName")
        If dt.Rows(0)("Gender") = "M" Then
            lblSex.Text = "ชาย"
        Else
            lblSex.Text = "หญิง"
        End If
        lblIdCard.Text = dt.Rows(0)("Idcard")
        txtAddress.Text = dt.Rows(0)("Address")
        txtTel.Text = dt.Rows(0)("Tel")
        txtMobile.Text = dt.Rows(0)("Mobile")
        txtEmail.Text = dt.Rows(0)("Email")
        email = txtEmail.Text
        getAddress(dt)
    End Sub
    Sub getAddress(ByVal dt As DataTable)
        ddlProvince.SelectedValue = dt.Rows(0)("Province")
        ControlMethod.ddlAddValue("SELECT DISTINCT [Amphur] FROM [PostCode] WHERE ([Province] LIKE '%' + '" & dt.Rows(0)("Province") & "' + '%')", ddlCity, "Amphur", "Amphur")
        ddlCity.SelectedValue = dt.Rows(0)("City")
        ControlMethod.ddlAddValue("SELECT DISTINCT [Tumbon] FROM [PostCode] WHERE ([Amphur] LIKE '%' + '" & dt.Rows(0)("City") & "' + '%')", ddlDistrict, "Tumbon", "Tumbon")
        ddlDistrict.SelectedValue = dt.Rows(0)("District")
        ddlPostcode.Items.Add(dt.Rows(0)("Postcode"))
    End Sub
    Sub updateProfile()
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        Dim strUpdate As String = "UPDATE " & freeValue.fromTable & " SET FirstName =@fname, " & _
        "LastName =@lname, Address =@addr, Province =@prov, City =@city, District =@dist, " & _
        "Postcode =@post, Tel =@tel, Mobile =@mob, Email =@email WHERE Username = @user"
        param.AddWithValue("@fname", txtFname.Text)
        param.AddWithValue("@lname", txtLname.Text)
        param.AddWithValue("@addr", txtAddress.Text)
        param.AddWithValue("@prov", ddlProvince.SelectedValue)
        param.AddWithValue("@city", ddlCity.SelectedValue)
        param.AddWithValue("@dist", ddlDistrict.SelectedValue)
        param.AddWithValue("@post", ddlPostcode.SelectedValue)
        param.AddWithValue("@tel", txtTel.Text)
        param.AddWithValue("@mob", txtMobile.Text)
        param.AddWithValue("@email", txtEmail.Text)
        param.AddWithValue("@user", Session("username"))
        DBClass.SqlExecute(strUpdate, param)
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showUpdate();</script>", False)
        End Sub
    Sub updatePass()
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@user", Session("username"))
        param.AddWithValue("@newpass", txtNewPass.Text)
        DBClass.SqlExecute("UPDATE " & freeValue.fromTable & " SET Password=@newpass WHERE Username = @user", param)
    End Sub
    '////////// END ALL SUB //////////'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim chkLog As String = ControlMethod.checkLogin(Session)
        If chkLog <> Nothing Then
            Response.Write(chkLog)
            Exit Sub
        End If
        getData()
    End Sub

    Protected Sub txtEmail_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtEmail.TextChanged
        If (txtEmail.Text.Contains("@") = 0 Or txtEmail.Text.Contains(".") = 0) Then
            lblEmail.Text = "รูปแบบอีเมลล์ไม่ถูกต้อง"
        ElseIf email = txtEmail.Text Then
            lblEmail.Text = Nothing
            Exit Sub
        ElseIf DBClass.SqlGet("SELECT Email FROM Student WHERE Email = '" & txtEmail.Text & "'", "checkMail").Tables(0).Rows.Count = 1 Then
            txtEmail.Text = Nothing
            lblEmail.Text = "ไม่สามารถใช้ E-mail นี้ได้.."
            Exit Sub
        ElseIf DBClass.SqlGet("SELECT Email FROM Lecturer WHERE Email = '" & txtEmail.Text & "'", "checkMail").Tables(0).Rows.Count = 1 Then
            txtEmail.Text = Nothing
            lblEmail.Text = "ไม่สามารถใช้ E-mail นี้ได้.."
            Exit Sub
        Else
            lblEmail.Text = Nothing
        End If
    End Sub

    Protected Sub txtMobile_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtMobile.TextChanged
        If txtMobile.Text.Length < 10 Then
            lblMobile.Text = "กรุณากรอกหมายเลขโทรศัพท์ให้ครบ 10 หลัก"
        Else
            lblMobile.Text = Nothing
        End If
        txtEmail.Focus()
    End Sub

    Protected Sub btnSummitProfile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSummitProfile.Click
        If ControlMethod.NothingTextBox(Pmember) = False Then
            Exit Sub
        ElseIf (txtEmail.Text.Contains("@") = 0 Or txtEmail.Text.Contains(".") = 0) Then
            lblEmail.Text = "รูปแบบอีเมลล์ไม่ถูกต้อง"
            txtEmail.Focus()
            Exit Sub
        ElseIf txtMobile.Text.Length < 10 Then
            lblMobile.Text = "กรุณากรอกหมายเลขโทรศัพท์ให้ครบ 10 หลัก"
            txtMobile.Focus()
            Exit Sub
        ElseIf ddlDistrict.Items.Count = 0 Then
            ddlCity.Focus()
        End If
        updateProfile()
    End Sub

    Protected Sub btnSummitPass_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSummitPass.Click
        Dim strSql As String = "SELECT Username, Password FROM " & freeValue.fromTable & " WHERE " & _
        "Username=@user and Password=@pass"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@user", Session("username"))
        param.AddWithValue("@pass", txtOldPass.Text)
        Dim dt As DataTable = DBClass.SqlGet(strSql, "chkPass", param).Tables(0)
        If ControlMethod.NothingTextBox(PPass) = False Then
            Exit Sub
        ElseIf txtNewPass.Text.Length < 6 Or txtOldPass.Text.Length < 6 Then
            Exit Sub
        ElseIf dt.Rows.Count = 0 Then
            Exit Sub
        Else
            updatePass()
        End If
    End Sub

    Protected Sub ddlProvince_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProvince.SelectedIndexChanged
        ControlMethod.ddlAddValue("SELECT DISTINCT [Amphur] FROM [PostCode] WHERE ([Province] LIKE '%' + '" & ddlProvince.SelectedValue & "' + '%')", ddlCity, "Amphur", "Amphur")
        ddlDistrict.Items.Clear()
        ddlPostcode.Items.Clear()
    End Sub

    Protected Sub ddlCity_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCity.SelectedIndexChanged
        ControlMethod.ddlAddValue("SELECT DISTINCT [Tumbon] FROM [PostCode] WHERE ([Amphur] LIKE '%' + '" & ddlCity.SelectedValue & "' + '%')", ddlDistrict, "Tumbon", "Tumbon")
        ControlMethod.ddlAddValue("SELECT DISTINCT [Postcode] FROM [PostCode] WHERE ([Amphur] LIKE '%' + '" & ddlCity.SelectedValue & "' + '%')", ddlPostcode, "PostCode", "PostCode")
    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
    '    'Request.Url.GetLeftPart(UriPartial.Authority) + Request.FilePath
    '    'Request.RawUrl.ToString()
    '    'Response.Redirect("profile.aspx?" & Server.UrlEncode("pass=testing"))
    '    'MsgBox(FromBase64(Request.Url.Query))
    'End Sub

    'Sub a()
    '    If Me.fiUpload.HasFile Then

    '        Dim intWidth, intHeight As Integer
    '        Dim UlFileName, NewFileName As String

    '        intWidth = 100 '*** Fix Width ***'
    '        'intHeight = 0   '*** If = 0 Auto Re-Cal Size ***'
    '        intHeight = 120

    '        UlFileName = "MyImages/" & fiUpload.FileName

    '        '*** Save Images ***'
    '        Me.fiUpload.SaveAs(Server.MapPath(UlFileName))

    '        NewFileName = "MyImages/Thumbnail_" & fiUpload.FileName


    '        Dim objGraphic As System.Drawing.Image = System.Drawing.Image.FromFile(Server.MapPath(UlFileName))

    '        Dim objBitmap As Bitmap
    '        '*** Calculate Height ***'
    '        If intHeight > 0 Then
    '            objBitmap = New Bitmap(objGraphic, intWidth, intHeight)
    '        Else
    '            If objGraphic.Width > intWidth Then
    '                Dim ratio As Double = objGraphic.Height / objGraphic.Width
    '                intHeight = ratio * intWidth
    '                objBitmap = New Bitmap(objGraphic, intWidth, intHeight)
    '            Else
    '                objBitmap = New Bitmap(objGraphic)
    '            End If
    '        End If

    '        '*** Save As  ***'
    '        objBitmap.Save(Server.MapPath(NewFileName), objGraphic.RawFormat)

    '        '*** Close ***'
    '        objGraphic.Dispose()

    '        '*** View Images ***'
    '        Me.imgPicture.Visible = True
    '        Me.imgPicture.ImageURL = NewFileName


    '    End If
    'End Sub

End Class
