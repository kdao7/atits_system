<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" title="ATIT ::: Profile" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language="javascript" type="text/javascript">
        
        function active(active, link) {
            var idActive = active;
            var idLink = link;
            document.getElementById(idActive).style.background = '#FFFF77';
            document.getElementById(idLink).style.background = 'inherit';
        }
        </script>
<script type="text/javascript">

    $(document).ready(function () {

        $("#lbProfile").click(function () {
            $("#<% = Pmember.ClientID %>").slideDown();
            $("#tSubmit").slideDown();
            $("#<% = PPass.ClientID %>").slideUp();
        });
        $("#lbPass").click(function () {
            $("#<% = Pmember.ClientID %>").slideUp();
            $("#tSubmit").slideUp();
            $("#<% = PPass.ClientID %>").slideDown();
            $("#<% = txtOldPass.ClientID %>").focus();
        });
    });
        function showUpdate() {
            $('#active').fadeIn(100);
            $('#active').fadeOut(4000);
        }
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3626;&#3656;&#3623;&#3609;&#3605;&#3633;&#3623;(Profile)</h1>
        <p style="border-bottom : solid 1px #CCC;" class="pagelink">
           <a href="#" id="lbProfile"  
                onclick="active('lbProfile', 'lbPass');" 
                style="background: #FFFF77">&#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3626;&#3656;&#3623;&#3609;&#3605;&#3633;&#3623;</a>
           <a href="#" id="lbPass" onclick="active('lbPass', 'lbProfile');">
            &#3649;&#3585;&#3657;&#3652;&#3586;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;</a>
           </p>
    <blockquote>
      
        <asp:UpdatePanel ID="UpProfile" runat="server" ChildrenAsTriggers="False" 
            UpdateMode="Conditional">
            <ContentTemplate>
            <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
                Sys.Application.add_load(textStyle);
            </script>
                <asp:Panel ID="Pmember" runat="server">
                    <table border="0" cellpadding="2" cellspacing="2" width="100%" ID="tProfile">
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
                                    <asp:Label ID="lblSex" runat="server"></asp:Label>
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
                                    *</div>
                            </td>
                            <td>
                                <div align="left">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &#3592;&#3633;&#3591;&#3627;&#3623;&#3633;&#3604; :</td>
                            <td>
                                <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" 
                                    DataSourceID="Province" DataTextField="Province" DataValueField="Province">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Province" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConString %>" 
                                    SelectCommand="SELECT DISTINCT [Province] FROM [PostCode]">
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &#3629;&#3635;&#3648;&#3616;&#3629; :</td>
                            <td>
                                <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;&#3605;&#3635;&#3610;&#3621; :</td>
                            <td>
                                <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True">
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
                                        Width="145px" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                </asp:Panel>
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
                                    &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660; (&#3617;&#3639;&#3629;&#3606;&#3639;&#3629;) :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtMobile" runat="server" Height="18px" MaxLength="10" 
                                        Width="145px" 
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        AutoPostBack="True"></asp:TextBox>
                                    *</div>
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
                                    <asp:TextBox ID="txtEmail" runat="server" Height="18px" MaxLength="40" 
                                        Width="145px" AutoPostBack="True"></asp:TextBox>
                                    *</div>
                            </td>
                            <td>
                                <div align="left">
                                    
                                    <asp:Label ID="lblEmail" runat="server" ForeColor="Red"></asp:Label>
                                    
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <div align="left">
                                    <div ID="active" style="display: none; color: #0066CC;">
                                        &#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3648;&#3619;&#3637;&#3618;&#3610;&#3619;&#3657;&#3629;&#3618;&#3649;&#3621;&#3657;&#3623;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        </table>
                </asp:Panel>
                
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                    	<br />
            </ContentTemplate>
        
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlCity" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlDistrict" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlPostcode" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlProvince" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtEmail" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtMobile" EventName="TextChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <table width="100%" id="tSubmit">
         <tr>
         <td width="25%">
                                &nbsp;</td>
                            <td align="center" width="42%">
                                <asp:Button ID="btnSummitProfile" runat="server" BackColor="#FFFF66" style="cursor:pointer" 
                                    BorderColor="Black" BorderStyle="Solid" Text="&#3605;&#3585;&#3621;&#3591;" 
                                    
                                    onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;');" />
                            </td>
                            <td width="33%">
                                &nbsp;</td>
        </tr>
        </table>
      <asp:Panel ID="PPass" runat="server" CssClass="hide">
                <table border="0" cellpadding="2" cellspacing="2" width="100%" id="tPass" >
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; [&#3648;&#3585;&#3656;&#3634;] :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtOldPass" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" TextMode="Password"  
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674)event.returnValue=false;"></asp:TextBox>
                                    *</div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; [&#3651;&#3627;&#3617;&#3656;] :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtNewPass" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" TextMode="Password"  
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674)event.returnValue=false;"></asp:TextBox>
                                    *</div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:Label ID="lblNewPass" runat="server" Text="Password &#3605;&#3657;&#3629;&#3591;&#3617;&#3637;&#3588;&#3623;&#3634;&#3617;&#3618;&#3634;&#3623;&#3652;&#3617;&#3656;&#3605;&#3656;&#3635;&#3585;&#3623;&#3656;&#3634; 6 &#3629;&#3633;&#3585;&#3586;&#3619;&#3632;" ForeColor="Red"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; [&#3629;&#3637;&#3585;&#3588;&#3619;&#3633;&#3657;&#3591;] :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtNewConfirm" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" TextMode="Password"  
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674)event.returnValue=false;"></asp:TextBox>
                                    *</div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="txtNewPass" ControlToValidate="txtNewConfirm" 
                                        ErrorMessage="Password &#3652;&#3617;&#3656;&#3605;&#3619;&#3591;&#3585;&#3633;&#3609;"></asp:CompareValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td align="center" width="42%">
                                &nbsp;</td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td align="center" width="42%">
                                <asp:Button ID="btnSummitPass" runat="server" BackColor="#FFFF66" style="cursor:pointer"
                                    BorderColor="Black" BorderStyle="Solid" Text="&#3605;&#3585;&#3621;&#3591;" 
                                    onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3649;&#3585;&#3657;&#3652;&#3586;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;');" />
                                &nbsp;</td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        </table>
                </asp:Panel>
    </blockquote>
</div>











</asp:Content>


