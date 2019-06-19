<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="follow_up.aspx.cs" Inherits="follow_up" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>followup_students-BCLS </title>
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
        .style3
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="Tasks To Do" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                            ForeColor="#333333" CellSpacing="2" Width="859px" OnRowDataBound="GridView1_RowDataBound"
                            OnRowCommand="GridView1_RowCommand">
                            <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                            <Columns>
                                <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="testsession_id" ItemStyle-HorizontalAlign="Center" HeaderText="Test ID"
                                    HeaderStyle-BackColor="#98272d" SortExpression="testsession_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_name" ItemStyle-HorizontalAlign="Center" HeaderText="StudentName"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_name">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_id" ItemStyle-HorizontalAlign="Center" HeaderText="Student_ID"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_nric" ItemStyle-HorizontalAlign="Center" HeaderText="Student_NRIC"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_nric">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_group" ItemStyle-HorizontalAlign="Center" HeaderText="Group"
                                    HeaderStyle-BackColor="#98272d" InsertVisible="False" ReadOnly="True" SortExpression="student_group">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="true" HeaderText="Scheduled Date" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb_date" runat="server" ForeColor="Black" CausesValidation="false"
                                            CommandName="select_date" Text='<%#Eval("test_date")%>' HeaderText="Date"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="140px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="test_vs_student_status" ItemStyle-HorizontalAlign="Center"
                                    HeaderText="Theory Status" HeaderStyle-BackColor="#98272d" SortExpression="test_vs_student_status">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="true" HeaderText="Practical Status" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="label_practical_status" runat="server" ForeColor="Black" ItemStyle-HorizontalAlign="left"
                                            CausesValidation="false"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="140px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="reason_for_follow_up" ItemStyle-HorizontalAlign="Center"
                                    HeaderText="Reason for FollowUp" HeaderStyle-BackColor="#98272d" SortExpression="reason_for_follow_up">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="logistics" ItemStyle-HorizontalAlign="Center" HeaderText="Remarks/Arrangements/Logistics"
                                    HeaderStyle-BackColor="#98272d" SortExpression="logistics">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="instruction_for_students" ItemStyle-HorizontalAlign="Center"
                                    HeaderText="Instructions for students" HeaderStyle-BackColor="#98272d" SortExpression="instruction_for_students">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="comments_by_CI" ItemStyle-HorizontalAlign="Center" HeaderText="Comments on followup by CI"
                                    HeaderStyle-BackColor="#98272d" SortExpression="comments_by_CI">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Owner" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <asp:Label ID="label_chief" Text='<%#Eval("responsible_CI")%>' runat="server"></asp:Label>
                                    </ItemTemplate>
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
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
