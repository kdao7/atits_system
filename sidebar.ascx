<%@ Control Language="VB" AutoEventWireup="false" CodeFile="sidebar.ascx.vb" Inherits="sidebar" %>

<script type="text/javascript">
    $(document).ready(function() {

        $("#regis").mouseover(function() {
            $("#subRegis").slideDown();
        });

        $("#regis").mouseout(function() {
            setTimeout(function() {
                $("#subRegis").slideUp();
            }, 15000);
        });

        $('a').mouseover(function() {
            $(this).animate({
                opacity: 0.6
            }, 500);
        });
        $('a').mouseout(function() {
            $(this).animate({
                opacity: 1
            }, 500);
        });

        $('h2').css('cursor', 'pointer');

        $('h2').click(function() {
            var id = $(this).attr('id');
            var did = $('#' + id + ' ~ div').attr('id');
            $('div.hide').slideUp(750);
            $('#' + did).slideDown(750);
        });
    });
        </script>
        
<h2>เมนูหลัก
</h2>
    <asp:Panel ID="Plogin" runat="server" Visible="False">
    <div style="margin-top: 15px; margin-left: 10px">
    ชื่อผู้ใช้ :
        <asp:TextBox ID="txtUser" runat="server" Height="18px" Width="128px"></asp:TextBox>
      <div class="clear"></div>
        รหัสผ่าน :
        <asp:TextBox ID="txtPass" runat="server" Height="18px" TextMode="Password" 
            Width="128px"></asp:TextBox>
        <asp:Label ID="lblWrong" runat="server" ForeColor="Red"></asp:Label>
</div>
                    <p align=center>
                        <asp:Button ID="btnLogin" runat="server" Text="เข้าสู่ระบบ" BackColor="#FFFF66" style="cursor:pointer"
                            BorderColor="Black" BorderStyle="Solid" />
    </p>
        <div class="sidemenu">
            <ul>
                <li id="regis">
                    <asp:HyperLink ID="hlRegis" runat="server" NavigateUrl="register.aspx?r=mem">สมัครสมาชิก</asp:HyperLink>
                <ol id="subRegis" style="display:none">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="register.aspx?r=mem" Text="ผู้ฝึกอบรม"></asp:HyperLink>
                    <div class="clear"></div><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="register.aspx?r=lec" Text="วิทยากร"></asp:HyperLink>
                </ol>
                </li>
                <li>
                    <asp:HyperLink ID="hlForget" runat="server" NavigateUrl="forget.aspx">ลืมรหัสผ่าน?</asp:HyperLink>
                </li>
            </ul>
        <h2>
        
            ปฏิทินการอบรม</h2>
            <p align="center">
            <asp:Calendar ID="courseCalendar" runat="server" BorderColor="#FFCC66" 
                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                ForeColor="Black" Height="200px" SelectionMode="None" ShowGridLines="True" 
                ShowNextPrevMonth="False" ToolTip="ปฏิทินการอบรม" Width="98%">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                <SelectorStyle BackColor="#FFCC66" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#CC9966" />
                <DayStyle BackColor="#FFFF88" BorderStyle="Solid" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                <TitleStyle BackColor="#FFCC00" Font-Bold="True" Font-Size="8pt" 
                    ForeColor="White" />
            </asp:Calendar>
            </p>
        </div>   
    </asp:Panel>

    <asp:Panel ID="Plogout" runat="server" Visible="False">
        <div class="sidemenu">
            <ul>
                <li>
                    <asp:HyperLink ID="hlProfile" runat="server" NavigateUrl="~/profile.aspx">ข้อมูลส่วนตัว</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlCourseHistory" runat="server" 
                        NavigateUrl="~/courseHistory.aspx">ประวัติการอบรม</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlBooking" runat="server" NavigateUrl="~/booking.aspx">จองหลักสูตร</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlCancel" runat="server" NavigateUrl="~/courseList.aspx">รายการหลักสูตร</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlAlert" runat="server" NavigateUrl="~/alertTranfer.aspx">แจ้งการโอนเงิน</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlCalendar" runat="server" 
                        NavigateUrl="~/calendarCourse.aspx">ปฏิทินการอบรม</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlLogout" runat="server" NavigateUrl="~/logout.aspx">ออกจากระบบ</asp:HyperLink>
                </li>
            </ul>
        </div>
</asp:Panel>


    <asp:Panel ID="Plec" runat="server" Visible="False">
    <div class="sidemenu">
        <h2 id="hcourse">
            จัดการหลักสูตร</h2>
            <div id="dcourse" class="hide">
            <ul>
                <li>
                    <asp:HyperLink ID="hlCourse" runat="server" 
                        NavigateUrl="~/admin/course/dataCourse.aspx">ข้อมูลหลักสูตร</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlClass" runat="server" 
                        NavigateUrl="~/admin/course/dataClass.aspx">ข้อมูลตารางอบรม</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlBookDetail" runat="server" 
                        NavigateUrl="~/admin/course/dataBooking.aspx">ข้อมูลจองหลักสูตร</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlSignin" runat="server" 
                        NavigateUrl="~/admin/course/dataSignin.aspx">หลักสูตรที่ลงทะเบียน</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlSigninCancel" runat="server" 
                        NavigateUrl="~/admin/course/dataSigninCancel.aspx">ยกเลิกการลงทะเบียน</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlAddClass" runat="server" 
                        NavigateUrl="~/admin/course/addClass.aspx">เพิ่มตารางอบรม</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlAddCourse" runat="server" 
                        NavigateUrl="~/addCourse.aspx">เพิ่มหลักสูตร</asp:HyperLink>
                </li>
             </ul>
             </div>
            <h2 id="hmember">
                จัดการสมาชิก</h2>
            <div id="dmember" class="hide">
            <ul>
                <li>
                    
                    <asp:HyperLink ID="hlMember" runat="server" 
                        NavigateUrl="~/admin/member/editMember.aspx">ข้อมูลสมาชิก</asp:HyperLink>
                    
                </li>
                <li>
                    <asp:HyperLink ID="hlEmp" runat="server" 
                        NavigateUrl="~/admin/member/editEmp.aspx">ข้อมูลพนักงาน</asp:HyperLink>
                </li>
            </ul>
            </div>
            <h2 id="hgenaral">
                จัดการทั่วไป</h2>
            <div id="dgenaral" class="hide">
            <ul>
                <li>
                   
                    <asp:HyperLink ID="hlPayment" runat="server" 
                        NavigateUrl="~/admin/general/dataPayment.aspx">การชำระเงินสด</asp:HyperLink>
                   
                </li>
                <li>
                    <asp:HyperLink ID="hlManageAlert" runat="server" 
                        NavigateUrl="~/admin/general/dataAlert.aspx">การแจ้งโอนเงิน</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlAddBankTranfer" runat="server" 
                        NavigateUrl="~/admin/general/addBank.aspx">เพิ่มธนาคารโอนเงิน</asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="hlReport" runat="server" NavigateUrl="~/admin/report">รายงาน</asp:HyperLink>
                </li>
            </ul>
            </div>
        </div>
</asp:Panel>



    