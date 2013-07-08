Imports System.Data
Imports System.Data.SqlClient
Partial Class alert
    Inherits System.Web.UI.UserControl

    '////////// ALL SUB //////////'
    Sub getBank()
        Dim strSql As String = "SELECT B_Id, B_Name FROM Bank"
        ControlMethod.ddlAddValue(strSql, ddlBank, "B_Name", "B_Id")
        ddlBank.Items.Insert(0, New ListItem("กรุณาเลือกธนาคาร", [String].Empty))
    End Sub
    Sub getDatailBank(ByVal bid As String)
        Dim strSql As String = "SELECT * FROM Bank WHERE B_Id = " & bid
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getBank").Tables(0)
        lblAcc.Text = dt.Rows(0)("B_Acc")
        lblBranch.Text = dt.Rows(0)("B_Branch")
        lblNumber.Text = dt.Rows(0)("B_Number")
    End Sub
    Sub timeAlert(ByVal timer As Integer, ByVal ddl As DropDownList)
        For i As Integer = 0 To timer
            If (i / 10) < 1 Then
                ddl.Items.Add("0" & i.ToString)
            Else
                ddl.Items.Add(i.ToString)
            End If
        Next
    End Sub
    Sub getClass()
        Dim strSql As String = "SELECT Cs_Id, CourseName, CONVERT(VARCHAR(10),Class_Start,105) as Class_Start FROM Class_Student, Class, Course WHERE Class.Class_Id = Class_Student.Class_Id and Course.Course_Id = Class.Course_Id and Class_Start > GETDATE() and S_Id = @sid and Paid = 1 and Cancel = 'False' and DATEDIFF(d,RegisDate,GETDATE()) < 15"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@sid", Session("sid"))
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getClass", param).Tables(0)
        With Me.ddlCourse
            .DataSource = dt
            .DataTextField = "CourseName"
            .DataValueField = "Cs_Id"
            .DataBind()
        End With
        With Me.ddlStart
            .DataSource = dt
            .DataTextField = "Class_Start"
            .DataValueField = "Class_Start"
            .DataBind()
            .Enabled = False
        End With
    End Sub
    Sub addAlert()
        Dim strSql As String = "INSERT INTO [Payment] ([Cs_Id],[Pay_Date],[Pay_Choice],[Chk_Id]) VALUES(@csid,@pDate,@pChoice,@chk)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@csid", ddlCourse.SelectedValue)
        param.AddWithValue("@pDate", txtDate.Text)
        param.AddWithValue("@pChoice", "2")
        param.AddWithValue("@chk", rdoFullHalf())
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        strSql = "INSERT INTO [Alert] ([Student_Acc],[DateTranfer],[TimeTranfer],[Amount],[Cs_Id],[B_Id]) VALUES (@StuAcc,@dTran,@tTran,@Amount,@csid,@bid) UPDATE [Class_Student] SET Paid=2 WHERE Cs_Id=@csid"
        param.AddWithValue("@StuAcc", txtAcc.Text)
        param.AddWithValue("@dTran", txtDate.Text)
        param.AddWithValue("@tTran", ddlHour.SelectedValue & ":" & ddlMinute.SelectedValue)
        param.AddWithValue("@Amount", txtMoney.Text)
        param.AddWithValue("@csid", ddlCourse.SelectedValue)
        param.AddWithValue("@bid", ddlBank.SelectedValue)
        DBClass.SqlExecute(strSql, param)

        Response.Write("<script type='text/javascript'> window.alert('ระบบจะทำการตรวจสอบรายการของท่าน\n\nขอบคุณที่ใช้บริการ'); </script>")
    End Sub
    Function rdoFullHalf() As String
        If rdoFull.Checked Then
            Return "1"
        Else
            Return "2"
        End If
    End Function
    '////////// END ALL SUB //////////'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLogin(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        getBank()
        timeAlert(23, ddlHour)
        ddlHour.Items.Insert(0, New ListItem("เลือกเวลา", [String].Empty))
        timeAlert(59, ddlMinute)
        ddlMinute.Items.Insert(0, New ListItem("เลือกเวลา", [String].Empty))
        getClass()
        If ddlCourse.Items.Count = 0 Then
            btnOk.Enabled = False
        Else
            btnOk.Enabled = True
        End If
    End Sub

    Protected Sub ddlBank_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBank.SelectedIndexChanged
        ddlBank.Items.Remove(New ListItem("กรุณาเลือกธนาคาร", [String].Empty))
        getDatailBank(ddlBank.SelectedValue)
        pDetail.Visible = True
    End Sub

    Protected Sub ddlHour_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHour.SelectedIndexChanged
        ddlHour.Items.Remove(New ListItem("เลือกเวลา", [String].Empty))
    End Sub

    Protected Sub ddlMinute_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlMinute.SelectedIndexChanged
        ddlMinute.Items.Remove(New ListItem("เลือกเวลา", [String].Empty))
    End Sub

    Protected Sub ddlCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCourse.SelectedIndexChanged
        ddlStart.SelectedIndex = ddlCourse.SelectedIndex
    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        If ControlMethod.NothingTextBox(pAlert) = False Then
            Exit Sub
        ElseIf txtAcc.Text.Length < 10 Then
            lblYouAcc.Text = "กรุณากรอกเลขที่บัญชีให้ถูกต้อง"
            txtAcc.Focus()
        ElseIf lblNumber.Text = Nothing Then
            ddlBank.Focus()
        ElseIf Val(txtMoney.Text) <= 0 Then
            lblMoney.Text = "กรุณากรอกจำนวนเงินให้ถูกต้อง"
        ElseIf ddlHour.Items.Count = 25 Then
            lblTime.Text = "กรุณาระบุเวลาให้ถูกต้อง"
            ddlHour.Focus()
        ElseIf ddlMinute.Items.Count = 61 Then
            lblTime.Text = "กรุณาระบุเวลาให้ถูกต้อง"
            ddlMinute.Focus()
        ElseIf txtDate.Text = Nothing Then
            pcDate.Focus()
        Else
            addAlert()
            Response.Redirect("courseList.aspx")
        End If
    End Sub
End Class
