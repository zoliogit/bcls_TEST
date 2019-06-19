<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Practical_module3.aspx.cs"
    Inherits="Practical_module3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>practicalmodule3-BCLS</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
   function attempt1() {
    if (document.getElementById('<%=CheckBox1.ClientID%>').checked && document.getElementById('<%=CheckBox4.ClientID%>').checked  && document.getElementById('<%=CheckBox7.ClientID%>').checked  && document.getElementById('<%=CheckBox10.ClientID%>').checked  && document.getElementById('<%=CheckBox13.ClientID%>').checked  && document.getElementById('<%=CheckBox16.ClientID%>').checked  && document.getElementById('<%=CheckBox19.ClientID%>').checked  && document.getElementById('<%=CheckBox22.ClientID%>').checked && document.getElementById('<%=CheckBox25.ClientID%>').checked  && document.getElementById('<%=CheckBox28.ClientID%>').checked  && document.getElementById('<%=CheckBox31.ClientID%>').checked  && document.getElementById('<%=CheckBox34.ClientID%>').checked)  
      {
   
     document.getElementById("lb_attempt1_result").innerHTML = 'Passed';

     } 
     else 
     {
         document.getElementById("lb_attempt1_result").innerHTML = 'Referred';

    }
    }
  function attempt2() {
    if (document.getElementById('<%=CheckBox2.ClientID%>').checked && document.getElementById('<%=CheckBox5.ClientID%>').checked  && document.getElementById('<%=CheckBox8.ClientID%>').checked  && document.getElementById('<%=CheckBox11.ClientID%>').checked  && document.getElementById('<%=CheckBox14.ClientID%>').checked  && document.getElementById('<%=CheckBox17.ClientID%>').checked  && document.getElementById('<%=CheckBox20.ClientID%>').checked  && document.getElementById('<%=CheckBox23.ClientID%>').checked  && document.getElementById('<%=CheckBox26.ClientID%>').checked  && document.getElementById('<%=CheckBox29.ClientID%>').checked  && document.getElementById('<%=CheckBox32.ClientID%>').checked  && document.getElementById('<%=CheckBox35.ClientID%>').checked)  
      {
   
     document.getElementById("lb_attempt2_result").innerHTML = 'Passed';

     } else {
         document.getElementById("lb_attempt2_result").innerHTML = 'Referred';

    }
}
  function attempt3() {
   if (document.getElementById('<%=CheckBox3.ClientID%>').checked && document.getElementById('<%=CheckBox6.ClientID%>').checked  && document.getElementById('<%=CheckBox9.ClientID%>').checked  && document.getElementById('<%=CheckBox12.ClientID%>').checked  && document.getElementById('<%=CheckBox15.ClientID%>').checked  && document.getElementById('<%=CheckBox18.ClientID%>').checked  && document.getElementById('<%=CheckBox21.ClientID%>').checked  && document.getElementById('<%=CheckBox24.ClientID%>').checked  && document.getElementById('<%=CheckBox27.ClientID%>').checked  && document.getElementById('<%=CheckBox30.ClientID%>').checked  && document.getElementById('<%=CheckBox33.ClientID%>').checked  && document.getElementById('<%=CheckBox36.ClientID%>').checked)  
      {
   
     document.getElementById("lb_attempt3_result").innerHTML = 'Passed';

     } else {
         document.getElementById("lb_attempt3_result").innerHTML = 'Referred';

    }
}
function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to Submit the test ?  ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
            }
            document.forms[0].appendChild(confirm_value);
        }
 function Confirm2() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to Save the details ? ")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
           function getConfirmationValue2() 
       {var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value2";
            if (confirm("Student has not completed all the steps? Are you sure you want to submit the details? ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
            }
            document.forms[0].appendChild(confirm_value);
       }
        function Confirm_checkall(){
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Are you sure you wants to tick all the check boxes ?")) {
            confirm_value.value = "OK";
        } else {
            confirm_value.value = "No";
        }
        document.forms[0].appendChild(confirm_value);
    }
    </script>

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
        p.MsoNormal
        {
            margin-top: 0cm;
            margin-right: 0cm;
            margin-bottom: 10.0pt;
            margin-left: 0cm;
            line-height: 115%;
            font-size: 11.0pt;
            font-family: "Calibri" , "sans-serif";
        }
        .shape
        {
            behavior: url(#default#VML);
        }
        .style4
        {
            height: 40px;
        }
        .style7
        {
            height: 31px;
        }
        .style10
        {
            height: 32px;
        }
        .style14
        {
            width: 456px;
        }
        .style15
        {
            height: 38px;
            width: 456px;
        }
        .style16
        {
            height: 40px;
            width: 456px;
        }
        .style17
        {
            height: 34px;
            width: 456px;
        }
        .style18
        {
            height: 36px;
            width: 456px;
        }
        .style19
        {
            height: 31px;
            width: 456px;
        }
        .style20
        {
            height: 33px;
            width: 456px;
        }
        .style21
        {
            height: 27px;
            width: 456px;
        }
        .style22
        {
            height: 44px;
        }
        .style24
        {
            width: 45px;
        }
        .style25
        {
            height: 38px;
            width: 45px;
        }
        .style26
        {
            height: 40px;
            width: 45px;
        }
        .style27
        {
            height: 34px;
            width: 45px;
        }
        .style28
        {
            height: 36px;
            width: 45px;
        }
        .style29
        {
            height: 31px;
            width: 45px;
        }
        .style30
        {
            height: 33px;
            width: 45px;
        }
        .style31
        {
            height: 27px;
            width: 45px;
        }
        .style38
        {
            height: 31px;
            width: 173px;
        }
        .style41
        {
            height: 32px;
            width: 173px;
        }
        .style42
        {
            height: 44px;
            width: 168px;
        }
        .style43
        {
            height: 31px;
            width: 168px;
        }
        .style44
        {
            height: 32px;
            width: 168px;
        }
        .style45
        {
            height: 44px;
            width: 135px;
        }
        .style46
        {
            height: 31px;
            width: 135px;
        }
        .style47
        {
            height: 32px;
            width: 135px;
        }
        .style48
        {
            width: 124px;
        }
        #form1
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style49
        {
            width: 45px;
            height: 165px;
        }
        .style50
        {
            width: 456px;
            height: 165px;
        }
        .style51
        {
            height: 165px;
            width: 168px;
        }
        .style52
        {
            height: 165px;
            width: 135px;
        }
        .style53
        {
            height: 165px;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <div style="font-family: Arial; height: 134px;">
        <table style="display: inline-table;" class="style1" width="100">
            <tr>
                <td bgcolor="White" valign="top" class="style48" rowspan="3">
                    <div style="background-color: White; width: 237px; height: 89px; margin-top: 0px;"
                        align="center">
                        <br />
                        <img alt="" src="images/NPHSlogoTransparentBig.png" style="width: 220px; height: 43px;
                            background-position: center; margin-top: 23;" /><br />
                    </div>
                    <div style="height: 3px; width: 237px; background-color: #98272d">
                    </div>
                </td>
                <td class="styleAA" align="center" style="background-image: url(images/navigationBar.png)"
                    colspan="2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="XX-Large" Font-Strikeout="False"
                        ForeColor="#F9FAFA" Text="CPRact" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="styleBB" bgcolor="#efa237" colspan="2">
                    <asp:Label ID="lb_welcome" runat="server" Text="Label" Font-Bold="False" Style="margin-left: 8px"
                        ForeColor="Black" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
            <tr>
                <td bgcolor="#F7F6F3" class="styleCC">
                 </br>
                    <asp:ImageButton ID="Button4" runat="server" ImageUrl="~/images/BackToModulesBtn.png" Height="35px" 
                        OnClick="Button4_Click"  Width="200px" CausesValidation="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Module 3: Infant One-Rescuer CPR" Font-Names="Arial"></asp:Label>
               </td>
            </tr>
        </table>
    </div>
    <div align="center">
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;"
            align="center" width="1000px">
            <tr>
                <td class="styleCC" align="left" bgcolor="White" colspan="5">
                    &nbsp;
                    <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Text="STUDENT NAME:" Font-Names="Arial"></asp:Label>
                    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Font-Names="Arial"></asp:Label>
                        </td>
                        </tr>
                        <tr>
                        <td class="styleCC" align="left" bgcolor="White" colspan="5">
                     &nbsp;
                    <asp:Label ID="Label14" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Text="NRIC:" Font-Names="Arial"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Font-Names="Arial"></asp:Label>
                </td>
            </tr>
              <tr>
                  <td class="styleCC" align="right" bgcolor="White" colspan="5"> &nbsp;
                  
                                  <asp:ImageButton ID="btn_submit2" OnClientClick="Confirm()" 
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                    Style="margin-top: 5px" Height="48px" OnClick="btn_submit_click" />

                    <asp:ImageButton ID="bt_allpass2" runat="server"  Width="145px"
                    Height="48px" Style="margin-top: 5px"
                             Font-Bold="False" OnClientClick="Confirm_checkall()"
                            OnClick="bt_allpass_Click" ImageUrl="~/images/CheckAllBtn.png"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
         
            <tr bgcolor="#98272D">
                <td rowspan="2" class="style24" bgcolor="#98272D">
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td class="style14" align="center" rowspan="2" bgcolor="#98272D">
                    <asp:Label ID="Label8" runat="server" Text="Assessment Criteria" Font-Bold="True"
                        ForeColor="White"></asp:Label>
                </td>
                <td class="style4" align="center" colspan="3" bgcolor="#98272D">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Tick if steps performed correctly" ForeColor="White"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr bgcolor="#98272D">
                <td class="style42" align="center">
                    <b>
                        <asp:Label ID="Label10" runat="server" Text="1st attempt" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:Label ID="Label11" runat="server" Text="2nd attempt" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:Label ID="Label12" runat="server" Text="3rd attempt" ForeColor="White"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style25">
                    1
                </td>
                <td class="style15">
                    <asp:Label ID="Label23" runat="server" Text="Check for <b>danger</b>: Ensure the environment is safe and remove the infant from danger."
                        Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox3" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();"
                            runat="server" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style26">
                    2
                </td>
                <td class="style16">
                    <asp:Label ID="Label15" runat="server" Text="Check for <b>responsiveness</b>:</br>Call, tap or shake the infant's shoulders firmly."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox4" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox5" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox6" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style26">
                    3
                </td>
                <td class="style16">
                    If infant is unresponsive, activate EMS by dialing for an ambulance "995" . Get AED if visible or within 100 meters.
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox7" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox8" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox9" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style27">
                    4
                </td>
                <td class="style17">
                    <asp:Label ID="Label24" runat="server" Text="Place infant on a firm flat surface."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox10" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox11" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox12" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style24">
                    5
                </td>
                <td class="style14">
                    <asp:Label ID="Label25" runat="server" Font-Bold="False" Text="Open the airway:</br> Perform head-tilt-chin-lift manoeuvre.</br> Do not overextend the neck.</br> Check for normal breathing: Look for the rise and fall of the chest. While maintaining head-tilt-chin-lift with one 
hand on the forehead, feel for brachial pulse with the pulp of two fingers of the other hand.  (all of these-Upto 10 Seconds)"></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox13" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox14" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox15" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style28">
                    6
                </td>
                <td class="style18">
                    <asp:Label ID="Label26" runat="server" Text="Locate hand position for chest compression. Place index finger on the infant's nipple. Draw an imaginary line between the nipples. Place middle and ring fingers next to index finger. Move 3 fingers to the center of sternum. Position fingers upright. Lift index finger but maintain middle and ring fingers  on sternum."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox16" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox17" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox18" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style49">
                    7
                </td>
                <td class="style50">
                    <asp:Label ID="Label27" runat="server" Text="Compress chest at least 3-4 cm vertically, counting: <br>1 and 2 and 3 and 4 and 5 and,<br>1 and 2 and 3 and 4 and 10 and,<br>1 and 2 and 3 and 4 and 15,<br>1 and 2 and 3 and 4 and 20,<br>1 and 2 and 3 and 4 and 25,<br>1 and 2 and 3 and 4 and 30."></asp:Label>
                </td>
                <td class="style51" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox19" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style52" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox20" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style53" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox21" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style29">
                    8
                </td>
                <td class="style19">
                    <asp:Label ID="Label21" runat="server" Text="Perform mouth-to-mouth and nose breathing. Give 2 breaths (1sec / breath)."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox22" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox23" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox24" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style30">
                    9
                </td>
                <td class="style20">
                    <asp:Label ID="Label22" runat="server" Text="Perform 30 compressions followed by 2 breaths (repeat steps 6 -9 for a total of 5 cycles)."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox25" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox26" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox27" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style31">
                    10
                </td>
                <td class="style21">
                    <asp:Label ID="Label28" runat="server" Text="Assess pulse and breathing after 5 cycles. If no pulse, repeat steps 6 -9."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox28" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox29" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox30" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style29">
                    11
                </td>
                <td class="style19">
                    <asp:Label ID="Label29" runat="server" Text="If pulse is present, check for breathing. If no breathing, perform rescue breathing."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox31" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox32" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox33" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style27">
                    12
                </td>
                <td class="style17">
                    <asp:Label ID="Label30" runat="server" Text="If breathing is present, place infant in the lateral position and wait till help arrives."></asp:Label>
                </td>
                <td class="style42" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox34" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </b>
                </td>
                <td class="style45" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox35" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </b>
                </td>
                <td class="style22" align="center">
                    <b>
                        <asp:CheckBox ID="CheckBox36" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style7" colspan="2" align="right">
                    <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Result: " ForeColor="Black"></asp:Label>
                </td>
                <td class="style43" align="center">
                    <asp:Label ID="lb_attempt1_result" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style46" align="center">
                    <asp:Label ID="lb_attempt2_result" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style38" align="center">
                    <asp:Label ID="lb_attempt3_result" runat="server"></asp:Label>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style10" colspan="2" align="right">
                    <asp:Label ID="Label32" runat="server" Font-Bold="True" Text="Date of assessment: "
                        ForeColor="Black"></asp:Label>
                </td>
                <td class="style44" align="center">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100px" BackColor="#F7F6F3" Font-Bold="True"
                        ForeColor="Black" OnTextChanged="bt_Save_Click"></asp:TextBox>
                </td>
                <td class="style47" align="center">
                    <asp:TextBox ID="TextBox2" runat="server" Width="95px" BackColor="#F7F6F3" Font-Bold="True"
                        ForeColor="Black"></asp:TextBox>
                </td>
                <td class="style41" align="center">
                    <asp:TextBox ID="TextBox3" runat="server" Width="91px" BackColor="#F7F6F3" ForeColor="Black"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style10" colspan="2" align="right">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Instructor:" ForeColor="Black"></asp:Label>
                </td>
                <td class="style44" align="center">
                    <asp:Label ID="instructor1" runat="server" Text="Label" Visible="False" Font-Bold="True"
                        ForeColor="Black"></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:Label ID="instructor2" runat="server" Text="Label" Visible="False" Font-Bold="True"
                        ForeColor="Black"></asp:Label>
                </td>
                <td class="style41" align="center">
                    <asp:Label ID="instructor3" runat="server" Text="Label" Visible="False" Font-Bold="True"
                        ForeColor="Black"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style10" colspan="2" bgcolor="#F7F6F3" align="right">
                    <asp:Label ID="Label35" runat="server" Font-Bold="True" Text="Remarks:" ForeColor="Black"></asp:Label>
                </td>
                <td class="style44">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="196px" OnTextChanged="bt_Save_Click"
                        BackColor="#F7F6F3"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox4"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
                <td class="style47">
                    <asp:TextBox ID="TextBox5" runat="server" BackColor="#F7F6F3" OnTextChanged="bt_Save_Click"
                        TextMode="MultiLine"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
                <td class="style10">
                    <asp:TextBox ID="TextBox6" runat="server" BackColor="#F7F6F3" OnTextChanged="bt_Save_Click"
                        TextMode="MultiLine"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <tr>
              <td class="styleCC" align="right"  bgcolor="White" colspan="5"> &nbsp;
                  <asp:ImageButton ID="btn_submit" OnClientClick="Confirm()" 
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                    Style="margin-top: 5px" Height="48px" OnClick="btn_submit_click" />
                     <asp:ImageButton ID ="bt_allpass" ImageUrl="~/images/CheckAllBtn.png" runat="server" Width="145px"
                     Height="48px"
                              Font-Bold="False" OnClientClick="Confirm_checkall()"
                            OnClick="bt_allpass_Click"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
        </table>
    </div>
   
    </form>
</body>
</html>
