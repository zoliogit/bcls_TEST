<%@ Page Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" CodeFile="NSL_All_Groups_v2_2.aspx.cs" Inherits="NSL_All_Groups_v2_2" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>All Groups-NSL V2.2</title>
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
        function Confirm1() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to cleanup the current NSL records for this module ?")) {
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
            height: 40px;
            width: 191px;
        }
        .style46
        {
            height: 27px;
        }
        </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div><asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ALL GROUPS" Font-Names="Arial"></asp:Label></div>
        
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

      <div style="height: 1056px; font-family: Arial;">
            <table class="style1" bgcolor="White">
              
                <tr>
                    <td class="style43" align="center" bgcolor="White">
                        <br />
                    <div align="left">     <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="Practical Group" Font-Names="Arial" Style="margin-left: 10px"></asp:Label>&nbsp; &nbsp;
                            <%--   <asp:DropDownList ID="dl_P_group" runat="server" Style="
                                    text-align: center; " ForeColor="Black"
                                    Width="60px" Height="30px">
                                    <asp:ListItem Text="Practical Group" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="P01"></asp:ListItem>
                                    <asp:ListItem Text="P02"></asp:ListItem>        
                                </asp:DropDownList>--%> 
                                  <asp:DropDownList ID="dl_P_group" runat="server" AutoPostBack="true"
        Style="margin-left: 8px;
                                    text-align: center; text-align: center; margin-right: 10px;" ForeColor="Black"
                                    Width="120px" Height="35px" 
        onselectedindexchanged="dl_P_group_SelectedIndexChanged">
                                </asp:DropDownList>
                                
                                    
               
                                
                                
                                
                         </div>
                        <table  class="center">
                                     
                
                
                
                
                <tr>
                    <td class="style41" align="center" bgcolor="White">
                   
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 900px;"
                        DataKeyNames="student_id"  ForeColor="#333333"
                        CellSpacing="2" Width="500px"
                        
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
                            <asp:BoundField DataField="student_name"  ItemStyle-HorizontalAlign="Left" HeaderText="Student Name"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_name" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left" ></ItemStyle>
                            </asp:BoundField>
                            
                            
                            
                             <asp:BoundField DataField="practical_group" ItemStyle-HorizontalAlign="Left" HeaderText="Practical Group"
                                HeaderStyle-BackColor="#98272d" SortExpression="practical_group" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                             
                 <asp:BoundField DataField="student_group" ItemStyle-HorizontalAlign="Left" HeaderText="Group"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_group" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                 
                 
                                          
                 <asp:BoundField DataField="percent_score_sim1" ItemStyle-HorizontalAlign="Left" HeaderText="SIM1- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim1" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="edited_score_remarks_sim1" ItemStyle-HorizontalAlign="Left" HeaderText="SIM1- Comments"
                                HeaderStyle-BackColor="#98272d" SortExpression="edited_score_remarks_sim1" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="submitted_staff_sim1" ItemStyle-HorizontalAlign="Left" HeaderText="SIM1- Submitted By"
                                HeaderStyle-BackColor="#98272d" SortExpression="submitted_staff_sim1" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                                               
                 <asp:BoundField DataField="percent_score_sim2" ItemStyle-HorizontalAlign="Left" HeaderText="SIM2- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim2" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="edited_score_remarks_sim2" ItemStyle-HorizontalAlign="Left" HeaderText="SIM2- Comments"
                                HeaderStyle-BackColor="#98272d" SortExpression="edited_score_remarks_sim2" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="submitted_staff_sim2" ItemStyle-HorizontalAlign="Left" HeaderText="SIM2- Submitted By"
                                HeaderStyle-BackColor="#98272d" SortExpression="submitted_staff_sim2" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                            
                        <asp:BoundField DataField="percent_score_sim3" ItemStyle-HorizontalAlign="Left" HeaderText="SIM3- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_sim3" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                                </asp:BoundField>
                                
                                <asp:BoundField DataField="edited_score_remarks_sim3" ItemStyle-HorizontalAlign="Left" HeaderText="SIM3- Comments"
                                HeaderStyle-BackColor="#98272d" SortExpression="edited_score_remarks_sim3" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="submitted_staff_sim3" ItemStyle-HorizontalAlign="Left" HeaderText="SIM3- Submitted By"
                                HeaderStyle-BackColor="#98272d" SortExpression="submitted_staff_sim3" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                           
                            <%--   <asp:BoundField DataField="percent_score_mgc" ItemStyle-HorizontalAlign="Left" HeaderText="MGC- %"
                                HeaderStyle-BackColor="#98272d" SortExpression="percent_score_mgc" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            
                             <asp:BoundField DataField="edited_score_remarks_mgc" ItemStyle-HorizontalAlign="Left" HeaderText="MGC- Comments"
                                HeaderStyle-BackColor="#98272d" SortExpression="edited_score_remarks_mgc" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="submitted_staff_mgc" ItemStyle-HorizontalAlign="Left" HeaderText="MGC- Submitted By"
                                HeaderStyle-BackColor="#98272d" SortExpression="submitted_staff_mgc" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>--%>
                            
                               
                            
                       
                 
                            
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
                 <td align="center">
                     <asp:ImageButton ID="download" runat="server" CausesValidation="false"  Width="145px" Height="48px"
                                Style="margin-top: 20px"  
                         ImageUrl="~/images/BtnDownload.png" OnClick="download_Click" 
                         />
                       <asp:ImageButton ID="archive" runat="server" CausesValidation="false" OnClientClick="Confirm1();" Width="145px" Height="48px"
                                Style="margin-top: 20px"  
                         ImageUrl="~/images/BtnArchive.png" OnClick="archive_Click" 
                         />
                </td></tr>
             
            </table>
        </div>
        
                      
</asp:Content>



