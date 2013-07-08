Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Imports CrystalDecisions.Shared
Partial Class admin_report_reportMemberData
    Inherits System.Web.UI.Page

    Sub export(ByVal format As Integer)
        Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
        repDoc.SetParameterValue("author", Session("Author"))
        Response.Buffer = False
        Response.ClearContent()
        Response.ClearHeaders()
        Try
            repDoc.ExportToHttpResponse(format, Response, True, "MemberDataReport")
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub
    Sub img(ByVal a As Boolean)
        imgDoc.Enabled = a
        imgPdf.Enabled = a
        imgXls.Enabled = a
        MemberDataReport.Visible = a
        lblNone.Visible = Not a
    End Sub
    Sub refreshReport()
        Try
            Dim repDoc As ReportDocument = TryCast(Me.Session("ReportSource"), ReportDocument)
            repDoc.SetParameterValue("author", Session("Author"))
            MemberDataReport.ReportSource = repDoc
            MemberDataReport.RefreshReport()
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsPostBack Then
            refreshReport()
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim sex As Label = CType(e.Row.FindControl("lblSex"), Label)
        If Not IsNothing(sex) Then
            If sex.Text = "F" Then
                sex.Text = "หญิง"
            Else
                sex.Text = "ชาย"
            End If
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Dim root As String = Request.PhysicalApplicationPath
        Dim rpt As New ReportDocument()
        Dim user As String = Me.GridView2.SelectedRow.Cells(1).Text
        If Not String.IsNullOrEmpty(user) Then
            Try
                Dim strSql As String = "SELECT * FROM Student WHERE UserName='" & user & "'"
                Dim dt As DataTable = DBClass.SqlGet(strSql, "getMember").Tables(0)
                Dim strSqlSub As String = "SELECT pm.Pay_Id, co.CourseName,st.Username,CONVERT(VARCHAR(10),pm.Pay_Date,103) as Pay_Date,CASE pc.Chk_Id WHEN 1 THEN co.Price / 2 ELSE co.Price END as Price FROM Class cl, Course co, Class_Student cs,Student st ,Payment pm,Payment_Check pc WHERE Cancel = 'False' and cs.Class_Id = cl.Class_Id and cs.S_Id = st.S_Id and co.Course_Id = cl.Course_Id and pm.Cs_Id = cs.Cs_Id and pc.Chk_Id = pm.Chk_Id and UserName='" & user & "'"
                Dim dtSt As DataTable = DBClass.SqlGet(strSqlSub, "getProfile").Tables(0)
                If dtSt.Rows.Count = 0 Then
                    img(False)
                    Exit Sub
                Else
                    img(True)
                    imgPdf.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=5&name=MemberDataReport';")
                    imgDoc.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=3&name=MemberDataReport';")
                    imgXls.OnClientClick = "window.location='" & ResolveClientUrl("~/print.aspx?cmd=report&id=4&name=MemberDataReport';")
                    Session("ReportDataTable") = strSql
                    Session("SubReportDataTable") = strSqlSub
                    rpt.Load(root & "admin/report/file/reportMemberData.rpt")
                    rpt.SetDataSource(dt)
                    rpt.Subreports("Student_Profile").Database.Tables(0).SetDataSource(dtSt)
                    rpt.SetParameterValue("author", Session("Author"))
                    Session("ReportSource") = rpt
                    MemberDataReport.ReportSource = rpt
                    MemberDataReport.RefreshReport()
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

End Class
