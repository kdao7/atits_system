<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataPayment.aspx.vb" Inherits="admin_general_dataPayment" title="ATIT ::: Payment Cash" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function addClass() {
        $('#<% = txtIdCard.ClientID %>').focus(function() {
            $(this).parent().addClass('focus');
            $('#<% = lblIdCard.ClientID %>').fadeIn();
        });
    }

    function showWrongIdCard() {
        $('#hideIdCard').fadeIn(1000);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3626;&#3604; (Payment Cash)</h1>
      <asp:UpdatePanel ID="upPayCash" runat="server">
      <ContentTemplate>
      <script type="text/javascript">
          Sys.Application.add_load(textStyle);
          Sys.Application.add_load(tooltip);
      </script>
      <p>
                  &#3585;&#3619;&#3629;&#3585;&#3619;&#3627;&#3633;&#3626;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609; :
                  <asp:TextBox ID="txtIdCard" runat="server" Height="18px" MaxLength="13" 
                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                      Width="145px" Font-Italic="False"></asp:TextBox>
                  &nbsp;<asp:Button ID="btnIdCard" runat="server" BackColor="#FFFF66" 
                      BorderColor="Black" BorderStyle="Solid" style="cursor:pointer" Text="&#3588;&#3657;&#3609;&#3627;&#3634;" />
                  <br />
              </p>
              <div id="hideIdCard" 
              style="margin-left: 140px; margin-top: -10px; display: none;">
                  <asp:Label ID="lblIdCard" runat="server" ForeColor="Red"></asp:Label>
          </div>
              <asp:Panel ID="PNoPaid" runat="server">
                  <h3>
                      &#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3588;&#3657;&#3634;&#3591;&#3594;&#3635;&#3619;&#3632;</h3>
                  <p align="center">
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                          BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                          CellPadding="4" Visible="False" Width="95%">
                          <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                              HorizontalAlign="Left" VerticalAlign="Middle" />
                          <EmptyDataRowStyle BackColor="#FFFF66" />
                          <Columns>
                              <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="imgSelect" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/img/edit.gif" Text="Select" 
                                          ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3609;&#3637;&#3657;" />
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="Cs_Id" HeaderText="&#3621;&#3635;&#3604;&#3633;&#3610;&#3607;&#3637;&#3656;" SortExpression="Cs_Id">
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:BoundField>
                              <asp:BoundField DataField="CourseName" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                                  SortExpression="CourseName" />
                              <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Class_Start") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;" SortExpression="RegisDate">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("RegisDate") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblRegis" runat="server" Text='<%# Bind("RegisDate") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField DataField="Price" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;" 
                                  SortExpression="Price" >
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:BoundField>
                          </Columns>
                          <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                              ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                          <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                          <EmptyDataTemplate>
                              <p align="center" style="border: 1px solid #333333">
                                  &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3588;&#3657;&#3634;&#3591;&#3594;&#3635;&#3619;&#3632;</p>
                          </EmptyDataTemplate>
                          <SelectedRowStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="Black" />
                          <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                              ForeColor="#FFFFCC" />
                      </asp:GridView>
                  </p>
              </asp:Panel>
              <asp:Panel ID="PPaid" runat="server">
                  <h3 align="left">
                      &#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3588;&#3591;&#3588;&#3657;&#3634;&#3591;&#3594;&#3635;&#3619;&#3632;</h3>
                  <p align="center">
                      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                          BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                          CellPadding="4" Visible="False" Width="95%">
                          <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                              HorizontalAlign="Left" VerticalAlign="Middle" />
                          <EmptyDataRowStyle BackColor="#FFFF66" />
                          <Columns>
                              <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="imgSelect0" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/img/edit.gif" Text="Select" 
                                          ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3609;&#3637;&#3657;" />
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="Cs_Id" HeaderText="&#3621;&#3635;&#3604;&#3633;&#3610;&#3607;&#3637;&#3656;" SortExpression="Cs_Id">
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:BoundField>
                              <asp:BoundField DataField="CourseName" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                                  SortExpression="CourseName" />
                              <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("Class_Start") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="lblStart0" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="Price" HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;" 
                                  SortExpression="Price" >
                                  <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                              </asp:BoundField>
                          </Columns>
                          <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                              ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                          <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                          <EmptyDataTemplate>
                              <p align="center" style="border: 1px solid #333333">
                                  &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3588;&#3657;&#3634;&#3591;&#3594;&#3635;&#3619;&#3632;</p>
                          </EmptyDataTemplate>
                          <SelectedRowStyle BackColor="#FFFF66" Font-Bold="True" ForeColor="Black" />
                          <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                              ForeColor="#FFFFCC" />
                      </asp:GridView>
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                          
                      </asp:ScriptManager>
                  </p>
              </asp:Panel>
              <asp:Panel ID="pPayment" runat="server" Visible="False">
                  <table id="tPayment0" border="0" cellpadding="2" cellspacing="2" width="98%" 
                      style="font-size: 16px">
                      <tr>
                          <td width="20%">
                              <div align="right">
                                  &#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                              </div>
                          </td>
                          <td colspan="2" style="width: 80%" width="47%">
                              <div align="left">
                                  <asp:Label ID="lblCourse" runat="server"></asp:Label>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="35%">
                              <div align="right">
                                  &#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617; :
                              </div>
                          </td>
                          <td width="32%">
                              <div align="left">
                                  <asp:Label ID="lblStart" runat="server"></asp:Label>
                              </div>
                          </td>
                          <td width="33%">
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="35%">
                              <div align="right">
                                  &#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3605;&#3657;&#3629;&#3591;&#3594;&#3635;&#3619;&#3632; :
                              </div>
                          </td>
                          <td width="32%">
                              <div align="left">
                                  <asp:Label ID="lblAmount" runat="server"></asp:Label>
                              </div>
                          </td>
                          <td width="33%">
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="35%" colspan="3" style="width: 77%">
                              <div align="center">
                                  <asp:Label ID="lblChk0" runat="server" ForeColor="Red" 
                                      Text="&#3585;&#3619;&#3640;&#3603;&#3634;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3651;&#3627;&#3657;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591;&#3585;&#3656;&#3629;&#3609;&#3585;&#3604;&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;"></asp:Label>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="35%">
                              &nbsp;</td>
                          <td align="center" width="32%">
                              <asp:Button ID="btnCash" runat="server" BackColor="#FFFF66" 
                                  BorderColor="Black" BorderStyle="Solid" 
                                  OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;');" style="cursor:pointer" 
                                  Text="&#3605;&#3585;&#3621;&#3591;" Visible="False" />
                              &nbsp;
                              <asp:Button ID="btnPaid" runat="server" BackColor="#FFFF66" BorderColor="Black" 
                                  BorderStyle="Solid" OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;');" 
                                  style="cursor:pointer" Text="&#3605;&#3585;&#3621;&#3591;" Visible="False" />
                          </td>
                          <td width="33%">
                          </td>
                      </tr>
                  </table>
              </asp:Panel>
      </ContentTemplate>
          <Triggers>
              <asp:AsyncPostBackTrigger ControlID="btnCash" EventName="Click" />
              <asp:AsyncPostBackTrigger ControlID="btnPaid" EventName="Click" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" 
                  EventName="SelectedIndexChanged" />
              <asp:AsyncPostBackTrigger ControlID="GridView2" 
                  EventName="SelectedIndexChanged" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="DataBinding" />
              <asp:AsyncPostBackTrigger ControlID="GridView2" EventName="DataBinding" />
              <asp:AsyncPostBackTrigger ControlID="btnIdCard" EventName="Click" />
          </Triggers>
      </asp:UpdatePanel>
</div>

</asp:Content>


