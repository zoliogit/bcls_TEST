<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="Active_testsessiondetails.aspx.cs" Inherits="active_testsessiondetails" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>activetest-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you wants to delete this Session?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        
            function Confirm_archive() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Archive the session, confirm?")) {
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
        .style2
        {
            width: 202px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ACTIVE SESSION DETAILS" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="font-family: Arial; height: 100%;">
        <table class="style1" style="display: inline-table;" align="center">
            <tr>
                <td class="styleCC" align="center" bgcolor="White">
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                        DataKeyNames="testsession_id" OnRowCommand="GridView1_RowCommand" ForeColor="#333333"
                        OnRowDataBound="GridView1_RowDataBound" CellSpacing="2" Width="809px">
                        <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="testsession_id" ItemStyle-HorizontalAlign="Center" HeaderText="Session ID"
                                HeaderStyle-BackColor="#98272d" InsertVisible="False" ReadOnly="True" SortExpression="testsession_id">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="admin_id" ItemStyle-HorizontalAlign="Center" HeaderText="Created by"
                                HeaderStyle-BackColor="#98272d" SortExpression="admin_id">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="chiefinstructor_name" ItemStyle-HorizontalAlign="left"
                                HeaderText="Chief Instructor" HeaderStyle-BackColor="#98272d" SortExpression="chiefinstructor_name">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="test_date" ItemStyle-HorizontalAlign="Center" HeaderText="Scheduled Date"
                                HeaderStyle-BackColor="#98272d" SortExpression="testsession_name">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="student_id" ItemStyle-HorizontalAlign="Center" HeaderText="No.of Students"
                                HeaderStyle-BackColor="#98272d" InsertVisible="False" ReadOnly="True" SortExpression="student_id">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="testsession_status" ItemStyle-HorizontalAlign="Center"
                                HeaderText="Test Status" HeaderStyle-BackColor="#98272d" SortExpression="testsession_status">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False" HeaderText="View" HeaderStyle-BackColor="#98272d">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" CausesValidation="false"
                                        CommandName="select" Text="View"></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Archive" HeaderStyle-BackColor="#98272d">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkdelete" OnClientClick="Confirm()" ForeColor="Black" runat="server"
                                        CommandName="DELETE" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                                    <asp:LinkButton ID="lnkarchive" OnClientClick="Confirm_archive()" Visible="false"
                                        ForeColor="Black" CommandName="ARCHIVE" runat="server">Archive</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    <br />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
