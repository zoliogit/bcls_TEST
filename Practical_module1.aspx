<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Practical_module1.aspx.cs"
    Inherits="Pracical_module1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>practicalmodule1-BCLS</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <script type="text/javascript">
function attempt1() {
var ventilation1 =    document.getElementById('<%=tb_ventilation1.ClientID%>');
var compression1 =    document.getElementById('<%=tb_compression1.ClientID%>');
var cycle1 =    document.getElementById('<%=tb_cycle1.ClientID%>');
if (document.getElementById('<%=CheckBox1.ClientID%>').checked && document.getElementById('<%=CheckBox4.ClientID%>').checked  && document.getElementById('<%=CheckBox7.ClientID%>').checked  && document.getElementById('<%=CheckBox10.ClientID%>').checked  && document.getElementById('<%=CheckBox13.ClientID%>').checked  && document.getElementById('<%=CheckBox16.ClientID%>').checked  && document.getElementById('<%=CheckBox19.ClientID%>').checked  && document.getElementById('<%=CheckBox22.ClientID%>').checked && document.getElementById('<%=CheckBox25.ClientID%>').checked  && document.getElementById('<%=CheckBox28.ClientID%>').checked  && document.getElementById('<%=CheckBox31.ClientID%>').checked  && document.getElementById('<%=CheckBox34.ClientID%>').checked  && document.getElementById('<%=CheckBox37.ClientID%>').checked && ventilation1.value.length >= 1  && compression1.value.length >= 1 && cycle1.value.length >= 1)  
    {
  		
 		document.getElementById("lb_attempt1_result").innerHTML = 'Passed';
 	} 
 	else 
 	{
     	document.getElementById("lb_attempt1_result").innerHTML = 'Referred';
    }

  
      
}

