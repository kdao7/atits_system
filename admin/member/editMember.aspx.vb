Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_member_editMember
    Inherits System.Web.UI.Page
    Dim user As String = Nothing
    Dim email As String = Nothing

    Sub updateProfile()
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        Dim strUpdate As String = "UPDATE Student SET FirstName =@fname, " & _
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
        param.AddWithValue("@user", Session("user"))
        DBClass.SqlExecute(strUpdate, param)
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showUpdate();</script>", False)
    End Sub
    Sub getAddress(ByVal dt As DataTable)
        ddlProvince.SelectedValue = dt.Rows(0)("Province")
        ControlMethod.ddlAddValue("SELECT DISTINCT [Amphur] FROM [PostCode] WHERE ([Province] LIKE '%' + '" & dt.Rows(0)("Province") & "' + '%')", ddlCity, "Amphur", "Amphur")
        ddlCity.SelectedValue = dt.Rows(0)("City")
        ControlMethod.ddlAddValue("SELECT DISTINCT [Tumbon] FROM [PostCode] WHERE ([Amphur] LIKE '%' + '" & dt.Rows(0)("City") & "' + '%')", ddlDistrict, "Tumbon", "Tumbon")
        ddlDistrict.SelectedValue = dt.Rows(0)("District")
        ddlPostcode.Items.Add(dt.Rows(0)("Postcode"))
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim sex As Label = CType(e.Row.FindControl("lblSex"), Label)
        Dim phone As Label = CType(e.Row.FindControl("lblPhone"), Label)
        If Not IsNothing(sex) Then
            If sex.Text = "F" Then
                sex.Text = "หญิง"
            Else
                sex.Text = "ชาย"
            End If
        End If
        If Not IsNothing(phone) Then
            Dim num1 As String = phone.Text.Substring(0, 3)
            Dim num2 As String = phone.Text.Substring(3, 7)
            phone.Text = num1 & "-" & num2
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        user = Me.GridView2.SelectedRow.Cells(1).Text
        Session("user") = user
        If Not String.IsNullOrEmpty(user) Then
            Dim dt As DataTable = DBClass.SqlGet("SELECT * FROM Student WHERE UserName='" & user & "'", "getMember").Tables(0)
            txtFname.Text = dt.Rows(0)("FirstName")
            txtLname.Text = dt.Rows(0)("LastName")
            If dt.Rows(0)("Gender") = "M" Then
                lblSex0.Text = "ชาย"
            Else
                lblSex0.Text = "หญิง"
            End If
            lblIdCard.Text = dt.Rows(0)("Idcard")
            txtAddress.Text = dt.Rows(0)("Address")
            txtTel.Text = dt.Rows(0)("Tel")
            txtMobile.Text = dt.Rows(0)("Mobile")
            txtEmail.Text = dt.Rows(0)("Email")
            email = txtEmail.Text
            ddlPostcode.Items.Clear()
            getAddress(dt)
            'pProfile.Visible = True
        End If
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
        If Session("position") <> "admin" Then
            btnSummitProfile.Visible = False
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
        If ControlMethod.NothingTextBox(pProfile) = False Then
            Exit Sub
        ElseIf txtMobile.Text.Length < 10 Then
            lblMobile.Text = "กรุณากรอกหมายเลขโทรศัพท์ให้ครบ 10 หลัก"
            txtMobile.Focus()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>checkMobile('" & txtMobile.ClientID & "');</script>", False)
            Exit Sub
        ElseIf ddlDistrict.Items.Count = 0 Then
            ddlCity.Focus()
        End If
        updateProfile()
        GridView2.DataBind()
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
End Class
