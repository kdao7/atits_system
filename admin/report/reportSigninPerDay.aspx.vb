Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Data
Imports System.Data.SqlClient

Partial Class admin_report_Default
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "MemberSigninReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
        MemberSigninReport.Visible = a
        lblNone.Visible = Not a
    End Sub
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            MemberSigninReport.ReportSource = repDoc
            MemberSigninReport.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
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

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Try
            Dim strSql As String = "SELECT st.FirstName,st.LastName,co.CourseName,cl.Class_Start,ps.Paid,co.Price,CONVERT(VARCHAR(10),cs.RegisDate,103) as Pay_Date FROM Course co,Class_Student cs,Class cl,PayStatus ps,Payment pm,Student st WHERE cs.Paid = ps.Paid and pm.Pay_Date >= '" & txtDate.Text & "' and pm.Pay_Date  <= '" & txtDateEnd.Text & "' and cs.Cancel = 'False' and cl.Class_Id = cs.Class_Id and co.Course_Id = cl.Course_Id and st.S_Id = cs.S_Id and pm.Cs_Id = cs.Cs_Id"
            Dim param As SqlParameterCollection = New SqlCommand().Parameters
            'param.AddWithValue("@pstart", txtDate.Text)
            'param.AddWithValue("@pend", txtDateEnd.Text)
            Dim dt As DataTable = DBClass.SqlGet(strSql, "Check").Tables(0)
            If dt.Rows.Count = 0 Then
                img(False)
                Exit Sub
            Else
                img(True)
                imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=MemberSigninReport';")
                imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=MemberSigninReport';")
                imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=MemberSigninReport';")
                Session("ReportDataTable") = strSql
                rpt.Load(root & "admin/report/file/reportSigninPerDay.rpt")
                rpt.SetDataSource(dt)
                rpt.SetParameterValue("author", Session("Author"))
                Session("ReportSource") = rpt
                MemberSigninReport.ReportSource = rpt
                MemberSigninReport.RefreshReport()
            End If
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub pcDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pcDate.SelectionChanged
        pcDateEnd.Enabled = True
        btnOk.Enabled = True
        pcDateEnd.From.Date = pcDate.SelectedDate
        txtDateEnd.Text = txtDate.Text
    End Sub
End Class
