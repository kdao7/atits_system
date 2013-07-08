<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="addClass.aspx.vb" Inherits="lecturer_addClass" title="ATIT ::: Add Class" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3605;&#3634;&#3619;&#3634;&#3591;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;<span style="color:#9C386A;">(Training table)</span></h1>
        <p style="border-bottom : solid 1px #CCC;" class="pagelink">
        <a id="addClass" href="#" style="background: #FFFF77">&#3648;&#3614;&#3636;&#3656;&#3617;&#3605;&#3634;&#3619;&#3634;&#3591;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617;</a>
        </p>
    <blockquote>
     
        <asp:UpdatePanel ID="UpClass" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(textStyle);
            Sys.Application.add_load(showToolTip);
            Sys.Application.add_load(tooltip);
      </script>
        <table border="0" cellpadding="2" cellspacing="2" width="100%" id="tAddClass" >
                        <tr>
                            <td width="20%">
                                <div align="right">
                                    &#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                                </div>
                            </td>
                            <td width="47%">
                                <div align="left">
                                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                                        style="height: 22px" ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;">
                                            </asp:DropDownList>*
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <div align="right">
                                    &#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                                </div>
                            </td>
                            <td width="47%">
                                <div align="left">
                                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;">
                                            </asp:DropDownList>*
                                </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:RequiredFieldValidator ID="rfCourse" runat="server" 
                                        ControlToValidate="ddlCourse" Display="None" SetFocusOnError="True" 
                                        Visible="False"></asp:RequiredFieldValidator>
                                    <asp:LinkButton ID="lbViewCourse" runat="server" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" Visible="False">&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtStart" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                    <rjs:PopCalendar ID="PopCalendarStart" runat="server" Control="txtStart" 
                                        AutoPostBack="True" Format="yyyy mm dd" ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" />*
                                </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:RequiredFieldValidator ID="rfStrat" runat="server" 
                                        ControlToValidate="txtStart" ErrorMessage="&#3585;&#3619;&#3640;&#3603;&#3634;&#3585;&#3635;&#3627;&#3609;&#3604;&#3623;&#3633;&#3609;&#3648;&#3619;&#3636;&#3656;&#3617;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;"></asp:RequiredFieldValidator>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtEnd" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                    <rjs:PopCalendar ID="PopCalendarEnd" runat="server" Control="txtEnd" 
                                        Enabled="False" Format="yyyy mm dd" ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;" />
                                    *</div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:RequiredFieldValidator ID="rfEnd" runat="server" 
                                        ControlToValidate="txtEnd" ErrorMessage="&#3585;&#3619;&#3640;&#3603;&#3634;&#3585;&#3635;&#3627;&#3609;&#3604;&#3623;&#3633;&#3609;&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;"></asp:RequiredFieldValidator>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617; [&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;] :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtMin" runat="server" Height="18px" MaxLength="2" 
                                        Width="50px" TextMode="SingleLine" 
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ></asp:TextBox>
                                    <div>
                                        &#3619;&#3632;&#3610;&#3640;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3592;&#3635;&#3609;&#3623;&#3609;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;&#3651;&#3609;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617; &#3627;&#3634;&#3585;&#3652;&#3617;&#3656;&#3585;&#3635;&#3627;&#3609;&#3604;&#3651;&#3627;&#3657;&#3648;&#3623;&#3657;&#3609;&#3623;&#3656;&#3634;&#3591;</div>
                                    </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617; [&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;] :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtMax" runat="server" Height="18px" MaxLength="3" 
                                        Width="50px" TextMode="SingleLine" 
                                        
                                        
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ></asp:TextBox>
                                    <div>
                                        &#3619;&#3632;&#3610;&#3640;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604; &#3605;&#3657;&#3629;&#3591;&#3617;&#3634;&#3585;&#3585;&#3623;&#3656;&#3634;&#3627;&#3619;&#3639;&#3629;&#3648;&#3607;&#3656;&#3634;&#3585;&#3633;&#3610;&#3592;&#3635;&#3609;&#3623;&#3609;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;</div>
                                    </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:Label ID="lblMinMax" runat="server" ForeColor="Red" 
                                        Text="&#3585;&#3619;&#3640;&#3603;&#3634;&#3651;&#3626;&#3656;&#3592;&#3635;&#3609;&#3623;&#3609;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3651;&#3627;&#3657;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591;" Visible="False"></asp:Label>
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
                                <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" style="cursor:pointer" OnClientClick="return confirm('&#3588;&#3640;&#3603;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3592;&#3632;&#3648;&#3614;&#3636;&#3656;&#3617;&#3605;&#3634;&#3619;&#3634;&#3591;&#3629;&#3610;&#3619;&#3617;?');"
                                    BorderColor="Black" BorderStyle="Solid" Text="&#3648;&#3614;&#3636;&#3656;&#3617;&#3605;&#3634;&#3619;&#3634;&#3591;&#3629;&#3610;&#3619;&#3617;" />
                                &nbsp;</td>
                            <td width="33%">
                                
                            </td>
                        </tr>
                        </table> 
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="PopCalendarStart" 
                    EventName="SelectionChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlType" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlCourse" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
     
    </blockquote>
</div>

</asp:Content>


