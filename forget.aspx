<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="forget.aspx.vb" Inherits="forget" title="ATIT :: Forget Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3621;&#3639;&#3617;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;</h1>
     
        <asp:UpdatePanel ID="UpForget" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(textStyle);
            Sys.Application.add_load(showToolTip);
            Sys.Application.add_load(tooltip);
        </script>
            <asp:Panel ID="pForget" runat="server">
                <table id="tForget" border="0" cellpadding="2" cellspacing="2" width="98%">
                    <tr>
                        <td width="20%">
                            <div align="right">
                                &#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657; :
                            </div>
                        </td>
                        <td width="47%">
                            <div align="left">
                                <asp:TextBox ID="txtUname" runat="server" Height="18px" MaxLength="20" 
                                    onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57) {event.returnValue=true;} else{event.returnValue=false;}" 
                                    Width="150px"></asp:TextBox>
                                *
                                <div align="left">
                                    &#3619;&#3632;&#3610;&#3640;&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;</div>
                            </div>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div align="right">
                                &#3588;&#3635;&#3606;&#3634;&#3617;&#3585;&#3633;&#3609;&#3621;&#3639;&#3617; :
                            </div>
                        </td>
                        <td colspan="2" style="width: 80%" width="47%">
                            <div align="left">
                                <asp:DropDownList ID="ddlQuestion" runat="server">
                                    <asp:ListItem>&#3588;&#3640;&#3603;&#3594;&#3629;&#3610;&#3626;&#3637;&#3629;&#3632;&#3652;&#3619; ?</asp:ListItem>
                                    <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3626;&#3633;&#3605;&#3623;&#3660;&#3648;&#3621;&#3637;&#3657;&#3618;&#3591;&#3605;&#3633;&#3623;&#3650;&#3611;&#3619;&#3604;&#3586;&#3629;&#3591;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                    <asp:ListItem>&#3610;&#3640;&#3588;&#3588;&#3621;&#3617;&#3637;&#3594;&#3639;&#3656;&#3629;&#3648;&#3626;&#3637;&#3618;&#3591;&#3651;&#3609;&#3651;&#3592;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                    <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3588;&#3609;&#3619;&#3633;&#3585;&#3586;&#3629;&#3591;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                    <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3627;&#3609;&#3633;&#3591;&#3626;&#3639;&#3629;&#3648;&#3621;&#3656;&#3617;&#3650;&#3611;&#3619;&#3604; ?</asp:ListItem>
                                </asp:DropDownList>
                                *</div>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <div align="right">
                                &#3588;&#3635;&#3605;&#3629;&#3610; :
                            </div>
                        </td>
                        <td width="42%">
                            <div align="left">
                                <asp:TextBox ID="txtAnswer" runat="server" Height="18px" MaxLength="50" 
                                    Width="150px" 
                                    onkeypress="if(event.keyCode<48 || event.keyCode>57) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                                *<div align="left">
                                    &#3588;&#3635;&#3605;&#3629;&#3610;&#3586;&#3629;&#3591;&#3588;&#3635;&#3606;&#3634;&#3617;&#3585;&#3633;&#3609;&#3621;&#3639;&#3617;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;</div>
                            </div>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <div align="right">
                                &nbsp;</div>
                        </td>
                        <td colspan="2" style="width: 75%" width="42%">
                            <asp:Label ID="lblX" runat="server" ForeColor="Red" 
                                Text="&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591;" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            &nbsp;</td>
                        <td align="center" width="42%">
                            <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" 
                                BorderColor="Black" BorderStyle="Solid" style="cursor:pointer" 
                                Text="&#3605;&#3585;&#3621;&#3591;" />
                            &nbsp;
                            </td>
                        <td width="33%">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Panel ID="pSuccess" runat="server" Visible="False">
                <p style="font-size: 18px">&#3619;&#3632;&#3610;&#3610;&#3652;&#3604;&#3657;&#3607;&#3635;&#3585;&#3634;&#3619;&#3626;&#3656;&#3591;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;&#3652;&#3611;&#3618;&#3633;&#3591;&#3629;&#3637;&#3648;&#3617;&#3621;&#3621;&#3660;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;&#3649;&#3621;&#3657;&#3623;! </p>
                <p>
                    &#3585;&#3619;&#3640;&#3603;&#3634;&#3605;&#3619;&#3623;&#3592;&#3610;&#3629;&#3637;&#3648;&#3617;&#3621;&#3621;&#3660;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;</p>

                </asp:Panel>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
        </ContentTemplate>
        </asp:UpdatePanel>
     
</div>

</asp:Content>


