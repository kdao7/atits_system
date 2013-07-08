<%@ Page Language="VB" MasterPageFile="~/admin/report/main.master" AutoEventWireup="false" CodeFile="reportMemberData.aspx.vb" Inherits="admin_report_reportMemberData" title="ATIT ::: Report" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3621;&#3641;&#3585;&#3588;&#3657;&#3634;</h1>
        <p>&#3648;&#3621;&#3639;&#3629;&#3585;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3621;&#3641;&#3585;&#3588;&#3657;&#3634;&#3592;&#3634;&#3585;&#3605;&#3634;&#3619;&#3634;&#3591;&#3604;&#3657;&#3634;&#3609;&#3621;&#3656;&#3634;&#3591; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
            <img alt="" src="../../img/edit.gif" style="width: 24px; height: 24px" /></p>
     <asp:UpdatePanel ID="upReport" runat="server">
            <ContentTemplate>
             <script type="text/javascript">
                 Sys.Application.add_load(BindEvents);
                 Sys.Application.add_load(tooltip);
            </script>
                <p align="left">
                  <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                      AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="S_Id" 
                      DataSourceID="member" Width="75%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:ImageButton ID="imgSelect" runat="server" CausesValidation="False" 
                                      CommandName="Select" ImageUrl="~/img/edit.gif" Text="Select" 
                                      ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:BoundField DataField="Username" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;" 
                              SortExpression="Username" />
                          <asp:TemplateField HeaderText="&#3648;&#3614;&#3624;" SortExpression="Gender">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblSex" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:BoundField DataField="Mobile" HeaderText="&#3648;&#3610;&#3629;&#3619;&#3660;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;" 
                              SortExpression="Mobile" />
                          <asp:BoundField DataField="Email" 
                              HeaderText="&#3629;&#3637;&#3648;&#3617;&#3621;&#3621;&#3660;" 
                              SortExpression="Email" />
                      </Columns>
                      <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <EmptyDataTemplate>
                          <p align="center" style="border: 1px solid #333333">
                              &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3652;&#3623;&#3657;</p>
                      </EmptyDataTemplate>
                      <SelectedRowStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="Black" />
                      <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="member" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConString %>" 
                      SelectCommand="SELECT [S_Id], [Username], [FirstName], [LastName], [Idcard], CONVERT(VARCHAR(10),Birth,105) as Birth, [Gender], [Address], [Province], [City], [District], [Postcode], [Tel], [Mobile], [Email] FROM [Student] ORDER BY [S_Id] DESC">
                  </asp:SqlDataSource>
              </p>
        <p align="left">
              &#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609; :
              <asp:ImageButton ID="imgPdf" runat="server" 
                  ImageUrl="~/admin/report/img/pdf-icon-small.gif" Enabled="False" />
              <asp:ImageButton ID="imgDoc" runat="server" 
                  ImageUrl="~/admin/report/img/word-icon-small.gif" Enabled="False" />
              <asp:ImageButton ID="imgXls" runat="server" 
                  ImageUrl="~/admin/report/img/excel-icon.gif" Enabled="False" />
              <CR:CrystalReportViewer ID="MemberDataReport" runat="server" 
                  AutoDataBind="true" DisplayGroupTree="False" 
                  EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" 
                  HasCrystalLogo="False" HasDrillUpButton="False" HasGotoPageButton="False" 
                  HasSearchButton="False" HasToggleGroupTreeButton="False" HasViewList="False" 
                  HasZoomFactorList="False" Visible="False" 
                  ReuseParameterValuesOnRefresh="True" HasExportButton="False" 
                  HasPrintButton="False" ToolbarStyle-BackColor="#FFFF99" />
                  <p>
                      <asp:Label ID="lblNone" runat="server" Font-Bold="True" Font-Size="Large" 
                          ForeColor="Red" Text="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;" Visible="False"></asp:Label>
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
              </p>
                                   
            </ContentTemplate>
        </asp:UpdatePanel>
     
        
</div>

</asp:Content>


