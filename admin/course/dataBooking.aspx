<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataBooking.aspx.vb" Inherits="admin_course_dataBooking" title="ATIT ::: Booking List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3586;&#3629;&#3591;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585; (member course list)</h1>
      <p>&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3621;&#3610;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3585;&#3634;&#3619;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3652;&#3604;&#3657;&#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
          <img alt="" src="../../img/minus-icon.png" style="width: 24px; height: 24px" /></p>
      <asp:UpdatePanel ID="upBook" runat="server">
          <ContentTemplate>
           <script type="text/javascript">
               Sys.Application.add_load(BindEvents);
               Sys.Application.add_load(tooltip);
      </script>
              <p align="center"><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" 
    BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Cs_Id" DataSourceID="booking" 
                      Width="95%">
                  <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                  <EmptyDataRowStyle BackColor="#FFFF66" />
                  <Columns>
                      <asp:TemplateField SortExpression="Cs_Id">
                          <EditItemTemplate>
                              <asp:Label ID="Label1" runat="server" 
                                      Text='<%# Eval("Cs_Id") %>'></asp:Label>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:ImageButton ID="imgDelete" runat="server" 
                                      ImageUrl="~/img/minus-icon.png" ToolTip="คลิกเพื่อลบข้อมูลนี้" />
                              <asp:Label ID="lblCourseId" runat="server" 
                                      Text='<%# Bind("Cs_Id") %>' Visible="False"></asp:Label>
                          </ItemTemplate>
                          <ItemStyle HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:BoundField DataField="Username" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;" 
                              SortExpression="Username" />
                      <asp:BoundField DataField="CourseName" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                              SortExpression="CourseName" />
                      <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3607;&#3635;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;" SortExpression="RegisDate">
                          <EditItemTemplate>
                              <asp:Label ID="Label3" runat="server" Text='<%# Eval("RegisDate") %>'></asp:Label>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="lblRegis" runat="server" Text='<%# Bind("RegisDate") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
                          <ItemTemplate>
                              <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                          </ItemTemplate>
                          <EditItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text='<%# Eval("Class_Start") %>'></asp:Label>
                          </EditItemTemplate>
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                  </Columns>
                  <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                  <EmptyDataTemplate>
                      <p align="center" style="border: 1px solid #333333">
                          &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3586;&#3629;&#3591;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;</p>
                  </EmptyDataTemplate>
                  <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                  <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
              </asp:GridView>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
              </p>
          </ContentTemplate>
          <Triggers>
              <asp:AsyncPostBackTrigger ControlID="GridView1" />
          </Triggers>
      </asp:UpdatePanel>
      <p align="center">
                  <asp:SqlDataSource ID="booking" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:ConString %>" 
                      SelectCommand="SELECT cs.Cs_Id, CONVERT(VARCHAR(10),cs.RegisDate,105) as RegisDate, st.Username, co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start 
FROM Class_Student cs,Student st,Class cl,Course co
WHERE Cancel = 'False' and Paid=1 and cs.S_Id = st.S_Id and cl.Class_Id = cs.Class_Id
and co.Course_Id = cl.Course_Id
ORDER BY cs.Cs_Id DESC">
                  </asp:SqlDataSource>
          </p>
      <p align="center">&nbsp;</p>
</div>

</asp:Content>


