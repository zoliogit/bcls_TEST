<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="add_newstaff.aspx.cs" Inherits="add_newstaff" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>addstaff - BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <style type="text/css">
        .center
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            width: 689px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ADD  STAFF" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div>
        <table class="style1" style="display: inline-table;" align="center">
            <tr>
                <td align="center" bgcolor="White" class="styleCC">
                    <br />
                    <br />
                    <asp:Panel ID="Panel_txt" runat="server" DefaultButton="Button1">
                            
                    
                    
                    <table class="center" cellspacing="1" cellpadding="3" frame="box" align="center">
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label1" runat="server" Style="margin-right: 8px;" Text="NPNet UserID"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox ID="TextBox1" runat="server" Height="22px" Style="margin-left: 8px;"
                                    Width="100px" ForeColor="Black"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="nameRegex" runat="server" ControlToValidate="TextBox1"
                                    ValidationExpression="^[a-zA-Z0-9]{1,40}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label6" runat="server" Style="margin-right: 8px;" Text="Full Name"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="100px" Style="margin-left: 8px;"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                                    ValidationExpression="^[a-zA-Z0-9\s]{1,40}$" ErrorMessage="Invalid "></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label8" runat="server" Style="margin-right: 8px;" Text="Staff Employee No"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox ID="TextBox3" runat="server" Width="100px" Style="margin-left: 8px;"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3"
                                    ValidationExpression="^[a-zA-Z0-9]{1,40}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label9" runat="server" Style="margin-right: 8px;" Text="NRIC/FIN"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox ID="TextBox4" runat="server" Width="100px" Style="margin-left: 8px;"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4"
                                    ValidationExpression="^[a-zA-Z0-9]{1,50}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4"
                                    ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label2" runat="server" Style="margin-right: 8px;" Text="Role "></asp:Label>
                            </td>
                            <td class="style69" align="left">
                                <asp:DropDownList ID="DropDownList1" runat="server" BackColor="White" Style="margin-left: 8px;"
                                    ForeColor="Black" Height="22px" Width="120px">
                                    <asp:ListItem>Chief Instructor</asp:ListItem>
                                    <asp:ListItem>Director/Asst Director</asp:ListItem>
                                    <asp:ListItem>Instructor</asp:ListItem>
                                     <asp:ListItem>Guest</asp:ListItem>
                                 
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label7" Style="margin-left: 8px;" runat="server" Text="NP Staff "></asp:Label>
                            </td>
                            <td class="style69" align="left">
                                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Style="margin-left: 8px;" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" class="style69">
                                <br />
                                <br />
                                <asp:ImageButton ID="Button1" runat="server"  Style="margin-top: 20px"
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
