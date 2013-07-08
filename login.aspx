<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" title="Untitled Page" %>

<%@ Register src="sidebar.ascx" tagname="sidebar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3648;&#3586;&#3657;&#3634;&#3626;&#3641;&#3656;&#3619;&#3632;&#3610;&#3610;(login)</h1>
    <blockquote>
        <uc1:sidebar ID="sidebar2" runat="server" />
    </blockquote>
</div>

</asp:Content>


