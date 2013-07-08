Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportPayType
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "PaymentTypeReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub checkDt(ByVal a As Boolean)
        PayType.Visible = Not a
        lblNone.Visible = a
        img(Not a)
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
    End Sub
    Function getMaxId() As String
        Return DBClass.SqlGet("SELECT MAX(Pay_Choice) FROM Payment_Choice", "getMax").Tables(0).Rows(0)(0).ToString
    End Function
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            PayType.ReportSource = repDoc
            PayType.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Function reportQuery() As DataTable
        Dim strSql As String = "SELECT st.FirstName,st.LastName,co.CourseName, CONVERT(VARCHAR(10),pm.Pay_Date,103) as Pay_Date,pc.Pay_Detail,pm.Pay_Id FROM Class cl, Course co, Class_Student cs, Payment pm, Payment_Choice pc,Student st WHERE cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and st.S_Id = cs.S_Id and pm.Cs_Id = cs.Cs_Id  and pm.Pay_Choice = pc.Pay_Choice and pm.Pay_Date >= '" & txtDate.Text & "' and pm.Pay_Date <= '" & txtDateEnd.Text & "' and pm.Pay_Choice >= " & ddlType.SelectedValue & " and pm.Pay_Choice <= "
        'Dim param As SqlParameterCollection = New SqlCommand().Parameters
        'param.AddWithValue("@pstart", txtDate.Text)
        'param.AddWithValue("@pend", txtDateEnd.Text)
        'param.AddWithValue("@cstart", ddlType.SelectedValue)
        If ddlType.SelectedValue = "0" Then
            'param.AddWithValue("@cend", getMaxId)
            strSql &= getMaxId()
        Else
            'param.AddWithValue("@cend", ddlType.SelectedValue)
            strSql &= ddlType.SelectedValue
        End If
        Session("ReportDataTable") = strSql
        Return DBClass.SqlGet(strSql, "getReport").Tables(0)
    End Function

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
        ControlMethod.ddlAddValue("SELECT * FROM [Payment_Choice]", ddlType, "Pay_Detail", "Pay_Choice")
        ddlType.Items.Insert(0, New ListItem("ทั้งหมด", "0"))
    End Sub

    Protected Sub pcDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pcDate.SelectionChanged
        pcDateEnd.Enabled = True
        btnOk.Enabled = True
        pcDateEnd.From.Date = pcDate.SelectedDate
        txtDateEnd.Text = txtDate.Text
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
        Dim dt As DataTable = reportQuery()
        If dt.Rows.Count = 0 Then
            checkDt(True)
            Exit Sub
        Else
            checkDt(False)
            imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=PaymentTypeReport';")
            imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=PaymentTypeReport';")
            imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=PaymentTypeReport';")
            Dim root As String = Request.PhysicalApplicationPath
            Dim rpt As New ReportDocument()
            Try
                rpt.Load(root & "admin/report/file/reportPayType.rpt")
                rpt.SetDataSource(dt)
                rpt.SetParameterValue("author", Session("Author"))
                Session("ReportSource") = rpt
                PayType.ReportSource = rpt
                PayType.RefreshReport()
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try
        End If
    End Sub
End Class
