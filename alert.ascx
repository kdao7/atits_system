<%@ Control Language="VB" AutoEventWireup="false" CodeFile="alert.ascx.vb" Inherits="alert" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

      <h3>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;</h3>
<asp:UpdatePanel ID="upAlert" runat="server">
<ContentTemplate>
<script type="text/javascript">
            Sys.Application.add_load(textStyle);
            Sys.Application.add_load(showToolTip);
            Sys.Application.add_load(tooltip);
        </script>
    <asp:Panel ID="pAlert" runat="server">
                    <blockquote>   
                  <table style="width:100%; color: #000000; font-style: normal; " 
                      cellpadding="5px" cellspacing="5px" class="view">
                      <tr align="right">
                          <td style="width:35%;">
                              กรุณาเลือกธนาคาร :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:DropDownList ID="ddlBank" runat="server" AutoPostBack="True" 
                                  ToolTip="คลิกเพื่อเลือกธนาคาร">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <asp:Panel ID="pDetail" runat="server" Visible="False">
                      <tr align="right">
                          <td style="width:35%;">
                              เลขที่บัญชี :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:Label ID="lblNumber" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              ชื่อบัญชี :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:Label ID="lblAcc" runat="server"></asp:Label>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              สาขา :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:Label ID="lblBranch" runat="server"></asp:Label>
                          </td>
                      </tr>
                      </asp:Panel>
                  </table>
                  </blockquote>
                 <h3>
                     ข้อมูลการโอนเงิน</h3>
      <blockquote>
      <table style="width:100%; color: #000000; font-style: normal; " 
                      cellpadding="5px" cellspacing="5px">
                      <tr align="right">
                          <td style="width:35%;">
                              เลขที่บัญชีของท่าน :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:TextBox ID="txtAcc" runat="server" Height="18px" MaxLength="10" 
                                  onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                  Width="90px" ></asp:TextBox>
                              <asp:Label ID="lblYouAcc" runat="server" ForeColor="Red"></asp:Label>
                              <div>
                                  ระบุเลขที่บัญชีของท่าน</div>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              วันที่โอน :&nbsp;</td>
                          <td style="width:65%;" align="left">
                                    <asp:TextBox ID="txtDate" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                    <rjs:PopCalendar ID="pcDate" runat="server" Control="txtDate" 
                                        AutoPostBack="True" Format="yyyy mm dd" Fade="1" From-Date="2012-10-01" 
                                        To-Date="" To-Today="True" ToolTip="เลือกวันที่ท่านทำการโอนเงิน" />
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              เวลา (ตามเวลาธนาคาร) :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:DropDownList ID="ddlHour" runat="server" AutoPostBack="True">
                              </asp:DropDownList>
                              &nbsp;:
                              <asp:DropDownList ID="ddlMinute" runat="server" AutoPostBack="True">
                              </asp:DropDownList>
                              <asp:Label ID="lblTime" runat="server" ForeColor="Red"></asp:Label>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              จำนวนเงิน (บาท) :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:TextBox ID="txtMoney" runat="server" Height="18px" Width="50px" 
                                  onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                  MaxLength="4" ></asp:TextBox>
                              &nbsp;<asp:Label ID="lblMoney" runat="server" ForeColor="Red"></asp:Label><div>
                                  ระบุจำนวนเงินที่ท่านโอนเงิน</div>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              หลักสูตรที่ชำระเงิน :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" 
                                  ToolTip="เลือกหลักสูตรที่ท่านชำระเงิน">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              เริ่มอบรม :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:DropDownList ID="ddlStart" runat="server" style="height: 22px">
                              </asp:DropDownList>
                          </td>
                      </tr>
                      <tr align="right">
                          <td style="width:35%;">
                              การชำระเงิน :&nbsp;</td>
                          <td style="width:65%;" align="left">
                              <asp:RadioButton ID="rdoFull" runat="server" Checked="True" 
                                  GroupName="pay" 
                                  Text="&#3594;&#3635;&#3619;&#3632;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;" />
                              <asp:RadioButton ID="rdoHalf" runat="server" GroupName="pay" 
                                  Text="&#3594;&#3635;&#3619;&#3632;&#3588;&#3619;&#3638;&#3656;&#3591;&#3627;&#3609;&#3638;&#3656;&#3591; (&#3617;&#3633;&#3604;&#3592;&#3635;)" />
                          </td>
                      </tr>
                      <tr align="right">
                          <td align="center" colspan="2">
                              <asp:Button ID="btnOk" runat="server" BackColor="#FFFF66" 
                                  BorderColor="Black" BorderStyle="Solid" 
                                  OnClientClick="return confirm('&#3650;&#3611;&#3619;&#3604;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3651;&#3627;&#3657;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591; &#3648;&#3617;&#3639;&#3656;&#3629;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3649;&#3621;&#3657;&#3623;&#3592;&#3632;&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3649;&#3585;&#3657;&#3652;&#3586;&#3652;&#3604;&#3657;\n\n&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3649;&#3592;&#3657;&#3591;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;?');" 
                                  style="cursor:pointer" 
                                  
                                  Text="&#3649;&#3592;&#3657;&#3591;&#3585;&#3634;&#3619;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;" />
                              <asp:ScriptManager ID="ScriptManager1" runat="server">
                              </asp:ScriptManager>
                          </td>
                      </tr>
                  </table>
          </blockquote>
    </asp:Panel>

</ContentTemplate>
</asp:UpdatePanel>
    
    
