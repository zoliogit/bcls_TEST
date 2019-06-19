<%@ Page Language="C#" AutoEventWireup="true" CodeFile="start_test.aspx.cs" Inherits="start_test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>starttest-BCLS</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
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
            height: 85px;
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
            height: 84px;
        }
        #form1
        {
            font-family: Arial;
        }
        .center
        {
            margin-left: auto;
            margin-right: auto;
        }
        .style5
        {
            margin-left: auto;
            margin-right: auto;
            height: 46px;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <table bgcolor="White" class="style1">
        <tr>
            <td style="background-image: url(images/navigationBar.png)" align="center" class="styleAA">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Strikeout="False"
                    ForeColor="White" Text="CPRact" Font-Italic="False"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td bgcolor="White" class="style2">
                <table class="center" align="center">
                    <tr>
                        <td align="right" bgcolor="White">
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Black" Text="Test Session ID"></asp:Label>
                        </td>
                        <td bgcolor="White">
                            <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Black" Style="margin-left: 8px;
                                width: 106px;" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="White">
                            <asp:Label ID="Label2" runat="server" Text=" Test Activation Code" Font-Bold="True"
                                Font-Size="Large" ForeColor="Black"></asp:Label>
                        </td>
                        <td bgcolor="White">
                            <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="XX-Large"
                                Style="margin-left: 8px; width: 106px;" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
