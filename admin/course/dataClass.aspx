<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="dataClass.aspx.vb" Inherits="admin_course_dataClass" title="ATIT ::: Class Data Table" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3619;&#3634;&#3591;&#3585;&#3634;&#3619;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617; (Class Data Table)</h1>
      <asp:UpdatePanel ID="upClass" runat="server">
          <ContentTemplate>
          <script type="text/javascript">
              Sys.Application.add_load(textStyle);
              Sys.Application.add_load(BindEvents);
              Sys.Application.add_load(showToolTip);
              Sys.Application.add_load(tooltip);
      </script>
              <p>&#3607;&#3656;&#3634;&#3609;&#3626;&#3634;&#3617;&#3634;&#3619;&#3606;&#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3586;&#3629;&#3591;&#3605;&#3634;&#3619;&#3634;&#3591;&#3613;&#3638;&#3585;&#3629;&#3610;&#3619;&#3617;&#3652;&#3604;&#3657;&#3612;&#3656;&#3634;&#3609;&#3605;&#3634;&#3619;&#3634;&#3591;&#3604;&#3657;&#3634;&#3609;&#3621;&#3656;&#3634;&#3591; &#3650;&#3604;&#3618;&#3588;&#3621;&#3636;&#3585;&#3607;&#3637;&#3656;&#3611;&#3640;&#3656;&#3617;
                  <img alt="" src="../../img/edit.gif" style="width: 24px; height: 24px"  /></p>
              <p>
                  &#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                  <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                      ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;" >
                  </asp:DropDownList>
              </p>
              <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                  BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                  CellPadding="4" DataKeyNames="Class_Id" DataSourceID="class" Width="95%">
                  <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                      HorizontalAlign="Left" VerticalAlign="Middle" />
                  <EmptyDataRowStyle BackColor="#FFFF66" />
                  <Columns>
                      <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/edit.gif" 
                          ShowSelectButton="True">
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:CommandField>
                      <asp:BoundField DataField="Class_Id" HeaderText="&#3619;&#3627;&#3633;&#3626;&#3605;&#3634;&#3619;&#3634;&#3591;" 
                          InsertVisible="False" ReadOnly="True" SortExpression="Class_Id">
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:BoundField>
                      <asp:TemplateField HeaderText="&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" SortExpression="CourseName">
                          <ItemTemplate>
                              <asp:HyperLink ID="hlCourse" runat="server" NavigateUrl="~/viewCourse.aspx?id=" 
                                  Text='<%# Bind("CourseName") %>'></asp:HyperLink>
                              <asp:Label ID="lblId" runat="server" Text='<%# Bind("Course_Id") %>' 
                                  Visible="False"></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;" SortExpression="CourseTypeName">
                          <ItemTemplate>
                              <asp:Label ID="lblType" runat="server" Text='<%# Bind("CourseTypeName") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3607;&#3637;&#3656;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_Start">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("Class_Start") %>' 
                                  Width="80px"></asp:TextBox>
                              <rjs:PopCalendar ID="pcStart" runat="server" AutoPostBack="True" 
                                  Control="txtStartDate" Format="yyyy mm dd" From-Date="" From-Today="True" 
                                  Separator="/" TodayText="Today : [Today]" />
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="&#3623;&#3633;&#3609;&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;" SortExpression="Class_End">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtDateEnd" runat="server" Text='<%# Bind("Class_End") %>' 
                                  Width="80px"></asp:TextBox>
                              <rjs:PopCalendar ID="pcEnd" runat="server" AutoPostBack="True" 
                                  Control="txtDateEnd" Format="yyyy mm dd" From-Date="" From-Today="True" 
                                  Separator="/" TodayText="Today : [Today]" />
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="lblEnd" runat="server" Text='<%# Bind("Class_End") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                  </Columns>
                  <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                      ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                  <SelectedRowStyle BackColor="#FFFF66" Font-Bold="False" ForeColor="Black" />
                  <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                      ForeColor="#FFFFCC" />
              </asp:GridView>
              <br />
              <asp:Panel ID="pClass" runat="server" Visible="False">
                  <table ID="tAddClass" border="0" cellpadding="2" cellspacing="2" width="98%">
                      <tr>
                          <td width="20%">
                              <div align="right">
                                  &#3619;&#3627;&#3633;&#3626;&#3605;&#3634;&#3619;&#3634;&#3591; :
                              </div>
                          </td>
                          <td width="47%">
                              <div align="left">
                                  <asp:Label ID="lblClassId" runat="server"></asp:Label>
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
                                  &#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                              </div>
                          </td>
                          <td width="47%">
                              <div align="left">
                                  <asp:Label ID="lblUpCourse" runat="server"></asp:Label>
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
                                  &#3648;&#3619;&#3636;&#3656;&#3617;&#3605;&#3657;&#3609; :
                              </div>
                          </td>
                          <td width="42%">
                              <div align="left">
                                  <asp:TextBox ID="txtStart" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                  <rjs:PopCalendar ID="PopCalendarStart" runat="server" AutoPostBack="True" 
                                      Control="txtStart" Format="yyyy mm dd" Separator="/" />
                                  *
                              </div>
                          </td>
                          <td width="33%">
                              <div align="left">
                                  <asp:RequiredFieldValidator ID="rfStrat" runat="server" 
                                      ControlToValidate="txtStart" ErrorMessage="&#3585;&#3619;&#3640;&#3603;&#3634;&#3585;&#3635;&#3627;&#3609;&#3604;&#3623;&#3633;&#3609;&#3648;&#3619;&#3636;&#3656;&#3617;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;"></asp:RequiredFieldValidator>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="25%">
                              <div align="right">
                                  &#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604; :
                              </div>
                          </td>
                          <td width="42%">
                              <div align="left">
                                  <asp:TextBox ID="txtEnd" runat="server" ReadOnly="True" Width="80px"></asp:TextBox>
                                  <rjs:PopCalendar ID="PopCalendarEnd" runat="server" Control="txtEnd" 
                                      Format="yyyy mm dd" Separator="/" />
                                  *</div>
                          </td>
                          <td width="33%">
                              <div align="left">
                                  <asp:RequiredFieldValidator ID="rfEnd" runat="server" 
                                      ControlToValidate="txtEnd" ErrorMessage="&#3585;&#3619;&#3640;&#3603;&#3634;&#3585;&#3635;&#3627;&#3609;&#3604;&#3623;&#3633;&#3609;&#3626;&#3636;&#3657;&#3609;&#3626;&#3640;&#3604;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;"></asp:RequiredFieldValidator>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="25%">
                              <div align="right">
                                  &#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617; [&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;] :
                              </div>
                          </td>
                          <td width="42%">
                              <div align="left">
                                  <asp:TextBox ID="txtMin" runat="server" Height="18px" MaxLength="2" 
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                      TextMode="SingleLine" Width="50px"></asp:TextBox>
                                  <div>
                                      &#3619;&#3632;&#3610;&#3640;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3592;&#3635;&#3609;&#3623;&#3609;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;&#3651;&#3609;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617; &#3627;&#3634;&#3585;&#3652;&#3617;&#3656;&#3585;&#3635;&#3627;&#3609;&#3604;&#3651;&#3627;&#3657;&#3648;&#3623;&#3657;&#3609;&#3623;&#3656;&#3634;&#3591;</div>
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
                                  &#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617; [&#3626;&#3641;&#3591;&#3626;&#3640;&#3604;] :
                              </div>
                          </td>
                          <td width="42%">
                              <div align="left">
                                  <asp:TextBox ID="txtMax" runat="server" Height="18px" MaxLength="3" 
                                      onkeypress="if(event.keyCode&lt;48 || event.keyCode&gt;57)event.returnValue=false;" 
                                      TextMode="SingleLine" Width="50px"></asp:TextBox>
                                  <div>
                                      &#3619;&#3632;&#3610;&#3640;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604; &#3605;&#3657;&#3629;&#3591;&#3617;&#3634;&#3585;&#3585;&#3623;&#3656;&#3634;&#3627;&#3619;&#3639;&#3629;&#3648;&#3607;&#3656;&#3634;&#3585;&#3633;&#3610;&#3592;&#3635;&#3609;&#3623;&#3609;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3605;&#3656;&#3635;&#3626;&#3640;&#3604;</div>
                              </div>
                          </td>
                          <td width="33%">
                              <div align="left">
                                  <asp:Label ID="lblMinMax" runat="server" ForeColor="Red" 
                                      Text="&#3585;&#3619;&#3640;&#3603;&#3634;&#3651;&#3626;&#3656;&#3592;&#3635;&#3609;&#3623;&#3609;&#3612;&#3641;&#3657;&#3629;&#3610;&#3619;&#3617;&#3651;&#3627;&#3657;&#3606;&#3641;&#3585;&#3605;&#3657;&#3629;&#3591;" Visible="False"></asp:Label>
                              </div>
                          </td>
                      </tr>
                      <tr>
                          <td width="25%">
                              &nbsp;</td>
                          <td align="center" width="42%">
                              &nbsp;</td>
                          <td width="33%">
                              &nbsp;</td>
                      </tr>
                      <tr>
                          <td width="25%">
                              &nbsp;</td>
                          <td align="center" width="42%">
                              <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" 
                                  BorderColor="Black" BorderStyle="Solid" 
                                  OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3649;&#3585;&#3657;&#3652;&#3586;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;');" style="cursor:pointer" 
                                  Text="&#3605;&#3585;&#3621;&#3591;" />
                              &nbsp;</td>
                          <td width="33%">
                          </td>
                      </tr>
                  </table>
              </asp:Panel>
              <asp:Panel ID="pError" runat="server" Visible="False">
              <p align="center" style="color: #FF0000; font-size: large">
                  &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;&#3652;&#3604;&#3657;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;&#3649;&#3621;&#3657;&#3623;</p>
              </asp:Panel>
              <asp:SqlDataSource ID="class" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:ConString %>" 
                  SelectCommand="SELECT cl.Class_Id,cl.Course_Id,CONVERT(VARCHAR(10),cl.Class_Start,111) as Class_Start,CONVERT(VARCHAR(10),cl.Class_End,111) as Class_End,co.CourseName,ct.CourseTypeName 
FROM Class cl,Course co,Course_Type ct WHERE cl.Course_Id = co.Course_Id and ct.CourseType_Id = co.CourseType_Id and ct.CourseType_Id=@type ORDER BY cl.Class_Id DESC"
                   UpdateCommand="UPDATE [Class] SET [Class_Start] = CONVERT(VARCHAR(10),@Class_Start,111), [Class_End] = CONVERT(VARCHAR(10),@Class_End,111) WHERE [Class_Id] = @Class_Id" >
                  <SelectParameters>
                      <asp:ControlParameter ControlID="ddlType" Name="type" 
                          PropertyName="SelectedValue" />
                  </SelectParameters>
                  <UpdateParameters>
                          <asp:Parameter DbType="Date" Name="Class_Start" />
                          <asp:Parameter DbType="Date" Name="Class_End" />
                          <asp:Parameter Name="Class_Id" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
              <asp:ScriptManager ID="ScriptManager1" runat="server">
              </asp:ScriptManager>
          </ContentTemplate>
      </asp:UpdatePanel>
</div>

</asp:Content>


