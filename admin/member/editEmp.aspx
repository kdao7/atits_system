<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="editEmp.aspx.vb" Inherits="admin_member_editEmp" title="ATIT ::: Employees Data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    function showProfile() {
        $('input[type="image"]').click(function() {
            $('#<% = pProfile.ClientID %>').slideDown(1000);
        });
    }
    function checkMobile(id) {
        $('#' + id + ' ~ div').slideDown();
    }
    function showUpdate() {
        $('#active').fadeIn(100);
        $('#active').fadeOut(4000);
    }
    
    $(document).ready(function() {
        $('#<% = pProfile.ClientID %>').hide();

    });
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1><span style="color:#9C386A;">&#3592;&#3633;&#3604;&#3585;&#3634;&#3619;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609; (employees data)</span></h1>
      <asp:UpdatePanel ID="upMember" runat="server">
          <ContentTemplate>
          <script type="text/javascript">
              Sys.Application.add_load(textStyle);
              Sys.Application.add_load(showProfile);
              Sys.Application.add_load(showToolTip);
              Sys.Application.add_load(tooltip);
          </script>
              <p>
                  &#3648;&#3621;&#3639;&#3629;&#3585;&#3619;&#3634;&#3618;&#3594;&#3639;&#3656;&#3629;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;&#3607;&#3637;&#3656;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3649;&#3585;&#3657;&#3652;&#3586;&#3592;&#3634;&#3585;&#3605;&#3634;&#3619;&#3634;&#3591;&#3604;&#3657;&#3634;&#3609;&#3621;&#3656;&#3634;&#3591; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
                  <img alt="Edit" src="../../img/edit.gif" style="width: 24px; height: 24px" onclick="showProfile();" /></p>
              <asp:Panel ID="pProfile" runat="server">
                  <table id="tProfile" border="0" cellpadding="2" cellspacing="2" width="98%" >
                      <tr>
                          <td width="25%">
                              <div align="right">
                                  &#3594;&#3639;&#3656;&#3629; :
                              </div>
                          </td>
                          <td width="42%">
                              <div align="left">
                                  <asp:TextBox ID="txtFname" runat="server" Height="18px" MaxLength="30" 
                                      Width="145px"></asp:TextBox>
                                  *</div>
                          </td>
                          <td width="33%">
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3609;&#3634;&#3617;&#3626;&#3585;&#3640;&#3621; :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:TextBox ID="txtLname" runat="server" Height="18px" MaxLength="30" 
                                      Width="145px"></asp:TextBox>
                                  *</div>
                          </td>
                          <td>
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3648;&#3614;&#3624; :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:Label ID="lblSex0" runat="server"></asp:Label>
                              </div>
                          </td>
                          <td>
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609; :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:Label ID="lblIdCard" runat="server"></asp:Label>
                              </div>
                          </td>
                          <td>
                              <div align="left">
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3607;&#3637;&#3656;&#3629;&#3618;&#3641;&#3656; :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:TextBox ID="txtAddress" runat="server" Height="18px" MaxLength="50" 
                                      Width="220px"></asp:TextBox>
                                  *<div align="left">
                                      &#3607;&#3637;&#3656;&#3629;&#3618;&#3641;&#3656;&#3607;&#3637;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3605;&#3636;&#3604;&#3605;&#3656;&#3629;&#3652;&#3604;&#3657;</div>
                              </div>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              &#3592;&#3633;&#3591;&#3627;&#3623;&#3633;&#3604; :</td>
                          <td>
                              <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" 
                                  DataSourceID="Province" DataTextField="Province" DataValueField="Province" 
                                  ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3592;&#3633;&#3591;&#3627;&#3623;&#3633;&#3604;">
                              </asp:DropDownList>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              &#3629;&#3635;&#3648;&#3616;&#3629; :</td>
                          <td>
                              <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                                  ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3629;&#3635;&#3648;&#3616;&#3629;">
                              </asp:DropDownList>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              &nbsp;&#3605;&#3635;&#3610;&#3621; :</td>
                          <td>
                              <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True" 
                                  ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3605;&#3635;&#3610;&#3621;">
                              </asp:DropDownList>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td align="right">
                              &#3619;&#3627;&#3633;&#3626;&#3652;&#3611;&#3619;&#3625;&#3603;&#3637;&#3618;&#3660; :</td>
                          <td>
                              <asp:DropDownList ID="ddlPostcode" runat="server" AutoPostBack="True">
                              </asp:DropDownList>
                          </td>
                          <td>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660; :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:Panel ID="PTel" runat="server">
                                      <asp:TextBox ID="txtTel" runat="server" Height="18px" MaxLength="9" 
                                          onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                          Width="145px"></asp:TextBox>
                                      <div align="left">
                                          &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;&#3610;&#3657;&#3634;&#3609; &#3627;&#3619;&#3639;&#3629; &#3607;&#3637;&#3656;&#3607;&#3635;&#3591;&#3634;&#3609;</div>
                                  </asp:Panel>
                              </div>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660; (&#3617;&#3639;&#3629;&#3606;&#3639;&#3629;) :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:TextBox ID="txtMobile" runat="server" Height="18px" 
                                      MaxLength="10"
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                      Width="145px"></asp:TextBox>
                                  *<div align="left">
                                      &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;&#3617;&#3639;&#3629;&#3606;&#3639;&#3629; 10 &#3627;&#3621;&#3633;&#3585;</div>
                              </div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:Label ID="lblMobile" runat="server" ForeColor="Red"></asp:Label>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td>
                              <div align="right">
                                  E-mail :</div>
                          </td>
                          <td>
                              <div align="left">
                                  <asp:TextBox ID="txtEmail" runat="server" AutoPostBack="True" Enabled="False" 
                                      Height="18px" MaxLength="40" Width="145px"></asp:TextBox>
                                  *</div>
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td>
                          <h3>&#3611;&#3619;&#3632;&#3623;&#3633;&#3605;&#3636;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634;</h3>
                          </td>
                      </tr>
                      <tr>
                            <td width="25%">
                                <div align="right">
                                    &nbsp;&#3623;&#3640;&#3602;&#3636;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:DropDownList ID="ddlDegree" runat="server" 
                                        ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3640;&#3602;&#3636;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;">
                                        <asp:ListItem Value="&#3611;.&#3605;&#3619;&#3637;">&#3611;&#3619;&#3636;&#3597;&#3597;&#3634;&#3605;&#3619;&#3637;</asp:ListItem>
                                        <asp:ListItem Value="&#3611;.&#3650;&#3607;">&#3611;&#3619;&#3636;&#3597;&#3597;&#3634;&#3650;&#3607;</asp:ListItem>
                                        <asp:ListItem Value="&#3611;.&#3648;&#3629;&#3585;">&#3611;&#3619;&#3636;&#3597;&#3597;&#3634;&#3648;&#3629;&#3585;</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3592;&#3634;&#3585;&#3626;&#3606;&#3634;&#3609;&#3624;&#3638;&#3585;&#3625;&#3634; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtFromUni" runat="server" Height="18px" MaxLength="40" 
                                        Width="145px" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3626;&#3606;&#3634;&#3609;&#3624;&#3638;&#3585;&#3625;&#3634;&#3607;&#3637;&#3656;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3626;&#3634;&#3586;&#3634;&#3623;&#3636;&#3594;&#3634; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtBranch" runat="server" Height="18px" MaxLength="40" 
                                        Width="145px" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3626;&#3634;&#3586;&#3634;&#3623;&#3636;&#3594;&#3634;&#3607;&#3637;&#3656;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;&#3648;&#3591;&#3636;&#3609;&#3648;&#3604;&#3639;&#3629;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtSalary" runat="server" Height="18px" MaxLength="5" 
                                        Width="64px" 
                                        
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3648;&#3591;&#3636;&#3609;&#3648;&#3604;&#3639;&#3629;&#3609;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:Label ID="lblSaraly" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;&#3605;&#3635;&#3649;&#3627;&#3609;&#3656;&#3591; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlPosition" runat="server" 
                                        ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3640;&#3602;&#3636;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;">
                                        <asp:ListItem Value="employee">&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609;</asp:ListItem>
                                        <asp:ListItem Value="lecturer">&#3623;&#3636;&#3607;&#3618;&#3634;&#3585;&#3619;</asp:ListItem>
                                        <asp:ListItem Value="admin">&#3612;&#3641;&#3657;&#3604;&#3641;&#3649;&#3621;&#3619;&#3632;&#3610;&#3610;</asp:ListItem>
                                    </asp:DropDownList>
                                    *</div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:CheckBox ID="chkActive" runat="server" Text="&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3626;&#3617;&#3633;&#3588;&#3619;" 
                                        ToolTip="&#3648;&#3611;&#3655;&#3609;&#3585;&#3634;&#3619;&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3648;&#3611;&#3655;&#3609;&#3610;&#3640;&#3588;&#3621;&#3634;&#3585;&#3619;&#3586;&#3629;&#3591;&#3624;&#3641;&#3609;&#3618;&#3660;&#3613;&#3638;&#3585;" />
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;</div>
                            </td>
                            <td>
                                <div align="left">
                                    <div id="active" style="display: none; color: #0066CC;">
                                        &#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3648;&#3619;&#3637;&#3618;&#3610;&#3619;&#3657;&#3629;&#3618;&#3649;&#3621;&#3657;&#3623;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                      <tr>
                          <td>
                              &nbsp;</td>
                          <td align="center">
                              <asp:Button ID="btnSummitProfile" runat="server" BackColor="#FFFF66" 
                                  BorderColor="Black" BorderStyle="Solid" 
                                  onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;');" style="cursor:pointer" 
                                  Text="&#3605;&#3585;&#3621;&#3591;" />
                          </td>
                          <td>
                              &nbsp;</td>
                      </tr>
                  </table>
              </asp:Panel>
              <p>
                  <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                      AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                      BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Lecturer_Id" 
                      DataSourceID="member" Width="95%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:ImageButton ID="imgSelect" runat="server" CausesValidation="False" 
                                      CommandName="Select" ImageUrl="~/img/edit.gif" Text="Select" 
                                      ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;" />
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
                          <asp:TemplateField HeaderText="&#3648;&#3610;&#3629;&#3619;&#3660;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;" SortExpression="Mobile">
                              <ItemTemplate>
                                  <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:BoundField DataField="Email" HeaderText="&#3629;&#3637;&#3648;&#3617;&#3621;&#3621;&#3660;" SortExpression="Email" />
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
                      SelectCommand="SELECT [Lecturer_Id], [Username], [FirstName], [LastName], [Idcard], CONVERT(VARCHAR(10),Birth,105) as Birth, [Gender], [Address], [Province], [City], [District], [Postcode], [Tel], [Mobile], [Email] FROM [Lecturer] ORDER BY [Lecturer_Id] DESC">
                  </asp:SqlDataSource>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
                  <asp:SqlDataSource ID="Province" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConString %>" 
                      SelectCommand="SELECT DISTINCT [Province] FROM [PostCode]">
                  </asp:SqlDataSource>
              </p>
          </ContentTemplate>
      </asp:UpdatePanel>
</div>

</asp:Content>


