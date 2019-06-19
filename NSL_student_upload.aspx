<%@ Page Language="C#" MasterPageFile="~/NSL_MasterPage.master" AutoEventWireup="true" CodeFile="NSL_student_upload.aspx.cs" Inherits="NSL_student_upload" Title="Untitled Page" %>
<asp:Content ID="head" runat="server" ContentPlaceHolderID="head">
    <title>Upload Students -NSL</title>
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
            
        
    </script>
    <style type="text/css">
     
        .style1
        {
          
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
        .style43
        {
            height: 50px;
        }
        #form1
        {
            font-family: Arial;
        }
     
         .style450
        {
            height: 40px;
            border-bottom: 1px solid #98272d;
              border-top: 1px solid #98272d;
               border-left: 1px solid #98272d;
            border-right: 1px solid #98272d;
        }
           
        
        
        </style>

    <script language="javascript" type="text/javascript">

    </script>

</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div><asp:Label ID="Lb_subheading" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
        Text="UPLOAD STUDENTS" Font-Names="Arial"></asp:Label></div>
        
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
  
      <div style="height: 1000px; font-family: Arial;">
      </br></br>
          
                    
                        <table  class="center">
                            <tr>
                                <td class="style450" align="center">
                                   </br>    
                                    <asp:HyperLink ID="hl_studenttemplate" runat="server" Font-Size="Large" 
                                        ForeColor="Blue" Target="_blank">Download Student Upload Template</asp:HyperLink> <br /><br />
                                          &nbsp; <span style="color: Red">* </span>Attach CSV file  <asp:FileUpload ID="fileuploadstudentdb" runat="server" Width="248px" />
                     
                           <br />
                         <asp:ImageButton ID="btn_student_upload" OnClientClick="upload_student_excel()" OnClick="btn_student_upload_Click"
                        runat="server" CausesValidation="false"  Width="145px" Height="48px" Style="margin-top: 20px" ImageUrl="~/images/BtnAppend.png" />
                           <br />       
                         <asp:Label ID="lb_upload_err" runat="server" Text="Label" Visible="False" ForeColor="#FF3300"></asp:Label>
                         
                                        
                                        
                                        
                                </td>
                            </tr>
                                       

                        
                                       

                        </table>
              
        </div>
        
                      
</asp:Content>


