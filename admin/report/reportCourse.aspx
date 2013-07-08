<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reportCourse.aspx.vb" Inherits="admin_report_reportCourse" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ATIT ::: Report</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <eo:CallbackPanel ID="cp1" runat="server" 
            Triggers="{ControlID:ddlCourse;Parameter:},{ControlID:crv1;Parameter:}" 
            Width="98%">
            <asp:DropDownList ID="ddlCourse" runat="server" 
                AutoPostBack="True">
            </asp:DropDownList>
            <asp:Button ID="btnOk" runat="server" Text="OK" />
            <br />
            <CR:CrystalReportViewer ID="crv1" runat="server" AutoDataBind="true" 
                DisplayGroupTree="False" EnableDatabaseLogonPrompt="False" HasCrystalLogo="False" 
                ReuseParameterValuesOnRefresh="True" />
        </eo:CallbackPanel>
    
    </div>
    </form>
</body>
</html>
