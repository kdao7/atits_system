Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportPayStatus
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "PaymentStatusReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Function getMaxId() As String
        Return DBClass.SqlGet("SELECT MAX(CourseType_Id) FROM Course_Type", "getMax").Tables(0).Rows(0)(0).ToString
    End Function
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
    End Sub
    Sub checkDt(ByVal a As Boolean)
        PayStatusReport.Visible = Not a
        lblNone.Visible = a
        img(Not a)
    End Sub
    Function addNoPaid(ByVal dt1 As DataTable, ByVal dt2 As DataTable) As DataTable
        For i As Integer = 0 To dt2.Rows.Count - 1
            dt1.Rows.Add(dt2.Rows(i)("Paid").ToString, dt2.Rows(i)("CourseName").ToString, dt2.Rows(i)("FirstName").ToString, dt2.Rows(i)("LastName").ToString, dt2.Rows(i)("Status").ToString, dt2.Rows(i)("RegisDate").ToString, Nothing)
        Next
        Return dt1
    End Function
    Function reportQuery() As DataTable
        Dim strSql As String = Nothing
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        If ddlStatus.SelectedValue = "1" Then
            strSql = "SELECT ps.Paid,co.CourseName,st.FirstName,st.LastName,ps.Status,CONVERT(VARCHAR(10),cs.RegisDate,103) as RegisDate FROM Class cl, Course co, Class_Student cs,Student st,PayStatus ps WHERE Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and ps.Paid = cs.Paid and cs.RegisDate >= @rstart and cs.RegisDate <= @rend and cs.Paid >= 0 and cs.Paid <= 1"
            param.AddWithValue("@rstart", txtDate.Text)
            param.AddWithValue("@rend", txtDateEnd.Text)
            Dim dt As DataTable = DBClass.SqlGet(strSql, "getReport", param).Tables(0)
            If dt.Rows.Count = 0 Then
                Return Nothing
            Else
                dt.Columns.Add("PayDate")
                Session("ReportDataTable") = dt
                Return dt
            End If
        Else
            strSql = "SELECT ps.Paid,co.CourseName,st.FirstName,st.LastName,ps.Status,CONVERT(VARCHAR(10),cs.RegisDate,103) as RegisDate,CONVERT(VARCHAR(10),pm.Pay_Date,103) as PayDate FROM Class cl, Course co, Class_Student cs,Student st,PayStatus ps,Payment pm WHERE Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and ps.Paid = cs.Paid and cs.RegisDate >= @rstart and cs.RegisDate <= @rend and cs.Paid >= @pstart and cs.Paid <= @pend and pm.Cs_Id = cs.Cs_Id "
            param.AddWithValue("@rstart", txtDate.Text)
            param.AddWithValue("@rend", txtDateEnd.Text)
            param.AddWithValue("@pstart", ddlStatus.SelectedValue)
            If ddlStatus.SelectedValue = "0" Then
                param.AddWithValue("@pend", getMaxId)
            Else
                param.AddWithValue("@pend", ddlStatus.SelectedValue)
            End If
            Dim ds As DataSet
            If ddlStatus.SelectedValue = "0" Then
                strSql &= Chr(13) & "SELECT ps.Paid,co.CourseName,st.FirstName,st.LastName,ps.Status,CONVERT(VARCHAR(10),cs.RegisDate,103) as RegisDate FROM Class cl, Course co, Class_Student cs,Student st,PayStatus ps WHERE Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and ps.Paid = cs.Paid and cs.RegisDate >= @rstart and cs.RegisDate <= @rend and cs.Paid >= 0 and cs.Paid <= 1"
                ds = DBClass.SqlGet(strSql, "getProfile", param)
                If ds.Tables.Count = 0 Then
                    Return Nothing
                Else
                    Dim dt As DataTable = ds.Tables(0)
                    dt = addNoPaid(dt, ds.Tables(1))
                    Session("ReportDataTable") = dt
                    Return dt
                End If
            Else
                ds = DBClass.SqlGet(strSql, "getProfile", param)
                Session("ReportDataTable") = ds.Tables(0)
                Return ds.Tables(0)
            End If
        End If
        Return Nothing
    End Function
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            PayStatusReport.ReportSource = repDoc
            PayStatusReport.RefreshReport()
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
        ControlMethod.ddlAddValue("SELECT [Paid],[Status] FROM [PayStatus]", ddlStatus, "Status", "Paid")
        ddlStatus.Items.Insert(0, New ListItem("ทั้งหมด", "0"))
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
            imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=PaymentStatusReport';")
            imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=PaymentStatusReport';")
            imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=PaymentStatusReport';")
            Dim root As String = Request.PhysicalApplicationPath
            Dim rpt As New ReportDocument()
            Try
                rpt.Load(root & "admin/report/file/reportPayStatus.rpt")
                rpt.SetDataSource(dt)
                rpt.SetParameterValue("author", Session("Author"))
                Session("ReportSource") = rpt
                PayStatusReport.ReportSource = rpt
                PayStatusReport.RefreshReport()
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub pcDate_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles pcDate.SelectionChanged
        pcDateEnd.Enabled = True
        btnOk.Enabled = True
        pcDateEnd.From.Date = pcDate.SelectedDate
        txtDateEnd.Text = txtDate.Text
    End Sub
End Class
