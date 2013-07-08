Imports System.Data
Imports System.Data.SqlClient
Partial Class admin_course_dataClass
    Inherits System.Web.UI.Page

    Sub addType()
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlType, "CourseTypeName", "CourseType_Id")
        ddlType.Items.Insert(0, New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
    End Sub
    Sub getDateStart(ByVal cd As RJS.Web.WebControl.PopCalendar)
        cd.From.Date = Date.Today
    End Sub
    Sub changeDay(ByVal lbl As Label)
        Dim day, month, year As String

        If lbl.Text.Contains("/01/") Then
            month = " ม.ค. "
        ElseIf lbl.Text.Contains("/02/") Then
            month = " ก.พ. "
        ElseIf lbl.Text.Contains("/03/") Then
            month = " มี.ค. "
        ElseIf lbl.Text.Contains("/04/") Then
            month = " เม.ย. "
        ElseIf lbl.Text.Contains("/05/") Then
            month = " พ.ค. "
        ElseIf lbl.Text.Contains("/06/") Then
            month = " มิ.ย. "
        ElseIf lbl.Text.Contains("/07/") Then
            month = " ก.ค. "
        ElseIf lbl.Text.Contains("/08/") Then
            month = " ส.ค. "
        ElseIf lbl.Text.Contains("/09/") Then
            month = " ก.ย. "
        ElseIf lbl.Text.Contains("/10/") Then
            month = " ต.ค. "
        ElseIf lbl.Text.Contains("/11/") Then
            month = " พ.ย. "
        ElseIf lbl.Text.Contains("/12/") Then
            month = " ธ.ค. "
        End If

        year = Left(lbl.Text, 4)
        day = Right(lbl.Text, 2)
        If day.IndexOf("0") = 0 Then
            day = day.Substring(1)
        End If
        lbl.Text = day & month & year
    End Sub
    Sub updateClass()
        Dim strSql As String = "UPDATE [Class] SET [Class_Start] = @start,[Class_End] = @end,[Class_Min] = @min,[Class_Max] = @max WHERE Class_Id = @clid"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@start", txtStart.Text)
        param.AddWithValue("@end", txtEnd.Text)
        param.AddWithValue("@min", txtMin.Text)
        param.AddWithValue("@max", txtMax.Text)
        param.AddWithValue("@clid", lblClassId.Text)
        DBClass.SqlExecute(strSql, param)
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
        getDateStart(PopCalendarStart)
        addType()
    End Sub

    Protected Sub ddlType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlType.SelectedIndexChanged
        ddlType.Items.Remove(New ListItem("กรุณาเลือกหมวดหมู่", [String].Empty))
        GridView2.Visible = True
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        Dim start As Label = CType(e.Row.FindControl("lblStart"), Label)
        Dim dateEnd As Label = CType(e.Row.FindControl("lblEnd"), Label)
        Dim hl As HyperLink = CType(e.Row.FindControl("hlCourse"), HyperLink)
        Dim cid As Label = CType(e.Row.FindControl("lblId"), Label)
        Dim rjsStart As RJS.Web.WebControl.PopCalendar = CType(e.Row.FindControl("pcStart"), RJS.Web.WebControl.PopCalendar)
        Dim rjsEnd As RJS.Web.WebControl.PopCalendar = CType(e.Row.FindControl("pcEnd"), RJS.Web.WebControl.PopCalendar)
        If Not IsNothing(cid) Then
            hl.NavigateUrl = ResolveClientUrl("~/viewCourse.aspx?id=" & cid.Text)
        End If
        If Not IsNothing(rjsStart) Then
            rjsEnd.From.Date = rjsStart.SelectedDate
        End If
        If Not IsNothing(start) Then
            changeDay(start)
        End If
        If Not IsNothing(dateEnd) Then
            changeDay(dateEnd)
        End If
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Dim clid As String = Me.GridView2.SelectedRow.Cells(1).Text
        'Session("clid") = clid
        If Not String.IsNullOrEmpty(clid) Then
            Dim dt As DataTable = DBClass.SqlGet("SELECT Class.*,CourseName FROM Class,Course WHERE Class_Id=" & clid & " and Course.Course_Id = Class.Course_Id", "getMember").Tables(0)
            If DateDiff("d", dt.Rows(0)("Class_Start"), Date.Today.Date) > 0 Then
                pError.Visible = True
                pClass.Visible = False
                Exit Sub
            Else
                pError.Visible = False
                pClass.Visible = True
            End If
            lblClassId.Text = clid
            lblUpCourse.Text = dt.Rows(0)("CourseName")
            txtStart.Text = dt.Rows(0)("Class_Start")
            PopCalendarStart.SelectedDate = dt.Rows(0)("Class_Start")
            getDateStart(PopCalendarStart)
            txtEnd.Text = dt.Rows(0)("Class_End")
            PopCalendarEnd.From.Date = PopCalendarStart.SelectedDate
            PopCalendarEnd.SelectedDate = dt.Rows(0)("Class_End")
            txtMin.Text = dt.Rows(0)("Class_Min")
            txtMax.Text = dt.Rows(0)("Class_Max")
        End If
    End Sub

    Protected Sub PopCalendarStart_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PopCalendarStart.SelectionChanged
        getDateStart(PopCalendarStart)
        txtEnd.Text = Nothing
        PopCalendarEnd.From.Date = PopCalendarStart.SelectedDate
    End Sub

    Protected Sub btnSubmitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        updateClass()
        GridView2.DataBind()
        pClass.Visible = False
    End Sub
End Class
