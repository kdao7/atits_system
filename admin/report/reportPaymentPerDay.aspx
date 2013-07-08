<%@ Page Language="VB" MasterPageFile="~/admin/report/main.master" AutoEventWireup="false" CodeFile="reportPaymentPerDay.aspx.vb" Inherits="admin_report_reportPaymentPerDay" title="ATIT ::: Report" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>
<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3586;&#3629;&#3591;&#3621;&#3641;&#3585;&#3588;&#3657;&#3634;</h1>
        <asp:UpdatePanel ID="upReport" runat="server">
            <ContentTemplate>
            <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
                Sys.Application.add_load(tooltip);
            </script>
                <p>&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656; :
          <asp:TextBox ID="txtDate" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
          <rjs:PopCalendar ID="pcDate" runat="server" AutoPostBack="True" 
              Control="txtDate" Fade="1" Format="yyyy mm dd" From-Date="2012-10-01" 
              To-Date="" To-Today="True" ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;" />
                    &nbsp;&#3606;&#3638;&#3591;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656; :&nbsp;<asp:TextBox ID="txtDate0" runat="server" ReadOnly="True" 
              Width="80px"></asp:TextBox><rjs:PopCalendar ID="pcDate0" runat="server" 
              AutoPostBack="False" Control="txtDate0" Enabled="False" Fade="1" 
              Format="yyyy mm dd" From-Control="txtDate" From-Date="" To-Date="" 
              To-Today="True" ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;" />
                    &nbsp;<asp:Button ID="btnOk" runat="server" Enabled="False" Text="&#3605;&#3585;&#3621;&#3591;" />
          </p>
      <p>
              &#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609; :
              <asp:ImageButton ID="imgPdf" runat="server" 
                  ImageUrl="~/admin/report/img/pdf-icon-small.gif" Enabled="False" />
              <asp:ImageButton ID="imgDoc" runat="server" 
                  ImageUrl="~/admin/report/img/word-icon-small.gif" Enabled="False" />
              <asp:ImageButton ID="imgXls" runat="server" 
                  ImageUrl="~/admin/report/img/excel-icon.gif" Enabled="False" />
              <CR:CrystalReportViewer ID="MemberPaymentReport" runat="server" 
                  AutoDataBind="true" DisplayGroupTree="False" 
                  EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" 
                  HasCrystalLogo="False" HasDrillUpButton="False" HasGotoPageButton="False" 
                  HasSearchButton="False" HasToggleGroupTreeButton="False" HasViewList="False" 
                  HasZoomFactorList="False" ReuseParameterValuesOnRefresh="True" 
                  HasPrintButton="False" Visible="False" ToolbarStyle-BackColor="#FFFF99" 
                  HasExportButton="False" />
              <p>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
                  <asp:Label ID="lblNone" runat="server" Font-Bold="True" Font-Size="Large" 
                      ForeColor="Red" Text="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;" Visible="False"></asp:Label>
              </p>
          </p>
            </ContentTemplate>
        </asp:UpdatePanel>
     
</div>

</asp:Content>


