<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="edit_sessiondetails.aspx.cs" Inherits="edit_sessiondetails" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>edit session-BCLS</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <style type="text/css">
        .center
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            width: 610px;
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
        .style41
        {
            height: 192px;
        }
        .style43
        {
            height: 50px;
        }
        #form1
        {
            font-family: Arial;
        }
        .style44
        {
            height: 40px;
        }
        .style45
        {
            width: 309px;
        }
    </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div style="height: 1056px; font-family: Arial;">
            <table class="style1" bgcolor="White">
                <tr>
                    <td class="styleCC" colspan="2" bgcolor="#F7F6F3">
                        <asp:ImageButton ID="Button4" runat="server"  CausesValidation="False"
                            Height="35px" Width="200px" ImageUrl="~/images/BackToStudentListBtn.png" OnClick="Button4_Click" />
                            
                            
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                            Text="EDIT TEST SESSIONS" Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style43" bgcolor="White">
                        <br />
                        <br />
                        <table frame="box" class="center">
                            <tr>
                                <td align="right" class="style44">
                                    <asp:Label ID="Label13" runat="server" ForeColor="Black" Style="margin-right: 8px;
                                        margin-left: 8px;" Text="Test Session ID" Font-Bold="False"></asp:Label>
                                </td>
                                <td align="left" class="style44">
                                    <asp:Label ID="lb_testid" runat="server" ForeColor="Black" Style="margin-left: 8px;
                                        text-align: center; margin-right: 8px;" Width="138px" Height="22px"></asp:Label>
                                </td>
                                <td class="style44" rowspan="4">
                                    <asp:Calendar ID="EndDate" runat="server" OnSelectionChanged="EndDate_OnSelectionChanged"
                                        BackColor="White" Style="margin-left: 8px; margin-right: 8px;" BorderColor="#3366CC"
                                        BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana"
                                        Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                        <WeekendDayStyle BackColor="#CCCCFF" />
                                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                        <TitleStyle BackColor="#5D7B9D" ForeColor="White"></TitleStyle>
                                    </asp:Calendar>
                                    <br />
                                    <asp:CustomValidator runat="server" ID="CompareEndTodayValidatorCust" Style="margin-left: 8px;"
                                        OnServerValidate="ServerValidation" ControlToValidate="tb_date" ErrorMessage="Exam date can't be less than today" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style44">
                                    <asp:Label ID="Label7" runat="server" Font-Bold="False" ForeColor="Black" Style="margin-right: 8px;"
                                        Text="Date "></asp:Label>
                                </td>
                                <td align="left" class="style44">
                                    <asp:TextBox ID="tb_date" runat="server" BackColor="White" Style="margin-left: 8px;
                                        text-align: center; margin-right: 8px;" ForeColor="Black" Width="138px" OnTextChanged="tb_date_TextChanged"
                                        Height="22px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_date"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style44">
                                    <asp:Label ID="Label21" runat="server" Font-Bold="False" ForeColor="Black" Style="margin-right: 8px;"
                                        Text="Chief Instructor"></asp:Label>
                                </td>
                                <td align="left" class="style44">
                                    <asp:DropDownList ID="dl_chief" runat="server" Width="138px" ForeColor="Black" Style="margin-left: 8px;
                                        text-align: center; margin-right: 8px;">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style44">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center" class="style44">
                                    <asp:ImageButton ID="bt_addtotest" runat="server" Style="margin-top: 20px"
                                      Width="145px" Height="48px" ImageUrl="~/images/BtnSave.png" OnClick="Button1_Click" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style41" align="center" bgcolor="White">
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Style="margin-left: 0px;
                            top: 319px; left: 532px; width: 769px;" DataKeyNames="student_id" CellPadding="2"
                            CellSpacing="2" ForeColor="#333333" GridLines="Both" Height="38px" Width="919px"
                            Caption="Student List" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="Serial No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="student_name" HeaderText="Student Name" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_name"></asp:BoundField>
                                <asp:BoundField DataField="student_id" HeaderText="StudentID" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_id" ReadOnly="True">
                                </asp:BoundField>
                                <asp:BoundField DataField="student_nric" HeaderText="Student NRIC" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_nric"></asp:BoundField>
                                <asp:BoundField DataField="student_group" HeaderText="Student Group" ItemStyle-HorizontalAlign="Center"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_group"></asp:BoundField>
                                <asp:TemplateField ShowHeader="true" HeaderStyle-BackColor="#98272d" HeaderText="Theory">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb_theory" ForeColor="Black" runat="server" CausesValidation="false"
                                            CommandName="theory_remove" Text="Remove" command="lnk_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="true" HeaderText="Practical" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb_practical" ForeColor="Black" runat="server" CausesValidation="false"
                                            CommandName="practical_remove" Text="Remove"></asp:LinkButton>
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
                    <td class="style43" bgcolor="White">
                        <br />
                        <table frame="box" align="center" class="center">
                            <tr>
                                <td align="right" class="style69">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="False" ForeColor="Black" Style="margin-right: 8px;"
                                        Text="Add new student , Enter the student ID "></asp:Label>
                                </td>
                                <td align="left" class="style45">
                                
                                  <asp:Panel ID="Panel_txt" runat="server" DefaultButton="LinkButton1">     
                    
                                    <asp:TextBox ID="tb_test_student_id" runat="server" Height="22px" Width="138px" ForeColor="Black"
                                        BackColor="White"></asp:TextBox>
                                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" Style="margin-left: 8px;"
                                        OnClick="lb_from_textbox_Click" CausesValidation="false">Add</asp:LinkButton>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tb_test_student_id"
                                        ValidationExpression="^[a-zA-Z0-9\s]{1,40}$" ErrorMessage="Invalid name">
                                    </asp:RegularExpressionValidator>
                                    </asp:Panel>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style69">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="False" ForeColor="Black" Style="margin-right: 8px;"
                                        Text="Add  another group (Select the group)"></asp:Label>
                                </td>
                                <td align="left" class="style45">
                                    <asp:ListBox ID="ListBox2" SelectionMode="Multiple" runat="server" BackColor="White"
                                        ForeColor="Black" Height="93px" Width="138px"></asp:ListBox>
                                    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" Style="margin-left: 8px;"
                                        OnClick="lb_from_listbox_Click" CausesValidation="False">Add</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style69">
                                    <asp:Label ID="Label20" runat="server" Font-Bold="False" ForeColor="Black" Text="Add External Students "></asp:Label>
                                </td>
                                <td class="style45" align="left" bgcolor="White">
                                  <asp:Panel ID="Panel1" runat="server" DefaultButton="lb_add_external_students">     
                    
                                    <asp:TextBox ID="tb_studentnric" runat="server" onfocus="if (this.value == 'StudentNRIC') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'StudentNRIC';" value="StudentNRIC"
                                        ForeColor="Black" BackColor="White" Height="21px" Width="113px"></asp:TextBox>
                                           
                                       <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_studentnric"
                                    InitialValue="StudentNRIC"    ErrorMessage="*"></asp:RequiredFieldValidator>
                                        --%>
                                        
                                    <asp:TextBox ID="tb_student_name" runat="server" onfocus="if (this.value == 'StudentName') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'StudentName';" value="StudentName"
                                        ForeColor="Black" BackColor="White" Height="21px" Width="113px"></asp:TextBox>
                                        
                                     <%--   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_student_name"
                                    InitialValue="StudentName"    ErrorMessage="*"></asp:RequiredFieldValidator>
                                    --%>
                                    <asp:LinkButton ID="lb_add_external_students" runat="server" ForeColor="Black" OnClick="lb_add_external_students_Click"
                                        CausesValidation="false">Add</asp:LinkButton>
                                    <br />
                                    
                                    
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  runat="server" ControlToValidate="tb_studentnric"
                                        ValidationExpression="^[a-zA-Z0-9\s]{1,40}$" ErrorMessage="Invalid nric">
                                    </asp:RegularExpressionValidator>&nbsp;<asp:RegularExpressionValidator ID="nameRegex"
                                        runat="server" ControlToValidate="tb_student_name" ValidationExpression="^[a-zA-Z0-9\s]{1,40}$"
                                        ErrorMessage="Invalid name">
                                    </asp:RegularExpressionValidator>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:ImageButton ID="bt_addtotest1" runat="server" Width="145px" Style="margin-top: 20px"
                            Height="48px" ImageUrl="~/images/BtnSave.png" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
