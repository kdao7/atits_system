<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="admin_Default" title="ATIT ::: Main menu" %>

<%@ Register src="../sidebar.ascx" tagname="sidebar" tagprefix="uc1" %>

<%@ Register src="report/reportMenu.ascx" tagname="reportMenu" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="report/SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="report/SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    
        <h1>
            &#3648;&#3617;&#3609;&#3641;&#3627;&#3621;&#3633;&#3585; (Main Menu)</h1>
        <div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">&#3592;&#3633;&#3604;&#3585;&#3634;&#3619;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</li>
    <li class="TabbedPanelsTab" tabindex="0">&#3592;&#3633;&#3604;&#3585;&#3634;&#3619;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;</li>
    <li class="TabbedPanelsTab" tabindex="0">&#3592;&#3633;&#3604;&#3585;&#3634;&#3619;&#3607;&#3633;&#3656;&#3623;&#3652;&#3611;</li>
    <li class="TabbedPanelsTab" tabindex="0">&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;</li>
    <li class="TabbedPanelsTab" tabindex="0" onclick="javascript:if (confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3629;&#3629;&#3585;&#3592;&#3634;&#3585;&#3619;&#3632;&#3610;&#3610;')) {window.location='../logout.aspx';} else {return false;}">
        &#3629;&#3629;&#3585;&#3592;&#3634;&#3585;&#3619;&#3632;&#3610;&#3610;</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
                    <asp:HyperLink ID="hlCourse" runat="server" 
                        NavigateUrl="~/admin/course/dataCourse.aspx">&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlClass" runat="server" 
                        NavigateUrl="~/admin/course/dataClass.aspx">&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3619;&#3634;&#3591;&#3629;&#3610;&#3619;&#3617;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlBookDetail" runat="server" 
                        NavigateUrl="~/admin/course/dataBooking.aspx">&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlSignin" runat="server" 
                        NavigateUrl="~/admin/course/dataSignin.aspx">&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlSigninCancel" runat="server" 
                        NavigateUrl="~/admin/course/dataSigninCancel.aspx">&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlAddClass" runat="server" 
                        NavigateUrl="~/admin/course/addClass.aspx">&#3648;&#3614;&#3636;&#3656;&#3617;&#3605;&#3634;&#3619;&#3634;&#3591;&#3629;&#3610;&#3619;&#3617;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlAddCourse" runat="server" 
                        NavigateUrl="~/addCourse.aspx">&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</asp:HyperLink>
                </div>
    <div class="TabbedPanelsContent">
                    
                    <asp:HyperLink ID="hlMember" runat="server" 
                        NavigateUrl="~/admin/member/editMember.aspx">&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;</asp:HyperLink>
                    
                <br />
                    <asp:HyperLink ID="hlEmp" runat="server" 
                        NavigateUrl="~/admin/member/editEmp.aspx">&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609;</asp:HyperLink>
                </div>
    <div class="TabbedPanelsContent">
                   
                    <asp:HyperLink ID="hlPayment" runat="server" 
                        NavigateUrl="~/admin/general/dataPayment.aspx">&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3626;&#3604;</asp:HyperLink>
                   
                <br />
                    <asp:HyperLink ID="hlManageAlert" runat="server" 
                        NavigateUrl="~/admin/general/dataAlert.aspx">&#3585;&#3634;&#3619;&#3649;&#3592;&#3657;&#3591;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;</asp:HyperLink>
                <br />
                    <asp:HyperLink ID="hlAddBankTranfer" runat="server" 
                        NavigateUrl="~/admin/general/addBank.aspx">&#3648;&#3614;&#3636;&#3656;&#3617;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609;</asp:HyperLink>
                </div>
    <div class="TabbedPanelsContent">
        <uc2:reportMenu ID="reportMenu1" runat="server" />
      </div>
  </div>
</div>
<script type="text/javascript">
    var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
    
</div>

</asp:Content>


