<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="payment.aspx.vb" Inherits="payment" title="ATIT ::: Payment" %>

<%@ Register src="alert.ascx" tagname="alert" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function choice() {
            $("#<% = rdoTranfer.ClientID %>").change(function() {
                if ($(this).is(":checked")) {
                    $("#<% = pTranfer.ClientID %>").slideDown();
                    $("#<% = pCredit.ClientID %>").slideUp();
                }
            });

            $("#<% = rdoCredit.ClientID %>").change(function() {
                if ($(this).is(":checked")) {
                    $("#<% = pCredit.ClientID %>").slideDown();
                    $("#<% = pTranfer.ClientID %>").slideUp();
                }

            });
        }
        $(document).ready(function() {

            //&#3649;&#3626;&#3604;&#3591;/&#3595;&#3656;&#3629;&#3609; &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3648;&#3617;&#3639;&#3656;&#3629; textbox
            $("#<% = txtCvv.ClientID %>").focus(function() {
                $("#cvv").slideDown();
                //$("#<% = txtName.ClientID %>").attr("disabled", "disabled");
            });

            $("#<% = txtCvv.ClientID %>").blur(function() {
                $("#cvv").slideUp();
                //$("#<% = txtName.ClientID %>").removeAttr("disabled");
            });

            $("#<% = txtNumber.ClientID %>").focus(function() {
                $("#creditnum").slideDown();
            });

            $("#<% = txtNumber.ClientID %>").blur(function() {
                $("#creditnum").slideUp();
            });

            //&#3588;&#3635;&#3609;&#3623;&#3603;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3648;&#3621;&#3639;&#3629;&#3585;&#3592;&#3656;&#3634;&#3618; &#3649;&#3610;&#3610;&#3588;&#3619;&#3638;&#3656;&#3591;&#3627;&#3609;&#3638;&#3656;&#3591;&#3627;&#3619;&#3639;&#3629;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;
            $("#<% = rdoFull.ClientID %>").change(function() {
                if ($(this).is(":checked")) {
                    var myText = $("#<% = txtAmount.ClientID %>").val();
                    myText = myText * 2;
                    $("#<% = txtAmount.ClientID %>").val(myText);
                }
            });

            $("#<% = rdoHalf.ClientID %>").change(function() {
                if ($(this).is(":checked")) {
                    var myText = $("#<% = txtAmount.ClientID %>").val();
                    myText = myText / 2;
                    $("#<% = txtAmount.ClientID %>").val(myText);
                }
            });
        });
