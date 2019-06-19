<%@ Page Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" CodeFile="NSL_Add_Edit_PracticalGroup_v2_1.aspx.cs" Inherits="NSL_Add_Edit_PracticalGroup_v2_1" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Edit PGroup - NSL V2.1 </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
       <script type="text/javascript">
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to remove this Prcatical Group?")) {
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
            width: 689px;
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
        .style70
        {
            height: 31px;
        }
        .style71
        {
            width: 349px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ADD/REMOVE PRACTICAL GROUP" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <table class="style1" style="display: inline-table;" align="center">
            <tr>
                <td align="center" bgcolor="White" class="styleCC">
                    
                    <table class="center" cellspacing="1" cellpadding="3" frame="box" align="center">
                        <tr>
                            <td align="center" class="style70" colspan="3">
                                <asp:Label ID="Label1" runat="server" Style="margin-right: 8px;" Text="NPNet UserID :"></asp:Label>
                              <asp:Label ID="lb_staffid" runat="server" Height="22px" 
                                    Width="100px" ForeColor="Black"></asp:Label >
                            </td>
                        </tr>
                       
                        <tr>
                            <td align="center" class="style70" colspan="3">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            CellSpacing="1" Style="margin-left: 0px; top: 319px;
                            left: 532px; width: 400px;" ForeColor="#333333" GridLines="Both" Height="186px"
                            OnRowDataBound="GridView1_RowDataBound" Width="697px" OnRowCommand="GridView1_RowCommand">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                               
                                <asp:BoundField DataField="p_group_name" HeaderText="Practical Group" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="p_group_name">
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                              
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="Remove Practical Group">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkremove" ForeColor="Black" runat="server" OnClientClick="Confirm()" OnClick="lnkremove_Click">Remove</asp:LinkButton>
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
                        </asp:GridView></td>
                        </tr>
                        <tr>
                            <td align="right" class="style71" >
                                <asp:Label ID="Label4" runat="server" 
                                    Text="Select Practical Group"></asp:Label></br>
                                      <asp:Label ID="Label2" runat="server" 
                                    Text="(Use CTRL for multiple selection)"></asp:Label>
                                    
                                    
                            </td>
                            <td align="left">
                                <asp:ListBox ID="lb_p_group" SelectionMode="Multiple" runat="server" Style="margin-left: 8px;"
                                    BackColor="White" ForeColor="Black" Height="92px" Width="99px"></asp:ListBox>
                                </td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center" >
                               
                                <asp:ImageButton ID="bt_add" runat="server" Width="145px" Height="48px" Style="margin-top: 20px"
                                    ImageUrl="~/images/addBtn.png" OnClick="bt_add_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

