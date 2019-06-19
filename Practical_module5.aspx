<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Practical_module5.aspx.cs" Inherits="Practical_module5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>practicalmodule5-BCLS</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />

    <script type="text/javascript">
  function c1()
  {
 document.getElementById('<%=CheckBox1.ClientID%>').checked;
  }
   function attempt1() {
       if (document.getElementById('<%=CheckBox1.ClientID%>').checked && document.getElementById('<%=CheckBox4.ClientID%>').checked && document.getElementById('<%=CheckBox7.ClientID%>').checked && document.getElementById('<%=CheckBox10.ClientID%>').checked && document.getElementById('<%=CheckBox13.ClientID%>').checked && document.getElementById('<%=CheckBox16.ClientID%>').checked && document.getElementById('<%=CheckBox19.ClientID%>').checked && document.getElementById('<%=CheckBox22.ClientID%>').checked && document.getElementById('<%=CheckBox25.ClientID%>').checked && document.getElementById('<%=CheckBox28.ClientID%>').checked && document.getElementById('<%=CheckBox31.ClientID%>').checked && document.getElementById('<%=CheckBox34.ClientID%>').checked && document.getElementById('<%=CheckBox37.ClientID%>').checked && document.getElementById('<%=CheckBox40.ClientID%>').checked && document.getElementById('<%=CheckBox43.ClientID%>').checked && document.getElementById('<%=CheckBox46.ClientID%>').checked && document.getElementById('<%=CheckBox49.ClientID%>').checked && document.getElementById('<%=CheckBox52.ClientID%>').checked )  
      {
   
     document.getElementById("lb_attempt1_result").innerHTML = 'Passed';

     } 
     else 
     {
         document.getElementById("lb_attempt1_result").innerHTML = 'Referred';

    }
    }
  function attempt2() {
      if (document.getElementById('<%=CheckBox2.ClientID%>').checked && document.getElementById('<%=CheckBox5.ClientID%>').checked && document.getElementById('<%=CheckBox8.ClientID%>').checked && document.getElementById('<%=CheckBox11.ClientID%>').checked && document.getElementById('<%=CheckBox14.ClientID%>').checked && document.getElementById('<%=CheckBox17.ClientID%>').checked && document.getElementById('<%=CheckBox20.ClientID%>').checked && document.getElementById('<%=CheckBox23.ClientID%>').checked && document.getElementById('<%=CheckBox26.ClientID%>').checked && document.getElementById('<%=CheckBox29.ClientID%>').checked && document.getElementById('<%=CheckBox32.ClientID%>').checked && document.getElementById('<%=CheckBox35.ClientID%>').checked && document.getElementById('<%=CheckBox38.ClientID%>').checked && document.getElementById('<%=CheckBox41.ClientID%>').checked && document.getElementById('<%=CheckBox44.ClientID%>').checked && document.getElementById('<%=CheckBox47.ClientID%>').checked && document.getElementById('<%=CheckBox50.ClientID%>').checked && document.getElementById('<%=CheckBox53.ClientID%>').checked)  
      {
   
     document.getElementById("lb_attempt2_result").innerHTML = 'Passed';

     } else {
         document.getElementById("lb_attempt2_result").innerHTML = 'Referred';

    }
}
  function attempt3() {
      if (document.getElementById('<%=CheckBox3.ClientID%>').checked && document.getElementById('<%=CheckBox6.ClientID%>').checked && document.getElementById('<%=CheckBox9.ClientID%>').checked && document.getElementById('<%=CheckBox12.ClientID%>').checked && document.getElementById('<%=CheckBox15.ClientID%>').checked && document.getElementById('<%=CheckBox18.ClientID%>').checked && document.getElementById('<%=CheckBox21.ClientID%>').checked && document.getElementById('<%=CheckBox24.ClientID%>').checked && document.getElementById('<%=CheckBox27.ClientID%>').checked && document.getElementById('<%=CheckBox30.ClientID%>').checked && document.getElementById('<%=CheckBox33.ClientID%>').checked && document.getElementById('<%=CheckBox36.ClientID%>').checked && document.getElementById('<%=CheckBox39.ClientID%>').checked && document.getElementById('<%=CheckBox42.ClientID%>').checked && document.getElementById('<%=CheckBox45.ClientID%>').checked && document.getElementById('<%=CheckBox48.ClientID%>').checked && document.getElementById('<%=CheckBox51.ClientID%>').checked && document.getElementById('<%=CheckBox54.ClientID%>').checked)  
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
        function GetRDBValue_Scenario() {
            var rb = document.getElementById("<%=RadioButtonList_Scenario.ClientID%>");
            var radio = rb.getElementsByTagName("input");
            var label = rb.getElementsByTagName("label");
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {
                    //alert("SelectedText: " + label[i].innerHTML    + "\nSelectedValue: " + radio[i].value);
                    
                    var tb_attempt1_remarks = document.getElementById('<%=TextBox4.ClientID %>');
                    var tb_attempt2_remarks = document.getElementById('<%=TextBox5.ClientID %>');
                    var tb_attempt3_remarks = document.getElementById('<%=TextBox6.ClientID %>');
                    if (tb_attempt1_remarks.disabled == false)
                    {
                        tb_attempt1_remarks.innerHTML = label[i].innerHTML;
                    }
                    else if (tb_attempt2_remarks.disabled == false) {
                        tb_attempt2_remarks.innerHTML = label[i].innerHTML;
                    }
                    else if (tb_attempt3_remarks.disabled == false) {
                        tb_attempt3_remarks.innerHTML = label[i].innerHTML;
                    }
                    break;
                }
            }

            //return false;
        }
     
