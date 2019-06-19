<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="create_new_test.aspx.cs" Inherits="create_new_test" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>createtest-BCLS</title>
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
        .style69
        {
            height: 30px;
        }
        body, html
        {
            height: 100%;
        }
        #right
        {
            height: 100%;
        }
    </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text=" NEW SESSION" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="height: 100%; font-family: Arial;">
        <table class="style1" align="center">
            <tr>
                <td class="styleCC" align="center">
                    <br />
                      <asp:Panel ID="Panel_txt" runat="server" DefaultButton="bt_addtotest">     
                    
                    <table class="center" cellspacing="1" cellpadding="3" frame="box" align="center">
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;
                                    margin-bottom: 344px;" Text="Date " Font-Size="Small"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox runat="server" ID="tb_date" BackColor="White" Style="margin-left: 8px;
                                    text-align: center; margin-right: 10px;" ForeColor="Black" Width="138px" Height="25px"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_date"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                            <td class="style69" rowspan="4">
                                <asp:Calendar ID="EndDate" runat="server" Style="margin-right: 8px;" OnSelectionChanged="EndDate_OnSelectionChanged"
                                    BorderColor="#3366CC" Height="178px" Width="220px" BackColor="White" BorderWidth="1px"
                                    CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt"
                                    ForeColor="#003399" OnDayRender="EndDate_DayRender">
                                    <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                    <WeekendDayStyle BackColor="#CCCCFF" />
                                    <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                    <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                    <TitleStyle BackColor="#5D7B9D" ForeColor="White"></TitleStyle>
                                </asp:Calendar>
                                <asp:CustomValidator runat="server" ID="CompareEndTodayValidatorCust" Style="margin-left: 8px;"
                                    OnServerValidate="ServerValidation" ControlToValidate="tb_date" ErrorMessage="Exam date can't be less than today" />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;
                                    margin-bottom: 344px;" Text="Chief Instructor" Font-Size="Small"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:DropDownList ID="dl_chiefinstructor" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: center; margin-right: 10px;" ForeColor="Black"
                                    Width="142px" Height="30px">
                                </asp:DropDownList>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label15" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;"
                                    Text="Session Name" Font-Size="Small"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:DropDownList ID="dl_test_name" runat="server" OnSelectedIndexChanged="SelectedIndexChanged"
                                    Height="30px" Width="142px" Style="margin-left: 8px; text-align: center; margin-right: 10px;"
                                    AutoPostBack="True" ForeColor="Black">
                                    <asp:ListItem>BCLS</asp:ListItem>
                                    <asp:ListItem>BCLS Re-Cirtifcation</asp:ListItem>
                                    <asp:ListItem>BCLS Instructor</asp:ListItem>
                                    <asp:ListItem>CPR (Citizen)</asp:ListItem>
                                    <asp:ListItem>CPR (Heart Savers)</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <asp:TextBox ID="tb_other" runat="server" Width="138px" Visible="False" Style="margin-left: 8px;
                                    margin-right: 10px;" ForeColor="#5D7B9D" Height="25px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_other"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label17" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;"
                                    Text="Duration In Hr" Font-Size="Small"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:DropDownList ID="dl_duration" Style="margin-left: 8px; text-align: center;"
                                    runat="server" Height="26px" Width="49px" ForeColor="Black">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>1.5</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>2.5</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>3.5</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>4.5</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>5.5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>6.5</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>7.5</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>8.5</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label14" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;"
                                    Text="Select Groups " Font-Size="Small" Width="100px"></asp:Label>
                                <br />
                                <asp:Label ID="Label20" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 33px;"
                                    Text="Use CTRL" Font-Size="Small" Width="61px" Height="16px"></asp:Label>
                                <br />
                                <asp:Label ID="Label21" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-right: 8px;"
                                    Text="for multiple selection" Font-Size="Small" Width="139px"></asp:Label>
                            </td>
                            <td class="style69" align="left" colspan="2">
                                <asp:ListBox ID="ListBox1" SelectionMode="Multiple" runat="server" Style="margin-left: 8px;"
                                    BackColor="White" ForeColor="Black" Height="92px" Width="142px">
                                    </asp:ListBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center" class="style69">
                                <asp:ImageButton ID="bt_addtotest" runat="server"  Style="margin-top: 20px;"
                                    Width="145px" Height="48px" ImageUrl="~/images/BtnContinue (1).png" OnClick="Button1_Click" />
                            </td>
                        </tr>
                    </table>
                    
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
