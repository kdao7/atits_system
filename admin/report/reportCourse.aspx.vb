Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared

Partial Class admin_report_reportCourse
    Inherits System.Web.UI.Page

    Sub ConfigureCrystalReports()
        Dim myConnectionInfo As ConnectionInfo = New ConnectionInfo()
        myConnectionInfo.DatabaseName = "ATIT"
        myConnectionInfo.IntegratedSecurity = True
        'SetDBLogonForReport(myConnectionInfo, rpt)
    End Sub

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)

        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(ExportFormatType.Excel, Response, True, "CourseReport")
        Catch ex As Exception
            'Response.Write(ex.Message)
        End Try
    End Sub

    Private Sub SetDBLogonForReport(ByVal myConnectionInfo As ConnectionInfo, ByVal myReportDocument As ReportDocument)
        Dim myTables As Tables = myReportDocument.Database.Tables
        For Each myTable As CrystalDecisions.CrystalReports.Engine.Table In myTables
            Dim myTableLogonInfo As TableLogOnInfo = myTable.LogOnInfo
            myTableLogonInfo.ConnectionInfo = myConnectionInfo
            myTable.ApplyLogOnInfo(myTableLogonInfo)
        Next
    End Sub

    Protected Sub ddlCourse_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCourse.SelectedIndexChanged
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Try
            'Dim dt As DataTable = DBClass.SqlGet("SELECT [CourseName],[CourseTypeName],[CourseDetail],[Duration],[Price] FROM [Course],[Course_Type] WHERE Course.CourseType_Id = Course_Type.CourseType_Id and (Course_Type.CourseType_Id = " & ddlCourse.SelectedValue & ")", "getCourse").Tables(0)

            rpt.Load(root & "admin/report/file/reportCourse.rpt")
            rpt.SetParameterValue("CourseType_Id", Me.ddlCourse.SelectedValue)
            If ddlCourse.SelectedIndex = 0 Then
                rpt.SetParameterValue("CourseType_Id2", getTypeIdSting())
            Else
                rpt.SetParameterValue("CourseType_Id2", Me.ddlCourse.SelectedValue)
            End If
            'rpt.SetDataSource(dt)
            Session("ReportSource") = rpt
            crv1.ReportSource = rpt
            crv1.RefreshReport()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            'Response.Write(check)
            'Exit Sub
        End If
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlCourse, "CourseTypeName", "CourseType_Id")
        ddlCourse.Items.Insert(0, New ListItem("ทั้งหมด", "0"))
    End Sub

    Function getTypeIdSting() As String
        Return DBClass.SqlGet("SELECT MAX(CourseType_Id) FROM Course_Type", "getType").Tables(0).Rows(0)(0)
    End Function
End Class
