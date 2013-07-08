<%@ Page Language="VB" MasterPageFile="~/admin/report/main.master" AutoEventWireup="false" CodeFile="reportCourse2.aspx.vb" Inherits="admin_report_reportCourse2" title="ATIT ::: Report" %>
<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h1>
    
        <eo:CallbackPanel ID="cp1" runat="server" 
            Triggers="{ControlID:ddlCourse;Parameter:},{ControlID:crv1;Parameter:}" 
            Width="98%">
            <p>&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </p>
            <br />
            <CR:CrystalReportViewer ID="crv2" runat="server" AutoDataBind="true" 
                DisplayGroupTree="False" EnableDatabaseLogonPrompt="False" 
                EnableParameterPrompt="False" HasCrystalLogo="False" 
                DisplayToolbar="False" />
        </eo:CallbackPanel>
    
</div>

</asp:Content>


