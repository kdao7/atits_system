<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataAlert.aspx.vb" Inherits="admin_general_dataAlert" title="ATIT ::: Tranfer Data" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>
<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3585;&#3634;&#3619;&#3649;&#3592;&#3657;&#3591;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;&#3586;&#3629;&#3591;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585; (Tranfer data)</h1>
      <asp:UpdatePanel ID="upTranferData" runat="server">
      <ContentTemplate>
      <script type="text/javascript">
          Sys.Application.add_load(textStyle);
          Sys.Application.add_load(tooltip);
      </script>
      <p>
                  &#3648;&#3621;&#3639;&#3629;&#3585;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3617;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619; :
                  <asp:TextBox ID="txtDate" runat="server" Height="18px" 
        ReadOnly="True" Width="80px"></asp:TextBox>
                  <rjs:PopCalendar ID="pc1" runat="server" 
        AutoPostBack="True" Control="txtDate" Format="yyyy mm dd" From-Date="2012-10-01" 
                      Separator="/" To-Date="" To-Today="True" 
                      ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;" />
              </p>
              <p>
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Alert_Id" DataSourceID="Alert" ShowFooter="True" 
                      Width="95%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:BoundField DataField="Username" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;" 
                              SortExpression="Username" />
                          <asp:BoundField DataField="Student_Acc" HeaderText="&#3610;&#3633;&#3597;&#3594;&#3637;&#3612;&#3641;&#3657;&#3650;&#3629;&#3609;" 
                              SortExpression="Student_Acc">
                              <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3648;&#3623;&#3621;&#3634;&#3607;&#3637;&#3656;&#3650;&#3629;&#3609;" SortExpression="DateTranfer">
                              <ItemTemplate>
                                  <asp:Label ID="lblDate" runat="server" Text='<%# Bind("DateTranfer") %>'></asp:Label>
                                  &nbsp;<asp:Label ID="lblTime" runat="server" Text='<%# Bind("TimeTranfer") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DateTranfer") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;" SortExpression="Pay_Date">
                              <ItemTemplate>
                                  <asp:Label ID="lblDateAdd" runat="server" Text='<%# Bind("Pay_Date") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pay_Date") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:BoundField DataField="B_Name" FooterText="&#3619;&#3623;&#3617;" HeaderText="&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3607;&#3637;&#3656;&#3650;&#3629;&#3609;" 
                              SortExpression="B_Name">
                              <FooterStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;" SortExpression="Amount">
                              <ItemTemplate>
                                  <asp:Label ID="Label4" runat="server" Text='<%# Bind("Amount") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <FooterStyle Font-Underline="True" ForeColor="White" HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                      </Columns>
                      <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <EmptyDataTemplate>
                          <p align="center" style="border: 1px solid #333333">
                              &#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;&#3651;&#3609;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3619;&#3637;&#3618;&#3585;&#3604;&#3641;</p>
                      </EmptyDataTemplate>
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
                  </asp:GridView>
              </p>
              <p>
                  <asp:SqlDataSource ID="Alert" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConString %>" 
                      SelectCommand="SELECT CONVERT(VARCHAR(10),p.Pay_Date,105) as Pay_Date,a.Alert_Id,a.Student_Acc,CONVERT(VARCHAR(10),a.DateTranfer,105) as DateTranfer,a.TimeTranfer,a.Amount ,b.B_Name,s.Username FROM Alert a,Payment p, Bank b, Class_Student cs, Student s WHERE p.Cs_Id = a.Cs_Id and a.B_Id = b.B_Id and cs.Cs_Id = p.Cs_Id and a.Cs_Id = cs.Cs_Id and s.S_Id = cs.S_Id and Pay_Date=@pdate ORDER BY Alert_Id DESC">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txtDate" Name="pdate" PropertyName="Text" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
              </p>
      </ContentTemplate>
      </asp:UpdatePanel>
              
</div>

</asp:Content>


