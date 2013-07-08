<%@ Page Title="ATIT ::: Course History" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="courseHistory.aspx.vb" Inherits="courseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3611;&#3619;&#3632;&#3623;&#3633;&#3605;&#3636;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617; (Course History)</h1>
      <asp:UpdatePanel ID="upHistory" runat="server">
          <ContentTemplate>
              <p align="center">
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Cs_Id" DataSourceID="cancelSign" 
                      Width="95%" AllowPaging="True">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField HeaderText="&#3619;&#3627;&#3633;&#3626;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;" 
                              SortExpression="Pay_Id">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" 
                                      Text='<%# Bind("Pay_Id") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblIdPay" runat="server" 
                                      Text='<%# Bind("Pay_Id") %>'></asp:Label>
                                  <asp:Label ID="lblCsId" runat="server" 
                                      Text='<%# Bind("Cs_Id") %>' Visible="False"></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                              SortExpression="CourseName">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:HyperLink ID="hlViewCourse" runat="server" 
                                      NavigateUrl='<%# Eval("Course_Id", "viewCourse.aspx?id={0}") %>' 
                                      Text='<%# Bind("CourseName") %>' 
                                      ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3604;&#3641;&#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;"></asp:HyperLink>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField FooterText="&#3619;&#3623;&#3617;&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3588;&#3639;&#3609; (50%)" 
                              
                              HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" 
                              SortExpression="Class_Start">
                              <EditItemTemplate>
                                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("Class_Start") %>'></asp:Label>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                                  <asp:Label ID="lblReceive" runat="server" Text='<%# Bind("Price") %>' 
                                      Visible="False"></asp:Label>
                              </ItemTemplate>
                              <FooterStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
                                  VerticalAlign="Middle" />
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3651;&#3610;&#3648;&#3626;&#3619;&#3655;&#3592;&#3619;&#3633;&#3610;&#3648;&#3591;&#3636;&#3609;">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:ImageButton ID="imgTax" runat="server" 
                                      ImageUrl="~/admin/report/img/pdf-icon-small-disable.gif" Enabled="False" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                      </Columns>
                      <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <EmptyDataTemplate>
                          <p align="center" style="border: 1px solid #333333">
                              &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3652;&#3623;&#3657;</p>
                      </EmptyDataTemplate>
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="cancelSign" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ConString %>" 
              SelectCommand="SELECT co.Course_Id,cs.Cs_Id,co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, 
                ps.Status, co.Price, pc.Chk_Detail, pc.Chk_Id, ps.Paid, pm.Pay_Id
                FROM Class cl, Course co, Class_Student cs, PayStatus ps, Payment pm, Payment_Check pc 
                WHERE cs.Paid = ps.Paid and (ps.Paid=3) and Cancel = 'False' 
                and cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and S_Id=@sid 
                and pm.Cs_Id = cs.Cs_Id and pm.Chk_Id = pc.Chk_Id ORDER BY cs.Cs_Id DESC" 
              UpdateCommand="UPDATE [Class_Student] SET [Cancel] = 'True' WHERE Cs_Id=@Cs_Id" >
                      <SelectParameters>
                          <asp:SessionParameter Name="sid" SessionField="sid" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="Cs_Id" Type="Int32" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
              </p>
          </ContentTemplate>
      </asp:UpdatePanel>
</div>
</asp:Content>


