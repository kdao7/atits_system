<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataCourse.aspx.vb" Inherits="admin_course_dataCourse" title="ATIT ::: Course Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; (course data)</h1>
    <blockquote>
        <asp:UpdatePanel ID="upCourseData" runat="server">
            <ContentTemplate>
            <script type="text/javascript">
              Sys.Application.add_load(tooltip);
            </script>
                &#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                    ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;">
                </asp:DropDownList>
                <br />
                <br />
                <div id="hideGrid" style="display: none">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="Course_Id" DataSourceID="dataCourse" 
                        Width="95%">
                        <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                            HorizontalAlign="Left" VerticalAlign="Middle" />
                        <EmptyDataRowStyle BackColor="#FFFF66" />
                        <Columns>
                            <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" SortExpression="CourseName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                                SortExpression="CourseTypeName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("CourseTypeName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CourseTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;" InsertVisible="False" 
                                SortExpression="Course_Id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Course_Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgView" runat="server" ImageUrl="~/img/edit.gif" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" />
                                    <asp:Label ID="lblCourseId" runat="server" Text='<%# Bind("Course_Id") %>' 
                                        Visible="False"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                            ForeColor="#FFFFCC" />
                    </asp:GridView>
                </div>
                <p>
                    <asp:SqlDataSource ID="dataCourse" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                        SelectCommand="SELECT [Course_Id], [CourseName], [CourseTypeName] FROM [Course], [Course_Type] WHERE [Course_Type].CourseType_Id = [Course].CourseType_Id and  [Course].CourseType_Id = @tid">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlType" Name="tid" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </p>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlType" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        </blockquote>
        <p align="center">&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3652;&#3604;&#3657;&#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;             <img alt="View" src="../../img/edit.gif" style="width: 24px; height: 24px" />&#3649;&#3621;&#3632;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3652;&#3604;&#3657;&#3650;&#3604;&#3618;
            <asp:HyperLink ID="hlAddCourse" runat="server" 
                NavigateUrl="~/addCourse.aspx">&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3609;&#3637;&#3656;</asp:HyperLink>
      </p>
    
</div>

</asp:Content>


