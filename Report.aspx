<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Reports-BCLS </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">

        function upload_student_excel() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to Export the Student Details ? ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
            }
            document.forms[0].appendChild(confirm_value);
        }
        
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to clear all groups ? ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
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
        .style36
        {
            height: 40px;
        }
        .style37
        {
            height: 36px;
        }
        .style38
        {
            height: 32px;
        }
        .style39
        {
            height: 32px;
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
        .style2
        {
            width: 153px;
        }
        .style3
        {
            margin-left: auto;
            margin-right: auto;
            font-family: Arial, Helvetica, sans-serif;
            height: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="WORK BENCH" Font-Names="Arial"></asp:Label>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div style="border: 2px solid #98272d; position: absolute; top: 161px; left: 355px;
        height: 235px; width: 400px;">
        <h3 style="margin-top: 0px">
            Students</h3>
        <asp:LinkButton ID="lb_cert" runat="server" OnClick="lb_cert_Click" Font-Size="Large">Passed Students For Approval</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" Font-Size="Large">Students Pending Certificate Email</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Font-Size="Large">Students passed In Last 3 Months</asp:LinkButton>
        <br />
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click" Font-Size="Large">Search NRIC For Passed Students</asp:LinkButton>
    <br />
    <br />
       <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click" Font-Size="Large">Search NRIC </asp:LinkButton>
   <br />
    <br />
    </div>
    <div style="border: 2px solid #98272d; position: absolute; top: 158px; left: 850px;
        height: 235px; width: 400px;">
        <h3 style="margin-top: 0px">
            Sessions/Instructors</h3>
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Font-Size="Large">BCLS 
                    and CPR AED Training Report</asp:LinkButton><br />
        <br />
        <asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton6_Click" Font-Size="Large">Instructors attendance by date</asp:LinkButton>
    </div>
    <div style="border: 2px solid #98272d; position: absolute; top: 453px; left: 354px;
        height: 230px; width: 400px;">
        <h3 style="margin-top: 0px">
            Append Student List</h3>
        <table align="center">
            <tr>
                <td class="style38">
                    &nbsp; <span style="color: Red">* </span>Attach CSV file
                </td>
                <td class="style39">
                    <asp:FileUpload ID="fileuploadstudentdb" runat="server" Width="248px" />
                </td>
            </tr>
            <tr>
                <td class="style36" align="center" colspan="2">
                    <asp:ImageButton ID="btn_student_upload" OnClientClick="upload_student_excel()" OnClick="btn_student_upload_Click"
                        runat="server"  Width="145px" Height="48px" Style="margin-top: 20px" ImageUrl="~/images/BtnAppend.png" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Label ID="lb_upload_err"  runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="border: 2px solid #98272d; position: absolute; top: 451px; left: 15px;
        height: 230px; width: 400px; left: 850px;">
        <h3 style="margin-top: 0px">
            Template & User Manual</h3>
        <asp:HyperLink ID="hl_studenttemplate"  ForeColor="Blue" runat="server" Target="_blank"
            Font-Size="Large">Student Upload Template</asp:HyperLink>
        <br />
        <br />
         <asp:LinkButton ID="hl_cleargroup" Text="Clear Groups"  ForeColor="Blue" 
            runat="server" OnClientClick="Confirm()"
            Font-Size="Large" onclick="hl_cleargroup_Click"/>
        <br />
        <br />
       
        <asp:HyperLink ID="hl_usermanual" ForeColor="Blue"  runat="server" Target="_blank"
            Font-Size="Large">User Manual</asp:HyperLink>
    </div>
</asp:Content>
