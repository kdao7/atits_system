Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_general_dataPayment
    Inherits System.Web.UI.Page

    Sub updatePayment()
        Dim strSql As String = "UPDATE [Payment] SET Chk_Id=1 WHERE Pay_Id=@payid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@payid", Session("pid"))
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        strSql = "UPDATE [Class_Student] SET Paid=3 WHERE Cs_Id=@csid"
        param.AddWithValue("@csid", Session("csid"))
        DBClass.SqlExecute(strSql, param)
        param.Clear()
        Session("csid") = Nothing
        Session("pid") = Nothing
    End Sub
    Function changeMonth(ByVal start As String) As String
        If start.Contains("-01-") Then
            start = start.Replace("-01-", " ม.ค. ")
        ElseIf start.Contains("-02-") Then
            start = start.Replace("-02-", " ก.พ. ")
        ElseIf start.Contains("-03-") Then
            start = start.Replace("-03-", " มี.ค. ")
        ElseIf start.Contains("-04-") Then
            start = start.Replace("-04-", " เม.ย. ")
        ElseIf start.Contains("-05-") Then
            start = start.Replace("-05-", " พ.ค. ")
        ElseIf start.Contains("-06-") Then
            start = start.Replace("-06-", " มิ.ย. ")
        ElseIf start.Contains("-07-") Then
            start = start.Replace("-07-", " ก.ค. ")
        ElseIf start.Contains("-08-") Then
            start = start.Replace("-08-", " ส.ค. ")
        ElseIf start.Contains("-09-") Then
            start = start.Replace("-09-", " ก.ย. ")
        ElseIf start.Contains("-10-") Then
            start = start.Replace("-10-", " ต.ค. ")
        ElseIf start.Contains("-11-") Then
            start = start.Replace("-11-", " พ.ย. ")
        ElseIf start.Contains("-12-") Then
            start = start.Replace("-12-", " ธ.ค. ")
        End If
        Return start
    End Function
    Function amountPay(ByVal chkid As String, ByVal price As String) As String
        If chkid = 1 Then
            btnPaid.Enabled = False
            Return "-"
        Else
            Return (Val(price) / 2).ToString
        End If
    End Function
    Sub getUser(ByVal idcard As String)
        Dim strSql As String = "SELECT cs.Cs_Id,cl.Class_Id, co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, CONVERT(VARCHAR(10),cs.RegisDate,105) as RegisDate,co.Price,st.Username FROM Class cl, Course co, Class_Student cs,Student st WHERE Paid=1 and Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and cl.Class_Start > GETDATE() and st.Idcard=@idcard"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@idcard", idcard)
        Dim dt As DataTable = DBClass.SqlGet(strSql, "getUser", param).Tables(0)
        GridView1.DataSource = dt
        GridView1.DataBind()
        GridView1.Visible = True

        dt = Nothing
        strSql = "SELECT cs.Cs_Id,co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start,ps.Paid, ps.Status, pc.Chk_Detail, pc.Chk_Id,CASE ps.Paid WHEN 2 THEN co.Price WHEN 4 THEN co.Price / 2 END as Price, pm.Pay_Id FROM Class cl, Course co, Class_Student cs, PayStatus ps, Payment pm, Payment_Check pc,Student st WHERE cs.Paid = ps.Paid and Cancel = 'False' and cs.Class_Id = cl.Class_Id and (ps.Paid = 2 or ps.Paid = 4) and co.Course_Id = cl.Course_Id  and cl.Class_Start > GETDATE() and st.S_Id = cs.S_Id and pm.Cs_Id = cs.Cs_Id and pm.Chk_Id = pc.Chk_Id and st.Idcard = '" & idcard & "'"
        dt = DBClass.SqlGet(strSql, "getUser").Tables(0)
        GridView2.DataSource = dt
        GridView2.DataBind()
        GridView2.Visible = True
        param.Clear()
        strSql = Nothing
    End Sub
    Sub PayCash()
        Dim strSql As String = "UPDATE [Class_Student] SET Paid=3 WHERE Cs_Id=@csid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@csid", Session("csid"))
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        strSql = "INSERT INTO [Payment] ([Cs_Id],[Pay_Date],[Pay_Choice],[Chk_Id]) VALUES (@csid,@date,@choice,@chk)"
        param.AddWithValue("@csid", Session("csid"))
        param.AddWithValue("@date", Date.Today.ToString)
        param.AddWithValue("@choice", "1")
        param.AddWithValue("@chk", "1")
        DBClass.SqlExecute(strSql, param)
        param.Clear()

        Session("csid") = Nothing
    End Sub
    Function checkIdCard() As Boolean
        Dim sum, count As Integer
        sum = 0
        For count = 1 To 12
            sum = sum + Val(Mid(txtIdCard.Text, count, 1)) * (14 - count)
        Next

        If Microsoft.VisualBasic.Right(txtIdCard.Text, 1) <> Microsoft.VisualBasic.Right(Str(11 - (sum Mod 11)), 1) Then
            txtIdCard.Text = Nothing
            lblIdCard.Text = "หมายเลขบัตรประชาชนไม่ถูกต้อง.."
            Return False
        Else
            lblIdCard.Text = Nothing
            Return True
        End If
    End Function
    Sub Paid()
        pPayment.Visible = False
        GridView1.Visible = False
        GridView2.Visible = False
        txtIdCard.Text = Nothing
        txtIdCard.Focus()
    End Sub
    Sub hideGrid()
        GridView1.Visible = False
        GridView2.Visible = False
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
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>addClass();</script>", False)
        txtIdCard.Focus()
    End Sub

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPaid.Click
        updatePayment()
        getUser(txtIdCard.Text)
        pPayment.Visible = False
    End Sub

    Protected Sub btnIdCard_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIdCard.Click
        If txtIdCard.Text = Nothing Then
            lblIdCard.Text = "หมายเลขบัตรประชาชนไม่ถูกต้อง.."
            hideGrid()
            txtIdCard.Focus()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showWrongIdCard();</script>", False)
            Exit Sub
        ElseIf txtIdCard.Text.Length < 13 Then
            lblIdCard.Text = "หมายเลขบัตรประชาชนไม่ถูกต้อง.."
            hideGrid()
            txtIdCard.Focus()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showWrongIdCard();</script>", False)
            Exit Sub
        ElseIf checkIdCard() = False Then
            hideGrid()
            txtIdCard.Focus()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showWrongIdCard();</script>", False)
            Exit Sub
        Else
            getUser(txtIdCard.Text)
            pPayment.Visible = False
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        Dim start As Label = CType(e.Row.FindControl("lblStart"), Label)
        Dim regis As Label = CType(e.Row.FindControl("lblRegis"), Label)
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
        If Not IsNothing(regis) Then
            ControlMethod.changeSqlMonth(regis)
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim csid As String = Me.GridView1.SelectedRow.Cells(1).Text
        Session("csid") = csid
        If Not String.IsNullOrEmpty(csid) Then
            Dim dt As DataTable = DBClass.SqlGet("SELECT cs.Cs_Id,cl.Class_Id, co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, CONVERT(VARCHAR(10),cs.RegisDate,105) as RegisDate,co.Price,st.Username FROM Class cl, Course co, Class_Student cs,Student st WHERE Paid=1 and Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and cl.Class_Start > GETDATE() and cs.Cs_Id=" & csid, "getMember").Tables(0)
            lblCourse.Text = dt.Rows(0)("CourseName")
            lblStart.Text = changeMonth(dt.Rows(0)("Class_Start"))
            lblAmount.Text = dt.Rows(0)("Price") & " บาท"
            pPayment.Visible = True
            btnPaid.Visible = False
            btnCash.Visible = True
        End If
    End Sub

    Protected Sub btnCash_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCash.Click
        PayCash()
        getUser(txtIdCard.Text)
        pPayment.Visible = False
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim start As Label = CType(e.Row.FindControl("lblStart0"), Label)
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Dim csid As String = Me.GridView2.SelectedRow.Cells(1).Text
        Session("csid") = csid
        If Not String.IsNullOrEmpty(csid) Then
            Dim dt As DataTable = DBClass.SqlGet("select CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start,pm.Pay_Id from Class cl,Class_Student cs,Payment pm where cs.Class_Id = cl.Class_Id and cs.Cs_Id = pm.Cs_Id and cs.Cs_Id =" & csid, "getMember").Tables(0)
            lblCourse.Text = Me.GridView2.SelectedRow.Cells(2).Text
            lblStart.Text = changeMonth(dt.Rows(0)("Class_Start"))
            lblAmount.Text = Me.GridView2.SelectedRow.Cells(4).Text & " บาท"
            Session("pid") = dt.Rows(0)("Pay_Id")
            pPayment.Visible = True
            btnPaid.Visible = True
            btnCash.Visible = False
        End If
    End Sub
End Class
