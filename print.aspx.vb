Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Data.SqlClient
Partial Class print
    Inherits System.Web.UI.Page

    Sub DownloadTax(ByVal csid As String)
        Dim strSql As String = "SELECT pm.Pay_Id,CASE SUBSTRING(CONVERT(VARCHAR(10),pm.Pay_date,105),3,4) WHEN '-01-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ม.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-02-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ก.พ. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-03-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' มี.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-04-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' เม.ษ. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-05-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' พ.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-06-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' มิ.ย. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-07-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ก.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-08-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ส.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-09-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ก.ย. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-10-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ต.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-11-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' พ.ย. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) WHEN '-12-' THEN CONVERT(VARCHAR(2),pm.Pay_date,105) + ' ธ.ค. '+ CONVERT(VARCHAR(4),YEAR(pm.Pay_date)+ 543,111) END as Pay_date,co.CourseName,co.Price,CASE pm.Pay_Choice WHEN 1 THEN 'เงินสด' WHEN 2 THEN 'เงินสด' ELSE 'บัตรเครดิต' END as Payby,st.FirstName + '  ' + st.LastName as Name FROM Payment pm, Payment_Check pc,Class_Student cs,PayStatus ps,Class cl,Course co,Student st WHERE pc.Chk_Id = pm.Chk_Id and cs.Cs_Id = pm.Cs_Id and ps.Paid = cs.Paid and cs.Class_Id = cl.Class_Id and cl.Course_Id = co.Course_Id and st.S_Id = cs.S_Id and cs.Paid = 3 and cs.Cs_Id = " & csid
        Dim dt As DataTable = DBClass.SqlGet(strSql, "tax").Tables(0)
        If dt.Rows.Count = 0 Then
            Exit Sub
        Else
            Dim root As String = Request.PhysicalApplicationPath
            Dim rpt As New ReportDocument()
            Try
                rpt.Load(root & "admin/report/file/reportTax.rpt")
                rpt.SetDataSource(dt)
                Session("ThaiText") = ControlMethod.ThaiBaht(dt.Rows(0)("Price"))
                rpt.SetParameterValue("numth", Session("ThaiText"))
                Response.Buffer = False
                Response.ClearContent()
                Response.ClearHeaders()
                rpt.ExportToHttpResponse(5, Response, True, "Tax_No." & dt.Rows(0)("Pay_Id").ToString)
                rpt.Close()
                Session("ThaiText") = Nothing
            Catch ex As Exception
                'MsgBox(ex.Message)
            End Try
        End If
    End Sub
    Sub DownloadReport(ByVal dt As DataTable, ByVal exportNum As Integer, ByVal name As String)
        If dt.Rows.Count = 0 Then
            Exit Sub
        Else
            Dim root As String = Request.PhysicalApplicationPath
            Dim rpt As New ReportDocument()
            Try
                If name = "EmployeesDataReport" Then
                    rpt.Load(root & "admin/report/file/reportEmpData.rpt")
                ElseIf name = "MemberSigninCourseReport" Then
                    rpt.Load(root & "admin/report/file/reportMemberPerCourse.rpt")
                ElseIf name = "MemberPaymentReport" Then
                    rpt.Load(root & "admin/report/file/reportPaymentPerDay.rpt")
                ElseIf name = "PaymentStatusReport" Then
                    rpt.Load(root & "admin/report/file/reportPayStatus.rpt")
                ElseIf name = "PaymentTypeReport" Then
                    rpt.Load(root & "admin/report/file/reportPayType.rpt")
                ElseIf name = "MemberSigninReport" Then
                    rpt.Load(root & "admin/report/file/reportSigninPerDay.rpt")
                ElseIf name = "MemberDataReport" Then
                    rpt.Load(root & "admin/report/file/reportMemberData.rpt")
                End If
                rpt.SetDataSource(dt)
                If name = "MemberDataReport" Then
                    Dim strSqlSub As String = TryCast(Me.Session("SubReportDataTable"), String)
                    Dim dtSt As DataTable = DBClass.SqlGet(strSqlSub, "getProfile").Tables(0)
                    rpt.Subreports("Student_Profile").Database.Tables(0).SetDataSource(dtSt)
                    Session("SubReportDataTable") = Nothing
                End If
                rpt.SetParameterValue("author", Session("Author"))
                Response.Buffer = False
                Response.ClearContent()
                Response.ClearHeaders()
                rpt.ExportToHttpResponse(exportNum, Response, True, name)
                rpt.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
    End Sub

    Sub DownloadReportPayStatus(ByVal dt As DataTable, ByVal exportNum As Integer, ByVal name As String)
        If dt.Rows.Count = 0 Then
            Exit Sub
        Else
            Dim root As String = Request.PhysicalApplicationPath
            Dim rpt As New ReportDocument()
            Try
                rpt.Load(root & "admin/report/file/reportPayStatus.rpt")
                rpt.SetDataSource(dt)
                rpt.SetParameterValue("author", Session("Author"))
                Response.Buffer = False
                Response.ClearContent()
                Response.ClearHeaders()
                rpt.ExportToHttpResponse(exportNum, Response, True, name)
                rpt.Close()
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim check As String = ControlMethod.checkLogin(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        Dim cmd As String = Request.QueryString("cmd")
        Dim id As String = Request.QueryString("id")
        If cmd = "tax" Then
            DownloadTax(id)
            Response.Write("<script type='text/javascript'> history.back(); </script>")
        ElseIf cmd = "report" Then
            Dim reportName As String = Request.QueryString("name")
            If reportName = "PaymentStatusReport" Then
                Dim dtStatus As DataTable = TryCast(Me.Session("ReportDataTable"), DataTable)
                DownloadReportPayStatus(dtStatus, id, reportName)
                Response.Write("<script type='text/javascript'> history.back(); </script>")
                Exit Sub
            End If
            Dim strSql As String = TryCast(Me.Session("ReportDataTable"), String)
            Dim dt As DataTable = DBClass.SqlGet(strSql, "report").Tables(0)
            Session("ReportDataTable") = Nothing
            DownloadReport(dt, id, reportName)
            Response.Write("<script type='text/javascript'> history.back(); </script>")
        End If
    End Sub
End Class
