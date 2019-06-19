<%@ Page Title="" Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" CodeFile="NSL_StaffDetails_v1_1.aspx.cs" Inherits="NSL_StaffDetails_V1_1" %>


<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>staffdetails-NSL V1.1</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <script type="text/javascript">
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to delete this Staff?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        
        </script>
    <style type="text/css">
        .center
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style1
        {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            margin: 0;
            padding: 0;
        }
        .styleBB
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 1px;
        }
        .styleAA
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 24px;
        }
        .styleCC
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 24px;
        }
        .styleDD
        {
            width: 217px;
        }
        .styleGG
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 477px;
        }
        .GridPosition
        {
            position: absolute;
            left: 350px;
            right: 103px;
            top: 182px;
            height: 200px;
            width: 886px;
        }
        .style19
        {
            width: 253px;
        }
        .style20
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 408px;
        }
    </style>

    <script type="text/javascript">
function ConfirmationBox(username) {

var result = confirm('Are you sure you want to delete '+username+' Details' );
if (result) {

return true;
}
else {
return false;
}
}
    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label13" runat="server" Font-Size="X-Large" ForeColor="Black" Text="STAFF DETAILS"
        Font-Names="Arial" Font-Bold="False"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" align="center">
                <tr>
                    <td align="center" class="styleCC">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            DataKeyNames="staff_id" CellSpacing="2" Style="margin-left: 0px; top: 319px;
                            left: 532px; width: 769px;" ForeColor="#333333" GridLines="Both" Height="186px"
                            OnRowDataBound="GridView1_RowDataBound" Width="697px" OnRowCommand="GridView1_RowCommand">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                             <%--   <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:BoundField DataField="staff_id" HeaderText="NPNetID" ItemStyle-HorizontalAlign="Left"
                                    ReadOnly="True" HeaderStyle-BackColor="#98272d" SortExpression="staff_id">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="staff_name" HeaderText="Name" HeaderStyle-HorizontalAlign="Center"
                                    ItemStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#98272d" SortExpression="staff_name">
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="staff_role" HeaderText="Role" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="staff_role">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                          <%--      <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="NPStaff">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%# Bind("NPstaff") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>--%>
                                   <asp:BoundField DataField="p_group_name" HeaderText="Practical Group" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="p_group_name">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                
                                
                                 <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="Add/Remove Practical Group">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnk_p_group" ForeColor="Black" CausesValidation="false"  OnClick="lnkedit_Click"
                                        runat="server" >Edit</asp:LinkButton>
                                    </ItemTemplate>
                                   <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                               
                                
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="Delete Staff ">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkdelete" ForeColor="Black" runat="server" OnClientClick="Confirm()" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                               
                           
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="White" align="center" class="styleCC">
                        <br />
                        &nbsp;
                        <asp:ImageButton ID="Button1" runat="server"  Style="margin-top: 20px"
                            Width="145px" Height="48px" ImageUrl="~/images/BtnAddNewStaff.png" OnClick="Button1_Click"
                            CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>



