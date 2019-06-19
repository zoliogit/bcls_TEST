<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CI_Report.aspx.cs" Inherits="CI_Report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>CI-Report</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
    
         function Confirm1() {
             var confirm_value = document.createElement("INPUT");
             confirm_value.type = "hidden";
             confirm_value.name = "confirm_value";
             if (confirm("This will close the session.  For any further operation on this session, Direcotr/Asst Direcor will have to open the session. Proceed to close?")) {
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
            width: 134%;
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
        .style6
        {
            width: 153px;
        }
        .style11
        {
        }
        .style12
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 5px;
        }
        body, html
        {
            height: 100%;
            width: 100%;
        }
        #right
        {
            height: 100%;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <div style="font-family: Arial; height: 100%;">
        <table style="display: inline-table;" class="style1">
            <tr>
                <td bgcolor="White" valign="top" class="style6" rowspan="4">
                    <div style="background-color: White; width: 237px; height: 89px; margin-top: 0px;"
                        align="center">
                        <br />
                        <img alt="" src="images/NPHSlogoTransparentBig.png" style="width: 220px; height: 42px;
                            background-position: center; margin-top: 23;" /><br />
                    </div>
                    <div style="height: 3px; width: 237px; background-color: #98272d">
                    </div>
                </td>
                <td class="styleAA" align="center" style="background-image: url(images/navigationBar.png)">
                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="XX-Large" Font-Strikeout="False"
                        ForeColor="#F9FAFA" Text="CPRact" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style12" bgcolor="#efa237">
                    <asp:Label ID="lb_welcome" runat="server" Text="Label" Font-Bold="False" Style="margin-left: 8px"
                        ForeColor="Black" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#F7F6F3" class="style11">
                </br>
                    <asp:ImageButton ID="Button4" runat="server"  CausesValidation="False"
                        Height="35px" Width="200px" ImageUrl="~/images/BackToStudentListBtn.png" OnClick="Button4_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Chief Instructor's Report" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="White" class="style11">
                    <asp:Label ID="Label23" runat="server" ForeColor="Black" Text="Chief Instructor"
                        Style="margin-left: 10px"></asp:Label>&nbsp;<asp:Label ID="v_chief_name" runat="server"
                            ForeColor="Black" Style="margin-right: 10px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Date"></asp:Label>&nbsp;<asp:Label
                        ID="v_date" runat="server" ForeColor="Black"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" ForeColor="Black" Style="margin-left: 10px"
                        Text="Test Session ID"></asp:Label>
                    &nbsp;<asp:Label ID="v_testid" runat="server" Font-Bold="False" ForeColor="Black"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div align="center">
            <div>
                <table class="style1" style="display: inline-table;" align="center">
                    <tr>
                        <td class="styleCC" align="center" bgcolor="White">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                                ForeColor="#333333" CellSpacing="2" Width="859px" OnRowDataBound="GridView1_RowDataBound">
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
                                    <asp:BoundField DataField="test_date" ItemStyle-HorizontalAlign="Center" HeaderText="Scheduled Date"
                                        HeaderStyle-BackColor="#98272d" SortExpression="test_date">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
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
                                    <asp:TemplateField HeaderText="Reason for follow up" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows="3" MaxLength="10" Text='<%# Bind("reason_for_follow_up") %>'
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox1"
                                                ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="rq1" ErrorMessage="Required" ControlToValidate="TextBox1"
                                                runat="server"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks/ Arrangements/ Logistics" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox2" TextMode="MultiLine" Rows="3" MaxLength="10" Text='<%# Bind("logistics") %>'
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                                                ControlToValidate="TextBox2" ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$"
                                                ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="rq2" ErrorMessage="Required" ControlToValidate="TextBox2"
                                                runat="server"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Instructions for students" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox3" TextMode="MultiLine" Rows="3" MaxLength="10" Text='<%# Bind("instruction_for_students") %>'
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                                                ControlToValidate="TextBox3" ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$"
                                                ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="rq3" ErrorMessage="Required" ControlToValidate="TextBox3"
                                                runat="server"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comments on followup by CI" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <asp:TextBox ID="TextBox4" TextMode="MultiLine" Rows="3" MaxLength="10" Text='<%# Bind("comments_by_CI") %>'
                                                runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server"
                                                ControlToValidate="TextBox4" ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$"
                                                ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="rq4" ErrorMessage="Required" ControlToValidate="TextBox4"
                                                runat="server"></asp:RequiredFieldValidator>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Owner" HeaderStyle-BackColor="#98272d">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddl1" AppendDataBoundItems="true" runat="server">
                                                <asp:ListItem Text="--Select One--" Value="" />
                                            </asp:DropDownList>
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
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <br />
                <asp:ImageButton ID="bt_Save" runat="server" ImageUrl="~/images/BtnSave.png" 
                    Style="margin-top: 20px"  Width="145px" Height="48px" OnClick="bt_Save_Click" />
                &nbsp;
                <asp:ImageButton ID="img_completesession" OnClientClick="Confirm1();" OnClick="img_completesession_Click"
                    Width="145px" Height="48px" ImageUrl="~/images/BtnSessionComplete.png" Style="margin-top: 20px"
                    runat="server" />
            </div>
        </div>
    </div>
    </form>
</body>
</html>
