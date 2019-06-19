<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="student_passed_NRIC_search.aspx.cs" Inherits="student_passed_NRIC_search" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Passed_students_searchNRIC-BCLS </title>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="Passed Students Details" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        </br> </br>
                        <p>
                            Enter Student-NRIC :  
                            <asp:Panel ID="Panel_txt" runat="server" DefaultButton="btnSearch">
                            <asp:TextBox ID="txtSearch" runat="server" />&nbsp;
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtSearch" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                           
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />&nbsp;
                            </asp:Panel>
                            
                            <br />
                            <br />
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                                ForeColor="#333333" CellSpacing="2" Width="859px" Caption='Passed Students' CaptionAlign="Top"
                                OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound1">
                                <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                                <Columns>
                                    <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <%# ((GridViewRow)Container).RowIndex + 1%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                                    <asp:BoundField DataField="date_of_pass" ItemStyle-HorizontalAlign="Center" HeaderText="Passed Date"
                                        HeaderStyle-BackColor="#98272d" SortExpression="date_of_pass">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="true" HeaderText="Certificates" HeaderStyle-BackColor="#98272d"
                                        ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lb_certificate" runat="server" ForeColor="Black" CausesValidation="false"
                                                CommandName="certificates" Text="Certificate"></asp:LinkButton>
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
                        </p>
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
