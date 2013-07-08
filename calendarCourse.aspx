<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="calendarCourse.aspx.vb" Inherits="calendarCourse" title="ATIT ::: Calendar Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
    function calendar() {
        $('td').mouseover(function() {
            $(this).animate({
                opacity: 0.4
            }, 500);
        });
        $('td').mouseout(function() {
            $(this).animate({
                opacity: 1
            }, 500);
        });
    }
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1><span style="color:#9C386A;">&#3611;&#3599;&#3636;&#3607;&#3636;&#3609;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617; (calendar course)</span></h1>
      <asp:UpdatePanel ID="upCalendar" runat="server">
          <ContentTemplate>
          <script type="text/javascript">
              Sys.Application.add_load(calendar);
              Sys.Application.add_load(tooltip);
        </script>
              <asp:Calendar ID="courseCalendar" runat="server"
                  BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Full" 
                  Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="200px" 
                  SelectionMode="None" ShowGridLines="True" 
                  ToolTip="&#3611;&#3599;&#3636;&#3607;&#3636;&#3609;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;" 
                  Width="98%">
                  <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                  <SelectorStyle BackColor="#FFCC66" />
                  <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                  <OtherMonthDayStyle ForeColor="#CC9966" />
                  <DayStyle BorderStyle="Solid" Height="80px" BackColor="#FFFF88" />
                  <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                  <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                  <TitleStyle BackColor="#FFCC00" Font-Bold="True" Font-Size="15pt" 
                      ForeColor="White" />
              </asp:Calendar>
              <asp:ScriptManager ID="ScriptManager1" runat="server">
              </asp:ScriptManager>
          </ContentTemplate>
      </asp:UpdatePanel>
</div>

</asp:Content>


