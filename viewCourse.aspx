<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="viewCourse.aspx.vb" Inherits="viewCourse" title="ATIT ::: Course Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; (Course detail)</h1>
      <blockquote>
     
     <h3>
         &#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h3>
          <p class="view">
              <asp:Label ID="lblCourseName" runat="server"></asp:Label>
     </p>
          <h3>
              &#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h3>
          <p class="view">
              <asp:Label ID="lblCourseType" runat="server"></asp:Label>
     </p>
          <h3>
              &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h3>
          <p class="view">
              <asp:Label ID="lblCourseDetail" runat="server"></asp:Label>
     </p>
          <h3>
              &#3619;&#3632;&#3618;&#3632;&#3648;&#3623;&#3621;&#3634;</h3>
          <p class="view">
                                    <asp:Label ID="lblCourseDuration" runat="server"></asp:Label>
     </p>
          <h3>
              &#3619;&#3634;&#3588;&#3634;</h3>
          <p class="view">
                                
                                    <asp:Label ID="lblCoursePrice" runat="server"></asp:Label>
                                
     </p>
          <h3>
              &#3648;&#3629;&#3585;&#3626;&#3634;&#3619;</h3>
          <p class="view">
                                    <asp:Label ID="lblCourseFile" runat="server" BackColor="#F4F227" 
                                        ForeColor="#0066FF" ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;&#3648;&#3629;&#3585;&#3626;&#3634;&#3619;"></asp:Label>
     </p>
          <p align="center" 
              style="padding-top: 5px; padding-bottom: 5px; margin-top: 5px; border-bottom-style: dotted; border-top-style: dotted; border-top-width: 2px; border-bottom-width: 2px; border-top-color: #FFCC00; border-bottom-color: #FFCC00">
                                <asp:Button ID="btnBooking" runat="server" 
                  BackColor="#FFFF66" style="cursor:pointer" 
                                    BorderColor="Black" BorderStyle="Solid" 
                                    
                  Text="&#3592;&#3629;&#3591; / &#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;" />
                                &nbsp;
     </p>
    </blockquote>
</div>

</asp:Content>


