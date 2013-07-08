<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataSigninCancel.aspx.vb" Inherits="admin_course_dataSigninCancel" title="ATIT ::: Cancel Signin Data" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3586;&#3629;&#3591;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585; (cancel Signin data)</h1>
<p>&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3621;&#3610;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3585;&#3634;&#3619; &#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609; &#3652;&#3604;&#3657;&#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
          <img alt="" src="../../img/minus-icon.png" style="width: 24px; height: 24px" /></p>
      <p>&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3626;&#3606;&#3634;&#3609;&#3632;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
          &quot;<strong>&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;</strong>&quot; 
          (&#3650;&#3611;&#3619;&#3604;&#3605;&#3619;&#3623;&#3592;&#3626;&#3629;&#3610;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3588;&#3639;&#3609;&#3648;&#3591;&#3636;&#3609;&#3651;&#3627;&#3657;&#3648;&#3619;&#3637;&#3618;&#3610;&#3619;&#3657;&#3629;&#3618;&#3585;&#3656;&#3629;&#3609;&#3607;&#3637;&#3656;&#3592;&#3632;&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3588;&#3639;&#3609;&#3648;&#3591;&#3636;&#3609; 
          &#3650;&#3604;&#3618;&#3649;&#3605;&#3656;&#3621;&#3632;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3592;&#3632;&#3588;&#3639;&#3609;&#3648;&#3591;&#3636;&#3609;&#3651;&#3627;&#3657;&#3626;&#3617;&#3634;&#3594;&#3636;&#3585;&#3648;&#3614;&#3637;&#3618;&#3591; 
          <b>&quot;&#3588;&#3619;&#3638;&#3656;&#3591;&#3627;&#3609;&#3638;&#3656;&#3591;&quot;</b> &#3649;&#3621;&#3632;&#3648;&#3593;&#3614;&#3634;&#3632;&#3585;&#3619;&#3603;&#3637;&#3607;&#3637;&#3656;&#3617;&#3637;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;&#3649;&#3610;&#3610;
          <b>&quot;&#3594;&#3635;&#3619;&#3632;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;&quot;</b> &#3648;&#3607;&#3656;&#3634;&#3609;&#3633;&#3657;&#3609;)</p>
        <asp:UpdatePanel ID="upCancelSign" runat="server">
            <ContentTemplate>
            <script type="text/javascript">
              Sys.Application.add_load(tooltip);
            </script>
                <p>
                    &#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3617;&#3626;&#3606;&#3634;&#3609;&#3632;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609; :
                    <asp:DropDownList ID="ddlPaid" runat="server" AutoPostBack="True" 
                        
                        ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3626;&#3606;&#3634;&#3609;&#3632;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;">
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="btnUpdate" runat="server" BackColor="#FFFF66" 
                        BorderColor="Black" BorderStyle="Solid" Enabled="False" 
                        OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;');" style="cursor:pointer" 
                        Text="&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;" />
                </p>
                <div ID="hideGrid" align="center" style="display: none">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="4" DataKeyNames="Cs_Id" DataSourceID="cancelSign" Width="95%">
                        <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                            HorizontalAlign="Left" VerticalAlign="Middle" />
                        <EmptyDataRowStyle BackColor="#FFFF66" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgDelete" runat="server" CausesValidation="false" 
                                        CommandName="Update" ImageUrl="~/img/minus-icon.png" Text="Update" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3621;&#3610;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3609;&#3637;&#3657;" />
                                    <asp:Label ID="lblCsId" runat="server" Text='<%# Bind("Cs_Id") %>' 
                                        Visible="False"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3612;&#3641;&#3657;&#3651;&#3594;&#3657;" SortExpression="Username">
                                <ItemTemplate>
                                    <asp:Label ID="lblUser" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
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
                                </ItemTemplate>
                                <FooterStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" 
                                    VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&#3592;&#3635;&#3609;&#3623;&#3609;&#3648;&#3591;&#3636;&#3609;" SortExpression="Column1">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblReceive" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle Font-Bold="True" Font-Underline="True" ForeColor="White" 
                                    HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="&#3626;&#3606;&#3634;&#3609;&#3632;">
                                <ItemTemplate>
                                    <asp:Label ID="lblChkId" runat="server" Text='<%# Bind("Chk_Id") %>' 
                                        Visible="False"></asp:Label>
                                    <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="status" 
                                        DataTextField="Status" DataValueField="Paid" 
                                        SelectedValue='<%# Bind("Paid") %>' 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3611;&#3621;&#3637;&#3656;&#3618;&#3609;&#3649;&#3611;&#3621;&#3591;&#3626;&#3606;&#3634;&#3609;&#3632;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;">
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgUpdate" runat="server" CausesValidation="false" 
                                        CommandName="Update" ImageUrl="~/img/payment.png" 
                                        onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3629;&#3633;&#3614;&#3648;&#3604;&#3607;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;');" Text="" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3629;&#3633;&#3615;&#3648;&#3604;&#3607;&#3626;&#3606;&#3634;&#3609;&#3632;&#3585;&#3634;&#3619;&#3594;&#3635;&#3619;&#3632;&#3648;&#3591;&#3636;&#3609;" />
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <p align="center" style="border: 1px solid #333333">
                                &#3607;&#3656;&#3634;&#3609;&#3652;&#3617;&#3656;&#3617;&#3637;&#3619;&#3634;&#3618;&#3585;&#3634;&#3619;&#3607;&#3637;&#3656;&#3652;&#3604;&#3657;&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;&#3585;&#3634;&#3619;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3652;&#3623;&#3657;</p>
                        </EmptyDataTemplate>
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                            ForeColor="#FFFFCC" />
                    </asp:GridView>
                </div>
                <p align="center">
                    <asp:SqlDataSource ID="cancelSign" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                        SelectCommand="SELECT cs.Cs_Id,st.Username,co.CourseName, CONVERT(VARCHAR(10),cl.Class_Start,105) as Class_Start, ps.Paid, ps.Status, co.Price, pc.Chk_Detail,pch.Pay_Detail, pc.Chk_Id
FROM Class cl, Course co, Class_Student cs, PayStatus ps,Student st, Payment pm,Payment_Check pc,Payment_Choice pch WHERE cs.Paid = ps.Paid and (ps.Paid=@paid) and Cancel = 'True' 
and cs.Class_Id = cl.Class_Id and co.Course_Id = cl.Course_Id and cl.Class_Start &gt; GETDATE() and st.S_Id = cs.S_Id and pc.Chk_Id = 1
and cs.Cs_Id = pm.Cs_Id and pm.Chk_Id = pc.Chk_Id and pm.Pay_Choice = pch.Pay_Choice ORDER BY cs.Cs_Id DESC" 
                        UpdateCommand="UPDATE [Class_Student] SET [Paid] = @Paid WHERE Cs_Id=@Cs_Id">
                        <UpdateParameters>
                            <asp:Parameter Name="Cs_Id" Type="Int32" />
                            <asp:Parameter Name="Paid" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                          <asp:ControlParameter ControlID="ddlPaid" Name="paid" PropertyName="SelectedValue" />
                      </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:SqlDataSource ID="status" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConString %>" 
                        SelectCommand="SELECT [Paid], [Status] FROM [PayStatus] WHERE (Paid=3 or Paid=5)">
                    </asp:SqlDataSource>
                </p>
            </ContentTemplate>
        </asp:UpdatePanel>
</div>

</asp:Content>


