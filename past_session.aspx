<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="past_session.aspx.cs" Inherits="past_session" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>PastSessions-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">

        
            function Confirm_archive() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("un-Archive the session, confirm?")) {
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
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="PAST SESSION DETAILS" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <br />
                        <br />
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                            DataKeyNames="testsession_id" ForeColor="#333333" CellSpacing="2" Width="809px"
                            OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                            <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="admin_id" ItemStyle-HorizontalAlign="Center" HeaderText="Created by"
                                    HeaderStyle-BackColor="#98272d" SortExpression="admin_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="chiefinstructor_name" ItemStyle-HorizontalAlign="Center"
                                    HeaderText="Chief Instructor" HeaderStyle-BackColor="#98272d" SortExpression="chiefinstructor_name">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="test_date" ItemStyle-HorizontalAlign="Center" HeaderText="Scheduled Date"
                                    HeaderStyle-BackColor="#98272d" SortExpression="testsession_name">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="testsession_id" ItemStyle-HorizontalAlign="Center" HeaderText="Session ID"
                                    HeaderStyle-BackColor="#98272d" InsertVisible="False" ReadOnly="True" SortExpression="testsession_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
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
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Un-Archive" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkarchive" OnClientClick="Confirm_archive()" ForeColor="Black"
                                            CommandName="un-ARCHIVE" runat="server">Un-Archive</asp:LinkButton>
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
                         <asp:Label ID="Labe32" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
        Text="If you require past data please contact admin" Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
