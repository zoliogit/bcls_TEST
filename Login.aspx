<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>login-CPRact </title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <style type="text/css">
        .RBL label
{
    display: block;
}

.RBL td
{
    text-align: center;
    width: 20px;
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
        .style8
        {
            height: 61px;
        }
        .style18
        {
            margin-left: auto;
            margin-right: auto;
            height: 35px;
        }
        .style19
        {
            margin-left: auto;
            margin-right: auto;
            height: 20px;
        }
        
  .black_overlay{
display:none;
position: absolute;
top: 0%;
left: 0%;
width: 100%;
height: 100%;
background-color:black;
z-index:1001;
 -moz-opacity: 0.8;
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
font-size:25px;
color:#efa237;
font-weight:bold;
}    
        
    </style>
    <script type="text/javascript">
        function SetUsrnamPsswordHiddenfield()
        {
            document.getElementById('hdnfldusername').value = document.getElementById('tb_loginid').value;
            document.getElementById('tb_loginid').value = "";
            document.getElementById('hdnfldpassword').value = document.getElementById('tb_password').value;
            document.getElementById('tb_password').value = "";
         //   alert('HAI');
        }
function check()
{
if(!document.getElementById("RB_BCLS").checked)
{
alert("Select BCLS/Simulation to continue");
}
}
function RadioCheck(rb) {

      if(!document.getElementById("RB_BCLS").checked)
{
document.getElementById("RB_BCLS").checked=true;
document.getElementById("RB_simulation").checked=false;
}

    } 
  function UserLoginClose() {
            document.getElementById('light').style.display = 'none';
            document.getElementById('fade').style.display = 'none';
            return false;
        }   
</script>

</head>
<body bgcolor="White" onload="window.history.forward();">
    <form method="post" id="form1" runat="server"  autocomplete="off" >
          
    <div style="height: 100%; font-family: Arial;">
        <table class="style1" align="center">
            <tr>
                <td class="styleAA" style="background-image: url(images/navigationBar.png)" align="center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="XX-Large" Font-Strikeout="False"
                        ForeColor="White" Style="width: 106px;" Text="CPRact" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#efa237" class="styleBB" align="center">
                    <asp:Label ID="Label4" runat="server" ForeColor="White" Text=" Login Here" Style="width: 106px;"
                        Font-Names="Arial"></asp:Label>
                    &nbsp;
                </td>
            </tr>
            
   
            
            <tr>
                <td class="style8" bgcolor="White">
                    </br>
                    <table class="center" align="center">
                     
                        <tr>
                            <td align="right" class="style18">
                                <asp:Label ID="Label2" runat="server" Font-Bold="False" ForeColor="Black" Style="width: 106px;
                                    text-align: left;" Text="User Name" Font-Names="Arial"></asp:Label>
                            </td>
                            <td align="left" class="center">
                                <asp:TextBox ID="tb_loginid" autocomplete="off"  AutoCompleteType="Disabled" runat="server" ForeColor="#5D7B9D" Style="margin-left: 8px;
                                    width: 106px;"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style18">
                                <asp:Label ID="Label3" runat="server" Font-Bold="False" ForeColor="Black" Text="Password"
                                    Font-Names="Arial" Style="width: 106px;"></asp:Label>
                            </td>
                            <td align="left" class="style18">
           <asp:HiddenField ID="hdnfldusername" runat="server" />                         
    <asp:HiddenField ID="hdnfldpassword" runat="server" />  

                             <%--   <input type="password" style="display:none;"/>--%>
                                <asp:TextBox ID="tb_password"  autocomplete="off"    AutoCompleteType="Disabled"   Style="margin-left: 8px; width: 106px;" runat="server"
                                    ForeColor="#5D7B9D" TextMode="Password" >*</asp:TextBox>
                            </td>
                        </tr>
                       <tr>
                            <td align="right" class="style18">
                                <asp:Label ID="Label5" runat="server" Font-Bold="False" ForeColor="Black" Text="Module"
                                    Font-Names="Arial" Style="width: 106px;"></asp:Label>
                            </td>
                            <td align="left" class="style18">
                                <asp:DropDownList ID="dl_version" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="110px" Height="25px">
                                   <asp:ListItem Text="CPRact" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="SIMPRact 1.1" Value="5"></asp:ListItem>
                                   <asp:ListItem Text="SIMPRact 2.1" Value="2" ></asp:ListItem>
                                   <asp:ListItem Text="SIMPRact 2.2" Value="3"></asp:ListItem>
                                   <asp:ListItem Text="SIMPRact 3.1" Value="4"></asp:ListItem>
                                  
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style19" colspan="2">
                                <asp:Label ID="lb_invalid" runat="server" ForeColor="#FF3300" Text="Invalid userID or Password !"
                                    Visible="False"></asp:Label>
                            </td>
                            
                        </tr>
                        
                        <tr>
                            <td colspan="2" align="center" class="center">
                                <%--<asp:ImageButton ID="bt_login"   runat="server" Width="145px" Height="48px"
                                    ImageUrl="~/images/BtnLogin.png" onclick="bt_login_Click" />
                                  
                                    <asp:ImageButton ID="bt_NSL_Login" runat="server" Width="145px" Height="48px"
                                    ImageUrl="~/images/BtnLogin.png"  Visible="false" 
                                    onclick="bt_NSL_Login_Click"/>--%>
                                    
                                    <asp:ImageButton ID="bt_login"  runat="server"  OnClientClick="SetUsrnamPsswordHiddenfield()"  CausesValidation="False" onclick="bt_login_Click" 
                                    ImageUrl="~/images/BtnLogin.png" Width="145px" Height="48px"/>&nbsp;&nbsp;
                     <%--       <asp:ImageButton ID="bt_NSL_Login" runat="server" 
                      CausesValidation="False" onclick="bt_NSL_Login_Click" ImageUrl="~/images/simLoginBtn.png"  Width="200px" Height="35px" />
                                   
                      --%>             
                      
                         </td>
                        </tr>   
                        
                        <tr>
                            <td colspan="2" align="center" class="center">
                                <asp:HyperLink ID="hl_termsofUse" 
     runat="server" 
     NavigateUrl="http://www2.np.edu.sg/home/TermsAndPrivacy/Pages/terms.aspx" 
     Target="_blank">
       Terms of Use
</asp:HyperLink>&nbsp;&nbsp;
                                <asp:HyperLink ID="hl_privacyStatement" 
     runat="server" 
     NavigateUrl="http://www2.np.edu.sg/home/TermsAndPrivacy/Pages/privacy.aspx" 
     Target="_blank">
       Privacy Statement
</asp:HyperLink>
                                &nbsp;</td>
                        </tr>   
                        
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
