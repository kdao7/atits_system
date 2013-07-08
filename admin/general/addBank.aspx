<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="addBank.aspx.vb" Inherits="admin_general_addBank" title="ATIT ::: Add Bank Tranfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
    function clearText() {
        $('input[type="text"]').val('');
    }
    function showUpdate() {
        $('#active').fadeIn(100);
        $('#active').fadeOut(4000);
    }

        function pageEvent() {
            
    }
</script>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ContentPlaceHolder1">
    <div id="content">
    <h1>&#3648;&#3614;&#3636;&#3656;&#3617;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3651;&#3609;&#3585;&#3634;&#3619;&#3650;&#3629;&#3609;&#3648;&#3591;&#3636;&#3609; (add bank tranfer)</h1>
     <blockquote>
     
        <asp:UpdatePanel ID="UpBank" runat="server">
        <ContentTemplate>
        <script type="text/javascript">
            Sys.Application.add_load(textStyle);
            Sys.Application.add_load(clearText);
            Sys.Application.add_load(showToolTip);
            Sys.Application.add_load(pageEvent);
            Sys.Application.add_load(tooltip);
      </script>
            <asp:Panel ID="pBank" runat="server">
                <table id="tAddClass" border="0" cellpadding="2" cellspacing="2" width="100%">
                    <tr>
                        <td width="20%">
                            &nbsp;</td>
                        <td width="47%">
                            &nbsp;</td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div align="right">
                                &#3608;&#3609;&#3634;&#3588;&#3634;&#3619; :
                            </div>
                        </td>
                        <td width="47%">
                            <div align="left">
                                <asp:DropDownList ID="ddlBankName" runat="server" 
                                    ToolTip="&#3588;&#3621;&#3636;&#3585;&#3648;&#3614;&#3639;&#3656;&#3629;&#3648;&#3621;&#3639;&#3629;&#3585;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;">
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3585;&#3619;&#3640;&#3591;&#3648;&#3607;&#3614;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3585;&#3619;&#3640;&#3591;&#3624;&#3619;&#3637;&#3629;&#3618;&#3640;&#3608;&#3618;&#3634;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3585;&#3626;&#3636;&#3585;&#3619;&#3652;&#3607;&#3618;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3648;&#3585;&#3637;&#3618;&#3619;&#3605;&#3636;&#3609;&#3634;&#3588;&#3636;&#3609;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3595;&#3637;&#3652;&#3629;&#3648;&#3629;&#3655;&#3617;&#3610;&#3637;&#3652;&#3607;&#3618;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3607;&#3627;&#3634;&#3619;&#3652;&#3607;&#3618;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3652;&#3607;&#3618;&#3614;&#3634;&#3603;&#3636;&#3594;&#3618;&#3660;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3608;&#3609;&#3594;&#3634;&#3605;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3618;&#3641;&#3650;&#3629;&#3610;&#3637;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3585;&#3619;&#3640;&#3591;&#3652;&#3607;&#3618;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3629;&#3629;&#3617;&#3626;&#3636;&#3609;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3629;&#3634;&#3588;&#3634;&#3619;&#3626;&#3591;&#3648;&#3588;&#3619;&#3634;&#3632;&#3627;&#3660;</asp:ListItem>
                                    <asp:ListItem>&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3629;&#3636;&#3626;&#3621;&#3634;&#3617;&#3649;&#3627;&#3656;&#3591;&#3611;&#3619;&#3632;&#3648;&#3607;&#3624;&#3652;&#3607;&#3618;</asp:ListItem>
                                </asp:DropDownList>
                                *
                            </div>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20%">
                            <div align="right">
                                &#3648;&#3621;&#3586;&#3607;&#3637;&#3656;&#3610;&#3633;&#3597;&#3594;&#3637; :
                            </div>
                        </td>
                        <td colspan="2" style="width: 80%" width="47%">
                            <div align="left">
                                <asp:TextBox ID="txtNumber" runat="server" Height="18px" MaxLength="10" 
                                    onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" 
                                    Width="100px"></asp:TextBox>
                                *<div align="left">
                                    &#3619;&#3632;&#3610;&#3640; &quot;&#3648;&#3621;&#3586;&#3607;&#3637;&#3656;&#3610;&#3633;&#3597;&#3594;&#3637;&quot; 10 &#3627;&#3621;&#3633;&#3585;</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <div align="right">
                                &#3594;&#3639;&#3656;&#3629;&#3610;&#3633;&#3597;&#3594;&#3637; :
                            </div>
                        </td>
                        <td width="42%">
                            <div align="left">
                                <asp:TextBox ID="txtAccName" runat="server" Height="18px" MaxLength="50" 
                                    Width="150px" onkeypress="if(event.keyCode<48 || event.keyCode>57) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                                *<div align="left">
                                    &#3619;&#3632;&#3610;&#3640; &quot;&#3594;&#3639;&#3656;&#3629;&#3610;&#3633;&#3597;&#3594;&#3637;&quot; &#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;</div>
                            </div>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <div align="right">
                                &#3626;&#3634;&#3586;&#3634; :
                            </div>
                        </td>
                        <td width="42%">
                            <div align="left">
                                <asp:TextBox ID="txtBranch" runat="server" Height="18px" MaxLength="40" 
                                    Width="150px" onkeypress="if(event.keyCode<48 || event.keyCode>57) {event.returnValue=true;} else{event.returnValue=false;}"></asp:TextBox>
                                <div align="left">
                                    &#3619;&#3632;&#3610;&#3640;&#3594;&#3639;&#3656;&#3629; &quot;&#3626;&#3634;&#3586;&#3634;&quot; &#3586;&#3629;&#3591;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3607;&#3637;&#3656;&#3607;&#3656;&#3634;&#3609;&#3605;&#3657;&#3629;&#3591;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;</div>
                            </div>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="25%">
                            <div align="right">
                                &nbsp;</div>
                        </td>
                        <td colspan="2" style="width: 75%" width="42%">
                            <div>
                            <div align="left">
                                    <div id="active" style="display: none; color: #0066CC;">
                                        &#3648;&#3614;&#3636;&#3656;&#3617;&#3586;&#3657;&#3629;&#3617;&#3641;&#3621;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;&#3649;&#3621;&#3657;&#3623;</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td width="25%">
                            &nbsp;</td>
                        <td align="center" width="42%">
                            <asp:Button ID="btnSubmitAdd" runat="server" BackColor="#FFFF66" 
                                BorderColor="Black" BorderStyle="Solid" 
                                OnClientClick="return confirm('&#3618;&#3639;&#3609;&#3618;&#3633;&#3609;&#3585;&#3634;&#3619;&#3648;&#3614;&#3636;&#3656;&#3617;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;');" 
                                PostBackUrl="~/admin/general/addBank.aspx" style="cursor:pointer" 
                                Text="&#3605;&#3585;&#3621;&#3591;" />
                            &nbsp;
                        </td>
                        <td width="33%">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
                CellPadding="4" DataKeyNames="B_Id" DataSourceID="bank" Width="95%">
                <RowStyle BackColor="White" BorderColor="#FFCC00" ForeColor="Black" 
                    HorizontalAlign="Left" VerticalAlign="Middle" />
                <EmptyDataRowStyle BackColor="#FFFF66" />
                <Columns>
                    <asp:BoundField DataField="B_Name" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3608;&#3609;&#3634;&#3588;&#3634;&#3619;" 
                        SortExpression="B_Name" />
                    <asp:TemplateField HeaderText="&#3648;&#3621;&#3586;&#3607;&#3637;&#3656;&#3610;&#3633;&#3597;&#3594;&#3637;" SortExpression="B_Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("B_Number") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAccNum" runat="server" Text='<%# Bind("B_Number") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="B_Acc" HeaderText="&#3594;&#3639;&#3656;&#3629;&#3610;&#3633;&#3597;&#3594;&#3637;" SortExpression="B_Acc">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:BoundField DataField="B_Branch" HeaderText="&#3626;&#3634;&#3586;&#3634;" 
                        SortExpression="B_Branch" />
                </Columns>
                <FooterStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                    ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <HeaderStyle BackColor="#FFCC00" BorderColor="#FFCC00" Font-Bold="True" 
                    ForeColor="#FFFFCC" />
            </asp:GridView>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
        </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSubmitAdd" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
     
         <br />
         <asp:SqlDataSource ID="bank" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ConString %>" 
             SelectCommand="SELECT * FROM [Bank] ORDER BY [B_Id] DESC">
         </asp:SqlDataSource>
      </blockquote>
     
    </div>

</asp:Content>


