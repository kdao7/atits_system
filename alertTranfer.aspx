<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="alertTranfer.aspx.vb" Inherits="alertTranfer" title="ATIT ::: Alert Payment" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<%@ Register src="alert.ascx" tagname="alert" tagprefix="uc1" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3649;&#3592;&#3657;&#3591;&#3585;&#3634;&#3619;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;</h1>
        <uc1:alert ID="alert1" runat="server" />
      
</div>

</asp:Content>


