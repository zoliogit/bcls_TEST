<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="Practical_test.aspx.cs" Inherits="Practical_test" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>practicaltest-BCLS</title>
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
        .center
        {
            margin-left: auto;
            margin-right: auto;
        }
        .style31
        {
            width: 234px;
        }
        .style32
        {
            width: 90%;
        }
        .style34
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 24px;
            width: 718px;
        }
        .style71
        {
            font-family: Arial, Helvetica, sans-serif;
            height: 21px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" runat="server" Visible="false" ContentPlaceHolderID="ContentPlaceHolder2">
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div style="font-family: Arial">
            <table bgcolor="White" class="style1">
                <tr>
                    <td bgcolor="#F7F6F3" class="styleCC" colspan="2">
                        <asp:ImageButton ID="Button4" runat="server" CausesValidation="False"
                            Height="35px" Width="200px" ImageUrl="~/images/BackToStudentListBtn.png" OnClick="Button4_Click" />
                       &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label12" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                            Text=" Practical Test Modules" Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
                <tr>
             
                    <td align="left" >
                        </br>
                    &nbsp;
                        <asp:Label ID="Label3" runat="server" Font-Bold="False"
                            Font-Size="Large" ForeColor="Black" Text="STUDENT NAME:" Font-Names="Arial"></asp:Label>
                        &nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Font-Names="Arial"></asp:Label>
                    </td>
                    </tr>
                    <tr>
                    <td align="left"  >
                     &nbsp;
                        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="NRIC:" Font-Names="Arial"></asp:Label>
                        &nbsp;<asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="White" align="center" class="styleGG" colspan="2">
                        <table class="style32" frame="box" cellspacing="1" cellpadding="3" align="center">
                            <tr>
                                <td align="center" colspan="5">
                                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 12.800000190734863px;
                                        font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                                        line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none;
                                        white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                                        background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                        <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="#98272D"
                                            Text="Click On Each Module Button To Start The Practical Test" Font-Names="Arial"></asp:Label>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Label14" runat="server" Text="Module 1"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label15" runat="server" Text="Module 2"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label16" runat="server" Text="Module 3"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label17" runat="server" Text="Module 4"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label18" runat="server" Text="Module 5"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:ImageButton ID="img_a_cpr" ImageUrl="~/images/adutCPR.png" OnClick="img_a_cpr_Click"
                                        runat="server" Width="145px" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="img_a_fbao" ImageUrl="~/images/adultFBAO.png" OnClick="img_a_fbao_Click"
                                        runat="server" Width="145px" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="img_i_cpr" ImageUrl="~/images/infantCPR.png" OnClick="img_i_cpr_Click"
                                        runat="server" Width="145px" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="img_i_fbao" ImageUrl="~/images/infantFBAO.png" OnClick="img_i_fbao_Click"
                                        runat="server" Width="145px" />
                                </td>
                                <td align="center">
                                    <asp:ImageButton ID="img_i_AED" ImageUrl="~/images/CPR_AED.png" OnClick="img_i_AED_Click"
                                        runat="server" Width="145px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Label ID="Label21" runat="server" Text="Adult CPR"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label20" runat="server" Text="Adult FBAO"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label198" runat="server" Text="Infant CPR"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Label ID="Label19" runat="server" Text="Infant  FBAO"></asp:Label>
                                </td>
                                <td align="center">
                                    CPR+AED</td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 12.800000190734863px;
                                        font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal;
                                        line-height: normal; orphans: auto; text-align: left; text-indent: 0px; text-transform: none;
                                        white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;
                                        background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                        <asp:Image ID="Image1" runat="server" Visible="False" />
                                        <asp:Label ID="Label22" runat="server"></asp:Label>
                                    </span>
                                </td>
                                <td align="center">
                                    <asp:Image ID="Image2" runat="server" Visible="False" />
                                    <asp:Label ID="Label23" runat="server"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Image ID="Image3" runat="server" Visible="False" />
                                    <asp:Label ID="Label24" runat="server"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Image ID="Image4" Visible="False" runat="server" />
                                    <asp:Label ID="Label25" runat="server"></asp:Label>
                                </td>
                                <td align="center">
                                    <asp:Image ID="Image5" Visible="False" runat="server" />
                                    <asp:Label ID="Label26" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
