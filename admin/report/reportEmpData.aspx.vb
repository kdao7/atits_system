Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportEmpData
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "EmployeesDataReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
        EmpDataReport.Visible = a
        lblNone.Visible = Not a
    End Sub
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            EmpDataReport.ReportSource = repDoc
            EmpDataReport.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
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
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsPostBack Then
            refreshReport()
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim sex As Label = CType(e.Row.FindControl("lblSex"), Label)
        Dim position As Label = CType(e.Row.FindControl("lblPosition"), Label)
        Dim salary As Label = CType(e.Row.FindControl("lblSalary"), Label)
        If Not IsNothing(sex) Then
            If sex.Text = "F" Then
                sex.Text = "หญิง"
            Else
                sex.Text = "ชาย"
            End If
        End If
        If Not IsNothing(position) Then
            If position.Text = "admin" Then
                position.Text = "ผู้ดูแลระบบ"
            Else
                position.Text = "วิทยากร"
            End If
        End If
        If Not IsNothing(salary) Then
            If (salary.Text.Length / 3) < 2 Then
                salary.Text = salary.Text.Insert(2, ",") & " บาท"
            Else
                salary.Text = salary.Text.Insert(3, ",") & " บาท"
            End If
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Dim lecId As Integer = Me.GridView2.SelectedRow.RowIndex
        Dim lblLecId As Label
        If Not String.IsNullOrEmpty(lecId) Then
            lblLecId = GridView2.Rows(lecId).FindControl("lblLecturerId")
            Try
                Dim strSql As String = "SELECT FirstName + '  ' + LastName as Name,CASE SUBSTRING(CONVERT(VARCHAR(10),Birth,105),3,4) WHEN '-01-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ม.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-02-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ก.พ. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-03-' THEN CONVERT(VARCHAR(2),Birth,105) + ' มี.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-04-' THEN CONVERT(VARCHAR(2),Birth,105) + ' เม.ษ. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-05-' THEN CONVERT(VARCHAR(2),Birth,105) + ' พ.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-06-' THEN CONVERT(VARCHAR(2),Birth,105) + ' มิ.ย. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-07-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ก.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-08-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ส.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-09-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ก.ย. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-10-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ต.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-11-' THEN CONVERT(VARCHAR(2),Birth,105) + ' พ.ย. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) WHEN '-12-' THEN CONVERT(VARCHAR(2),Birth,105) + ' ธ.ค. '+ CONVERT(VARCHAR(4),YEAR(Birth)+ 543,111) END as Birth,CASE Gender WHEN 'M' THEN 'ชาย' ELSE 'หญิง' END as Gender,Address + ' ต. ' + District + ' อ. ' + City + ' จ. ' + Province + ' ' + Postcode as [Address],SUBSTRING(Tel,1,3) + '-' + SUBSTRING(Tel,4,6) as Tel,SUBSTRING(Mobile,1,3) + '-' + SUBSTRING(Mobile,4,3)  + '-' + SUBSTRING(Mobile,7,4) as Mobile,Qual_degree,Qual_fromUni,Qual_branch,Qual_suc + 543 as Qual_suc,Qual_gpa,ISNULL(Exp_detail,'-') as Exp_detail,ISNULL(Exp_course,'-') as Exp_course,ISNULL(Exp_from,'-') as Exp_from,Salary,CASE Position WHEN 'admin' THEN 'ผู้ดูแลระบบ' ELSE 'วิทยากร' END Position FROM Lecturer WHERE Lecturer_Id = " & lblLecId.Text
                Dim dt As DataTable = DBClass.SqlGet(strSql, "getEmp").Tables(0)
                If dt.Rows.Count = 0 Then
                    img(False)
                    Exit Sub
                Else
                    img(True)
                    imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=EmployeesDataReport';")
                    imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=EmployeesDataReport';")
                    imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=EmployeesDataReport';")
                    Session("ReportDataTable") = strSql
                    rpt.Load(root & "admin/report/file/reportEmpData.rpt")
                    rpt.SetDataSource(dt)
                    rpt.SetParameterValue("author", Session("Author"))
                    Session("ReportSource") = rpt
                    EmpDataReport.ReportSource = rpt
                    EmpDataReport.RefreshReport()
                End If
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
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
End Class