function attempt2() {
var ventilation2 =    document.getElementById('<%=tb_ventilation2.ClientID%>');
	var compression2 =    document.getElementById('<%=tb_compression2.ClientID%>');
	var cycle2 =    document.getElementById('<%=tb_cycle2.ClientID%>');
if (document.getElementById('<%=CheckBox2.ClientID%>').checked && document.getElementById('<%=CheckBox5.ClientID%>').checked  && document.getElementById('<%=CheckBox8.ClientID%>').checked  && document.getElementById('<%=CheckBox11.ClientID%>').checked  && document.getElementById('<%=CheckBox14.ClientID%>').checked  && document.getElementById('<%=CheckBox17.ClientID%>').checked  && document.getElementById('<%=CheckBox20.ClientID%>').checked  && document.getElementById('<%=CheckBox23.ClientID%>').checked  && document.getElementById('<%=CheckBox26.ClientID%>').checked  && document.getElementById('<%=CheckBox29.ClientID%>').checked  && document.getElementById('<%=CheckBox32.ClientID%>').checked  && document.getElementById('<%=CheckBox35.ClientID%>').checked  &&  document.getElementById('<%=CheckBox38.ClientID%>').checked && ventilation2.value.length >= 1  && compression2.value.length >= 1 && cycle2.value.length >= 1 )  
  {

 document.getElementById("lb_attempt2_result").innerHTML = 'Passed';

 } else {
     document.getElementById("lb_attempt2_result").innerHTML = 'Referred';

}
}
function attempt3() {
var ventilation3 =    document.getElementById('<%=tb_ventilation3.ClientID%>');
	var compression3 =    document.getElementById('<%=tb_compression3.ClientID%>');
	var cycle3 =    document.getElementById('<%=tb_cycle3.ClientID%>');
if (document.getElementById('<%=CheckBox3.ClientID%>').checked && document.getElementById('<%=CheckBox6.ClientID%>').checked  && document.getElementById('<%=CheckBox9.ClientID%>').checked  && document.getElementById('<%=CheckBox12.ClientID%>').checked  && document.getElementById('<%=CheckBox15.ClientID%>').checked  && document.getElementById('<%=CheckBox18.ClientID%>').checked  && document.getElementById('<%=CheckBox21.ClientID%>').checked  && document.getElementById('<%=CheckBox24.ClientID%>').checked  && document.getElementById('<%=CheckBox27.ClientID%>').checked  && document.getElementById('<%=CheckBox30.ClientID%>').checked  && document.getElementById('<%=CheckBox33.ClientID%>').checked  && document.getElementById('<%=CheckBox36.ClientID%>').checked   && document.getElementById('<%=CheckBox39.ClientID%>').checked && ventilation3.value.length >= 1  && compression3.value.length >= 1 && cycle3.value.length >= 1)  
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
        if (confirm("Please make sure Rhythm Strip has been uploaded to this system. If no files uploaded then specify reason for not uploading in the Remarks column")) {
            confirm_value.value = "OK";
        } else {
            confirm_value.value = "CANCEL";
        }
        document.forms[0].appendChild(confirm_value);
    }
    
    function Confirm_submit() {
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
  
   function getConfirmationValue2() 
   {
   var confirm_value = document.createElement("INPUT");
        confirm_value.type = "hidden";
        confirm_value.name = "confirm_value2";
        if (confirm("Student has not completed all the steps? Are you sure you want to submit the details? ")) {
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
            width: 27px;
        }
        .style3
        {
            height: 41px;
        }
        .style6
        {
            width: 153px;
        }
        .style8
        {
            width: 1000px;
        }
        .style9
        {
            width: 100px;
        }
        .style10
        {
            width: 226px;
        }
        .style11
        {
            width: 128px;
        }
        .style12
        {
            width: 1000px;
            height: 22px;
        }
        .style14
        {
            height: 22px;
        }
        .style15
        {
            width: 100px;
            height: 22px;
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
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <div style="font-family: Arial; height: 100%;">
        <table style="display: inline-table;" class="style1" width="100">
            <tr>
                <td bgcolor="White" valign="top" class="style6" rowspan="3">
                    <div style="background-color: White; width: 237px; height: 89px; margin-top: 0px;"
                        align="center">
                        <br />
                        <img alt="" src="images/NPHSlogoTransparentBig.png" style="width: 220px; height: 42px;
                            background-position: center; margin-top: 23;" /><br />
                    </div>
                    <div style="height: 3px; width: 237px; background-color: #98272d">
                    </div>
                </td>
                <td class="styleAA" align="center" style="background-image: url(images/navigationBar.png)"
                    colspan="2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="XX-Large" Font-Strikeout="False"
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
                    <asp:ImageButton ID="Button4" runat="server"  
                        OnClick="Button4_Click" CausesValidation="False" Height="35px" ImageUrl="~/images/BackToModulesBtn.png"
                        Width="200px" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
              
                   <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Module 1: One-Man Adult CPR" Font-Names="Arial" ></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div align="center">
            <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;"
                align="center" width="1000px">
                <tr>
                    <td class="styleCC" align="left" bgcolor="White" colspan="5">
                        &nbsp;<asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="STUDENT NAME:" Font-Names="Arial"></asp:Label><asp:Label ID="Label5" runat="server"
                                Font-Bold="False" Font-Size="Large" ForeColor="Black" Font-Names="Arial"></asp:Label>
                                 </td>
                                 </tr>
                                 <tr>
                                <td class="styleCC" align="left" bgcolor="White" colspan="5"> &nbsp;
                        <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="NRIC:" Font-Names="Arial"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Font-Names="Arial"></asp:Label>
                            
                            
                    </td>
                  
                </tr>
                <tr>
                  <td class="styleCC"  align="right" bgcolor="White" colspan="5"> &nbsp;
                  
                                  <asp:ImageButton ID="btn_submit2" OnClientClick="if(Page_ClientValidate()) Confirm_submit();"
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"  Style="margin-top: 5px"
                    Height="48px" OnClick="btn_submit_click" />

                    <asp:ImageButton ID="bt_allpass2" runat="server"  Width="145px"
                    Height="48px" 
                             Font-Bold="False" OnClientClick="Confirm_checkall()" Style="margin-top: 5px"
                            OnClick="bt_allpass_Click" ImageUrl="~/images/CheckAllBtn.png"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
                <tr bgcolor="#98272D">
                    <td rowspan="2" class="style2">
                        <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </td>
                    <td rowspan="2" align="center" class="style8">
                        <b>
                            <asp:Label ID="Label8" runat="server" Text="Assessment Criteria" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                    <td colspan="3" align="center" bgcolor="#98272D" class="style3">
                        <b>
                            <asp:Label ID="Label9" runat="server" Text="Tick if steps performed correctly" ForeColor="White"></asp:Label>
                            <br />
                            <br />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#98272D" align="center">
                    <td bgcolor="#98272D" class="style10">
                        <b>
                            <asp:Label ID="Label10" runat="server" Text="1st attempt" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                    <td class="style58" align="center" bgcolor="#98272D">
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" Font-Size="Large" Text="2nd attempt"
                            ForeColor="White"></asp:Label>
                    </td>
                    <td align="center" bgcolor="#98272D" class="style9">
                        <b>
                            <asp:Label ID="Label12" runat="server" Text="3rd attempt" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr bgcolor="White">
                    <td class="style2">
                        1
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label14" runat="server" Text="Check for <b>danger</b> : Ensure the environment is safe and remove the casualty from danger. "></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox1" runat="server" onchange=" attempt1();" Height="34px"
                            OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged=" bt_Save_Click" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged=" bt_Save_Click" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        2
                    </td>
                    <td class="style8">
                        Check for <b>responsiveness</b> :</br>
                        Call, tap or shake the casualty firmly.</br>
                        <b>Shout</b> : “Hello! Hello! Are you OK?”
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox4" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox5" OnCheckedChanged=" bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox6" OnCheckedChanged=" bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        3
                    </td>
                    <td class="style8">
                        If casualty is unresponsive, activate EMS by dialing for ambulance "995".Get AED if there is one nearby.
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox7" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox8" OnCheckedChanged=" bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox9" OnCheckedChanged=" bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        4
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label16" runat="server" Text="Position casualty on a firm, flat surface."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox10" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </td>
                    <td class="style95" align="center">
                        <asp:CheckBox ID="CheckBox11" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </td>
                    <td class="style9" align="center">
                        <asp:CheckBox ID="CheckBox12" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        5
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label17" runat="server" Text="Open the <b>airway</b> : </br> Perform head-tilt-chin-lift manoeuvre. </br> Check for normal <b>breathing</b> : Look for rise and fall of chest</br> <b>Circulation</b> :While maintaining head tilt with one hand, feel for 
carotid pulse with the pulp of two fingers of the other hand. <br> (all of these-Upto 10 Seconds)"></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox13" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox14" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox15" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        6
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label23" runat="server" Text="Locate hand position for chest compression.</br>Place the heel of your hand on the lower half of the sternum. Place the heel of the other hand on top of hand on the sternum. 
						Interlace the fingers of both hands and lift fingers off the chest wall."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox16" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox17" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox18" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        7
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label22" runat="server" Text="Ensure correct hands & body position for chest compression. </br> Compress chest at least 4-6 cm vertically, counting:</br> 
						1 and 2 and 3 and 4 and 5 and,</br> 1 and 2 and 3 and 4 and 10 and, </br> 1 and 2 and 3 and 4 and 15, </br>1 and 2 and 3 and 4 and 20, </br> 1 and 2 and 3 and 4 and 25, </br> 1 and 2 and 3 and 4 and 30."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox19" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt1();" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox20" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox21" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        8
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label24" runat="server" Text="Perform head-tilt-chin-lift and open the mouth gently. Give 2 breaths (1 sec / breath)."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox22" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox23" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox24" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        9
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label25" runat="server" Text="Perform 30 compressions followed by 2 breaths (repeat steps 6 -9 for a total of 5 cycles) within 2 minutes."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox25" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox26" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox27" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        10
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label26" runat="server" Text="Assess pulse after 5 cycles. If no pulse, repeat steps 6 -9."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox28" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox29" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox30" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        11
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label27" runat="server" Text="If pulse is present, check breathing. If no breathing, perform rescue breathing."></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox31" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox32" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox33" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        12
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label28" runat="server" Text="If breathing is present, place casualty in the recovery position and wait till help arrives. "></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox34" runat="server" onchange=" attempt1();" OnCheckedChanged="bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox35" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt2();" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox36" OnCheckedChanged="bt_Save_Click" runat="server" onchange=" attempt3();" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="4" class="style2">
                        13
                    </td>
                    <td class="style8">
                        <asp:Label ID="Label32" runat="server" Font-Bold="False" Text="   Performance Strip Verified:"></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:CheckBox ID="CheckBox37" onchange=" attempt1();" runat="server" OnCheckedChanged=" bt_Save_Click" />
                    </td>
                    <td align="center">
                        <asp:CheckBox ID="CheckBox38" onchange=" attempt2();" OnCheckedChanged="bt_Save_Click"
                            runat="server" />
                    </td>
                    <td align="center" class="style9">
                        <asp:CheckBox ID="CheckBox39" onchange=" attempt3();" OnCheckedChanged="bt_Save_Click"
                            runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        <asp:Label ID="Label37" runat="server" Text="Correct Breaths (10):"></asp:Label>
                    </td>
                    <td class="style10" align="center">
                        <asp:TextBox ID="tb_ventilation1" runat="server" Style="margin-left: 8px;" Height="16px"
                            Width="38px" onchange="attempt1();" OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RangeValidator ID="range1" runat="server" ControlToValidate="tb_ventilation1"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_venti1" ControlToValidate="tb_ventilation1" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td align="center" class="style14">
                        <asp:TextBox ID="tb_ventilation2" OnTextChanged="bt_Save_Click" runat="server" Height="16px"
                            Width="38px" Style="margin-left: 8px;" onchange="attempt2();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tb_ventilation2"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_venti2" ControlToValidate="tb_ventilation2" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td class="style15" align="center">
                        <asp:TextBox ID="tb_ventilation3" OnTextChanged="bt_Save_Click" runat="server" Style="margin-left: 8px;"
                            Height="16px" Width="38px" onchange="attempt3();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="tb_ventilation3"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_venti3" ControlToValidate="tb_ventilation3" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                        <asp:Label ID="Label38" runat="server" Text="Correct Compressions(150):"></asp:Label>
                    </td>
                    <td class="style10" align="center">
                        <asp:TextBox ID="tb_compression1" runat="server" Height="16px" Style="margin-left: 8px;"
                            Width="38px" onchange="attempt1();" OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="tb_compression1"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_compression1" ControlToValidate="tb_compression1"
                            runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="tb_compression2" OnTextChanged="bt_Save_Click" runat="server" Height="16px"
                            Style="margin-left: 8px;" Width="38px" onchange="attempt2();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="tb_compression2"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_compression2" ControlToValidate="tb_compression2"
                            runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td class="style9" align="center">
                        <asp:TextBox ID="tb_compression3" Style="margin-left: 8px;" OnTextChanged="bt_Save_Click"
                            runat="server" Height="18px" Width="38px" onchange="attempt3();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="tb_compression3"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_compression3" ControlToValidate="tb_compression3"
                            runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                       Total time for 5 cycles (100 – 130 secs):
                    </td>
                    <td class="style10" align="center">
                        <asp:TextBox ID="tb_cycle1" runat="server" Height="16px" Style="margin-left: 8px;"
                            Width="37px" BackColor="White" onchange="attempt1();" OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator7" runat="server" ControlToValidate="tb_cycle1"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_cycle1" ControlToValidate="tb_cycle1" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="tb_cycle2" OnTextChanged="bt_Save_Click" runat="server" Style="margin-left: 8px;"
                            Height="16px" Width="38px" onchange="attempt2();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator8" runat="server" ControlToValidate="tb_cycle2"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_cycle2" ControlToValidate="tb_cycle2" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                    <td class="style9" align="center">
                        <asp:TextBox ID="tb_cycle3" OnTextChanged="bt_Save_Click" runat="server" Style="margin-left: 8px;"
                            Height="16px" Width="38px" onchange="attempt3();"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator9" runat="server" ControlToValidate="tb_cycle3"
                            MinimumValue="0" MaximumValue="2147483647" Type="Integer" Text="Invalid" />
                        <asp:RequiredFieldValidator ID="Req_cycle3" ControlToValidate="tb_cycle3" runat="server">
            Invalid
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td colspan="2" align="right">
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Result: " ForeColor="Black"></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:Label ID="lb_attempt1_result" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="lb_attempt2_result" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td align="center" class="style9">
                        <asp:Label ID="lb_attempt3_result" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="right">
                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Date of assessment: "
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:TextBox ID="TextBox1" OnTextChanged="bt_Save_Click" runat="server" Width="96px"
                            BackColor="White" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td align="center">
                        <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="bt_Save_Click" Width="101px"
                            BackColor="White" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td align="center" class="style9">
                        <asp:TextBox ID="TextBox3" OnTextChanged="bt_Save_Click" runat="server" Width="97px"
                            BackColor="White" Font-Bold="True" ForeColor="Black" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td colspan="2" align="right">
                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Text="Instructor: " ForeColor="Black"></asp:Label>
                    </td>
                    <td align="center" class="style10">
                        <asp:Label ID="instructor1" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="instructor2" runat="server" Text="Label" Visible="False" Font-Bold="True"
                            BackColor="White"></asp:Label>
                    </td>
                    <td align="center" class="style9">
                        <asp:Label ID="instructor3" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="White">
                    <td class="style90" colspan="2" align="right">
                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Text="Remarks: " ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox4" OnTextChanged="bt_Save_Click" runat="server" TextMode="MultiLine"
                            Width="174px" BackColor="White" ForeColor="Black" Height="39px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox4"
                            ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" OnTextChanged="bt_Save_Click" runat="server" BackColor="White"
                            Height="39px" TextMode="MultiLine" Width="182px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server"
                            ControlToValidate="TextBox5" ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$"
                            ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                    <td class="style9">
                        <asp:TextBox ID="TextBox6" OnTextChanged="bt_Save_Click" runat="server" BackColor="White"
                            Height="40px" TextMode="MultiLine" Width="175px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server"
                            ControlToValidate="TextBox6" ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$"
                            ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" bgcolor="White">
                        <asp:Label ID="Label31" runat="server" Font-Bold="True" Text="Rhythm Strip File :"
                            ForeColor="Black"></asp:Label>
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="43px" Width="225px" />
                        <asp:Button ID="UploadButton" runat="server" Font-Bold="True" OnClick="UploadButton_Click"
                            Text="Upload" Width="111px" Height="37px" CausesValidation="False" />
                        <%--<asp:Button ID="bt_allpass" runat="server" Text="Check All " Width="130px" Style="margin-top: 16px;
                            margin-right: 0px; margin-left: 370px" Height="36px" Font-Bold="False" OnClientClick="Confirm_checkall()"
                            OnClick="bt_allpass_Click" CausesValidation="false" Font-Size="Large" />--%><div>
                                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="False" Visible="False"></asp:Label></div>
                        <br />
                        <br />
                       
                        <asp:Panel ID="Panel1" runat="server" Width="223px" BackColor="White">
                        </asp:Panel>
                    </td>
                </tr>
                 <tr>
                  <td class="styleCC" align="right"  bgcolor="White" colspan="5"> &nbsp;
                  <asp:ImageButton ID="btn_submit" OnClientClick="if(Page_ClientValidate()) Confirm_submit();"
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                     Height="48px" OnClick="btn_submit_click"  Style="margin-top: 5px"/>
                     <asp:ImageButton ID ="bt_allpass" ImageUrl="~/images/CheckAllBtn.png" runat="server" Width="145px"
                     Height="48px" Style="margin-top: 5px"
                              Font-Bold="False" OnClientClick="Confirm_checkall()"
                            OnClick="bt_allpass_Click"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
            </table>
          
        </div>
    </div>
    </form>
</body>
</html>
