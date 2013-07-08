<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="admin_report_Default" title="ATIT ::: Report" %>

<%@ Register src="reportMenu.ascx" tagname="reportMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609; (Report)</h1>
      <p>
          <uc1:reportMenu ID="reportMenu1" runat="server" />
      </p>
</div>

</asp:Content>


