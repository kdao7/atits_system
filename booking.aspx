<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="booking.aspx.vb" Inherits="booking" title="ATIT ::: Course Booking" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>
        <asp:Label ID="lblSubject" runat="server" 
            Text="&#3592;&#3629;&#3591; / &#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; (Course Booking / Register)"></asp:Label>
        </h1>
    <blockquote>
     
        <asp:UpdatePanel ID="UpBooking" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
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
                                <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" title="คลิกเพื่อเลือกหมวดหมู่หลักสูตร">
                                            </asp:DropDownList>*
                                </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">
                                <div align="right">
                                    &#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                                </div>
                            </td>
                            <td width="47%" colspan="2" style="width: 80%">
                                <div align="left">
                                <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" title="คลิกเพื่อเลือกหลักสูตร">
                                            </asp:DropDownList>*
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3634;&#3588;&#3634; (&#3610;&#3634;&#3607;) :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:Label ID="lblPrice" runat="server" ForeColor="Black" title="ราคาตลอดหลักสูตร"></asp:Label>
                                    </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3648;&#3621;&#3639;&#3629;&#3585;&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:DropDownList ID="ddlDateStart" runat="server" AutoPostBack="True" title="เลือกวันอบรม">
                                    </asp:DropDownList>
                                    </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &nbsp;</div>
                            </td>
                            <td width="42%" colspan="2" style="width: 75%">
                                <div align="left">
                                    <asp:Label ID="lblClass" runat="server" ForeColor="Red"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td align="left" width="42%" colspan="2" style="width: 75%">
                                <asp:Label ID="lblMassege" runat="server" ForeColor="Red" 
                                    Text="&#3648;&#3617;&#3639;&#3656;&#3629;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3649;&#3621;&#3657;&#3623; &#3586;&#3629;&#3651;&#3627;&#3657;&#3607;&#3656;&#3634;&#3609;&#3604;&#3635;&#3648;&#3609;&#3636;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3616;&#3634;&#3618;&#3651;&#3609; 15 &#3623;&#3633;&#3609; &#3627;&#3634;&#3585;&#3648;&#3585;&#3636;&#3609;&#3619;&#3632;&#3618;&#3632;&#3648;&#3623;&#3621;&#3634;&#3607;&#3637;&#3656;&#3585;&#3635;&#3627;&#3609;&#3604; &#3607;&#3634;&#3591;&#3624;&#3641;&#3609;&#3618;&#3660;&#3613;&#3638;&#3585;&#3592;&#3632;&#3606;&#3639;&#3629;&#3623;&#3656;&#3634;&#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3611;&#3619;&#3632;&#3626;&#3591;&#3588;&#3660;&#3592;&#3632;&#3648;&#3586;&#3657;&#3634;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617; &#3649;&#3621;&#3632;&#3619;&#3632;&#3610;&#3610;&#3592;&#3632;&#3621;&#3610;&#3594;&#3639;&#3656;&#3629;&#3607;&#3656;&#3634;&#3609;&#3629;&#3629;&#3585;&#3650;&#3604;&#3618;&#3629;&#3633;&#3605;&#3650;&#3609;&#3617;&#3633;&#3605;&#3636;"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                &nbsp;</td>
                            <td align="center" width="42%">
                                <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" 
                                    style="cursor:pointer" OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;');"
                                    BorderColor="Black" BorderStyle="Solid" 
                                    Text="&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                                    Enabled="False" />
                                &nbsp;
                                <asp:Button ID="btnSignin" runat="server" BackColor="#FFFF66" 
                                    BorderColor="Black" BorderStyle="Solid" Enabled="False" 
                                    OnClientClick="return confirm('&#3627;&#3634;&#3585;&#3607;&#3656;&#3634;&#3609;&#3618;&#3633;&#3591;&#3652;&#3617;&#3656;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; &#3619;&#3632;&#3610;&#3610;&#3592;&#3632;&#3607;&#3635;&#3585;&#3634;&#3619;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3651;&#3627;&#3657;&#3650;&#3604;&#3618;&#3629;&#3633;&#3605;&#3650;&#3609;&#3617;&#3633;&#3605;&#3636;\n&#3585;&#3619;&#3641;&#3603;&#3634;&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;');" 
                                    style="cursor:pointer" Text="&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;" />
                            </td>
                            <td width="33%">
                                
                            </td>
                        </tr>
                        </table> 
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlType" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlCourse" 
                    EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="ddlDateStart" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
     
    </blockquote>
</div>

</asp:Content>


