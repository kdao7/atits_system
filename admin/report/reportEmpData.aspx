<%@ Page Language="VB" MasterPageFile="~/admin/report/main.master" AutoEventWireup="false" CodeFile="reportEmpData.aspx.vb" Inherits="admin_report_reportEmpData" title="" %>
<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609;</h1>
      <p>&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3648;&#3621;&#3639;&#3629;&#3585;&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609;&#3652;&#3604;&#3657;&#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
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
                              BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="lecturer" 
                              Width="75%">
                              <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                                  HorizontalAlign="Left" VerticalAlign="Middle" />
                              <EmptyDataRowStyle BackColor="#FFFF66" />
                              <Columns>
                                  <asp:TemplateField HeaderImageUrl="~/img/edit.gif" ShowHeader="False">
                                      <ItemTemplate>
                                          <asp:ImageButton ID="imgSelect" runat="server" CausesValidation="false" 
                                              CommandName="Select" ImageUrl="~/img/edit.gif" Text="select" 
                                              ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;" />
                                          <asp:Label ID="lblLecturerId" runat="server" Text='<%# Bind("Lecturer_Id") %>' 
                                              Visible="False"></asp:Label>
                                      </ItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629; - &#3626;&#3585;&#3640;&#3621;" SortExpression="FirstName">
                                      <ItemTemplate>
                                          <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                          &nbsp;
                                          <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                                      </ItemTemplate>
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="&#3648;&#3614;&#3624;">
                                      <ItemTemplate>
                                          <asp:Label ID="lblSex" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                                      </ItemTemplate>
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="&#3648;&#3591;&#3636;&#3609;&#3648;&#3604;&#3639;&#3629;&#3609;" SortExpression="Salary">
                                      <ItemTemplate>
                                          <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary") %>'></asp:Label>
                                      </ItemTemplate>
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Salary") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                      <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                  </asp:TemplateField>
                                  <asp:TemplateField HeaderText="&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591;" SortExpression="Position">
                                      <ItemTemplate>
                                          <asp:Label ID="lblPosition" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                                      </ItemTemplate>
                                      <EditItemTemplate>
                                          <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Position") %>'></asp:TextBox>
                                      </EditItemTemplate>
                                  </asp:TemplateField>
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
                          <asp:SqlDataSource ID="lecturer" runat="server" 
                              ConnectionString="<%$ ConnectionStrings:ConString %>" 
                              SelectCommand="SELECT [Lecturer_Id], [FirstName], [LastName], [Gender], [Salary], [Position] FROM [Lecturer]">
                          </asp:SqlDataSource>
                      </p>
                      <p align="left">
                          &#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609; :
                          <asp:ImageButton ID="imgPdf" runat="server" Enabled="False" 
                              ImageUrl="~/admin/report/img/pdf-icon-small.gif" />
                          <asp:ImageButton ID="imgDoc" runat="server" Enabled="False" 
                              ImageUrl="~/admin/report/img/word-icon-small.gif" />
                          <asp:ImageButton ID="imgXls" runat="server" Enabled="False" 
                              ImageUrl="~/admin/report/img/excel-icon.gif" />
                          <CR:CrystalReportViewer ID="EmpDataReport" runat="server" AutoDataBind="true" 
                              DisplayGroupTree="False" EnableDatabaseLogonPrompt="False" 
                              EnableParameterPrompt="False" HasCrystalLogo="False" HasDrillUpButton="False" 
                              HasExportButton="False" HasGotoPageButton="False" HasPrintButton="False" 
                              HasSearchButton="False" HasToggleGroupTreeButton="False" HasViewList="False" 
                              HasZoomFactorList="False" ReuseParameterValuesOnRefresh="True" 
                              ToolbarStyle-BackColor="#FFFF99" Visible="False" DisplayToolbar="False" />
                          <p>
                              <asp:Label ID="lblNone" runat="server" Font-Bold="True" Font-Size="Large" 
                                  ForeColor="Red" Text="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;" Visible="False"></asp:Label>
                              <asp:ScriptManager ID="ScriptManager1" runat="server">
                              </asp:ScriptManager>
                          </p>
                          <p>
                          </p>
                      </p>
                  </ContentTemplate>
              </asp:UpdatePanel>
</div>

</asp:Content>


