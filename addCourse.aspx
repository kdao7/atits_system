<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="addCourse.aspx.vb" Inherits="lecturer_addCourse" title="ATIT ::: Add Course" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript" type="text/javascript">
        function fncShowHide(show, hide) {
            var idShow = show;
            var idHide = hide;
            document.getElementById(idShow).style.display = '';
            document.getElementById(idHide).style.display = 'none';
        }
        function active(active, link) {
            var idActive = active;
            var idLink = link;
            document.getElementById(idLink).style.background = 'inherit';
            document.getElementById(idActive).style.background = '#FFFF77';
        }
        function showError(txt) {
            alert(txt);
        }   
        </script>
        
        <script type="text/javascript">
            function addType() {
                $('#tAddCourse').slideUp('slow');
                $('#tAddType').slideDown('slow');
                $("#<% = txtTypeCourse.ClientID %>").focus();
            }

            function ddlAddType(value, display) {
                $('select[id$=ddlCourseType]').append($('<option></option>').val(value).html(display));
            }

            function addCourse() {
                $('#tAddCourse').slideDown('slow');
                $('#tAddType').slideUp('slow');
                $("#<% = txtCourseName.ClientID %>").focus();
                clearTypeText();
            }

            function clearTypeText() {
                $("#<% = txtDetailType.ClientID %>").val(''); 
                $("#<% = txtTypeCourse.ClientID %>").val('');
            }

            $(document).ready(function() {

                $('#lbAddCourse').click(function() {
                    addCourse();
                });
                $('#lbAddType').click(function() {
                    addType();
                });
            });
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
  <div id="content">
    <h1>&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;(Course)</h1>
    <p style="border-bottom : solid 1px #CCC;" class="pagelink">
      <a id="lbAddCourse" href="#" style="background: #FFFF77" onclick="active('lbAddCourse', 'lbAddType');">
        &#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</a>
      <a id="lbAddType" href="#" onclick="active('lbAddType', 'lbAddCourse');">
        &#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;</a>
        </p>
      <asp:UpdatePanel ID="upAddClass" runat="server">
      <ContentTemplate>
      <script type="text/javascript">
          Sys.Application.add_load(textStyle);
          Sys.Application.add_load(showToolTip);
      </script>
      <asp:Panel ID="PAddCourse" runat="server">
                <table border="0" cellpadding="2" cellspacing="2" width="98%" id="tAddCourse" >
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtCourseName" runat="server" Height="18px" MaxLength="50" 
                                        Width="200px" TextMode="SingleLine" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3594;&#3639;&#3656;&#3629;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;&#3588;&#3623;&#3634;&#3617;&#3618;&#3634;&#3623;&#3652;&#3617;&#3656;&#3648;&#3585;&#3636;&#3609; 50 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</div>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                <asp:DropDownList ID="ddlCourseType" runat="server" 
                                        ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;">
                                            </asp:DropDownList>*
                                </div>
                            </td>
                            <td width="33%">
                                <div align="left">
                                    <asp:Label ID="lblAddType" runat="server" Font-Strikeout="False" onclick="active('lbAddType', 'lbAddCourse'); addType();"
                                        Font-Underline="True" ForeColor="#0066FF" style="cursor:pointer" Text="&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtDetail" runat="server" Height="122px" MaxLength="500" 
                                        Width="90%" TextMode="MultiLine" ></asp:TextBox>
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
                                    &#3652;&#3615;&#3621;&#3660;&#3649;&#3609;&#3610; :
                                </div>
                            </td>
                            <td width="42%" colspan="2" style="width: 75%">
                                <div align="left">
                                <eo:AJAXUploader ID="AJAXUploader1" runat="server" FinalFileList="AJAXPostedFileList1" 
    FinalFileLocation="~/temp" ImageBaseDirectory="" Rows="3" 
    TempFileLocation="~/temp" Width="90%" 
                    MaxDataSize="1500" MaxFileCount="3" 
                    ClientSideOnError="" BrowseButtonText="&#3648;&#3621;&#3639;&#3629;&#3585;&#3652;&#3615;&#3621;&#3660;" CancelButtonText="&#3618;&#3585;&#3648;&#3621;&#3636;&#3585;" 
                                        DeleteButtonText="&#3621;&#3610;&#3652;&#3615;&#3621;&#3660;&#3607;&#3637;&#3656;&#3648;&#3621;&#3639;&#3629;&#3585;" 
                                        ProgressTextFormat="&#3585;&#3635;&#3621;&#3633;&#3591;&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;...{transferred} bytes of {total} bytes ({percentage}%) done." 
                                        UploadButtonText="&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;">
                    <BrowseButtonStyle 
        
                        
                                        CssText="background-color:#ffff66;border-bottom-color:black;border-bottom-style:solid;border-left-color:black;border-left-style:solid;border-right-color:black;border-right-style:solid;border-top-color:black;border-top-style:solid;" />
                    <DeleteButtonStyle 
        
                        
                                        
                                        CssText="background-color:#ffff66;border-bottom-color:black;border-bottom-style:solid;border-left-color:black;border-left-style:solid;border-right-color:black;border-right-style:solid;border-top-color:black;border-top-style:solid;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;" />
                    <UploadButtonStyle 
        
                        
                                        
                                        CssText="background-color:#ffff66;border-bottom-color:black;border-bottom-style:solid;border-left-color:black;border-left-style:solid;border-right-color:black;border-right-style:solid;border-top-color:black;border-top-style:solid;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;" />
                    <TextBoxStyle 
        
                        CssText="padding-bottom:1px;padding-left:1px;padding-right:1px;padding-top:1px;" />
                    <CancelButtonStyle 
        
                        
                                        
                                        CssText="background-color:#ffff66;border-bottom-color:black;border-bottom-style:solid;border-left-color:black;border-left-style:solid;border-right-color:black;border-right-style:solid;border-top-color:black;border-top-style:solid;padding-bottom:2px;padding-left:2px;padding-right:2px;padding-top:2px;" />
                </eo:AJAXUploader>
                                    <br />
                                    <asp:Label ID="lblUpload" runat="server" ForeColor="Red" 
                                        
                                        Text="&#3586;&#3609;&#3634;&#3604;&#3652;&#3615;&#3621;&#3660;&#3619;&#3623;&#3617;&#3585;&#3633;&#3609;&#3652;&#3617;&#3656;&#3648;&#3585;&#3636;&#3609; 1.5 MB &#3649;&#3621;&#3632;&#3629;&#3633;&#3614;&#3650;&#3627;&#3621;&#3604;&#3652;&#3604;&#3657;&#3626;&#3641;&#3591;&#3626;&#3640;&#3604; 3 &#3652;&#3615;&#3621;&#3660; / &#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619; (&#3652;&#3615;&#3621;&#3660;&#3607;&#3633;&#3657;&#3591;&#3627;&#3617;&#3604;&#3592;&#3632;&#3606;&#3641;&#3585;&#3610;&#3637;&#3610;&#3629;&#3633;&#3604;&#3650;&#3604;&#3618;&#3629;&#3633;&#3605;&#3650;&#3609;&#3617;&#3633;&#3605;&#3636;)"></asp:Label>
                                    <eo:AJAXPostedFileList ID="AJAXPostedFileList1" runat="server">
                                    </eo:AJAXPostedFileList>
                                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3632;&#3618;&#3632;&#3648;&#3623;&#3621;&#3634; (&#3594;&#3633;&#3656;&#3623;&#3650;&#3617;&#3591;) :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtDuration" runat="server" Height="18px" MaxLength="2" 
                                        Width="50px" TextMode="SingleLine" 
                                       onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3619;&#3632;&#3618;&#3632;&#3648;&#3623;&#3621;&#3634;&#3651;&#3609;&#3585;&#3634;&#3619;&#3629;&#3610;&#3619;&#3617;</div>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3634;&#3588;&#3634; (&#3610;&#3634;&#3607;) :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtPrice" runat="server" Height="18px" MaxLength="5" 
                                        Width="50px" TextMode="SingleLine" 
                                       onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3619;&#3634;&#3588;&#3634;&#3605;&#3621;&#3629;&#3604;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;</div>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
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
                                <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" style="cursor:pointer" 
                                    BorderColor="Black" BorderStyle="Solid" 
                                    Text="&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;" 
                                    onclientclick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;');" />
                                &nbsp;</td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        </table>
                </asp:Panel>
    <asp:Panel ID="PAddType" runat="server">
                <table border="0" cellpadding="2" cellspacing="2" width="98%" id="tAddType" 
                    style="display: none" >
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3594;&#3639;&#3656;&#3629;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtTypeCourse" runat="server" Height="18px" MaxLength="30" 
                                        Width="200px" TextMode="SingleLine" ></asp:TextBox>
                                    *<div align="left">
                                        &#3619;&#3632;&#3610;&#3640;&#3594;&#3639;&#3656;&#3629;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;</div>
                                </div>
                            </td>
                            <td width="33%">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="25%">
                                <div align="right">
                                    &#3619;&#3634;&#3618;&#3621;&#3632;&#3648;&#3629;&#3637;&#3618;&#3604;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656; :
                                </div>
                            </td>
                            <td width="42%">
                                <div align="left">
                                    <asp:TextBox ID="txtDetailType" runat="server" Height="80px" MaxLength="300" 
                                        Width="90%" TextMode="MultiLine" ></asp:TextBox>
                                    </div>
                            </td>
                            <td width="33%">
                                <div align="left">
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
                                <asp:Button ID="btnSubmitType" runat="server" BackColor="#FFFF66" style="cursor:pointer"
                                    BorderColor="Black" BorderStyle="Solid" Text="&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;" OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;&#3627;&#3617;&#3623;&#3604;&#3627;&#3617;&#3641;&#3656;&#3627;&#3621;&#3633;&#3585;&#3626;&#3641;&#3605;&#3619;');" />
                                &nbsp;</td>
                            <td width="33%">
                                
                            </td>
                        </tr>
                        </table>
                </asp:Panel>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
      </ContentTemplate>
          <Triggers>
              <asp:AsyncPostBackTrigger ControlID="AJAXUploader1" EventName="FileUploaded" />
          </Triggers>
      </asp:UpdatePanel>
    
</div>

</asp:Content>


