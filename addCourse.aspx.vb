Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports ICSharpCode.SharpZipLib.Zip
Partial Class lecturer_addCourse
    Inherits System.Web.UI.Page
    Dim IdCourse As String = Nothing
    '////////// ALL SUB //////////'
    Sub addCourse()
        Dim strSql As String = "INSERT INTO [Course] ([CourseName],[CourseType_Id],[CourseDetail],                [Duration],[Price]) VALUES (@CourseName, @CourseTypeId, @CourseDetail,@Duration,@Price)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@CourseName", txtCourseName.Text)
        param.AddWithValue("@CourseTypeId", ddlCourseType.SelectedValue)
        param.AddWithValue("@CourseDetail", txtDetail.Text)
        param.AddWithValue("@Duration", txtDuration.Text)
        param.AddWithValue("@Price", txtPrice.Text)
        DBClass.SqlExecute(strSql, param)
        addFile()
    End Sub
    Sub addType()
        Dim strSql As String = "INSERT INTO [Course_Type] ([CourseTypeName],[CourseTypeDetail]) VALUES   (@CourseTypeName, @CourseTypeDetail)"
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@CourseTypeName", txtTypeCourse.Text)
        param.AddWithValue("@CourseTypeDetail", txtDetailType.Text)
        DBClass.SqlExecute(strSql, param)
    End Sub
    Sub addFile()
        Dim files As EO.Web.AJAXPostedFile() = AJAXUploader1.PostedFiles
        Dim file As EO.Web.AJAXPostedFile
        Dim postPath, copyPath As String
        Dim getPath As String = getid()
        Dim i As Integer = 1
        'Dim root As String = Request.PhysicalApplicationPath
        For Each file In files
            postPath = "temp/" & System.IO.Path.GetFileName(file.FinalFileName)
            copyPath = getPath & System.IO.Path.GetFileName(file.FinalFileName)
            'copyFile(root & postPath, root & copyPath)
            upPath(copyAndZip(postPath, getPath), i)
            i += 1
        Next file
    End Sub
    Sub upPath(ByVal path As String, ByVal i As Integer)
        Dim param As SqlParameterCollection = New SqlCommand().Parameters
        param.AddWithValue("@file", path)
        param.AddWithValue("@CourseId", IdCourse)
        DBClass.SqlExecute("UPDATE [Course] SET [File" & i.ToString & "] = @file WHERE Course_Id = @CourseId", param)
    End Sub
    Sub deleteFolder(ByVal name As String)
        Dim Path As String = Server.MapPath(name)
        If Directory.Exists(Path) = True Then
            Directory.Delete(Path, True)
        End If
    End Sub
    Function createFolder(ByVal name As String) As String
        Dim Path As String = Server.MapPath(name)
        If Directory.Exists(Path) = False Then
            Directory.CreateDirectory(Path)
        End If
        Return name
    End Function
    Sub copyFile(ByVal path As String, ByVal path2 As String)
        File.Copy(path, path2, True)
    End Sub
    Function copyAndZip(ByVal zipPath As String, ByVal pastePath As String) As String
        Dim MyZip As ZipFile
        Dim fileName As String = Path.GetFileName(zipPath).Substring(0, Path.GetFileName(zipPath).Length - Path.GetExtension(zipPath).Length)
        Dim addPath As String = pastePath & fileName.Replace(" ", "_") & ".zip"
        Dim createZip As String = Server.MapPath(addPath)
        MyZip = ZipFile.Create(createZip)
        With MyZip
            .BeginUpdate()
            .Add(Server.MapPath(zipPath), Path.GetFileName(zipPath))
            .CommitUpdate()
        End With
        MyZip.Close()
        Return addPath
    End Function
    Function getid() As String
        Dim dt As DataTable = DBClass.SqlGet("SELECT MAX(Course_Id) as CourseId FROM Course", "getId").Tables(0)
        IdCourse = dt.Rows(0)("CourseId")
        Dim courseId As String = Nothing
        If IsDBNull(dt.Rows(0)("CourseId")) Then
            Return createFolder("coursefile/1/")
        Else
            courseId = dt.Rows(0)("CourseId")
            Return createFolder("coursefile/" & courseId & "/")
        End If
    End Function
    '////////// END ALL SUB //////////'
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'> tooltip();</script>", False)
        Dim check As String = ControlMethod.checkLecturer(Session)
        If check <> Nothing Then
            Response.Write(check)
            Exit Sub
        End If
        ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlCourseType, "CourseTypeName", "CourseType_Id")
        deleteFolder("temp")
        createFolder("temp")
    End Sub

    Protected Sub btnSummitAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitAdd.Click
        If ControlMethod.NothingTextBox(PAddCourse) = False Then
            Exit Sub
        Else
            addCourse()
            Response.Write("<script type='text/javascript'> window.alert('เพิ่มหลักสูตรเรียบร้อยแล้ว'); </script>")
            Response.Redirect("admin/course/dataCourse.aspx")
        End If
    End Sub

    Protected Sub btnSubmitType_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmitType.Click
        If txtTypeCourse.Text = Nothing Then
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>fncShowHide('tAddType', 'tAddCourse');</script>", False)
            txtTypeCourse.Focus()
            Exit Sub
        ElseIf txtDetailType.Text.Length > 300 Then
            txtDetailType.Focus()
            Exit Sub
        Else
            addType()
            ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "", "<script type='text/javascript'>clearTypeText(); active('lbAddCourse', 'lbAddType'); showError('เพิ่มหมวดหมู่เรียบร้อยแล้ว...');</script>", False)
            ControlMethod.ddlAddValue("SELECT [CourseType_Id],[CourseTypeName] FROM [Course_Type]", ddlCourseType, "CourseTypeName", "CourseType_Id")
        End If
    End Sub
End Class
