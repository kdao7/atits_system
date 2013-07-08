Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportPaymentPerDay
    Inherits System.Web.UI.Page

    Function choice() As String
        Return "and pm.Pay_Date between '" & txtDate.Text & "' and '" & txtDate0.Text & "'"
    End Function
    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "MemberPaymentReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
        MemberPaymentReport.Visible = a
        lblNone.Visible = Not a
    End Sub
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            MemberPaymentReport.ReportSource = repDoc
            MemberPaymentReport.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsPostBack Then
            refreshReport()
        End If
    End Sub

    Protected Sub pcDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pcDate.SelectionChanged
        pcDate0.Enabled = True
        btnOk.Enabled = True
        pcDate0.From.Date = pcDate.SelectedDate
        txtDate0.Text = txtDate.Text
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

    Protected Sub btnOk_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOk.Click
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Try
            Dim strSql As String = "SELECT st.FirstName,st.LastName,cs.Cs_Id,cl.Class_Id, co.CourseName,st.Username,CONVERT(VARCHAR(10),pm.Pay_Date,103) as Pay_Date,CASE pc.Chk_Id WHEN 1 THEN co.Price / 2 ELSE co.Price END as Price FROM Class cl, Course co, Class_Student cs,Student st ,Payment pm,Payment_Check pc WHERE Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and pm.Cs_Id = cs.Cs_Id and pc.Chk_Id = pm.Chk_Id " & choice() & " ORDER BY pm.Pay_Date"
            Dim dt As DataTable = DBClass.SqlGet(strSql, "getPay").Tables(0)
            If dt.Rows.Count = 0 Then
                img(False)
                Exit Sub
            Else
                img(True)
                imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=MemberPaymentReport';")
                imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=MemberPaymentReport';")
                imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=MemberPaymentReport';")
                Session("ReportDataTable") = strSql
                rpt.Load(root & "admin/report/file/reportPaymentPerDay.rpt")
                rpt.SetDataSource(dt)
                rpt.SetParameterValue("author", Session("Author"))
                Session("ReportSource") = rpt
                MemberPaymentReport.ReportSource = rpt
                MemberPaymentReport.RefreshReport()
            End If
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
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
