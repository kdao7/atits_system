<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="courseList.aspx.vb" Inherits="bookingCancel" title="ATIT ::: Course List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; (Course list)</h1>
      <asp:UpdatePanel ID="upCancel" runat="server">
          <ContentTemplate>
          <script type="text/javascript">
              Sys.Application.add_load(tooltip);
        </script>
              <h3 align="left">
                  &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;</h3>
              <p align="left">
                  &#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
                  <img src="img/minus-icon.png" style="width: 24px; height: 24px" alt="" /> 
                  (&#3651;&#3609;&#3585;&#3619;&#3603;&#3637;&#3607;&#3637;&#3656;&#3648;&#3585;&#3636;&#3609; 15 &#3623;&#3633;&#3609; &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3592;&#3632;&#3606;&#3641;&#3585;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3650;&#3604;&#3618;&#3629;&#3633;&#3605;&#3636;&#3650;&#3609;&#3617;&#3633;&#3605;&#3636;)<br />
                  &#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3604;&#3635;&#3648;&#3609;&#3636;&#3609;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
                  <img alt="&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;" src="img/payment.png" style="width: 24px; height: 24px" /></p>
              <p align="center">
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Cs_Id" DataSourceID="cancel" ShowFooter="True" 
                      Width="95%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="False" title="ยกเลิกหลักสูตรนี้"
                                      CommandName="Delete" ImageUrl="~/img/minus-icon.png" Text="Delete" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" SortExpression="CourseName">
                              <ItemTemplate>
                                  <asp:Label ID="lblCourseName" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                              </EditItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Class_Start") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblDateStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                          <asp:TemplateField FooterText="&#3619;&#3634;&#3588;&#3634;&#3619;&#3623;&#3617;" HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3592;&#3629;&#3591;" 
                              SortExpression="RegisDate">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RegisDate") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblDateBook" runat="server" Text='<%# Bind("RegisDate") %>'></asp:Label>
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3619;&#3634;&#3588;&#3634;" SortExpression="Price">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                              </ItemTemplate>
                              <FooterStyle Font-Underline="True" />
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;">
                              <ItemTemplate>
                                  <asp:Label ID="lblCsId" runat="server" Text='<%# Bind("Cs_Id") %>' 
                                      Visible="False"></asp:Label>
                                  <asp:ImageButton ID="imgPay" runat="server" ImageUrl="~/img/payment.png" title="ชำระเงิน" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                      </Columns>
                      <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                      <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                      <EmptyDataTemplate>
                          <p align="center" style="border: 1px solid #333333">
                              &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3592;&#3629;&#3591; &#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606; &quot;&#3592;&#3629;&#3591;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&quot; &#3650;&#3604;&#3618;
                              <asp:HyperLink ID="hlBk" runat="server" NavigateUrl="~/booking.aspx">&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3609;&#3637;&#3656;</asp:HyperLink>
                          </p>
                      </EmptyDataTemplate>
                      <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                      <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                          ForeColor="#FFFFCC" />
                  </asp:GridView>
              </p>
              <h3 align="left">
                  &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609; / &#3592;&#3629;&#3591;</h3>
              <p align="left">
                  &#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
                  <img src="img/minus-icon.png" style="width: 24px; height: 24px" alt="" /> 
                  (&#3627;&#3621;&#3633;&#3591;&#3592;&#3634;&#3585;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3649;&#3621;&#3657;&#3623; &#3619;&#3632;&#3610;&#3610;&#3592;&#3632;&#3588;&#3639;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3656;&#3634;&#3609; <b>&quot;&#3588;&#3619;&#3638;&#3656;&#3591;&#3627;&#3609;&#3638;&#3656;&#3591;&quot;</b> 
                  &#3586;&#3629;&#3591;&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3619;&#3633;&#3610;&#3594;&#3635;&#3619;&#3632;&#3652;&#3623;&#3657;) &#3648;&#3617;&#3639;&#3656;&#3629;&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3649;&#3621;&#3657;&#3623;&#3592;&#3632;&#3652;&#3617;&#3656;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3649;&#3585;&#3657;&#3652;&#3586;&#3652;&#3604;&#3657;&#3629;&#3637;&#3585; </p>
              <p align="left">
                  &#3607;&#3656;&#3634;&#3609;&#3592;&#3632;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3652;&#3604;&#3657;&#3648;&#3593;&#3614;&#3634;&#3632;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3619;&#3633;&#3610;&#3585;&#3634;&#3619;<b> &quot;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3649;&#3621;&#3657;&#3623;&quot; </b>&#3648;&#3607;&#3656;&#3634;&#3609;&#3633;&#3657;&#3609; 
                  &#3649;&#3621;&#3632;&#3592;&#3632;&#3652;&#3604;&#3657;&#3619;&#3633;&#3610;&#3648;&#3591;&#3636;&#3609;&#3588;&#3639;&#3609;&#3648;&#3593;&#3614;&#3634;&#3632;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3617;&#3637;&#3585;&#3634;&#3619; <b>&quot;&#3594;&#3635;&#3619;&#3632;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;&quot;</b> &#3648;&#3607;&#3656;&#3634;&#3609;&#3633;&#3657;&#3609;</p>
              <p align="center">
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" DataKeyNames="Cs_Id" DataSourceID="cancelSign" 
                      Width="95%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:Label ID="lblCsId" runat="server" Text='<%# Bind("Cs_Id") %>' 
                                      Visible="False"></asp:Label>
                                  <asp:ImageButton ID="imgSign" runat="server" CausesValidation="false" title="ยกเลิกหลักสูตรนี้"
                                      CommandName="Update" ImageUrl="~/img/minus-icon.png" Text="Update" />
                              </ItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:BoundField DataField="Pay_Id" HeaderText="&#3619;&#3627;&#3633;&#3626;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;" 
                              SortExpression="Pay_Id">
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:BoundField>
                          <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" SortExpression="CourseName">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CourseName") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblCourse" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField FooterText="&#3619;&#3623;&#3617;&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;&#3607;&#3637;&#3656;&#3588;&#3639;&#3609; (50%)" 
                              HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
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
                          <asp:TemplateField HeaderText="&#3626;&#3606;&#3634;&#3609;&#3632;">
                              <ItemTemplate>
                                  <asp:Label ID="lblPaid" runat="server" Text='<%# Bind("Paid") %>' 
                                      Visible="False"></asp:Label>
                                  <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;" SortExpression="Chk_Detail">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Chk_Detail") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="lblChkId" runat="server" Text='<%# Bind("Chk_Id") %>' 
                                      Visible="False"></asp:Label>
                                  <asp:Label ID="lblPayment" runat="server" Text='<%# Bind("Chk_Detail") %>'></asp:Label>
                              </ItemTemplate>
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
                  <asp:ScriptManager ID="ScriptManager1" runat="server">
                  </asp:ScriptManager>
              </p>
              <p align="left">
                  &#3651;&#3609;&#3585;&#3619;&#3603;&#3637;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3617;&#3634;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3626;&#3656;&#3623;&#3609;&#3607;&#3637;&#3656;&#3648;&#3627;&#3621;&#3639;&#3629;&#3607;&#3637;&#3656;&#3624;&#3640;&#3609;&#3618;&#3660;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617; &#3648;&#3614;&#3639;&#3656;&#3629;&#3588;&#3623;&#3634;&#3617;&#3626;&#3632;&#3604;&#3623;&#3585;&#3649;&#3621;&#3632;&#3619;&#3623;&#3604;&#3648;&#3619;&#3655;&#3623; 
                  &#3586;&#3629;&#3588;&#3623;&#3634;&#3617;&#3585;&#3619;&#3640;&#3603;&#3634;&#3607;&#3656;&#3634;&#3609;&#3610;&#3629;&#3585;<b> &quot;&#3627;&#3617;&#3634;&#3618;&#3648;&#3621;&#3586;&#3610;&#3633;&#3605;&#3619;&#3611;&#3619;&#3632;&#3594;&#3634;&#3594;&#3609;&quot; </b>&#3651;&#3627;&#3657;&#3614;&#3609;&#3633;&#3585;&#3591;&#3634;&#3609;&#3607;&#3619;&#3634;&#3610;&#3604;&#3657;&#3623;&#3618;</p>
          </ContentTemplate>
          <Triggers>
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowDataBound" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdating" />
              <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowUpdated" />
          </Triggers>
      </asp:UpdatePanel>
      <p style="text-align: center">
          <asp:SqlDataSource ID="cancel" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ConString %>" 
              DeleteCommand="DELETE FROM [Class_Student] WHERE [Cs_Id] = @Cs_Id" 
              SelectCommand="SELECT cs.Cs_Id,cl.Class_Id, co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, CONVERT(VARCHAR(10),cs.RegisDate,105) as RegisDate,co.Price
