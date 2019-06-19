<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditTheoryScore.aspx.cs" Inherits="EditTheoryScore" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>EditScore - BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
     <script type="text/javascript">
   function Confirm3() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            var score= document.getElementById('<%= tb_score1.ClientID %>').value;
           //var student_id=document.getElementById('<%= lb_studentid.ClientID %>').innerText; //for local server
            var student_id=document.getElementById('<%= lb_studentid.ClientID %>').innerHTML;
            
               if (confirm("Theory score of "+score+ " will be added to the student "+student_id+".\nStaff ID, Date and time will be captured in the system.\nAre you sure you want to proceed ?"))
            
          {     confirm_value.value = "Yes";
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

<div style="font-family: Arial">
            <table bgcolor="White" class="style1">
 <tr>
                    <td bgcolor="#F7F6F3" class="styleCC" colspan="2">
                    </br>
                         <asp:ImageButton ID="Button4" runat="server" CausesValidation="False" 
                                Height="35px" Width="200px" ImageUrl="~/images/BackToStudentListBtn.png"
            OnClick="Button4_Click" />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="X-Large" align="center" ForeColor="Black"
            Text="EDIT THEORY SCORE" Font-Names="Arial"></asp:Label>
                    </td>
                </tr>
                </table>

</asp:Content>
<asp:Content ID="Content1" runat="server"  ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="width:101%; align:center;">
      <asp:Panel ID="Panel_txt" runat="server" DefaultButton="bt_submit">     
                    
                    <table class="center"  frame="box" align="center">
                    
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label1" runat="server" Style="margin-right: 8px;" 
                                    Text="Session ID" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="left" class="style69" colspan="2">
                                <asp:Label ID="lb_sessionid" runat="server" Height="22px" Style="margin-left: 8px;"
                                   ForeColor="Black" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label6" runat="server" Style="margin-right: 8px;" 
                                    Text="Student ID" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:Label ID="lb_studentid" runat="server" Height="22px" Width="100px" 
                                    Style="margin-left: 8px;" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style69">
                                <asp:Label ID="Label8" runat="server" Style="margin-right: 8px;" Text="Enter Score"></asp:Label>
                            </td>
                            <td align="left" class="style69">
                                <asp:TextBox ID="tb_score1" runat="server" Width="100px" Style="margin-left: 8px;"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_score1"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>--%>
                                       <asp:RequiredFieldValidator ID="tb_scorevalidator" ControlToValidate="tb_score1" runat="server" ErrorMessage="*">
                      
                        </asp:RequiredFieldValidator>   
                                </td>
                                
                        </tr>
                      <tr><td align="center" colspan="2">
                      <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="tb_score1"
                            MinimumValue="0" MaximumValue="30" Type="Integer" Text="Score should be between 0 and 30" />
                      </td></tr>
                     
                        <tr>
                            <td colspan="2" align="center" class="style69">
                               
                         <%--       <asp:Button ID="bt_submit" runat="server" Text="UPDATE" Width="130px" OnClientClick="Confirm3()"  Style="margin-top: 20px"
                                    Height="32px"  OnClick="bt_submit_Click" Font-Bold="True" />--%>
                                    
                                    <asp:ImageButton ID="bt_submit" runat="server" Width="145px"   
                                        Height="48px" ImageUrl="~/images/UpdateBtn.png" CausesValidation="true"  OnClientClick="if(Page_ClientValidate()) Confirm3();"
                                    OnClick="bt_submit_Click" />
                            </td>
                        </tr>
                        <tr><td align="left" colspan="2"> <asp:Label ID="Label2" runat="server" Style="margin-right: 8px;" 
                                    Text="NB :Third attempt, if needed, should not be on the same day of the second attempt" Font-Bold="false"></asp:Label></td></tr>
                    </table>
              </asp:Panel>
    </div>
</asp:Content>


