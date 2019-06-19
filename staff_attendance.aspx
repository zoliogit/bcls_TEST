<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="staff_attendance.aspx.cs" Inherits="staff_attendance" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>StaffAttendance-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
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
            margin-top: auto;
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
            width: 315px;
        }
        .style3
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ATTENDANCE REPORT" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <asp:Label ID="Label5" runat="server" Font-Size="Larger" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                            ForeColor="#333333" CellSpacing="2" Width="809px" OnRowDataBound="GridView1_RowDataBound">
                            <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="test_date" ItemStyle-HorizontalAlign="Center" HeaderText="Test Date (DD-MM-YYYY)"
                                    HeaderStyle-BackColor="#98272d" SortExpression="date">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
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
            </table>
        </div>
    </body>
</asp:Content>
