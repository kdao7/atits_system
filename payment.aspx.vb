Imports System.Data
Imports System.Data.SqlClient
Partial Class payment
    Inherits System.Web.UI.Page
    Dim sumAmount As Decimal = 0
    Dim count As Integer = 0
    '////////// ALL SUB //////////'
    Function getClass() As DataTable
        Dim strSql As String = "SELECT cs.Cs_Id,cl.Class_Id, co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, co.Price FROM Class cl, Course co, Class_Student cs WHERE Paid=1 and Cancel = 'False' and cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and Cs_Id=@csid and S_Id=@sid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@sid", Session("sid"))
        param.AddWithValue("@csid", Session("csid"))
        Return DBClass.SqlGet(strSql, "getData", param).Tables(0)
    End Function
    Sub yearCredit(ByVal year As Integer)
        For i As Integer = 1 To 5
            ddlYear.Items.Add(year)
            year += 1
        Next
    End Sub
    Sub payment()
        Dim strSql As String = "UPDATE [Class_Student] SET Paid=2 WHERE Cs_Id=@csid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@csid", Session("csid"))
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        strSql = "INSERT INTO [Payment] ([Cs_Id],[Pay_Date],[Pay_Choice],[Chk_Id]) VALUES (@csid,@date,@choice,@chk)"
        param.AddWithValue("@csid", Session("csid"))
        param.AddWithValue("@date", Date.Today.ToString)
        param.AddWithValue("@choice", "3")
        param.AddWithValue("@chk", rdoFullHalf())
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        strSql = "INSERT INTO [Credit] ([C_Type],[C_Number],[C_Name],[C_Cvv],[C_ExpDate],[Cs_Id],[Credit_Bank_Id]) VALUES (@type,@number,@name,@cvv,@exp,@csid,@cb)"
        param.AddWithValue("@type", rdoVisaMaster())
        param.AddWithValue("@number", txtNumber.Text)
        param.AddWithValue("@name", txtName.Text)
        param.AddWithValue("@cvv", txtCvv.Text)
        param.AddWithValue("@exp", ddlMonth.SelectedValue & "/" & ddlYear.SelectedValue)
        param.AddWithValue("@csid", Session("csid"))
        param.AddWithValue("@cb", ddlCreditBank.SelectedValue)
        DBClass.SqlExecute(strSql, param)
        param.Clear()
    End Sub
    Sub paySelect()
        If rdoCredit.Checked Then
            pCredit.Visible = True
            pTranfer.Visible = False
        ElseIf rdoTranfer.Checked Then
            pTranfer.Visible = True
            pCredit.Visible = False
        End If
    End Sub
    Function rdoChoice() As String
        If rdoCredit.Checked = True Then
            Return "3"
        Else
            Return "2"
        End If
    End Function
    Function rdoFullHalf() As String
        If rdoFull.Checked Then
            Return "1"
        Else
            Return "2"
        End If
    End Function
    Function rdoVisaMaster() As String
        If rdoVisa.Checked Then
            Return "VISA"
        Else
            Return "MC"
        End If
    End Function
    Sub changeAmount()
        If rdoFull.Checked Then
            txtAmount.Text = (Val(txtAmount.Text) * 2)
        ElseIf rdoHalf.Checked Then
            txtAmount.Text = (Val(txtAmount.Text) / 2)
        End If
    End Sub
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
        Dim csid As String = Request.QueryString("csid")
        If csid = Nothing And Session("csid") = Nothing Then
            Response.Write("<script type='text/javascript'> window.alert('ท่านไม่มีหลักสูตรที่ต้องชำระเงิน!!'); history.back(); </script>")
            Exit Sub
        End If
        If csid <> Nothing Then
            Session("csid") = csid
        End If
        Dim dt As DataTable = getClass()
        txtAmount.Text = dt.Rows(0)("Price").ToString
        If dt.Rows.Count = 0 Then
            Response.Write("<script type='text/javascript'> window.alert('เกิดข้อผิดพลาด!!'); history.back(); </script>")
        Else
            GridView2.DataSource = dt
            GridView2.DataBind()
        End If
        yearCredit(Val(Date.Today.Year))
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim price As Label = CType(e.Row.FindControl("lblPrice"), Label)
        Dim course As Label = CType(e.Row.FindControl("lblCourse"), Label)
        Dim start As Label = CType(e.Row.FindControl("lblStart"), Label)
        If Not IsNothing(price) Then
            price.Text = price.Text & " บาท"
        End If
        If Not IsNothing(course) Then
            course.Text = count.ToString & ". " & course.Text
        End If
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
        If e.Row.RowType = DataControlRowType.DataRow Then
            'บวกสะสมค่า
            sumAmount += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = sumAmount.ToString & " บาท"
        End If
        count += 1
    End Sub

    Protected Sub btnCredit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCredit.Click
        If ControlMethod.NothingTextBox(pCredit) = False Then
            Exit Sub
        ElseIf txtCvv.Text.Length < 3 Then
            txtCvv.Focus()
            Exit Sub
        ElseIf txtNumber.Text.Length < 16 Then
            txtNumber.Focus()
        Else
            payment()
            Session("csid") = Nothing
            Response.Write("<script type='text/javascript'> window.alert('กรุณารอการตรวจสอบรายการบัตรเครดิตของท่าน\n\nขอบคุณที่ใช้บริการ'); </script>")
            Response.Redirect("courseList.aspx")
        End If
    End Sub

    Protected Sub rdoCredit_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoCredit.CheckedChanged
        paySelect()
        rdoFull.Focus()
    End Sub

    Protected Sub rdoFull_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoFull.CheckedChanged, rdoHalf.CheckedChanged
        changeAmount()
    End Sub

    Protected Sub rdoTranfer_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdoTranfer.CheckedChanged, rdoCredit.CheckedChanged
        paySelect()
    End Sub

    Protected Sub btnAlert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlert.Click
        Session("csid") = Nothing
        Response.Redirect("alertTranfer.aspx")
    End Sub

End Class
