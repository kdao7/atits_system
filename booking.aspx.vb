Imports System.Data
Imports System.Data.SqlClient
Partial Class booking
    Inherits System.Web.UI.Page
    '////////// ALL SUB //////////'
    Sub addType()
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlType, "CourseTypeName", "CourseType_Id")
    End Sub
    Sub addCourse()
        ControlMethod.ddlAddValue("SELECT [Course_Id],[CourseName] FROM [Course] WHERE CourseType_Id = " & ddlType.SelectedValue, ddlCourse, "CourseName", "Course_Id")
    End Sub
    Sub addPrice()
        lblPrice.Text = DBClass.SqlGet("SELECT [Price] FROM [Course] WHERE Course_Id=" & ddlCourse.SelectedValue, "getPrice").Tables(0).Rows(0)(0) & " ฿"
    End Sub
    Function getTypeId(ByVal cid As String) As String
        Return DBClass.SqlGet("SELECT CourseType_Id FROM Course WHERE Course_Id=" & cid, "getTypeId").Tables(0).Rows(0)(0)
    End Function
    Sub getDateStart(ByVal cid As String)
        Dim dt As DataTable = DBClass.SqlGet("SELECT [Class_Id] ,CONVERT(VARCHAR(10),[Class].[Class_Start],105) as Class_Start FROM [Class] WHERE Class_Start > GETDATE() and Course_Id=" & cid, "getStart").Tables(0)
        If dt.Rows.Count = 0 Then
            ddlDateStart.Items.Clear()
            ddlDateStart.Items.Insert(0, New ListItem("ไม่มีการเปิดอบรมหลักสูตรในขณะนี้", [String].Empty))
            ddlDateStart.Enabled = False
            Exit Sub
        Else
            With ddlDateStart
                .DataSource = dt
                .DataTextField = "Class_Start"
                .DataValueField = "Class_Id"
                .DataBind()
                .Items.Insert(0, New ListItem("กรุณาเลือกวันที่เริ่มอบรม", [String].Empty))
                .Enabled = True
            End With
            btnSubmitAdd.Enabled = False
            btnSignin.Enabled = False
        End If
    End Sub
    Sub addBooking()
        Dim strSql As String = "INSERT INTO [Class_Student] ([Class_Id],[S_Id],[Paid],[RegisDate],[Cancel]) VALUES (@ClassId,@SId,@Paid,@Regis,@Cancel)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@ClassId", ddlDateStart.SelectedValue)
        param.AddWithValue("@SId", Session("sid"))
        param.AddWithValue("@Paid", "1")
        param.AddWithValue("@Regis", Date.Today)
        param.AddWithValue("@Cancel", False)
        DBClass.SqlExecute(strSql, param)
    End Sub
    Function pay() As String
        Dim strSql As String = "select MAX(Cs_Id) as csid from Class_Student where S_Id=@sid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@sid", Session("sid"))
        Return DBClass.SqlGet(strSql, "getMax", param).Tables(0).Rows(0)(0).ToString
    End Function
    Sub checkClass(ByVal clid As String)
        Dim strSql As String = "SELECT Class_Id FROM Class_Student WHERE S_Id=@sid and Class_Id = @clid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@sid", Session("sid"))
        param.AddWithValue("@clid", clid)
        Dim dt As DataTable = DBClass.SqlGet(strSql, "get", param).Tables(0)
        If dt.Rows.Count = 0 Then
            btnSubmitAdd.Enabled = True
            btnSignin.Enabled = True
            lblClass.Text = Nothing
        Else
            btnSubmitAdd.Enabled = False
            btnSignin.Enabled = False
            lblClass.Text = "ท่านไม่สามารถทำรายการได้ เนื่องจากท่านได้ จองหรือลงทะเบียน รายการนี้่แล้ว"
        End If
    End Sub
    '////////// END ALL SUB //////////'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim chk As String = ControlMethod.checkLogin(Session)
        If chk <> Nothing Then
            Response.Write(chk)
            Exit Sub
        ElseIf freeValue.fromTable = "lecturer" Then
            Response.Write("<script type='text/javascript'> window.alert('เฉพาะผู้ฝึกอบรมเท่านั้น'); history.back(); </script>")
            Exit Sub
        End If
        addType()
        Dim courseId As String = Request.QueryString("cid")
        If courseId = Nothing Then
            ddlType.Items.Insert(0, New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        Else
            ddlType.SelectedValue = getTypeId(courseId)
            addCourse()
            ddlCourse.SelectedValue = courseId
            addPrice()
            getDateStart(courseId)
        End If
    End Sub

    Protected Sub ddlType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlType.SelectedIndexChanged
        ddlType.Items.Remove(New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        addCourse()
        addPrice()
        getDateStart(ddlCourse.SelectedValue)
    End Sub

    Protected Sub ddlCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCourse.SelectedIndexChanged
        addPrice()
        getDateStart(ddlCourse.SelectedValue)
    End Sub

    Protected Sub ddlDateStart_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDateStart.SelectedIndexChanged
        ddlDateStart.Items.Remove(New ListItem("กรุณาเลือกวันที่เริ่มอบรม", [String].Empty))
        checkClass(ddlDateStart.SelectedValue)
    End Sub

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        addBooking()
        Response.Redirect("courseList.aspx")
    End Sub

    Protected Sub btnSignin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignin.Click
        addBooking()
        Session("csid") = pay()
        Response.Redirect("payment.aspx")
    End Sub
End Class