</script>
    </asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; (Checkout)</h1>
      <h3>&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h3>
      <p align="center">
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Cs_Id" ShowFooter="True" 
                      Width="95%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                              SortExpression="CourseName">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblCourse" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField FooterText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3594;&#3635;&#3619;&#3632;&#3607;&#3633;&#3657;&#3591;&#3626;&#3636;&#3657;&#3609;" 
                              
                              HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" 
                              SortExpression="Class_Start">
                              <EditItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("Class_Start") %>'></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                              </ItemTemplate>
                              <FooterStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;" 
                              SortExpression="Column1">
                              <EditItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                              </ItemTemplate>
                              <FooterStyle Font-Bold="True" Font-Underline="True" ForeColor="White" 
                                  HorizontalAlign="Center" VerticalAlign="Middle" />
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                      </Columns>
                      <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <EmptyDataTemplate>
                          <p align="center" style="border: 1px solid #333333">
                              &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3652;&#3623;&#3657;</p>
                      </EmptyDataTemplate>
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
                  </asp:GridView>
                  </p>
      <h3 align="left">&#3623;&#3636;&#3608;&#3637;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;</h3><blockquote>
      <asp:UpdatePanel ID="upPayment" runat="server">
          <ContentTemplate>
          <script type="text/javascript">
              Sys.Application.add_load(textStyle);
              Sys.Application.add_load(showToolTip);
              Sys.Application.add_load(choice);
        </script>
              <asp:Panel ID="pChoice" runat="server">
              <p align="left">
                      <asp:RadioButton ID="rdoCredit" 
                      runat="server" 
                      GroupName="1" 
                      Text="&#3594;&#3635;&#3619;&#3632;&#3612;&#3656;&#3634;&#3609;&#3610;&#3633;&#3605;&#3619;&#3648;&#3588;&#3619;&#3604;&#3636;&#3605;" 
                          Checked="True" />
                      <asp:RadioButton ID="rdoTranfer" 
                      runat="server" 
                      GroupName="1" 
                      Text="&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;&#3612;&#3656;&#3634;&#3609;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;" />
                      <asp:Panel ID="pTranfer" runat="server" CssClass="hide">
                  <table cellpadding="5px" cellspacing="5px" class="view" id="Tranfer" 
                          style="width:100%; color: #000000; font-style: normal; ">
                          <tr align="right">
                              <td style="width:35%;" align="center">
                                  &#3585;&#3656;&#3629;&#3609;&#3607;&#3635;&#3585;&#3634;&#3619; &quot;&#3649;&#3592;&#3657;&#3591;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;&quot; 
                                  &#3585;&#3619;&#3640;&#3603;&#3634;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3618;&#3629;&#3604;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3594;&#3635;&#3619;&#3632;&#3651;&#3627;&#3657;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591;&#3648;&#3619;&#3637;&#3618;&#3610;&#3619;&#3657;&#3629;&#3618;&#3585;&#3656;&#3629;&#3609; 
                                <br />&#3627;&#3634;&#3585;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3612;&#3636;&#3604;&#3614;&#3621;&#3634;&#3604;&#3592;&#3632;&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3649;&#3585;&#3657;&#3652;&#3586;&#3652;&#3604;&#3657; &#3649;&#3621;&#3632; &#3607;&#3634;&#3591;&#3624;&#3641;&#3609;&#3618;&#3660;&#3631;&#3592;&#3632;&#3652;&#3617;&#3656;&#3619;&#3633;&#3610;&#3612;&#3636;&#3604;&#3594;&#3629;&#3610;&#3651;&#3604; &#3654; 
                                  &#3607;&#3633;&#3657;&#3591;&#3626;&#3636;&#3657;&#3609;<br />
                                  <br />
                                  <asp:Button ID="btnAlert" runat="server" BackColor="#FFFF66" 
                                      BorderColor="Black" BorderStyle="Solid" style="cursor: pointer" 
                                      Text="&#3649;&#3592;&#3657;&#3591;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;" />
                                  </td>
                              </tr>
                              </table>
                  </asp:Panel> 
                     <asp:Panel ID="pCredit" runat="server">
                     <table cellpadding="5px" cellspacing="5px" class="view" id="credit" 
                          style="width:100%; color: #000000; font-style: normal; ">
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:RadioButton ID="rdoFull" runat="server" Checked="True" 
                                      GroupName="pay" 
                                      Text="&#3594;&#3635;&#3619;&#3632;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;" />
                                  <asp:RadioButton ID="rdoHalf" runat="server" 
                                      GroupName="pay" 
                                      Text="&#3594;&#3635;&#3619;&#3632;&#3588;&#3619;&#3638;&#3656;&#3591;&#3627;&#3609;&#3638;&#3656;&#3591; (&#3617;&#3633;&#3604;&#3592;&#3635;)" />
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3611;&#3619;&#3632;&#3648;&#3616;&#3607;&#3610;&#3633;&#3605;&#3619;&#3648;&#3588;&#3619;&#3604;&#3636;&#3605; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:RadioButton ID="rdoVisa" runat="server" Checked="True" GroupName="2" />
                                  <img alt="Visa" src="img/visa.gif" style="width: 60px; height: 40px" /><asp:RadioButton 
                                      ID="rdoMaster" runat="server" GroupName="2" />
                                  <img alt="Master Card" src="img/mastercd.gif" 
                                      style="width: 60px; height: 40px" /></td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3612;&#3641;&#3657;&#3629;&#3629;&#3585;&#3610;&#3633;&#3605;&#3619; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:DropDownList ID="ddlCreditBank" runat="server" DataSourceID="creditBank" 
                                      DataTextField="Bank_Name" DataValueField="Credit_Bank_Id">
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3648;&#3588;&#3619;&#3604;&#3636;&#3605; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:TextBox ID="txtNumber" runat="server" Height="18px" MaxLength="16" 
                                  onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;"></asp:TextBox>
                                  <div id="creditnum" align="left" dir="ltr" 
                                      style="color: #FF0000;">
                                      &#3585;&#3619;&#3629;&#3585;&#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3648;&#3588;&#3619;&#3604;&#3636;&#3605; 16 &#3627;&#3621;&#3633;&#3585;</div>
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3606;&#3639;&#3629;&#3610;&#3633;&#3605;&#3619; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:TextBox ID="txtName" runat="server" Height="18px" MaxLength="30" 
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57){event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                                  <div>
                                      &#3619;&#3632;&#3610;&#3640;&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3606;&#3639;&#3629;&#3610;&#3633;&#3605;&#3619;</div>
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3619;&#3627;&#3633;&#3626; CVV :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:TextBox ID="txtCvv" runat="server" Height="18px" MaxLength="3" 
                                       
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                      Width="40px"></asp:TextBox>
                              </td>
                          </tr>
                          <tr align="center">
                              <td colspan="2">
                                  <div id="cvv" style="color: #FF0000; display: none;">
                                      &#3619;&#3627;&#3633;&#3626; CVV 3 &#3627;&#3621;&#3633;&#3585;&#3604;&#3657;&#3634;&#3609;&#3627;&#3621;&#3633;&#3591;&#3610;&#3633;&#3605;&#3619;&#3648;&#3588;&#3619;&#3604;&#3636;&#3605;<br />
                                      <img src="img/cvv-visa.gif" style="width: 187px; height: 96px" /></div>
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3623;&#3633;&#3609;&#3627;&#3617;&#3604;&#3629;&#3634;&#3618;&#3640;&#3610;&#3633;&#3605;&#3619; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:DropDownList ID="ddlMonth" runat="server">
                                      <asp:ListItem Value="1">&#3617;&#3585;&#3619;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="2">&#3585;&#3640;&#3617;&#3616;&#3634;&#3614;&#3633;&#3609;&#3608;&#3660;</asp:ListItem>
                                      <asp:ListItem Value="3">&#3617;&#3637;&#3609;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="4">&#3648;&#3617;&#3625;&#3634;&#3618;&#3609;</asp:ListItem>
                                      <asp:ListItem Value="5">&#3614;&#3620;&#3625;&#3616;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="6">&#3617;&#3636;&#3606;&#3640;&#3609;&#3634;&#3618;&#3609;</asp:ListItem>
                                      <asp:ListItem Value="7">&#3585;&#3619;&#3585;&#3599;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="8">&#3626;&#3636;&#3591;&#3627;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="9">&#3585;&#3633;&#3609;&#3618;&#3634;&#3618;&#3609;</asp:ListItem>
                                      <asp:ListItem Value="10">&#3605;&#3640;&#3621;&#3634;&#3588;&#3617;</asp:ListItem>
                                      <asp:ListItem Value="11">&#3614;&#3620;&#3624;&#3592;&#3636;&#3585;&#3634;&#3618;&#3609;</asp:ListItem>
                                      <asp:ListItem Value="12">&#3608;&#3633;&#3609;&#3623;&#3634;&#3588;&#3617;</asp:ListItem>
                                  </asp:DropDownList>
                                  <asp:DropDownList ID="ddlYear" runat="server">
                                  </asp:DropDownList>
                              </td>
                          </tr>
                          <tr align="right">
                              <td style="width:35%;">
                                  &#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3605;&#3657;&#3629;&#3591;&#3594;&#3635;&#3619;&#3632; :&nbsp;</td>
                              <td align="left" style="width:65%;">
                                  <asp:TextBox ID="txtAmount" runat="server" Enabled="False" Height="18px" 
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                      Width="40px"></asp:TextBox>
                                  &nbsp;&#3610;&#3634;&#3607;</td>
                          </tr>
                          <tr align="right">
                              <td align="center" colspan="2">
                                  <asp:Button ID="btnCredit" runat="server" BackColor="#FFFF66" 
                                      BorderColor="Black" BorderStyle="Solid" 
                                      OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;');" style="cursor: pointer" 
                                      Text="&#3605;&#3585;&#3621;&#3591;" />
                              </td>
                          </tr>
                      </table>
                     </asp:Panel>
                  </asp:Panel>
                  <p align="center">
                      <asp:ScriptManager ID="ScriptManager1" runat="server">
                      </asp:ScriptManager>
                      <asp:SqlDataSource ID="creditBank" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConString %>" 
                          SelectCommand="SELECT * FROM [Credit_Bank] ORDER BY [Bank_Name]">
                      </asp:SqlDataSource>
                  </p>
              </p>
              </div>
              
          </ContentTemplate>
      </asp:UpdatePanel>
      </blockquote>
</div>

</asp:Content>


