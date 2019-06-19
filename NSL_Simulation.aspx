<%@ Page Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" CodeFile="NSL_Simulation.aspx.cs" Inherits="NSL_Simulation" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Group-NSL</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    
       <script type="text/javascript">
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you wants to delete this row?")) {
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
            width: 610px;
            height: 90px;
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
        #form1
        {
            font-family: Arial;
        }
        </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
      <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                            Text="SIMULATION" Font-Names="Arial"></asp:Label>
                    
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<div align="left">      <asp:Label ID="Label2" Style="margin-left: 10px" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="Practical Group" Font-Names="Arial"></asp:Label>
                                    &nbsp; 
                                    <asp:DropDownList ID="dl_practical_group" runat="server" Style="text-align: center; " ForeColor="Black"
                                    Width="60px" Height="30px"  AutoPostBack="true"
onselectedindexchanged="dl_practical_group_SelectedIndexChanged">
                                    
                               
                                          
                                          
                                </asp:DropDownList>
                                   
                                    <asp:RequiredFieldValidator
             ID="RequiredFieldValidator2"
             runat="server"
             ControlToValidate="dl_practical_group"
             InitialValue="0"
             ErrorMessage="Select Practical Group"
             ForeColor="Red"
            
             ></asp:RequiredFieldValidator></div>
      <div style="height: 1056px; font-family: Arial;">
      
      
      
      
         <table class="style1" bgcolor="White">
               
               
                
               
                  <tr>
                  
                             
                                    
                                   
                   <td align="center"  >
                                                
                                 <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="SIM Group" Font-Names="Arial"></asp:Label>
                            &nbsp;  <asp:DropDownList ID="dl_group" runat="server"  ForeColor="Black"
                                    Width="60px" Height="30px" Style="text-align: center; " onselectedindexchanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true" >
                               
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator
             ID="RequiredFieldValidator1"
             runat="server"
             ControlToValidate="dl_group"
             InitialValue="0"
             ErrorMessage="Select SIM Group"
             ForeColor="Red"
            
             ></asp:RequiredFieldValidator>
                               
                     </td>           
                                </tr>

               
                <tr><td></td></tr>
                
                
                <tr>
                    <td class="styleCC" align="center" bgcolor="White" colspan="2">
                   
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 250px;"
                        DataKeyNames="student_id"  ForeColor="#333333"
                        CellSpacing="2" Width="700px" onrowdatabound="GridView1_RowDataBound"
                      >
                        <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                        <Columns>
                             <asp:TemplateField HeaderText="No" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            <asp:BoundField DataField="student_id" ItemStyle-HorizontalAlign="Center" HeaderText="Student ID"
                                HeaderStyle-BackColor="#98272d" InsertVisible="False" ReadOnly="True" SortExpression="student_id">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="student_name" ItemStyle-HorizontalAlign="Left" HeaderText="Student Name"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_name" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                             <asp:BoundField DataField="practical_group" ItemStyle-HorizontalAlign="Left" HeaderText="Practical Group"
                                HeaderStyle-BackColor="#98272d" SortExpression="practical_group" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                              <asp:BoundField DataField="student_group" ItemStyle-HorizontalAlign="Left" HeaderText="Student Group"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_group" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                                  <asp:BoundField DataField="percent_score_sim1" ItemStyle-HorizontalAlign="Left" HeaderText="ACS- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim1" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                              <asp:BoundField DataField="percent_score_sim2" ItemStyle-HorizontalAlign="Left" HeaderText="BT- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim2" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                              <asp:BoundField DataField="percent_score_sim3" ItemStyle-HorizontalAlign="Left" HeaderText="TC- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim3" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                               <asp:BoundField DataField="percent_score_mgc" ItemStyle-HorizontalAlign="Left" HeaderText="MGC- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_mgc" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                            
                           </Columns>
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                    </td>
                </tr>
              
                <tr>
                <td align="center" colspan="2">
                     <asp:ImageButton ID="btn_go" runat="server"  
                                Style="margin-top: 20px"   Width="145px" Height="48px" ImageUrl="~/images/BtnContinue (1).png" 
                         OnClick="continue_Click"  /></td></tr>
                         <tr>
                         <td  align="center" colspan="2">
                      <asp:Label ID="lb_alert" runat="server" Text="**At a time only one group can continue.. " Font-Bold="False" Style="margin-left: 8px"
                        ForeColor="Red" Visible="false" Font-Names="Arial"></asp:Label>
                </td></tr>
              
               
            </table>
        </div>
        
                      
</asp:Content>

