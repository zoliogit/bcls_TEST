<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="insert_student_test.aspx.cs" Inherits="insert_student_test" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>insertstudent-BCLS</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/Javascript">
function ToggleEnable(src)
{

 if(confirm('Are you sure you want to update this task?'))
 {

    src.disabled =  true;
 }
 else
 {
   src.disabled = false;
 }
}
    </script>

    <style type="text/css">
        .center
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            width: 611px;
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
        .style1
        {
            width: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }
        .gridlinecolor
        {
            border-top: 1px solid red;
            border-bottom: 1px solid red;
        }
        #form1
        {
            height: 767px;
        }
        .style48
        {
            height: 41px;
        }
        .style50
        {
            height: 26px;
        }
        .style51
        {
            height: 69px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="Select Students for Session"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" align="center">
           
                <tr>
                    <td class="styleCC" bgcolor="White">
                        &nbsp;<asp:Label ID="Label19" runat="server" Font-Bold="False" Font-Size="Medium"
                            Style="margin-left: 10px" ForeColor="Black" Text="Chief Instructor:"></asp:Label>&nbsp;<asp:Label
                                ID="lb_chief" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                    </td>
                    <td class="styleCC" bgcolor="White">
                        <asp:Label ID="Label10" runat="server" Font-Bold="False" Font-Size="Medium" Style="margin-left: 40px"
                            ForeColor="Black" Text="Date:"></asp:Label>
                        <asp:Label ID="lb_insert_date" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#A1B5DC">
                    <td bgcolor="White" class="styleCC" align="center" colspan="2">
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Style="margin-left: 0px;
                            top: 319px; left: 532px; width: 769px;" CellPadding="2" CellSpacing="2" ForeColor="#333333"
                            GridLines="Both" DataKeyNames="student_id" Height="39px" Width="791px" OnRowDataBound="GridView2_RowDataBound"
                            OnRowCommand="GridView2_RowCommand">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="Serial No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="student_id" HeaderStyle-BackColor="#98272d" HeaderText="Student ID"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="student_id" ReadOnly="True">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_name" HeaderText="Student Name" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_name">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_nric" HeaderStyle-BackColor="#98272d" HeaderText="Student NRIC"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="student_nric">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_group" HeaderStyle-BackColor="#98272d" HeaderText="Student Group"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="student_group">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Theory Test" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox AutoPostBack="true" Checked="true" ID="CheckBoxTheory" OnCheckedChanged="CheckBoxTheory_Checked"
                                            runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Practical Test" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:CheckBox Checked="true" AutoPostBack="true" ID="CheckBoxPractical" OnCheckedChanged="CheckBoxPractical_Checked"
                                            runat="server" />
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
                <tr>
                    <td class="style48" align="center" bgcolor="White" colspan="2">
                        <table class="center" align="center">
                            <tr>
                                <td align="right" bgcolor="White">
                                    <asp:Label ID="Label21" runat="server" Font-Bold="False" ForeColor="Black" Text="Add another groups  (Select the group)"></asp:Label>
                                </td>
                                <td align="left" bgcolor="White">
                                    <asp:ListBox ID="ListBox1" SelectionMode="Multiple" runat="server" Style="margin-left: 8px;"
                                        BackColor="White" ForeColor="Black" Height="68px" Width="125px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
                                    </asp:ListBox>
                                    <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="Black" OnClick="LinkButton4_Click"
                                        CausesValidation="False">Add</asp:LinkButton>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" bgcolor="White">
                                    <asp:Label ID="Label17" runat="server" Font-Bold="False" ForeColor="Black" Text="Add new student "></asp:Label>
                                </td>
                                <td align="left" bgcolor="White">
                                 <asp:Panel ID="Panel_txt" runat="server" DefaultButton="LinkButton3">     
     
                                    <asp:TextBox ID="tb_test_student_id" runat="server" Style="margin-left: 8px;" onfocus="if (this.value == 'StudentID') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'StudentID';" value="StudentID" ForeColor="Black"
                                        BackColor="White" Height="21px" Width="120px"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="Black" OnClick="LinkButton3_Click"
                                        CausesValidation="False">Add</asp:LinkButton>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_test_student_id"
                                        ValidationExpression="^[a-zA-Z0-9\s]{1,40}$" ErrorMessage="Invalid name">
                                    </asp:RegularExpressionValidator>
                                    <br />
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50" align="right" bgcolor="White">
                                    <asp:Label ID="Label20" runat="server" Font-Bold="False" ForeColor="Black" Text="Add External Students "></asp:Label>
                                </td>
                                <td class="style50" align="left" bgcolor="White">
                                <asp:Panel ID="Panel1" runat="server" DefaultButton="lb_add_external_students">     
     
                                    <asp:TextBox ID="tb_studentnric" runat="server" Style="margin-left: 8px;" onfocus="if (this.value == 'StudentNRIC') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'StudentNRIC';" value="StudentNRIC"
                                        ForeColor="Black" BackColor="White" Height="21px" Width="120px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" InitialValue="StudentNRIC"
                                        ControlToValidate="tb_studentnric" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="tb_student_name" runat="server" onfocus="if (this.value == 'StudentName') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'StudentName';" value="StudentName"
                                        ForeColor="Black" BackColor="White" Height="21px" Width="120px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="StudentName"
                                        Display="Dynamic" ControlToValidate="tb_student_name" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:LinkButton ID="lb_add_external_students" runat="server" ForeColor="Black" OnClick="lb_add_external_students_Click">Add</asp:LinkButton>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tb_studentnric"
                                        ValidationExpression="^[a-zA-Z0-9\s]{1,40}$" ErrorMessage="Invalid nric">
                                    </asp:RegularExpressionValidator>&nbsp;<asp:RegularExpressionValidator ID="nameRegex"
                                        runat="server" ControlToValidate="tb_student_name" ValidationExpression="^[a-zA-Z0-9\s]{1,40}$"
                                        ErrorMessage="Invalid name">
                                    </asp:RegularExpressionValidator>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style51" align="center" colspan="2" bgcolor="White">
                                    <asp:ImageButton ID="bt_confirm" runat="server"  Style="margin-top: 20px"
                                         Width="145px" Height="48px" ImageUrl="~/images/BtnConfirmStudentList.png" OnClick="bt_confirm_Click"
                                        CausesValidation="False" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
