<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    EnableEventValidation="false" CodeFile="q_bank.aspx.cs" Inherits="q_bank" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>question_bank-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
         function Confirm1() {
             var confirm_value = document.createElement("INPUT");
             confirm_value.type = "hidden";
             confirm_value.name = "confirm_value";
             if (confirm("Do you want to download the question bank? ")) {
                 confirm_value.value = "Yes";
                 confirm_value.text = "Download";
             } else {
             confirm_value.value = "No";
             confirm_value.text = "Cancel";
             }
             document.forms[0].appendChild(confirm_value);
         }
         
         
          function upload_QB_excel() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to Export the QuestionBank ? ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
            }
            document.forms[0].appendChild(confirm_value);
        }
    </script>

    <style type="text/css">
        .style37
        {
            border: 1px solid #98272d;
            width: 356px;
        }
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
        .style38
        {
        }
        .style39
        {
            width: 162px;
        }
        .style71
        {
            height: 26px;
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
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="QUESTION BANK" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                        <br />
                        <div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                                ForeColor="#333333" CellSpacing="2" AllowSorting="true" Width="809px" OnSorting="GridView1_Sorting"
                                OnRowDataBound="GridView1_RowDataBound">
                                <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                                <Columns>
                                    <asp:BoundField DataField="question_num" ItemStyle-HorizontalAlign="Center" HeaderText="QNO"
                                        HeaderStyle-BackColor="#98272d" SortExpression="task_type">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="category" ItemStyle-HorizontalAlign="Center" HeaderText="Category"
                                        HeaderStyle-BackColor="#98272d" SortExpression="category">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="q_text" ItemStyle-HorizontalAlign="Center" HeaderText="Question"
                                        HeaderStyle-BackColor="#98272d">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="answer1_text" ItemStyle-HorizontalAlign="Center" HeaderText="Answer1"
                                        HeaderStyle-BackColor="#98272d">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="answer2_text" ItemStyle-HorizontalAlign="Center" HeaderText="Answer2"
                                        HeaderStyle-BackColor="#98272d">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="answer3_text" ItemStyle-HorizontalAlign="Center" HeaderText="Answer3"
                                        HeaderStyle-BackColor="#98272d">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="correct_answer" ItemStyle-HorizontalAlign="Center" HeaderText="Correct Answer"
                                        HeaderStyle-BackColor="#98272d">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </div>
                        <br />
                        <div>
                            <asp:ImageButton ID="Button1" runat="server" OnClientClick='Confirm1()' Width="145px" Height="48px"
                                Style="margin-top: 20px"  ImageUrl="~/images/BtnDownload.png" OnClick="Button1_Click" />
                        </div>
                        <br />
                        <br />
                        <div align="center">
                            <table class='style37' align="center">
                                <tr>
                                    <td colspan="2" align="center">
                                        <asp:Label ID="Label24" runat="server" ForeColor="Black" Style="margin-left: 10px;
                                            font-family: Arial, Helvetica, sans-serif;" Text="Upload Question Bank" Font-Bold="False"
                                            Font-Size="Medium"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style71">
                                        <span style="color: Red">*</span>Attach CSV file
                                    </td>
                                    <td class="style71">
                                        <asp:FileUpload ID="fileuploadExcel" runat="server" Width="209px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:ImageButton ID="btnSend" runat="server" OnClientClick="upload_QB_excel()"  Width="130px" Style="margin-top: 20px"
                                            Height="32px" ImageUrl="~/images/BtnExport.png" OnClick="btnSend_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style38" colspan="2">
                                        &nbsp;<asp:Label ID="Label5" runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </body>
</asp:Content>