/*$(function(){
    $( "input[type=checkbox]" ).on("change", function(){
        if($(this).is(':checked'))
            $(this).parent().css('background-color', '#cd0000');
        else
            $(this).parent().css('background-color', '');
    });
});*/

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
        .style6
        {
        }
        .style7
        {
            height: 41px;
        }
        .style12
        {
            height: 30px;
            width: 183px;
        }
        .style18
        {
            height: 30px;
            width: 139px;
        }
        .style22
        {
            height: 41px;
            width: 139px;
        }
        .style23
        {
            width: 183px;
        }
        .style24
        {
            height: 41px;
            width: 183px;
        }
        .style25
        {
            width: 139px;
        }
        .style28
        {
            width: 183px;
            height: 88px;
        }
        .style29
        {
            width: 139px;
            height: 88px;
        }
        .style2
        {
            width: 15px;
        }
        .style42
        {
            width: 217px;
            height: auto;
        }
        .style43
        {
            width: 217px;
            height: 88px;
        }
        .style44
        {
            height: 30px;
            width: 185px;
        }
        .style45
        {
            width: 185px;
        }
        .style46
        {
            width: 185px;
            height: 88px;
        }
        .style47
        {
            height: 41px;
            width: 185px;
        }
        .style49
        {
            width: 217px;
        }
    </style>
