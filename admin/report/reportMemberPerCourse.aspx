<%@ Page Language="VB" MasterPageFile="~/admin/report/main.master" AutoEventWireup="false" CodeFile="reportMemberPerCourse.aspx.vb" Inherits="admin_report_reportMemberPerCourse" title="ATIT ::: Report" %>

<%@ Register assembly="RJS.Web.WebControl.PopCalendar.Ajax.Net" namespace="RJS.Web.WebControl" tagprefix="rjs" %>

<%@ Register assembly="CrystalDecisions.Web, Version=10.5.3700.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
    function showError(txt) {
        alert(txt);
    }      
        
        function checked(id) {
            $(id).attr('checked', false);
            $('#chkAll').prop('checked', false);
        }

        function pageEvent() {
            $(document).ready(function() {
                function getData(send, id) {
                    id = '#' + id;
                    var txtsend = send;
                    $.ajax({
                        type: "POST",
                        url: "checkClass.aspx",
                        data: "txt=" + txtsend + '&cmd=classid',
                        async: false,
                        success: function(data) {
                            var check = data;
                            if (check == 'True') {                                
                                var cf = confirm($('#test').html());
                                if (cf) {
                                    $(id).prop('checked', true);
                                }
                                else {
                                    checked(id)
                                }
                            }
                            else {
                                $(id).prop('checked', true);
                            }

                        }
                    });
                }

                $('label[for*=chkClassId]').hide();

                $('#chkAll').click(function() {
                    var chk = $(this).prop('checked');
                    if (chk == true) {
                        $('input[id*=chkClassId]').attr('checked', true);
                    }
                    else {
                        checked('input[id*=chkClassId]')
                    }
                });

                $('input[id*=chkClassId]').click(function() {
                    var chk = $(this).prop('checked');
                    var id = $(this).prop('id');
                    var classid = $('label[for=' + id + ']').html();
                    if (chk == true) {
                        getData(classid, id)
                    }
                    else {
                        checked(this)
                    }
                });

            });
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">

    <div id="content">
    <h1>&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;&#3626;&#3619;&#3640;&#3611;&#3612;&#3641;&#3657;&#3621;&#3591;&#3607;&#3632;&#3648;&#3610;&#3637;&#3618;&#3609;&#3605;&#3634;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</h1>
        <asp:UpdatePanel ID="upReport" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(BindEvents);
            Sys.Application.add_load(pageEvent);
            Sys.Application.add_load(tooltip);
            </script>
            <p>
                  &#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3605;&#3634;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                  <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" 
                      ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;">
                  </asp:DropDownList>
                  &nbsp;<br />
                  &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                  <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="True" 
                      ToolTip="&#3648;&#3621;&#3639;&#3629;&#3585;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;">
                  </asp:DropDownList>
                  <asp:Button ID="btnOk" runat="server" Enabled="False" Text="&#3605;&#3585;&#3621;&#3591;" />
              </p>
              <p align="left">
                  <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                      BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                      CellPadding="4" Width="75%">
                      <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                          HorizontalAlign="Left" VerticalAlign="Middle" />
                      <EmptyDataRowStyle BackColor="#FFFF66" />
                      <Columns>
                          <asp:TemplateField ShowHeader="False">
                              <ItemTemplate>
                                  <asp:CheckBox ID="chkClassId" runat="server" Text='<%# Bind("Class_Id") %>' 
                                      ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3609;&#3637;&#3657;" />
                              </ItemTemplate>
                              <HeaderTemplate>
                                  <input ID="chkAll" type="checkbox" title="&#3648;&#3621;&#3639;&#3629;&#3585;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;" />
                              </HeaderTemplate>
                              <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" SortExpression="Course_Id">
                              <ItemTemplate>
                                  <asp:Label ID="lblCourseName" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                              </ItemTemplate>
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Course_Id") %>'></asp:TextBox>
                              </EditItemTemplate>
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
                  </p>
                    <p align="left">
                        <asp:Button ID="btnViewReport" runat="server" 
                        Text="&#3649;&#3626;&#3604;&#3591;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609;" 
                            Visible="False" />
            </p>
            <p align="left">
                &#3604;&#3634;&#3623;&#3609;&#3660;&#3650;&#3627;&#3621;&#3604;&#3619;&#3634;&#3618;&#3591;&#3634;&#3609; :
                <asp:ImageButton ID="imgPdf" runat="server" Enabled="False" 
                    ImageUrl="~/admin/report/img/pdf-icon-small.gif" />
                <asp:ImageButton ID="imgDoc" runat="server" Enabled="False" 
                    ImageUrl="~/admin/report/img/word-icon-small.gif" />
                <asp:ImageButton ID="imgXls" runat="server" Enabled="False" 
                    ImageUrl="~/admin/report/img/excel-icon.gif" />
            </p>
                    <div id="test" style="display: none">
                        &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;&#3652;&#3604;&#3657;&#3648;&#3619;&#3636;&#3656;&#3617;&#3629;&#3610;&#3619;&#3617;&#3649;&#3621;&#3657;&#3623; &#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3604;&#3641;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3651;&#3594;&#3656;&#3627;&#3619;&#3639;&#3629;&#3652;&#3617;&#3656;?</div>
                    <CR:CrystalReportViewer ID="MemberSigninCourse" runat="server" 
                  AutoDataBind="true" DisplayGroupTree="False" 
                  EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" 
                  HasCrystalLogo="False" HasDrillUpButton="False" HasGotoPageButton="False" 
                  HasSearchButton="False" HasToggleGroupTreeButton="False" HasViewList="False" 
                  HasZoomFactorList="False" HasExportButton="False" HasPrintButton="False" 
                ReuseParameterValuesOnRefresh="True" ToolbarStyle-BackColor="#FFFF99" 
                Visible="False" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:Label ID="lblNone" runat="server" Font-Bold="True" Font-Size="Large" 
                ForeColor="Red" Text="&#3652;&#3617;&#3656;&#3617;&#3637;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3648;&#3621;&#3639;&#3629;&#3585;" Visible="False"></asp:Label>
        </ContentTemplate>
        </asp:UpdatePanel>
        
</div>

</asp:Content>