FROM Class cl, Course co, Class_Student cs WHERE Paid=1 and Cancel = 'False' and cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and S_Id=@sid and DATEDIFF(d,RegisDate,GETDATE()) &lt; 15"
              UpdateCommand="UPDATE [Class_Student] SET [Cancel] = 'True' WHERE Cs_Id=@Cs_Id" >
              <UpdateParameters>
                    <asp:Parameter Name="Cs_Id" Type="Int32" />
              </UpdateParameters>
              <SelectParameters>
                  <asp:SessionParameter Name="sid" SessionField="sid" />
              </SelectParameters>
              <DeleteParameters>
                  <asp:Parameter Name="Cs_Id" Type="Int32" />
              </DeleteParameters>
          </asp:SqlDataSource>
          <asp:SqlDataSource ID="cancelSign" runat="server" 
              ConnectionString="<%$ ConnectionStrings:ConString %>" 
              SelectCommand="SELECT cs.Cs_Id,co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, 
                ps.Status, co.Price, pc.Chk_Detail, pc.Chk_Id, ps.Paid, pm.Pay_Id
                FROM Class cl, Course co, Class_Student cs, PayStatus ps, Payment pm, Payment_Check pc 
                WHERE cs.Paid = ps.Paid and (ps.Paid=2 or ps.Paid=3 or ps.Paid=4) and Cancel = 'False' 
                and cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and S_Id=@sid 
                and cl.Class_Start > GETDATE() and pm.Cs_Id = cs.Cs_Id and pm.Chk_Id = pc.Chk_Id ORDER BY cs.Cs_Id DESC" 
              UpdateCommand="UPDATE [Class_Student] SET [Cancel] = 'True' WHERE Cs_Id=@Cs_Id" >
              <SelectParameters>
                  <asp:SessionParameter Name="sid" SessionField="sid" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Cs_Id" Type="Int32" />
              </UpdateParameters>
          </asp:SqlDataSource>
      </p>
</div>

</asp:Content>


