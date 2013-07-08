Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportMemberPerCourse
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "MemberSigninCourseReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub checkDt(ByVal a As Boolean)
        MemberSigninCourse.Visible = Not a
        lblNone.Visible = a
        img(Not a)
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
    End Sub
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            MemberSigninCourse.ReportSource = repDoc
            MemberSigninCourse.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Function getAllCourseList() As String
        Dim value As String = Nothing
        If ddlCourse.SelectedValue = "0" Then
            For i As Integer = 1 To ddlCourse.Items.Count - 1
                ddlCourse.SelectedIndex = i
                If i < (ddlCourse.Items.Count - 1) Then
                    value &= "Course.Course_Id =" & ddlCourse.SelectedValue & " or "
                Else
                    value &= "Course.Course_Id =" & ddlCourse.SelectedValue
                End If
            Next
            ddlCourse.SelectedIndex = 0
            Return value
        Else
            Return "Course.Course_Id = " & ddlCourse.SelectedValue
        End If
    End Function
    Sub checkboxClass()
        Dim chk As CheckBox
        Dim i As Integer
        Dim count As Integer = 0
        Dim strSql, where As String
        For i = 0 To GridView2.Rows.Count - 1
            chk = GridView2.Rows(i).FindControl("chkClassId")
            If i > 0 Then
                where &= " or "
            End If
            If chk.Checked Then
                where &= "cl.Class_Id = " & chk.Text
                count += 1
            End If
        Next
        If count = 0 Then
            showError()
        Else
            strSql = "SELECT st.FirstName,st.LastName,co.CourseName,CASE SUBSTRING(CONVERT(VARCHAR(10),Class_Start,105),3,4) WHEN '-01-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ม.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-02-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ก.พ. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-03-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' มี.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-04-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' เม.ษ. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-05-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' พ.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-06-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' มิ.ย. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-07-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ก.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-08-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ส.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-09-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ก.ย. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-10-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ต.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-11-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' พ.ย. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) WHEN '-12-' THEN CONVERT(VARCHAR(2),Class_Start,105) + ' ธ.ค. '+ CONVERT(VARCHAR(4),YEAR(Class_Start)+ 543,111) END as Class_Start FROM Class_Student cs,Course co,Class cl,Student st WHERE co.Course_Id = cl.Course_Id and cs.Class_Id = cl.Class_Id and st.S_Id = cs.S_Id and (" & where & ") ORDER BY co.CourseName"
            Dim dt As DataTable = DBClass.SqlGet(strSql, "getClass").Tables(0)
            If dt.Rows.Count = 0 Then
                checkDt(True)
            Else
                checkDt(False)
                imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=MemberSigninCourseReport';")
                imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=MemberSigninCourseReport';")
                imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=MemberSigninCourseReport';")
                Session("ReportDataTable") = strSql
                showReport(dt)
            End If
        End If
    End Sub
    Sub showReport(ByVal dt As DataTable)
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Try
            rpt.Load(root & "admin/report/file/reportMemberPerCourse.rpt")
            rpt.SetDataSource(dt)
            rpt.SetParameterValue("author", Session("Author"))
            Session("ReportSource") = rpt
            MemberSigninCourse.ReportSource = rpt
            MemberSigninCourse.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub showError()
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>showError('กรุณาเลือกหลักสูตรที่ท่านต้องการดูข้อมูล');</script>", False)
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsPostBack Then
            refreshReport()
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
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlType, "CourseTypeName", "CourseType_Id")
        ddlType.Items.Insert(0, New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
    End Sub

    Protected Sub imgPdf_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgPdf.Click
        'export(5)
    End Sub

    Protected Sub imgDoc_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgDoc.Click
        'export(3)
    End Sub

    Protected Sub imgXls_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgXls.Click
        'export(4)
    End Sub

    Protected Sub ddlType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlType.SelectedIndexChanged
        ddlType.Items.Remove(New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        ControlMethod.ddlAddValue("SELECT [Course_Id],[CourseName] FROM [Course] WHERE CourseType_Id = " & ddlType.SelectedValue, ddlCourse, "CourseName", "Course_Id")
        ddlCourse.Items.Insert(0, New ListItem("ทั้งหมด", "0"))
        btnOk.Enabled = True
        GridView2.Visible = False
        MemberSigninCourse.Visible = False
        btnViewReport.Visible = False
    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Dim strSql As String = "SELECT Class_Id,Course.CourseName,CONVERT(VARCHAR(10),Class_Start,105) as Class_Start,CONVERT(VARCHAR(10),Class_End,105) as Class_End FROM Class ,Course WHERE Class.Course_Id = Course.Course_Id and (" & getAllCourseList() & ") ORDER BY Class_Id DESC"
        Try
            Dim dt As DataTable = DBClass.SqlGet(strSql, "getClass").Tables(0)
            With GridView2
                .DataSource = dt
                .DataBind()
                .Visible = True
            End With
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>pageEvent();</script>", False)
            btnViewReport.Visible = True
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim start As Label = CType(e.Row.FindControl("lblStart"), Label)
        Dim dateEnd As Label = CType(e.Row.FindControl("lblEnd"), Label)
        If Not IsNothing(start) Then
            ControlMethod.changeSqlMonth(start)
        End If
        If Not IsNothing(dateEnd) Then
            ControlMethod.changeSqlMonth(dateEnd)
        End If
    End Sub

    Protected Sub btnViewReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnViewReport.Click
        checkboxClass()
    End Sub

End Class
