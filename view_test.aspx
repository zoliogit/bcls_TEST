<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="view_test.aspx.cs" Inherits="view_test" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>viewtests-BCLS</title>
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
        function Confirm2() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("This will close the theory test. Students will not be able to submit theory test. Proceed to close? ")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
         function Confirm3() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("This will update the current theory scores. Are you sure you want to update? ")) {
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
        .left-border
        {
            border: 1px solid black !important;
        }
        .style1
        {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
            margin: 0;
            padding: 0;
            height: 632px;
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
        .style35
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 34px;
        }
        .style36
        {
            border-left: 1px solid #98272d;
            border-right: 1px solid #98272d;
            border-bottom: 1px solid #98272d;
        }
        .style37
        {
            border-left: 1px solid #98272d;
            border-right: 1px solid #98272d;
            border-top: 1px solid #98272d;
        }
        
        .black_overlay{
display:none;
position: absolute;
top: 0%;
left: 0%;
width: 100%;
height: 200%;
background-color:black;
z-index:1001;

}
.white_content {
display:none;
position: absolute;
top: 25%;
left: 35%;
width: 35%;
padding: 0px;
border: 0px solid #a6c25c;
background-color: white;
z-index:1002;
overflow: auto;
}
.headertext{
font-family:Arial, Helvetica, sans-serif;
font-size:14px;
color:#f19a19;
font-weight:bold;
}
.textfield
{
border:1px solid #a6c25c;
width:135px;
}
.button2
{
 background-color:#a6c25c;
 color:White;
 font-size:11px;
 font-weight:bold;
 border:1px solid #7f9db9;
 width:68px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ASSESSMENT STATUS" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <body>
        <div style="height: 100%">
            <table bgcolor="White" class="style1">
                <tr>
                <td bgcolor="White" class="styleCC" align="center"> <asp:Label ID="Label23" runat="server" ForeColor="Black" Text="Chief Instructor"></asp:Label>
                &nbsp;<asp:Label ID="v_chief_name" runat="server" ForeColor="Black" Style="margin-right: 10px"></asp:Label></td>
                   <%-- <td class="styleCC" bgcolor="White">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Label ID="Label23" runat="server" ForeColor="Black" Text="Chief Instructor"></asp:Label>&nbsp;&nbsp;&nbsp;<asp:Label
                            ID="v_chief_name" runat="server" ForeColor="Black" Style="margin-right: 10px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        &nbsp;
                        <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Date"></asp:Label>&nbsp;
                        <asp:Label ID="v_date" runat="server" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style35" align="left" bgcolor="White">
                        &nbsp;
                        <asp:Label ID="Label12" runat="server" ForeColor="Black" Style="margin-left: 10px"
                            Text="Test Session ID"></asp:Label>
                        &nbsp;
                        <asp:Label ID="v_testid" runat="server" Font-Bold="False" ForeColor="Black"></asp:Label>
                    </td>--%>
                <td bgcolor="White" class="styleCC"  align="center">
                  <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Date"></asp:Label>&nbsp;
                        <asp:Label ID="v_date" runat="server" ForeColor="Black"></asp:Label>
                        </td>
                <td bgcolor="White" class="styleCC"  align="center">
                  <asp:Label ID="Label12" runat="server" ForeColor="Black" Style="margin-left: 10px"
                            Text="Test Session ID"></asp:Label>
                        &nbsp;
                        <asp:Label ID="v_testid" runat="server" Font-Bold="False" ForeColor="Black"></asp:Label>
                   </td>
                </tr>
                <tr>
                    <td class="styleCC" align="center" bgcolor="White" colspan="3">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            Style="margin-left: 0px; top: 319px; left: 532px;" OnRowCommand="GridView1_RowCommand"
                            CellSpacing="2" Width="1000px" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333"
                            GridLines="Both">
                            <RowStyle ForeColor="#333333" BackColor="#F7F6F3" />
                            <Columns>
                                <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="student_id" HeaderText="Student ID" ItemStyle-Width="95px"
                                    HeaderStyle-BackColor="#98272d" SortExpression="student_id">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_name" HeaderStyle-BackColor="#98272d" HeaderText="Student Name"
                                    HeaderStyle-HorizontalAlign="Center" SortExpression="student_name">
                                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                </asp:BoundField>
                                <asp:BoundField DataField="student_group" HeaderText="Student Group" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="student_nric">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>

                               


                             <%--   <asp:BoundField DataField="test_vs_student_status" HeaderText="Theory Status" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Left" SortExpression="test_vs_student_status"></asp:BoundField>
                                 --%>   
                                    <asp:TemplateField ShowHeader="true" HeaderText="Theory Status" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lb_status" runat="server" ForeColor="Black" CausesValidation="false"
                                            CommandName="selectstatus" Text='<%# Eval("test_vs_student_status")%>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                    
                                    
                               <asp:BoundField DataField="score" HeaderText="Theory Score" ItemStyle-HorizontalAlign="Left"
                                    HeaderStyle-BackColor="#98272d" SortExpression="score">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:BoundField>
                                
                                
                                   
                                
                                
                                
                                
                                <asp:TemplateField ShowHeader="true" HeaderText="Theory Result" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="Black" CausesValidation="false"
                                            CommandName="selectresult" Text="Result"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField ShowHeader="true" HeaderText="Practical Status" HeaderStyle-BackColor="#98272d"
                                    ItemStyle-HorizontalAlign="Left">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" CausesValidation="false"
                                            ItemStyle-HorizontalAlign="left" CommandName="select" HeaderText="Practical Status"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle Width="140px" />
                                </asp:TemplateField>


                                   <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"
                                    HeaderText="Generate Password">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkpass" runat="server" ForeColor="Black" CommandArgument='<%#Eval("student_id")%>'
                                            CommandName="select_pass">Password</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>

                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center" bgcolor="White" colspan="3">
                        <br />
                        <div runat="server" id="theDivForBottomButtons">
                        <table style="width: 100%; height: 32px;">
                            <tr>
                                <td align="right">
                                    &nbsp;
                                </td>
                                <td class='style37' align="center" width="300px">
                                    <asp:Label ID="Label24" runat="server" ForeColor="Black" Style="margin-left: 10px;
                                        font-family: Arial, Helvetica, sans-serif;" Text="Theory Test" Font-Bold="False"
                                        Font-Size="Medium"></asp:Label>
                                </td>
                                <td align="left">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                               
                                <td align="right">
         
                                         
                                        <asp:ImageButton ID="img_edittest" Width="130px" Style="margin-top: 20px" Height="32px"
                                        ImageUrl="~/images/BtnEditSessionDetails.png" OnClick="img_edittest_Click" runat="server" />
                                </td>
                                <td class='style36' align="center" width="300px">
                                    <asp:ImageButton ID="img_starttest" runat="server" Width="130px" Style="margin-top: 20px"
                                        Height="32px" ImageUrl="~/images/BtnStartTheroyTest.png" OnClick="img_starttest_Click" />
                                    &nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="img_finishtest" Width="130px" Style="margin-top: 20px" OnClientClick="Confirm2()"
                                        Height="32px" ImageUrl="~/images/BtnFinishTheroyTest.png" OnClick="img_finishtest_Click"
                                        runat="server" />
                                </td>
                                <td align="left">
                                    <asp:ImageButton ID="img_completesession" OnClick="img_completesession_Click" Width="130px"
                                        ImageUrl="~/images/BtnReports.png" Style="margin-top: 20px" Height="32px" runat="server" />
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
