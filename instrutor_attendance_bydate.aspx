<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="instrutor_attendance_bydate.aspx.cs" Inherits="instrutor_attendance_bydate" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Passed_students_searchNRIC-BCLS </title>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="ATTENDANCE REPORT" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
  
        <div>
            <table class="style1" style="display: inline-table;" align="center">
                <tr>
                    <td class="styleCC" align="center" bgcolor="White">
                      
                     <%--   <p>
                            Enter Date :
                            <asp:TextBox ID="txtSearch" runat="server" Width="107px" onfocus="if (this.value == 'dd-mm-yyyy') this.value = '';"
                                onblur="if (this.value == '') this.value = 'dd-mm-yyyy';" value="dd-mm-yyyy" />&nbsp;&nbsp;
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"
                                Style="height: 26px" />&nbsp;&nbsp;
                            <br />
                         
                        </p>
                        --%>
                        <div align="center">     
                        <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="Select Date" Font-Names="Arial" Style="margin-left: 10px"></asp:Label>&nbsp; &nbsp;
                          
                                  <asp:DropDownList ID="dl_staff_date" runat="server" AutoPostBack="true"
        Style="margin-left: 8px;
                                    text-align: center; text-align: center; margin-right: 10px;" ForeColor="Black"
                                    Width="100px" Height="34px" 
        onselectedindexchanged="dl_staff_date_SelectedIndexChanged">
        
                                </asp:DropDownList>
                   </div>
                        
                     <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;"
                            ForeColor="#333333" CellSpacing="2" Width="859px" OnRowCommand="GridView1_RowCommand"
                            OnRowDataBound="GridView1_RowDataBound1">
                            <RowStyle BackColor="#F7F6F3" ForeColor="Black" />
                            <Columns>
                                <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Left" HeaderStyle-BackColor="#98272d">
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="instructor_id" ItemStyle-HorizontalAlign="Left" HeaderText="Staff ID"
                                    HeaderStyle-BackColor="#98272d" SortExpression="instructor_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="staff_nric" ItemStyle-HorizontalAlign="Left" HeaderText="Staff NRIC"
                                    HeaderStyle-BackColor="#98272d" SortExpression="staff_nric">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                
                                 <asp:BoundField DataField="staff_employee_no" ItemStyle-HorizontalAlign="Left" HeaderText="Staff No"
                                    HeaderStyle-BackColor="#98272d" SortExpression="staff_employee_no">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="staff_name" ItemStyle-HorizontalAlign="Left" HeaderText="Staff Name"
                                    HeaderStyle-BackColor="#98272d" SortExpression="staff_name">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#284775" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                      <%--  <br />
                        <br />
                        <br />
                        <br />--%>
                        <div align="center">
                        <asp:ImageButton ID="download" runat="server" CausesValidation="false"  
                                Style="margin-top: 20px" Width="145px" Height="48px"
                         ImageUrl="~/images/BtnPrint.png" OnClick="download_Click" 
                         />
                        
                       
                        </div>
                    </td>
                </tr>
            </table>
        </div>
   
</asp:Content>