</head>
<body bgcolor="White">
    <form id="form1" runat="server">
    <div style="font-family: Arial; height: 100px">
        <table bgcolor="#A1B5DC" style="display: inline-table;" class="style1" width="100">
            <tr>
                <td bgcolor="White" valign="top" class="style23" rowspan="3">
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
                    <asp:ImageButton ID="Button6" runat="server" ImageUrl="~/images/BackToModulesBtn.png"
                        OnClick="Button6_Click" Text="Back to Modules" CausesValidation="False" Height="35px"
                        Width="200px" /> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Module 5: CPR+AED" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div align="center">
            <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;
                width: 1029px;" align="center">
                <tr>
                    <td class="styleCC" align="left" bgcolor="White" colspan="6">   &nbsp;
                        <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="STUDENT NAME:" Font-Names="Arial"></asp:Label>
                        &nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="Large"
                            ForeColor="Black" Font-Names="Arial"></asp:Label>
                            </td>
                            </tr>
                            <tr>
                       <td class="styleCC" align="left" bgcolor="White" colspan="6"> &nbsp;
                        <asp:Label ID="Label31" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Text="NRIC:" Font-Names="Arial"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="Large" ForeColor="Black"
                            Font-Names="Arial"></asp:Label>
                    </td>
                    
                 
 
                </tr>
                    
                            <tr>
                       <td class="styleCC" align="left" bgcolor="White" colspan="3"> 
                           <asp:RadioButtonList ID="RadioButtonList_Scenario" runat="server" onclick="GetRDBValue_Scenario();" RepeatDirection="Vertical" RepeatLayout="Table" Width="100%">
                               <asp:ListItem Text="Scenario 1- Shock - No shock- No shock " Value="1"></asp:ListItem>
                               <asp:ListItem Text="Scenario 2- No Shock - Shock - No Shock" Value="2"></asp:ListItem>
                               <asp:ListItem Text="Scenario 3- Shock - Shock- No shock" Value="3"></asp:ListItem>
                               <asp:ListItem Text="Scenario 4- No Shock - No Shock - Shock" Value="4"></asp:ListItem>
                           </asp:RadioButtonList>
                    </td>
                    
                 
 
                       <td class="styleCC" align="right" bgcolor="White" colspan="3"> 
                           <asp:ImageButton ID="btn_submit2" runat="server" CausesValidation="true" Height="48px" ImageUrl="~/images/BtnSubmit.png" OnClick="btn_submit_click" OnClientClick="Confirm()" Style="margin-top: 5px" Width="145px" />
                           <asp:ImageButton ID="bt_allpass2" runat="server" CausesValidation="false" Font-Bold="False" Font-Size="Large" Height="48px" ImageUrl="~/images/CheckAllBtn.png" OnClick="bt_allpass_Click" OnClientClick="Confirm_checkall()" Style="margin-top: 5px" Width="145px" />
                                </td>
                    
                 
 
                </tr>
                    
                 
 
                <tr>
                    <td class="style2" rowspan="2" bgcolor="#98272D">
                        <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </td>
                    <td class="style2" rowspan="2" bgcolor="#98272D">
                        <b>
                            <asp:Label ID="Label163" runat="server" Text="Steps" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                    <td rowspan="2"  bgcolor="#98272D" class="style42">
                        <b>
                            <asp:Label ID="Label8" runat="server" Text="Performance Criteria & Learning Outcome" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                    <td colspan="3" align="center" bgcolor="#98272D">
                        <b>
                            <asp:Label ID="Label9" runat="server" Text="Tick if steps performed correctly" ForeColor="White"></asp:Label>
                            <br />
                            <br />
                            <br />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7BE81">
                    <td class="style12" align="center" bgcolor="#98272D">
                        <b>
                            <asp:Label ID="Label10" runat="server" Text="1st attempt" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                    <td class="style18" align="center" bgcolor="#98272D">
                        <asp:Label ID="Label162" runat="server" Font-Bold="True" Font-Size="Large" Text="2nd attempt"
                            ForeColor="White"></asp:Label>
                    </td>
                    <td class="style44" align="center" bgcolor="#98272D">
                        <b>
                            <asp:Label ID="Label12" runat="server" Text="3rd attempt" ForeColor="White"></asp:Label>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        1
                    </td>
                    <td class="style42">
                        <b> Danger </b></td>
                    <td align="left">
                        Demonstrates assessment of dangers</td>
                    <td onclick="return c1()" class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox2" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        2
                    </td>
                    <td class="style42">
                       <b> Responsiveness </b></td>
                    <td align="left">
                        Tap shoulders firmly and ask loudly &quot;Hello! Hello! Are you ok?&quot;</td>
                    <td class="style28" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox4" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style29" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style46" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox6" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        3
                    </td>
                    <td class="style42">
                        <b> Shout </b></td>
                    <td align="left">
                        &quot;Help! Call ambulance 995&quot;</td>
                    <td class="style28" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox7" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style29" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox8" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style46" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox9" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        4
                    </td>
                    <td class="style42">
                         <b>AED </b></td>
                    <td align="left">
                        If there is another person around, ask him/herto get the AED. If alone only get the AED if vissible and nearby.</td>
                    <td class="style28" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox10" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style29" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox11" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style46" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox12" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        5
                    </td>
                    <td class="style42">
                        <b> Breathing </b></td>
                    <td align="left">
                        Look for rise and fall of the chest ( should not take more than 10 seconds).</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox13" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox14" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox15" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        6
                    </td>
                    <td class="style42">
                       <b>  Locate Hand Position for chest compression </b></td>
                    <td align="left">
                        Ensure adequate exposure to the chest and start chest compressionover the lower half of the sternum. Place the heel of the hand. Do not compress the xiphoid process.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox16" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox17" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox18" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        7
                    </td>
                    <td class="style42">
                        <b> Perform Chest Compression </b></td>
                    <td align="left">
                       Place the heel of the other hand on top of the first hand on the sternum. Interlace the fingers of both hands and lift fingers off chest wall. Straighten both elbows and lock them in position. Position shoulders direcly above the casualty's chest. Use your body weight to compress the casualty's chest by 4-6cm in depth. Counting loudly as you compress: 1&2&3&4&5 & 1&2&3&4&10 & 1&2&3&4&15, 1&2&3&4&20, 1&2&3&4&25, 1&2&3&4& 30. Perform chest compressionat a rate of 100-120 per minute.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox19" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox20" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox21" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        8
                    </td>
                    <td class="style42">
                        <b>Open the airway</b></td>
                    <td align="left">
                   Head tilt- Place the palm on the forehead and push it backwards. Chin lift - Using the thumb  and the index finger of your other handto lift the bony part of the chin upward.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox22" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox23" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox24" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        9
                    </td>
                    <td class="style42">
                        <b>Mouth to Mouth ventilation</b></td>
                    <td align="left">
                        Pinch the casualty's nose with index finger and thumb, and seal your lips around the mouth. Give 2 quick and short breaths, each lasting 1 second. Release the nose after each breath. Each breath should be enough to make the cest rise. This is approximately, 400 -600 mls of air. Do not interrupt the chest compressions for more than 10 seconds to perform 2 breaths.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox25" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox26" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox27" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        10
                    </td>
                    <td class="style42">
                        <b> CPR </b></td>
                    <td align="left">
                        <asp:Label ID="Label24" runat="server" Width="324px" Text="Perform 5 cycles of 30 compressions: 2 ventilations within 2 minutes."></asp:Label>
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox28" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox29" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox30" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr >
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style42">
                        &nbsp;</td>
                    <td class="style42">
                       <b> AED rescuer&#39;s action<b></td>
                    <td class="style23" align="center">
                        &nbsp;</td>
                    <td class="style25" align="center">
                        &nbsp;</td>
                    <td class="style45" align="center">
                        &nbsp;</td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        11</td>
                    <td class="style42">
                         <b>AED Danger </b></td>
                    <td align="left">
                        Assess the scene is safe for use of AED, avoiding contact with metal, water and gas.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox31" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox32" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox33" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr >
                    <td class="style2">
                        12</td>
                    <td class="style42">
                         <b>Turn on AED </b></td>
                    <td align="left">
                        Press ON button.</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox34" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox35" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox36" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        13</td>
                    <td class="style42">
                         <b>Chest Preparation </b></td>
                    <td align="left">
                        (use chest preparation kit - wear gloves, expose chest) Shave chest <b>Hair</b>, move away necklace/chain <b>Jewelry</b>, if on the right side, apply pads 4 fingers away from <b>Pacemaker</b>, remove  <b>Medicated Patch</b>, wipe and dry  <b>Sweat</b>.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox37" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox38" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox39" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr >
                    <td class="style2">
                        14</td>
                    <td class="style42">
                         <b>Apply AED pads </b></td>
                    <td align="left">
                        Right pad is below the right collar bone, left pad is below and to the left of the left nipple.</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox40" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox41" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox42" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        15</td>
                    <td class="style42">
                         <b>Analysing </b></td>
                    <td align="left">
                        Ensure nobody touches the casualty.
                    </td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox43" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox44" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox45" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr >
                    <td class="style2">
                        16</td>
                    <td class="style42">
                        <b> Shock advised </b></td>
                    <td align="left">
                        Apply shock when safe. Perform continous CPR cycles of 30 compressions to 2 ventilations until*</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox46" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox47" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox48" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style2">
                        17</td>
                    <td class="style42">
                         <b>No shock advised </b></td>
                    <td align="left">
                        Perform continous CPR cycles of 30 compressions to 2 ventilations until*</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox49" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox50" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox51" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr >
                    <td class="style2">
                        18</td>
                    <td class="style42">
                        <b> Ambulance crew arrives </b></td>
                    <td align="left">
                        Paramedic takes over from rescuer. AED prompts to analyse the casualty or is ready to shock. Casualty wakes up or regain normal breathing and pulse (only trained healthcare professional).</td>
                    <td class="style23" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox52" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt1();" />
                        </b>
                    </td>
                    <td class="style25" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox53" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt2();" />
                        </b>
                    </td>
                    <td class="style45" align="center">
                        <b>
                            <asp:CheckBox ID="CheckBox54" runat="server" OnCheckedChanged="bt_Save_Click" onchange=" attempt3();" />
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style7" colspan="3" align="right">
                        <asp:Label ID="Label25" runat="server" Text="Result:" Font-Bold="True" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style24" align="center">
                        <asp:Label ID="lb_attempt1_result" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style22" align="center">
                        <asp:Label ID="lb_attempt2_result" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="style47" align="center">
                        <asp:Label ID="lb_attempt3_result" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr bgcolor="#F7F6F3">
                    <td class="style6" colspan="3" align="right">
                        <asp:Label ID="Label26" runat="server" Text="Date of assessment: " Font-Bold="True"
                            ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style23" align="center">
                        <asp:TextBox ID="TextBox1" runat="server" BackColor="#F7F6F3" Font-Bold="True" ForeColor="Black"
                            ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="style25" align="center">
                        <asp:TextBox ID="TextBox2" runat="server" BackColor="#F7F6F3" Font-Bold="True" ForeColor="Black"
                            ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="style45" align="center">
                        <asp:TextBox ID="TextBox3" runat="server" BackColor="#F7F6F3" Font-Bold="True" ForeColor="Black"
                            ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style6" colspan="3" align="right">
                        <asp:Label ID="Label30" runat="server" Font-Bold="True" Text="Instructor: " ForeColor="Black"></asp:Label>
                    </td>
                    <td class="style23" align="center">
                        <asp:Label ID="instructor1" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style25" align="center">
                        <asp:Label ID="instructor2" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                    </td>
                    <td class="style45" align="center">
                        <asp:Label ID="instructor3" runat="server" Text="Label" Visible="False" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" bgcolor="#F7F6F3" align="right">
                        <asp:Label ID="Label29" runat="server" Font-Bold="True" Text="Remarks: " ForeColor="Black"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Width="181px" BackColor="#F7F6F3"
                            OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox4"
                            ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" BackColor="#F7F6F3" TextMode="MultiLine"
                            OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5"
                            ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                    <td class="style45">
                        <asp:TextBox ID="TextBox6" runat="server" BackColor="#F7F6F3" TextMode="MultiLine"
                            OnTextChanged="bt_Save_Click"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                            ValidationExpression="^[a-zA-Z0-9-.;,\s]{1,300}$" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                    </td>
                </tr>
              <tr>
              <td class="styleCC" align="right"  bgcolor="White" colspan="6"> &nbsp;
                  <asp:ImageButton ID="btn_submit" OnClientClick="Confirm()" 
                    runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px"
                    Style="margin-top: 5px" Height="48px" OnClick="btn_submit_click" />
                     <asp:ImageButton ID ="bt_allpass" ImageUrl="~/images/CheckAllBtn.png" runat="server" Width="145px"
                     Height="48px"
                              Font-Bold="False" OnClientClick="Confirm_checkall()"
                            OnClick="bt_allpass_Click" Style="margin-top: 5px"  CausesValidation="false" Font-Size="Large" />
                    </td></tr>
            </table>
        </div>
      
    </div>
    </form>
</body>
</html>
