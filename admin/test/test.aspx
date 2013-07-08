<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="admin_test_test" %>

<%@ Register assembly="EO.Web" namespace="EO.Web" tagprefix="eo" %>
<%@ Register src="showTab.ascx" tagname="showTab" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test</title>
    <script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
  <script>
      $(function() {
          $(document).tooltip();
      });
  </script>

    <script language="javascript" type="text/javascript">
// <!CDATA[

        function check_idcard(idcard) {
            if (idcard.value == "") { return false; }
            if (idcard.length < 13) { return false; }

            var num = str_split(idcard); // function เพิ่มเติม
            var sum = 0;
            var total = 0;
            var digi = 13;

            for (i = 0; i < 12; i++) {
                sum = sum + (num[i] * digi);
                digi--;
            }
            total = ((11 - (sum % 11)) % 10);

            if (total == num[12]) { //	alert('รหัสหมายเลขประจำตัวประชาชนถูกต้อง');
                return true;
            } else { //	alert('รหัสหมายเลขประจำตัวประชาชนไม่ถูกต้อง');
                return false;
            }
        }


        function str_split(f_string, f_split_length) {
            f_string += '';
            if (f_split_length == undefined) {
                f_split_length = 1;
            }
            if (f_split_length > 0) {
                var result = [];
                while (f_string.length > f_split_length) {
                    result[result.length] = f_string.substring(0, f_split_length);
                    f_string = f_string.substring(f_split_length);
                }
                result[result.length] = f_string;
                return result;
            }
            return false;
        }

        function id_card(id) {
            if (check_idcard(id.value)) {
                alert("ID Card Completed.");
            } else {
                alert("ID Card Error ?\nPlease Tye Again");
                id.value = "";
                id.focus();
            }
        }

// ]]>
    </script>
    
    <script type="text/javascript">

        $(document).ready(function() {
            $('#btnAdd').click(function() {
                var txt = $('#txtAdd').val();
                $('select[id$=DropDownList1]').append($('<option></option>').val(txt).html(txt));
            });

            $('label[for*=GridView1]').hide();

            $('#chkAll').click(function() {
                var chk = $(this).attr('checked');
                if (chk == true) {
                    $('input[id*=chkCourseId]').attr('checked', true);
                }
                else {
                    $('input[id*=chkCourseId]').attr('checked', false);
                }
            });

            $('input[type=checkbox]').click(function() {
                var chk = $(this).attr('checked');
                if (chk == true) {
                    var cf = confirm('จิงนะเว้ย');
                    if (cf) {
                        $(this).attr('checked', true);
                        var id = $(this).attr('id');
                        var lbl = $('label[for=' + id + ']').html();
                        if (lbl != null) $('#test').html(lbl);
                    }
                    else {
                        $(this).attr('checked', false);
                    }
                }
                else {
                    $(this).attr('checked', false);
                }
            });
        });
        </script>   
</head>
<body>
    <form id="form1" runat="server">
    <input name="id_card_txt" type="text" id="id_card_txt" onkeypress="if (event.keyCode < 48 || event.keyCode > 57 ){event.returnValue = false;}" maxlength="13" />
<input type="submit" name="Submit" value="Check id card" onclick="id_card(document.getElementById('id_card_txt'))" />
   <p><input id="txtAdd" type="text" /><input id="btnAdd" type="button" 
            value="button" /></p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
                </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Class_Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField HeaderText="Class_Id" InsertVisible="False" 
                SortExpression="Class_Id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Class_Id") %>'></asp:Label>
                </EditItemTemplate>
                <HeaderTemplate>
                    <input id="chkAll" type="checkbox" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblClassd" runat="server" Text='<%# Bind("Class_Id") %>'></asp:Label>
                    +<asp:CheckBox ID="chkCourseId" runat="server" 
                        Text='<%# Bind("Course_Id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Class_Start" SortExpression="Class_Start">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Class_Start") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Class_Start") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Class_End" HeaderText="Class_End" 
                SortExpression="Class_End" />
            <asp:BoundField DataField="Class_Min" HeaderText="Class_Min" 
                SortExpression="Class_Min" />
            <asp:BoundField DataField="Class_Max" HeaderText="Class_Max" 
                SortExpression="Class_Max" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConString %>" 
        SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
<label id="test" title="สาดดดดด">TestSaddd</label><asp:SiteMapDataSource ID="SiteMapDataSource1" 
        runat="server" />
</form>
    </body>
</html>
