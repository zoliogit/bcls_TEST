<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="finalised_student_for_test.aspx.cs" Inherits="finalised_student_for_test" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>FinalisedStudent</title>
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
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="FINALISED STUDENT LIST" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1">
                <tr bgcolor="White">
                    <td bgcolor="White" align="left" class="styleCC">
                        <asp:Label ID="Label19" runat="server" Font-Bold="False" Font-Size="Medium" Style="margin-left: 10px"
                            ForeColor="Black" Text="Chief Instructor:"></asp:Label>
                        <asp:Label ID="lb_chief" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                    </td>
                    <td bgcolor="White" align="left" class="styleCC">
                        <asp:Label ID="Label10" runat="server" Font-Bold="False" Font-Size="Medium" Style="margin-left: 25px"
                            ForeColor="Black" Text="Date:"></asp:Label>
                        <asp:Label ID="lb_date" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="White" class="styleCC" colspan="2">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="student_id"
                            Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;" CellPadding="2"
                            CellSpacing="2" ForeColor="#333333" GridLines="Both" Height="38px" Width="946px"
                            OnRowDataBound="GridView1_RowDataBound">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="Serial No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="student_name" HeaderText="Student Name" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_name">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_id" HeaderText="StudentID" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_id" ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_nric" HeaderText="Student NRIC" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_nric">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_group" HeaderText="Student Group" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_group">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="true" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center"
                                    HeaderText="Theory">
                                    <ItemTemplate>
                                        <asp:Label ID="TextBox2" Text='Exempted' runat="server"></asp:Label>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" Checked='<%# Bind("theory") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="true" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="Practical">
                                    <ItemTemplate>
                                        <asp:Label ID="TextBox3" Text='Exempted' runat="server"></asp:Label>
                                        <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" Checked='<%# Bind("practical") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
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
