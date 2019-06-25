<%@ Page Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" EnableEventValidation ="false" CodeFile="NSL_Group_V1_1.aspx.cs" Inherits="NSL_Group_V1_1" Title="Untitled Page" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Group-NSL V1.1</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    
       <script type="text/javascript">
     function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you wants to delete this student?")) {
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
            border-bottom: 1px solid #98272d;
              border-top: 1px solid #98272d;
        }
         .style450
        {
            height: 40px;
            width: 191px;
            border-bottom: 1px solid #98272d;
              border-top: 1px solid #98272d;
               border-left: 1px solid #98272d;
           
        }
        .style4500
        {
            height: 40px;
            width: 191px;
            border-bottom: 1px solid #98272d;
              border-top: 1px solid #98272d;
               border-right: 1px solid #98272d;
           
        }
        .style46
        {
            height: 27px;
        }
         .style36
        {
            border-left: 1px solid #98272d;
            border-right: 1px solid #98272d;
            border-bottom: 1px solid #98272d;
              border-top: 1px solid #98272d;
        }
        .style37
        {
            border-left: 1px solid #98272d;
            border-right: 1px solid #98272d;
            border-top: 1px solid #98272d;
        }
        
        
        
        </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div><asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="GROUP" Font-Names="Arial"></asp:Label></div>
        
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
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
                                
                                    <asp:RequiredFieldValidator
             ID="RequiredFieldValidator3"
             runat="server"
             ControlToValidate="dl_P_group"
             InitialValue="0"
             ErrorMessage="*"
             ForeColor="Red"
            
             ></asp:RequiredFieldValidator>
               
                                
                                
                                
                         </div>
      <div style="height: 1056px; font-family: Arial;">
            <table class="style1" bgcolor="White">
              
                <tr>
                    <td class="style43" align="center" bgcolor="White">
                        <br />
                    
                        <table  class="center">
                            <tr>
                           
                            
                            
                                
                                
                                <td class="style450" align="center">
                                      
                                    <asp:TextBox  ID="tb_student_id" runat="server" ForeColor="Black"  Width="120px" Height="30px" onfocus="if (this.value == 'Student ID') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'Student ID';" value="Student ID"></asp:TextBox >
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_student_id"
                                    InitialValue="Student ID"  ForeColor="Red"  ErrorMessage="*"></asp:RequiredFieldValidator> </td>
                                <td  class="style45" align="center">
                          <asp:TextBox ID="tb_studentname" runat="server" BackColor="White" ForeColor="Black"   Width="120px" Height="30px" onfocus="if (this.value == 'Student Name') this.value = '';"
                                        onblur="if (this.value == '') this.value = 'Student Name';" value="Student Name" InitialValue="Student Name" 
                                      ></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_studentname"
                                        ErrorMessage="*" ForeColor="Red" InitialValue="Student Name" ></asp:RequiredFieldValidator>
                                        
                                           
                                </td>
                                
                                <td  class="style45" align="center">
                                    
                                    <asp:DropDownList ID="default_group" runat="server" Style="
                                    text-align: center; " ForeColor="Black"
                                    Width="120px" Height="30px">
                                    <asp:ListItem Text="--SIM Group--" Value="0"></asp:ListItem>
                                      <asp:ListItem Text="1"></asp:ListItem>
                                        <asp:ListItem Text="2"></asp:ListItem>
                                          <asp:ListItem Text="3"></asp:ListItem>
                                            <asp:ListItem Text="4"></asp:ListItem>
                                          
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator
             ID="RequiredFieldValidator2"
             runat="server"
             ControlToValidate="default_group"
             InitialValue="0"
             ErrorMessage="*"
             ForeColor="Red"
            
             ></asp:RequiredFieldValidator>
                    </td>
                                  <td class="style4500" align="center">
                                                                          
                                                 <asp:ImageButton ID="Button1" runat="server" 
                                     Width="145px" Height="48px" ImageUrl="~/images/addBtn.png"  OnClick="Button1_Click"  />
                                    
                                  </td>
                            </tr>
                                       

                        </table>
                    </td>
                </tr>
                <br />
                  <tr>
                  
                                <td align="center" class="style46"  >
                             <asp:DropDownList ID="dl_group" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: center; margin-right: 10px;" ForeColor="Black"
                                    Width="50px" Height="35px" >
                                     <%--<asp:ListItem Text="--SIM Group--" Value="0"></asp:ListItem>--%>
                                      <asp:ListItem Text="1"></asp:ListItem>
                                        <asp:ListItem Text="2"></asp:ListItem>
                                          <asp:ListItem Text="3"></asp:ListItem>
                                            <asp:ListItem Text="4"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" Style="margin-left: 8px; "
                                        OnClick="lb_from_searchbox_Click" CausesValidation="False">Filter</asp:LinkButton>
                              
                           </td>
                 
                </tr>
                
                
                
                
                <tr>
                    <td class="style41" align="center" bgcolor="White">
                   
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 900px;"
                        DataKeyNames="student_id"  ForeColor="#333333"
                        CellSpacing="2" Width="500px"
                        onrowediting="EditStudent"
