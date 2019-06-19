<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Practical_module4.aspx.cs"
    Inherits="Practical_module4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>practicalmodule4-BCLS</title>
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

window.onload = function(){
attempt1();
attempt2();
attempt3();
}

function Confirm() {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Are you sure you want to Submit the details ? ")) {
            confirm_value.value = "OK";
        } else {
            confirm_value.value = "CANCEL";
        }
        document.forms[0].appendChild(confirm_value);
    }

function ConfirmOrig() {
        var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value";
        if (confirm("Are you sure you want to Submit the details ? ")) {
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
        if (confirm("Are you sure you wants to Save the details ? ")) {
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
        .style7
        {
        }
        .style9
        {
            height: 43px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style11
        {
            width: 200px;
        }
        .style17
        {
            width: 200px;
            height: 15px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style30
        {
            width: 134px;
        }
        .style32
        {
            width: 134px;
            height: 15px;
        }
        .style34
        {
            height: 15px;
        }
        .style36
        {
            width: 200px;
            height: 30px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style37
        {
            width: 134px;
            height: 30px;
        }
        .style38
        {
            height: 3px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style41
        {
            font-weight: bold;
        }
        .style42
        {
            width: 100px;
        }
        .style43
        {
            height: 15px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style44
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style45
        {
            height: 30px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style47
        {
            width: 200px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .style23
        {
            width: 183px;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <div style="font-family: Arial; height: 100px;">
        <table style="display: inline-table;" class="style1" width="134px">
            <tr>
                <td bgcolor="White" valign="top" class="style23" rowspan="3">
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
                <td bgcolor="#F7F6F3" class="styleCC" ></br>
                     <asp:ImageButton ID="Button4" runat="server" Font-Bold="True" ImageUrl="~/images/BackToModulesBtn.png"
                        OnClick="Button4_Click" TCausesValidation="False" Height="35px"
                        Width="200px" />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Module 4: Infant FBAO - Conscious to Unconscious" Font-Names="Arial" Height="24px"></asp:Label>
                </td>
            </tr>
        </table>
    </div></br></br>
    <div align="center">
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;"
            align="center" width="1000px">
            <tr>
                <td class="styleCC" align="left" bgcolor="White" colspan="5">
                    &nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Text="STUDENT NAME:" Font-Names="Arial"></asp:Label><asp:Label ID="Label5" runat="server"
                            Font-Bold="False" Font-Size="Large" ForeColor="Black" Font-Names="Arial"></asp:Label>
                    
                    </td>
                    </tr>
                    <tr>
                 <td class="styleCC" align="left" bgcolor="White" colspan="5"> &nbsp;
                    <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Text="NRIC:" Font-Names="Arial"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                        Font-Names="Arial"></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            
            
            
               <tr>
                  <td class="styleCC" align="right" bgcolor="White" colspan="5"> &nbsp;
                  
                                  <asp:ImageButton ID="btn_submit2" OnClientClick="Confirm()" 
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                    Style="margin-top: 5px" Height="48px" OnClick="btn_submit_click" />

                    <asp:ImageButton ID="bt_allpass2" runat="server"  Width="145px"
                    Height="48px" 
                             Font-Bold="False" OnClientClick="Confirm_checkall()" Style="margin-top: 5px"
                            OnClick="bt_allpass_Click" ImageUrl="~/images/CheckAllBtn.png"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
            <tr>
                <td class="style41" rowspan="2" bgcolor="#98272D">
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td rowspan="2" align="center" bgcolor="#98272D">
                    <asp:Label ID="Label8" runat="server" Text="Assessment Criteria" Font-Bold="True"
                        ForeColor="White" Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                </td>
                <td colspan="3" align="center" bgcolor="#98272D">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Tick if steps performed correctly" ForeColor="White"
                            Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                        <br />
                        <br />
                    </b>
                </td>
            </tr>
            <tr bgcolor="#98272D">
                <td class="style11" align="center">
                    <b>
                        <asp:Label ID="Label10" runat="server" Text="1st attempt" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td class="style11" align="center">
                    <b>
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" Text="2nd attempt"
                            ForeColor="White" Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                    </b>
                </td>
                <td class="style11" align="center">
                    <b>
                        <asp:Label ID="Label12" runat="server" Text="3rd attempt" ForeColor="White" Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    1
                </td>
                <td>
                    <asp:Label ID="Label37" runat="server" Font-Bold="False" Text="<br>Assessment: Rescuer recognises signs of choking. <br>"
                        Style="font-family: Arial, Helvetica, sans-serif"></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox1" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style7">
                    2
                </td>
                <td style="font-family: Arial, Helvetica, sans-serif">
                    Perform back blows and chest thrusts. <br />
					5 back blows.
                    <br />
					•	"Sandwich" infant between both hands and arms, supporting the head and neck.
                    <br />
                    •	Straddle infant face down, head lower than the body over the rescuer's forearm and supported on the rescuer’s thigh.
                    <br />
                    •	Deliver 5 back blows forcefully between the shoulder blades with the heel of the other hand.
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox4" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox6" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style7">
                    3
                </td>
                <td>
                    <asp:Label ID="Label40" runat="server" Text="5 chest thrusts.</br> •	While supporting the head and neck, “sandwich” infant between the rescuer’s hands and arms and turn the infant on his/her back with head lower than the body. </br> •	Deliver 5 chest thrusts in the same manner as for chest compressions."
                        Style="font-family: Arial, Helvetica, sans-serif" Width="324px"></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox7" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox8" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox9" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style44">
                    4
                </td>
                <td class="style44">
                    <asp:Label ID="Label39" runat="server" Text="Check the infant's mouth for foreign body and remove only if visible."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox10" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox11" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox12" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style44">
                    5
                </td>
                <td class="style44">
                    <asp:Label ID="Label41" runat="server" Text="Repeat steps 2 - 4 until the foreign body is expelled or infant becomes unconscious."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox13" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox14" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox15" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style44">
                    6
                </td>
                <td class="style44">
                    <asp:Label ID="Label42" runat="server" Text="If infant becomes unconscious, proceed with the following steps:<br>
					Position the infant on his back on a firm surface, supporting head and neck."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox16" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox17" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox18" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style9">
                    7
                </td>
                <td class="style9">
                    Activate the EMS, dial for ambulance "995".
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox19" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox20" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox21" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style38">
                    8
                </td>
                <td class="style38">
                    <asp:Label ID="Label44" runat="server" Text="Perform 30 compressions, landmark and technique as per infant one-rescuer CPR."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox22" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox23" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox24" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style44">
                    9
                </td>
                <td class="style44">
                    Open the airway:<br />
					Perform head-tilt-chin-lift manoeuvre.<br />
                    Open mouth gently and check for any visible foreign body, remove if visible using the hooked little finger.
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox25" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox26" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox27" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style44">
                    10
                </td>
                <td class="style44">
                    <asp:Label ID="Label46" runat="server" Text="Assess breathing:</br> Check for normal breathing: Look for rise and fall of the chest (up to 10 seconds)."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox28" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox29" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox30" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style44">
                    11
                </td>
                <td class="style44">
                    <asp:Label ID="Label47" runat="server" Text="If no breathing, perform mouth-to-mouth and nose breathing.</br>If the airway is blocked, reposition infant’s head and re-attempt ventilation. If airway remains blocked repeat steps 8 – 11 until help arrives or infant’s airway is clear (able to give 2 successful ventilations)."></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox31" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox32" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox33" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style44">
                    12
                </td>
                <td class="style44">
                    <asp:Label ID="Label48" runat="server" Text="Place the infant in the <b>lateral</b> position after ensuring the presence of breathing and pulse.</br>Wait until help arrives. "></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox34" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                </td>
                <td class="style47" align="center">
                    <asp:CheckBox ID="CheckBox35" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                </td>
                <td class="style11" align="center">
                    <asp:CheckBox ID="CheckBox36" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                </td>
            </tr>
            <tr>
                <td class="style43" colspan="2" align="right">
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Result: " ForeColor="Black"></asp:Label>
                </td>
                <td class="style17" align="center">
                    <asp:Label ID="lb_attempt1_result" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style43" align="center">
                    <asp:Label ID="lb_attempt2_result" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="style32" align="center">
                    <asp:Label ID="lb_attempt3_result" runat="server"></asp:Label>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3">
                <td class="style45" colspan="2" align="right">
                    <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Date of assessment: "
                        ForeColor="Black"></asp:Label>
                </td>
                <td class="style36" align="center">
                    <asp:TextBox ID="TextBox1" runat="server" Width="96px" BackColor="#F7F6F3" Font-Bold="True"
                        ForeColor="Black" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="style45" align="center">
                    <asp:TextBox ID="TextBox2" runat="server" Width="101px" BackColor="#F7F6F3" Font-Bold="True"
                        ForeColor="Black" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="style37" align="center">
                    <asp:TextBox ID="TextBox3" runat="server" Width="97px" BackColor="#F7F6F3" Font-Bold="True"
                        ForeColor="Black" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="style44" align="right">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Instructor: " ForeColor="Black"></asp:Label>
                </td>
                <td class="style47" align="center">
                    <asp:Label ID="instructor1" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                </td>
                <td class="style44">
                    <asp:Label ID="instructor2" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                </td>
                <td class="style30" align="center">
                    <asp:Label ID="instructor3" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr bgcolor="#F7F6F3" align="center">
                <td class="style43" colspan="2" align="right">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Remarks: " ForeColor="Black"></asp:Label>
                </td>
                <td class="style43">
                    <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="bt_Save_Click" TextMode="MultiLine"
                        Width="153px" BackColor="#F7F6F3"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox4"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
                <td class="style43">
                    <asp:TextBox ID="TextBox5" runat="server" BackColor="#F7F6F3" Height="35px" OnTextChanged="bt_Save_Click"
                        TextMode="MultiLine" Width="148px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
                <td class="style34">
                    <asp:TextBox ID="TextBox6" runat="server" BackColor="#F7F6F3" Height="34px" OnTextChanged="bt_Save_Click"
                        TextMode="MultiLine" Width="146px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                        ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                </td>
            </tr>
           <tr>
                  <td class="styleCC" align="right" bgcolor="White" colspan="5"> &nbsp;
                  
                                  <asp:ImageButton ID="btn_submit" OnClientClick="Confirm()" 
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                    Style="margin-top: 5px" Height="48px" OnClick="btn_submit_click" />

                    <asp:ImageButton ID="bt_allpass" runat="server"  Width="145px"
                    Height="48px" 
                             Font-Bold="False" OnClientClick="Confirm_checkall()" Style="margin-top: 5px"
                            OnClick="bt_allpass_Click" ImageUrl="~/images/CheckAllBtn.png"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
        </table>
    </div>
    <br />
  
    </form>
</body>
</html>
