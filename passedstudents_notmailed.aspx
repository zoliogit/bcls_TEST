<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="passedstudents_notmailed.aspx.cs" Inherits="passedstudents_notmailed"
    Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Passed_students-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <script type="text/javascript">
   function Confirm3() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            
               if (confirm("Are you sure you want to send the certificates by email to all the above students?"))
            
          {     confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
        
       
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            // var stid = document.getElementById("GridView1");
            if (confirm("Are you sure you want to send the certificate by email to this student?")) {
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
        Text="Passed Students Details" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <br></br>
                        <br></br>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                            ForeColor="#333333" CellSpacing="2" Width="859px" Caption='Passed Students Not Mailed'
                            CaptionAlign="Top" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound1">
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
                                <asp:TemplateField ShowHeader="true" HeaderText="Send Mail" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb_mail" runat="server" ForeColor="Black" CausesValidation="false"
                                            Text="Mail" CommandName="mail_certificate" CommandArgument='<%#Eval("student_id")%>' OnClientClick="Confirm()" > </asp:LinkButton>
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
                      <%--<asp:Button ID="bt_mailall" runat="server" Width="130px" Style="margin-top: 20px"
                            Height="32px" Text="Email All" onclick="bt_mailall_Click" ></asp:Button>--%>
                        <asp:ImageButton ID="bt_mailall" runat="server"  Width="145px" Height="48px" Style="margin-top: 20px"
                             ImageUrl="~/images/BtnEmail.png" OnClick="bt_mailall_Click" OnClientClick="Confirm3()" />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </body>
    </td> </tr>
</asp:Content>
