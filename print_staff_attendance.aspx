<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_staff_attendance.aspx.cs" Inherits="print_staff_attendance"  EnableEventValidation = "false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PrintAttendance-BCLS</title>
        <style type="text/css">
        body, html
        {
            height: 100%;
            width: 100%;
        }
        #right
        {
            height: 100%;
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
            .style50
            {
            }
            .style51
            {
                margin-left: auto;
                margin-right: auto;
                font-family: Arial, Helvetica, sans-serif;
                height: 50px;
            }
            .style52
            {
                height: 59px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table  style="display: inline-table;" class="style1" width="100">
          
           
            <tr>
                <td class="style51" align="center">
                </br>
                        <asp:Label ID="lb_attendance_date" runat="server" Font-Bold="False" Font-Size="25px" ForeColor="Black"
                        Text="Attendance Report For " Font-Names="Arial"></asp:Label>
                </td>
            </tr>
          <%--<tr>
            <td align="right" bgcolor="#FFFFFF"><asp:ImageButton ID="btnExportasPDF" runat="server" CausesValidation="false"  
                                 Width="145px" Height="48px"
                         ImageUrl="~/images/BtnDownload.png" OnClick="btnExportasPDF_Click" 
                         /></td></tr>--%>
        </table>
    </div>
    <div align="center">
    <br />
    
    
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 769px;font-family:Arial, Helvetica, sans-serif;"
                            CellSpacing="2" Width="890px" >
                          
                            <Columns>
                                <asp:TemplateField HeaderText="No" ItemStyle-HorizontalAlign="Left" >
                                    <ItemTemplate>
                                        <%# ((GridViewRow)Container).RowIndex + 1%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="instructor_id" ItemStyle-HorizontalAlign="Left" HeaderText="Staff ID"
                                     SortExpression="instructor_id">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="staff_nric" ItemStyle-HorizontalAlign="Left" HeaderText="Staff NRIC"
                                     SortExpression="staff_nric">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                
                                 <asp:BoundField DataField="staff_employee_no" ItemStyle-HorizontalAlign="Left" HeaderText="Staff No"
                                     SortExpression="staff_employee_no">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="staff_name" ItemStyle-HorizontalAlign="Left" HeaderText="Staff Name"
                                     SortExpression="staff_name">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                 <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Left"  >
                                    <ItemTemplate>
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                   
                        </asp:GridView></div>
                      
       <table bgcolor="White" align="center"  style="border-collapse: collapse;
            width: 790px;">
         
         
         
         
         
         
            <tr>
                <td align="left" class="style52">
                <br /> <br />
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="17px" 
                        Text="Chief Instructors" 
                        Font-Names="Arial" Font-Underline="True"></asp:Label>&nbsp;
                 &nbsp;  
                </td>
                <td align="left" class="style52">
                    </td>
            </tr>
          
            <tr>
                <td >
                    <br /> <br />
                      <asp:Panel ID="Panel1"  runat="server" >
                      </asp:Panel>
                      <br /> <br />
                </td>
                <td align="left">  
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" height="50px" colspan="2"><br />
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="17px" Font-Underline="True"  Text="Director"
                        Font-Names="Arial"></asp:Label> &nbsp;
                   
                </td>
            </tr>
            <tr>
                <td  height="50px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp
                    <asp:Label ID="dr_name" runat="server"  Font-Names="Arial" 
                        Font-Size="17px" Text="Shree Devi Gopal"></asp:Label>
                </td>
                <td class="style50" >
                    &nbsp;</td>
            </tr>
         <%--   <tr>
                <td  align="right" height="50px">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="17px" Text="Remarks:"
                        Font-Names="Arial"></asp:Label>&nbsp;
                </td>
                <td height="100px">
                    <b>
                        <asp:Label ID="lb_date" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                    
                </td>
            </tr>
            <tr>
                <td  align="right" >
                      <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="17px" Text="Date Printed:"
                        Font-Names="Arial"></asp:Label>&nbsp; &nbsp;</td>   
                <td >
                 <asp:Label ID="lb_date_printed" runat="server" Font-Bold="True" Font-Size="17px"
                        Font-Names="Arial"></asp:Label></td>
                    &nbsp;</tr>--%>
       
        </table>
               
    </form>
</body>
</html>