onrowupdating="UpdateStudent"  onrowcancelingedit="CancelEdit"  OnRowDataBound="GridView1_RowDataBound">
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
                            
                
                 
                             <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "Group">
                             <ItemTemplate>
                             <asp:Label ID="lblgroup" runat="server"
                             Text='<%# Eval("student_group")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtgroup" runat="server"
                            Text='<%# Eval("student_group")%>'></asp:TextBox>
                            
                             <asp:RangeValidator ID="RangeValidatorgroup" runat="server" ControlToValidate="txtgroup"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" ValidationGroup="Group1" />
         
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtgroup" runat="server"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
                            
                              <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "CON1- %">
                             <ItemTemplate>
                             <asp:Label ID="lblsim1" runat="server"
                             Text='<%# Eval("percent_score_sim1")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim1" runat="server"
                            Text='<%# Eval("percent_score_sim1")%>'>
                            </asp:TextBox>
                          <asp:RangeValidator ID="RangeValidatorsim1" runat="server" ControlToValidate="txtsim1"
                            MinimumValue="0" MaximumValue="2147483647" Type="Double" Text="Invalid" ValidationGroup="Group1" />
         
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim1" runat="server"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
                          
                            <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "CON1- Comments">
                             <ItemTemplate>
                             <asp:Label ID="lblsim1_remarks" runat="server"
                             Text='<%# Eval("edited_score_remarks_sim1")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim1_remarks" runat="server" TextMode="MultiLine"
                            Text='<%# Eval("edited_score_remarks_sim1")%>'></asp:TextBox>
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim1_remarks" runat="server"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
                            
                                 <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "CON2- %" >
                             <ItemTemplate>
                             <asp:Label ID="lblsim2" runat="server" 
                             Text='<%# Eval("percent_score_sim2")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim2" runat="server" 
                            Text='<%# Eval("percent_score_sim2")%>'></asp:TextBox>
                            
                             <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtsim2"
                            MinimumValue="0" MaximumValue="2147483647" Type="Double" Text="Invalid" ValidationGroup="Group1" />
         
                            
                            
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim2" runat="server"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
                          
                             <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "CON2- Comments" >
                             <ItemTemplate>
                             <asp:Label ID="lblsim2_remarks" runat="server" 
                             Text='<%# Eval("edited_score_remarks_sim2")%>' Visible="false"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim2_remarks" runat="server" TextMode="MultiLine" Visible="false"
                            Text='<%# Eval("edited_score_remarks_sim2")%>'></asp:TextBox>
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim2_remarks" runat="server" Visible="false"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
                         
                         
                          <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "SIM3- %" Visible="false">
                             <ItemTemplate>
                             <asp:Label ID="lblsim3" runat="server" Visible="false"
                             Text='<%# Eval("percent_score_sim3")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim3" runat="server" Visible="false"
                            Text='<%# Eval("percent_score_sim3")%>'></asp:TextBox>
                            
                            
                             <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtsim3"
                            MinimumValue="0" MaximumValue="2147483647" Type="Double" Text="Invalid" ValidationGroup="Group1" />
         
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim3" runat="server" Visible="false"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>  
                             
                               <asp:TemplateField ItemStyle-Width = "70px" HeaderStyle-BackColor="#98272d" ItemStyle-HorizontalAlign="Center" HeaderText = "SIM3- Comments" Visible="false">
                             <ItemTemplate>
                             <asp:Label ID="lblsim3_remarks" runat="server" Visible="false"
                             Text='<%# Eval("edited_score_remarks_sim3")%>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                            <asp:TextBox ID="txtsim3_remarks" runat="server" TextMode="MultiLine" Visible="false"
                            Text='<%# Eval("edited_score_remarks_sim3")%>'></asp:TextBox>
                            
                           </EditItemTemplate> 
                          <FooterTemplate>
                          <asp:TextBox ID="txtsim3_remarks" runat="server" Visible="false"></asp:TextBox>
                          </FooterTemplate>
                          </asp:TemplateField>
              
                            
                            
                            
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d" HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkdelete" OnClientClick="Confirm()" ForeColor="Black" runat="server" OnClick="rowdelete_Click"
                                        CommandName="DELETE" CausesValidation="false">Delete</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                             <asp:CommandField  ShowEditButton="True" CausesValidation="true" ValidationGroup="Group1"  ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#98272d"/> 
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
                <td align="center">
                     <asp:ImageButton ID="download" runat="server" CausesValidation="false"  
                                Style="margin-top: 20px" Width="145px" Height="48px"
                         ImageUrl="~/images/BtnDownload.png" OnClick="download_Click" 
                         />
                      
                </td></tr>
              
             
            </table>
        </div>
        
                      
</asp:Content>


