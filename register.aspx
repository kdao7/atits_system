<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="register" title="ATIT ::: Register" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<%@ Register src="sidebar.ascx" tagname="sidebar" tagprefix="uc1" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    function callLoading() {$('#imgLoad').show().fadeOut(2000); }
        function checkID(id) {
            if (id.length != 13) return false;
            for (i = 0, sum = 0; i < 12; i++)
                sum += parseFloat(id.charAt(i)) * (13 - i); if ((11 - sum % 11) % 10 != parseFloat(id.charAt(12)))
                return false; return true;
        }
        function active(active, link) {
            var idActive = active;
            var idLink = link;
            document.getElementById(idActive).style.background = '#FFFF77';
            document.getElementById(idLink).style.background = 'inherit';
        }
        function passTip() {
            $('input[type="password"] ~ div').addClass('tip');
            $('input[type="password"]').focus(function() {
                var id = $(this).attr('id');
                id = '#' + id + ' ~ div';
                $(id).slideDown();
            });
            $('input[type="password"]').blur(function() {
                var id = $(this).attr('id');
                id = '#' + id + ' ~ div';
                var txt = $(this).val();
                if (txt.length < 6) { $(id).slideDown(); }
                else { $(id).slideUp(); }
            });
        }
        function checkData(id, cmd,divid) {
            id = '#' + id;
            var txtsend = $(id).val();
            $('#' + divid).hide();
            $.ajax({
                type: "POST",
                url: "admin/report/checkClass.aspx",
                data: "txt=" + txtsend + '&cmd=' + cmd,
                async: false,
                success: function (data) {
                        data = data.charAt(0);
                        if (data == 'T') { $('#' + divid).fadeOut(500); return true; } else { $(id).val(''); $('#' + divid).fadeIn(2500); return false; }
                  }
            });
        }
        </script>
    <style type="text/css">
        .style1
        {
            width: 75px;
            height: 75px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1><span style="color:#9C386A;" xml:lang="ATIT ::: Register">&#3626;&#3617;&#3633;&#3588;&#3619;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;(register)</span></h1>
    
        <asp:UpdatePanel ID="upRegister" runat="server">
            <ContentTemplate>
            <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
                //Sys.Application.add_load(textStyle);
                //Sys.Application.add_load(showToolTip);
                Sys.Application.add_load(passTip);
                Sys.Application.add_load(tooltip);           
            </script>
                <asp:RadioButton ID="rdoMember" runat="server" GroupName="1" 
                    
                    Text="&#3626;&#3617;&#3633;&#3588;&#3619;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;" 
                    AutoPostBack="True" Visible="False" />
                <asp:RadioButton ID="rdoLu" runat="server" GroupName="1" 
                    Text="&#3626;&#3617;&#3633;&#3588;&#3619;&#3623;&#3636;&#3607;&#3618;&#3634;&#3585;&#3619;" 
                    AutoPostBack="True" Visible="False" />
                <asp:Panel ID="Pmember" runat="server">
                    <h3>
                        &#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3607;&#3633;&#3656;&#3623;&#3652;&#3611;</h3>
                    <table border="0" cellpadding="2" cellspacing="2" width="98%">
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3594;&#3639;&#3656;&#3629; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtFname" runat="server" Height="18px" MaxLength="30" 
                                        Width="145px" ></asp:TextBox>
                                    *<div align="left">
                                        &#3585;&#3619;&#3640;&#3603;&#3634;&#3619;&#3632;&#3610;&#3640; &quot;&#3594;&#3639;&#3656;&#3629;-&#3626;&#3585;&#3640;&#3621;&quot; &#3592;&#3619;&#3636;&#3591;&#3648;&#3614;&#3639;&#3656;&#3629;&#3611;&#3619;&#3632;&#3650;&#3618;&#3594;&#3609;&#3660;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;</div>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
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
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3648;&#3614;&#3624; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlSex" runat="server">
                                        <asp:ListItem Value="F">&#3627;&#3597;&#3636;&#3591;</asp:ListItem>
                                        <asp:ListItem Value="M">&#3594;&#3634;&#3618;</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtIdCard" runat="server" Height="18px" MaxLength="13"
                                        Width="145px"
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        onblur="checkData($(this).attr('id'),'idcard','Idcard')" ></asp:TextBox>
                                    *<div align="left">
                                        &#3585;&#3619;&#3629;&#3585;&#3619;&#3627;&#3633;&#3626;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609; 13 &#3627;&#3621;&#3633;&#3585;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left" id="idcard" style="color: #FF0000; display:none;">
                                    &#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3651;&#3594;&#3657;&#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609;&#3609;&#3637;&#3657;&#3652;&#3604;&#3657;
                                    </div>
                                <div id="Idcard" style="display: none">
                                    <asp:Label ID="lblIdCard" runat="server" ForeColor="Red">&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3651;&#3594;&#3657;&#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609;&#3609;&#3637;&#3657;&#3652;&#3604;&#3657;</asp:Label>
                                </div>
                                <img alt="" class="style1" src="img/ajax-loading.gif" id="imgLoad" style="width: 32px; height: 32px; display: none;" />
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
                                        Width="220px" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3607;&#3637;&#3656;&#3629;&#3618;&#3641;&#3656;&#3607;&#3637;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3605;&#3636;&#3604;&#3605;&#3656;&#3629;&#3652;&#3604;&#3657;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3623;&#3633;&#3609; / &#3648;&#3604;&#3639;&#3629;&#3609; / &#3611;&#3637; &#3648;&#3585;&#3636;&#3604;:</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtBirth" runat="server" Width="80px" ReadOnly="true" 
                                        ></asp:TextBox>
                                    <rjs:PopCalendar id="PopCalendar1" runat="server" Control="txtBirth" 
                                        AutoPostBack="False" 
                                        ValidationGroup='RJS.PopCalendars' Format="yyyy mm dd" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;" />
                                    &nbsp;*</div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3592;&#3633;&#3591;&#3627;&#3623;&#3633;&#3604; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="True" 
                                        DataSourceID="Province" DataTextField="Province" DataValueField="Province">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3629;&#3635;&#3648;&#3616;&#3629; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" 
                                        DataSourceID="City" DataTextField="Amphur" DataValueField="Amphur">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3605;&#3635;&#3610;&#3621; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlDistrict" runat="server" DataSourceID="District" 
                                        DataTextField="Tumbon" DataValueField="Tumbon">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3619;&#3627;&#3633;&#3626;&#3652;&#3611;&#3619;&#3625;&#3603;&#3637;&#3618;&#3660; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlPostCode" runat="server" DataSourceID="Postcode" 
                                        DataTextField="PostCode" DataValueField="PostCode">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
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
                                        Width="145px" 
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                            ></asp:TextBox>
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
                                    <asp:TextBox ID="txtMobile" runat="server" Height="18px" MaxLength="10" 
                                        Width="145px" 
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        AutoPostBack="True" ></asp:TextBox>
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
                                    <asp:TextBox ID="txtEmail" runat="server" Height="18px" MaxLength="40" 
                                        Width="145px" onblur="checkData($(this).attr('id'),'email','msgemail')" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3629;&#3637;&#3648;&#3617;&#3621;&#3621;&#3660;&#3607;&#3637;&#3656;&#3651;&#3594;&#3657;&#3591;&#3634;&#3609;&#3652;&#3604;&#3657;&#3592;&#3619;&#3636;&#3591;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left" id="msgemail" style="display: none">
                                    <asp:Label ID="lblEmail" runat="server" ForeColor="Red">&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3651;&#3594;&#3657;&#3629;&#3637;&#3648;&#3617;&#3621;&#3660;&#3609;&#3637;&#3657;&#3652;&#3604;&#3657;</asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Plecturer" runat="server" Visible="False">
                    <h3>
                        &#3611;&#3619;&#3632;&#3623;&#3633;&#3605;&#3636;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634;</h3>
                
                <table border="0" cellpadding="2" cellspacing="2" width="98%">
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
                                    &#3611;&#3637;&#3607;&#3637;&#3656;&#3592;&#3610; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlYearSuccess" runat="server" 
                                        ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3611;&#3637;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3592;&#3610;&#3585;&#3634;&#3619;&#3624;&#3638;&#3585;&#3625;&#3634;">
                                    </asp:DropDownList>
                                    *</div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3648;&#3585;&#3619;&#3604;&#3648;&#3593;&#3621;&#3637;&#3656;&#3618; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlGpa" runat="server" AutoPostBack="True" Height="22px">
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem Value="2"></asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;. 
                                    <asp:TextBox ID="txtGpa" runat="server" Height="18px" MaxLength="2" 
                                        Width="32px" 
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        Enabled="False" >00</asp:TextBox>*</div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <h3>
                        &#3611;&#3619;&#3632;&#3623;&#3633;&#3605;&#3636;&#3585;&#3634;&#3619;&#3607;&#3635;&#3591;&#3634;&#3609;</h3>
                    <table border="0" cellpadding="2" cellspacing="2" width="98%">
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &nbsp;&#3611;&#3619;&#3632;&#3626;&#3610;&#3585;&#3634;&#3619;&#3603;&#3660; :</div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:CheckBox ID="chkExp" runat="server" AutoPostBack="True" 
                                        
                                        Text="&#3617;&#3637;&#3611;&#3619;&#3632;&#3626;&#3610;&#3585;&#3634;&#3619;&#3603;&#3660;" />
                                    &nbsp;<asp:DropDownList ID="ddlYeaExp" runat="server" Height="22px" 
                                        Visible="False" ToolTip="&#3611;&#3619;&#3632;&#3626;&#3610;&#3585;&#3634;&#3619;&#3603;&#3660;&#3585;&#3634;&#3619;&#3607;&#3635;&#3591;&#3634;&#3609;&#3586;&#3629;&#3591;&#3607;&#3656;&#3634;&#3609;">
                                        <asp:ListItem Value="&lt;2&#3611;&#3637;">&lt; 2</asp:ListItem>
                                        <asp:ListItem Value="2&#3611;&#3637;">2</asp:ListItem>
                                        <asp:ListItem Value="3&#3611;&#3637;">3</asp:ListItem>
                                        <asp:ListItem Value="4&#3611;&#3637;">4</asp:ListItem>
                                        <asp:ListItem Value="5&#3611;&#3637;">5</asp:ListItem>
                                        <asp:ListItem Value="6&#3611;&#3637;">6</asp:ListItem>
                                        <asp:ListItem Value="7&#3611;&#3637;">7</asp:ListItem>
                                        <asp:ListItem Value="8&#3611;&#3637;">8</asp:ListItem>
                                        <asp:ListItem Value="9&#3611;&#3637;">9</asp:ListItem>
                                        <asp:ListItem Value="10&#3611;&#3637;">10</asp:ListItem>
                                        <asp:ListItem Value="&gt;10&#3611;&#3637;">&gt; 10</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;(&#3611;&#3637;)<br />
                                    <asp:Panel ID="PExp" runat="server">
                                    <asp:TextBox ID="txtExp" runat="server" Height="92px" MaxLength="194" 
                                        TextMode="MultiLine" Width="250px" Visible="False"></asp:TextBox>
                                    </asp:Panel>
                                    </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:Label ID="lblExp" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;&#3585;&#3634;&#3619;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:CheckBox ID="chkTrain" runat="server" 
                                        Text="&#3648;&#3588;&#3618;&#3652;&#3604;&#3657;&#3619;&#3633;&#3610;&#3585;&#3634;&#3619;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617;" 
                                        AutoPostBack="True" />
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <asp:Panel ID="PTrain" runat="server" Visible="False">
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtCourse" runat="server" Height="18px" MaxLength="30" 
                                        Width="162px"></asp:TextBox>
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
                                    &nbsp;&#3592;&#3634;&#3585;&#3626;&#3606;&#3634;&#3610;&#3633;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtTrainFrom" runat="server" Height="18px" MaxLength="30" 
                                        Width="162px"></asp:TextBox>
                                    *</div>
                            </td>
                            <td>
                                <div align="left">
                                </div>
                            </td>
                        </tr>
                        </asp:Panel>
                        <tr>
                            <td>
                                <div align="right">
                                    &nbsp;&#3648;&#3591;&#3636;&#3609;&#3648;&#3604;&#3639;&#3629;&#3609;&#3607;&#3637;&#3656;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtSalary" runat="server" Height="18px" MaxLength="5" 
                                        Width="64px" 
                                        
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                        ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3648;&#3591;&#3636;&#3609;&#3648;&#3604;&#3639;&#3629;&#3609;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:Label ID="lblSaraly" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="PSystemLogin" runat="server">
                    <h3>
                        &#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3651;&#3609;&#3585;&#3634;&#3619;&#3651;&#3594;&#3657;&#3591;&#3634;&#3609;&#3619;&#3632;&#3610;&#3610;</h3>
                    <table border="0" cellpadding="2" cellspacing="2" width="98%">
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &nbsp;&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtUser" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" 
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674)event.returnValue=false;" 
                                        onblur="checkData($(this).attr('id'),'username','checkuser')" ></asp:TextBox>
                                    *<div align="left">
                                        &#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;&#3605;&#3657;&#3629;&#3591;&#3617;&#3637;&#3588;&#3623;&#3634;&#3617;&#3618;&#3634;&#3623;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6 - 20 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619; &#3649;&#3621;&#3632;&#3648;&#3611;&#3655;&#3609;&#3616;&#3634;&#3625;&#3634;&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;&#3648;&#3607;&#3656;&#3634;&#3609;&#3633;&#3657;&#3609;</div>
                                </div>
                            </td>
                            <td width="33%">
                                <div align="left" id="checkuser" style="display: none">
                                    <asp:Label ID="lblUser" runat="server" ForeColor="Red">&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3651;&#3594;&#3657;&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;&#3609;&#3637;&#3657;&#3652;&#3604;&#3657;</asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtPass" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" TextMode="Password" 
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674){event.returnValue=false;} else{event.returnValue=true;}" 
                                        ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3617;&#3637;&#3588;&#3623;&#3634;&#3617;&#3618;&#3634;&#3623;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6 - 20 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619; &#3649;&#3621;&#3632;&#3648;&#3611;&#3655;&#3609;&#3616;&#3634;&#3625;&#3634;&#3629;&#3633;&#3591;&#3585;&#3620;&#3625;&#3648;&#3607;&#3656;&#3634;&#3609;&#3633;&#3657;&#3609;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:Label ID="lblPass" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtPassComfirm" runat="server" Height="18px" MaxLength="20" 
                                        Width="145px" TextMode="Password" 
                                        onkeypress="if(event.keyCode>3584 && event.keyCode<3674)event.returnValue=false;" 
                                        ></asp:TextBox>
                                    *<div align="left">
                                        &#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;&#3629;&#3637;&#3585;&#3588;&#3619;&#3633;&#3657;&#3591;</div>
                                </div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToCompare="txtPass" ControlToValidate="txtPassComfirm" 
                                        ErrorMessage="Password &#3652;&#3617;&#3656;&#3605;&#3619;&#3591;&#3585;&#3633;&#3609;"></asp:CompareValidator>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3588;&#3635;&#3606;&#3634;&#3617;&#3648;&#3617;&#3639;&#3656;&#3629;&#3621;&#3639;&#3617;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:DropDownList ID="ddlQuestion" runat="server" 
                                        ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3588;&#3635;&#3606;&#3634;&#3617;&#3648;&#3617;&#3639;&#3656;&#3629;&#3607;&#3656;&#3634;&#3609;&#3621;&#3639;&#3617;&#3619;&#3627;&#3633;&#3626;&#3612;&#3656;&#3634;&#3609;">
                                        <asp:ListItem>&#3588;&#3640;&#3603;&#3594;&#3629;&#3610;&#3626;&#3637;&#3629;&#3632;&#3652;&#3619; ?</asp:ListItem>
                                        <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3626;&#3633;&#3605;&#3623;&#3660;&#3648;&#3621;&#3637;&#3657;&#3618;&#3591;&#3605;&#3633;&#3623;&#3650;&#3611;&#3619;&#3604;&#3586;&#3629;&#3591;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                        <asp:ListItem>&#3610;&#3640;&#3588;&#3588;&#3621;&#3617;&#3637;&#3594;&#3639;&#3656;&#3629;&#3648;&#3626;&#3637;&#3618;&#3591;&#3651;&#3609;&#3651;&#3592;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                        <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3588;&#3609;&#3619;&#3633;&#3585;&#3586;&#3629;&#3591;&#3588;&#3640;&#3603; ?</asp:ListItem>
                                        <asp:ListItem>&#3594;&#3639;&#3656;&#3629;&#3627;&#3609;&#3633;&#3591;&#3626;&#3639;&#3629;&#3648;&#3621;&#3656;&#3617;&#3650;&#3611;&#3619;&#3604; ?</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <div align="right">
                                    &#3588;&#3635;&#3605;&#3629;&#3610; :</div>
                            </td>
                            <td>
                                <div align="left">
                                    <asp:TextBox ID="txtAns" runat="server" Height="18px" MaxLength="30" 
                                        Width="145px" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3588;&#3635;&#3605;&#3629;&#3610;&#3586;&#3629;&#3591;&#3588;&#3635;&#3606;&#3634;&#3617;&#3585;&#3633;&#3609;&#3621;&#3639;&#3617;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;</div>
                                </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <div align="left">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
                
                    <table border="0" cellpadding="2" cellspacing="2" width="100%">
                        <tr>
                            <td>
                                <div align="center">
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                    <asp:SqlDataSource ID="Province" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                                        SelectCommand="SELECT DISTINCT [Province] FROM [PostCode] ORDER BY Province">
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="City" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                                        SelectCommand="SELECT DISTINCT [Amphur] FROM [PostCode] WHERE ([Province] LIKE '%' + @Province + '%')">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlProvince" Name="Province" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="District" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                                        SelectCommand="SELECT DISTINCT [Tumbon] FROM [PostCode] WHERE ([Amphur] LIKE '%' + @Amphur + '%')">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCity" Name="Amphur" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="Postcode" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                                        SelectCommand="SELECT DISTINCT [PostCode] FROM [PostCode] WHERE ([Amphur] LIKE '%' + @Amphur + '%')">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCity" Name="Amphur" 
                                                PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </td>
                        </tr>
                    </table>
                    </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="rdoLu" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="rdoMember" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlCity" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlProvince" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtIdCard" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtEmail" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtUser" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtMobile" EventName="TextChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlGpa" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="chkExp" EventName="CheckedChanged" />
                <asp:AsyncPostBackTrigger ControlID="chkTrain" EventName="CheckedChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <center><asp:Button ID="btnSummit" runat="server" BackColor="#FFFF66" style="cursor:pointer"
                                        BorderColor="Black" BorderStyle="Solid" 
                Text="&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;" 
                onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3626;&#3617;&#3633;&#3588;&#3619;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;');" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnReset" runat="server" 
                BackColor="#FFFF66" style="cursor:pointer" 
                                        BorderColor="Black" BorderStyle="Solid" 
                Text="&#3621;&#3657;&#3634;&#3591;&#3615;&#3629;&#3619;&#3660;&#3617;" />
            </center>
    
</div>

</asp:Content>


