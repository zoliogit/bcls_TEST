<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Confirm_staff.aspx.cs" Inherits="Confirm_staff" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>confirm staff-BCLS</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
    function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you wants to add this staff? ")) {
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
            width: 681px;
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
        .style8
        {
            height: 61px;
        }
        .style53
        {
            height: 30px;
        }
        .style54
        {
            margin-left: auto;
            margin-right: auto;
            height: 28px;
        }
        .style55
        {
            margin-left: auto;
            margin-right: auto;
            height: 32px;
        }
        .style56
        {
            width: 189px;
        }
        .style30
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style57
        {
            margin-left: auto;
            margin-right: auto;
            height: 44px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label5" runat="server" Font-Size="X-Large" ForeColor="Black" Text="CONFIRMATION"
        Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="font-family: Arial">
        <table class="style1" align="center">
            <br />
            <tr>
                <td class="style8" bgcolor="White" align="center">
                    <br />
                    <table class="center" cellspacing="1" cellpadding="3" align="center">
                        <tr>
                            <td class="center" align="right">
                                <asp:Label ID="Label1" runat="server" Text=" NPNet UserID"></asp:Label>
                            </td>
                            <td class="center" align="left">
                                <asp:Label ID="lb_confirmid" runat="server" BorderColor="Maroon" Style="margin-left: 8px;"
                                    Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="center" align="right">
                                <asp:Label ID="Label2" runat="server" Text="Full  Name "></asp:Label>
                            </td>
                            <td class="center" align="left">
                                <asp:Label ID="lb_confirmname" runat="server" Style="margin-left: 8px;" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="center" align="right">
                                <asp:Label ID="Label8" runat="server" Text="Satff Employee No"></asp:Label>
                            </td>
                            <td class="center" align="left">
                                <asp:Label ID="lb_confirm_emp_no" runat="server" Style="margin-left: 8px;" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="center" align="right">
                                <asp:Label ID="Label9" runat="server" Text="NRIC/FIN"></asp:Label>
                            </td>
                            <td class="center" align="left">
                                <asp:Label ID="lb_confirm_nric" runat="server" Style="margin-left: 8px;" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="center" align="right">
                                <asp:Label ID="Label3" runat="server" Text="Role "></asp:Label>
                            </td>
                            <td class="center" align="left">
                                <asp:Label ID="lb_confirmrole" runat="server" Style="margin-left: 8px;" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" class="center">
                                <br />
                                &nbsp;<asp:ImageButton ID="bt_confirm" runat="server" Style="margin-top: 20px"
                                     Width="145px" Height="48px" OnClientClick="Confirm()" ImageUrl="~/images/BtnConfirm.png" OnClick="bt_confirm_Click"
                                    CausesValidation="False" /> <br />
                                <asp:Label ID="lb_insert_err" Visible="false" runat="server" Style="margin-left: 8px;" Text="Label"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
