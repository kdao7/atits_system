<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="index" title="ATIT ::: Home Page" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #tView
        {
            background-position: right; 
            width: 95%; margin: 5px 5px 5px 15px; 
            padding: 5px 5px 1px 15px; 
            border-bottom-style: dotted; 
            border-bottom-width: 2px; 
            border-bottom-color: #000000;
            background-image: url('img/bgviewrover.png'); 
            background-repeat: repeat-y;
        }
        #tView:hover
        {
            background: #f4f227;
            cursor: pointer;
            font-weight: bold;
            background-image: url(img/arrow-hover.png);
	        background-repeat: no-repeat;
	        background-position: left center;
	        text-decoration: underline;
        }                
        
    </style>
    <script type="text/javascript">

        $(document).ready(function() {
            
        });
     </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3618;&#3636;&#3609;&#3604;&#3637;&#3605;&#3657;&#3629;&#3609;&#3619;&#3633;&#3610;&#3626;&#3641;&#3656; <span style="color:#9C386A;">ATIT (Academic training information 
        technology)</span></h1>
        <div class="tooltip" id="tip"></div>
        <h3>&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3648;&#3611;&#3636;&#3604;&#3629;&#3610;&#3619;&#3617;&#3621;&#3656;&#3634;&#3626;&#3640;&#3604;</h3>
        <script type="text/javascript">
            Sys.Application.add_load(textStyle);
            Sys.Application.add_load(tooltip);
            </script>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Class_Id" 
            DataSourceID="newClass">
            <ItemTemplate>
                <table id="tView" onclick="javascript:window.location='viewCourse.aspx?id=<%# Eval("Course_Id") %>';" >
                    <tr>
                        <td width="70%" 
                            style="border-right-style: solid; border-right-width: 1px; border-right-color: #000000; margin-right: 2px">
                            <span>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>'></asp:Label>
                            </span></td>
                        <td width="30%" style="margin-right: 2px" align="right">
                            &#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617; <span>
                            <asp:Label ID="Class_StartLabel" runat="server" 
                                Text='<%# Eval("Class_Start") %>'></asp:Label>
                            </span>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <table id="tView" onclick="javascript:window.location='viewCourse.aspx?id=<%# Eval("Course_Id") %>';" >
                    <tr>
                        <td width="70%" 
                            style="border-right-style: solid; border-right-width: 1px; border-right-color: #000000; margin-right: 2px">
                            <span>
                            <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Eval("CourseName") %>'></asp:Label>
                            </span></td>
                        <td width="30%" style="margin-right: 2px"  align="right">
                            &#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617; <span>
                            <asp:Label ID="Class_StartLabel" runat="server" 
                                Text='<%# Eval("Class_Start") %>'></asp:Label>
                            </span>
                        </td>
                    </tr>
                </table>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">CourseName:
                <asp:TextBox ID="CourseNameTextBox" runat="server" 
                    Text='<%# Bind("CourseName") %>' />
                <br />
                Class_Start:
                <asp:TextBox ID="Class_StartTextBox" runat="server" 
                    Text='<%# Bind("Class_Start") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
                <br />
                </span>
            </InsertItemTemplate>
            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span style="" >
                    <span ID="itemPlaceholder" runat="server"></span></span>
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <EditItemTemplate>
                <span style="">Class_Id:
                <asp:Label ID="Class_IdLabel1" runat="server" Text='<%# Eval("Class_Id") %>' />
                <br />
                CourseName:
                <asp:TextBox ID="CourseNameTextBox" runat="server" 
                    Text='<%# Bind("CourseName") %>' />
                <br />
                Class_Start:
                <asp:TextBox ID="Class_StartTextBox" runat="server" 
                    Text='<%# Bind("Class_Start") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br />
                <br />
                </span>
            </EditItemTemplate>
            <SelectedItemTemplate>
                <span style="">Class_Id:
                <asp:Label ID="Class_IdLabel" runat="server" Text='<%# Eval("Class_Id") %>' />
                <br />
                CourseName:
                <asp:Label ID="CourseNameLabel" runat="server" 
                    Text='<%# Eval("CourseName") %>' />
                <br />
                Class_Start:
                <asp:Label ID="Class_StartLabel" runat="server" 
                    Text='<%# Eval("Class_Start") %>' />
                <br />
                <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <p>
            <asp:SqlDataSource ID="newClass" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConString %>" 
                SelectCommand="SELECT TOP 5 Class.Class_Id, Course.CourseName,Course.Course_Id, CONVERT(VARCHAR(10),Class.Class_Start,105) as Class_Start FROM Class, Course WHERE Class.Course_Id = Course.Course_Id and Class_Start > GETDATE() ORDER BY Class_Id DESC">
            </asp:SqlDataSource>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </p>
        <h3>
            &#3586;&#3656;&#3634;&#3623;&#3626;&#3634;&#3619; / &#3585;&#3636;&#3592;&#3585;&#3619;&#3619;&#3617;&#3605;&#3656;&#3634;&#3591; &#3654;</h3>
        <div>
            <asp:Label ID="lblEvent" runat="server"></asp:Label>
        </div>
</div>












</asp:Content>


