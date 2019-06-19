<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_Simulation2_Opt3.aspx.cs" Inherits="NSL_Simulation2_Opt3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Blood Transfusion-Opt3</title>
    <link rel="icon" type="image/png" href="images/bclstestheart1234.png" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="-1" />
    <meta http-equiv="Cache-Control" content="no-cache" />

    <script type="text/javascript">

 function Confirm() {
  if (!Page_ClientValidate()) {
         alert('There are missing items to select. Please correct it before submission!');
        }
        else
        {
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
        }
         function Confirm2() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to save the above details ? ")) {
                confirm_value.value = "OK";
            } else {
                confirm_value.value = "CANCEL";
            }
            document.forms[0].appendChild(confirm_value);
        }
 function  show_score()
{
 var total_score=0;
 var newLine = "\r\n";
 var actual_score_float;
 var actual_score_decimalValue ;

 for (var i = 1; i <= 26; i++) 
 {    
 var rb = document.getElementById("RadioButtonList" + i); //Client ID of the radiolist

 if (rb != null)
            {
             var Buttons = rb.getElementsByTagName("input");
             for (var x = 0; x < Buttons.length; x++)
                {
                    if (Buttons[x].checked)
                    {
                       // alert("You checked " + Buttons[x].id + " which has the value " + Buttons[x].value);
                        total_score = parseInt(total_score) + parseInt(Buttons[x].value);
                     
                    }
                }
            }
        }
for (var i = 41; i <=47; i++) 
 {    
 var rb = document.getElementById("RadioButtonList" + i); //Client ID of the radiolist

 if (rb != null)
            {
             var Buttons = rb.getElementsByTagName("input");
             for (var x = 0; x < Buttons.length; x++)
                {
                    if (Buttons[x].checked)
                    {
                       // alert("You checked " + Buttons[x].id + " which has the value " + Buttons[x].value);
                        total_score = parseInt(total_score) + parseInt(Buttons[x].value);
                     
                    }
                }
            }
        }
        for (var i = 48; i <= 57; i++) 
 {    
 var rb = document.getElementById("RadioButtonList" + i); //Client ID of the radiolist

 if (rb != null)
            {
             var Buttons = rb.getElementsByTagName("input");
             for (var x = 0; x < Buttons.length; x++)
                {
                    if (Buttons[x].checked)
                    {
                       // alert("You checked " + Buttons[x].id + " which has the value " + Buttons[x].value);
                        total_score = parseInt(total_score) + parseInt(Buttons[x].value);
                     
                    }
                }
            }
        }
    actual_score_float = (parseInt(total_score) / 172) * (10 / 100) * 100;//Total/176 X 10% 
    actual_score_decimalValue= parseFloat(actual_score_float).toFixed(1);
       // actual_score_decimalValue= Math.round(actual_score_float, 1);
      //actual_score_decimalValue=Math.round(actual_score_float*100)/100  //returns 28.45
     //alert("Total Score: "+ total_score+ newLine +"Actual Score upon 4%: " + actual_score_decimalValue);         
document.getElementById('lb_total').innerHTML = total_score;
document.getElementById('lb_actualscore').innerHTML = actual_score_decimalValue+"%";

     return false;
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
         .font-italic {
    font-style: italic;
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
            width: 153px;
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
        .style16
        {
            height: 35px;
            width: 265px;
        }
        .style_radio
        {text-align:center!important;
         
        }
   
        .style39
        {
            width: 75px;
        }
   .RemarksTextarea
{
   width: 100%;
   height: 100%;
   margin:0;padding:0;
}

        .style41
        {
        }
        .style42
        {
            height: 22px;
            width: 156px;
        }
        .style45
        {
            height: 48px;
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
                        ForeColor="#F9FAFA" Text="SIMPract  V3.1" Font-Names="Arial"></asp:Label>
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
                    <asp:ImageButton ID="Button4" runat="server" Font-Bold="True"
                        OnClick="Button4_Click" CausesValidation="False" ImageUrl="~/images/backToGroupsBtn.png"  Height="35px" Width="200px"  />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        
                  <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="BLOOD TRANSFUSION - OPTION 3" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="font-family: Arial; height: 100%; width: 100%;">
        </br>
        <table bgcolor="White" align="left" style="width: 550px;">
            <tr>
                <td bgcolor="White">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="Both" Style="margin-left: 0px; top: 319px; left: 532px; width: 550px;"
                        DataKeyNames="student_id" ForeColor="#333333" CellSpacing="2" Width="299px">
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
                            <asp:BoundField DataField="student_name" ItemStyle-HorizontalAlign="Left" HeaderText="Student Name"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_name" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="student_group" ItemStyle-HorizontalAlign="Left" HeaderText="Student Group"
                                HeaderStyle-BackColor="#98272d" SortExpression="student_group" ReadOnly="true">
                                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                <ItemStyle HorizontalAlign="left"></ItemStyle>
                            </asp:BoundField>
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
        </table>
        <table bgcolor="White" border="1" align="center" bordercolor="#98272d" style="border-collapse: collapse;
            width: 380px;">
            <tr>
                <td class="style16" align="left">
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" Text="Name of assessor"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td class="style16" align="left">
                    <b>
                        <asp:Label ID="lb_assessor" runat="server" Text="" Font-Bold="True" Font-Size="Medium"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style16" align="left">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text="Total % upon 10%"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td class="style16">
                    <b>
                        <asp:Label ID="lb_actualscore2" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td class="style16" align="left">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date of Assessment"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td class="style16">
                    <b>
                        <asp:Label ID="lb_date" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            
            
            
         
            
        </table>
    </div><br/>
    
    
   
    <div>
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;
            width: 100%;" align="center">
            <tr>
                <td align="center" colspan="11" class="styleCC" bgcolor="#98272D">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Text="Postoperative Abdominal Laparotomy - Blood Transfusion"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                 <td align="left" colspan="11" class="styleCC" >
                   Brief Summary: </br>
				   Mdm Lee Ho Yin is a 58 -year-old housewife who was involved in a road traffic accident. She hit her abdomen on the steering wheel and sustained an abdominal injury with trauma to the spleen. She was transported to the Emergency Department by the ambulance crew from the scene of the accident. The pre-hospital scene assessment revealed that patient was alert and oriented to  time, place and person with mild abdominal pain. She underwent an emergency exploratory laparotomy for repair of mesenteric artery rupture and evacuation of clots. 4 hours post operation, patient has complained of fatigue with physical therapy and does not tolerate changes in position without dizziness. Latest Full blood count (FBC) identified hemoglobin of 7 g/dl. The doctor has ordered one unit of packed red blood cells (PRBC) to be given. The lab has called and the blood is ready for collection.
</br></br>Past Medical History: </br>She has a history of hypertension. She states that she takes “water pills” for her blood pressure and has been trying to exercise. She was previously admitted for sepsis secondary to wound infection and inferior myocardial infarction with percutaneous angiogram done. 
</br>Social: Lives with husband.
</br>Drug Allergy: NSAIDS
								
</td>
            </tr>
            <tr bgcolor="#98272D" >
                <td  rowspan="2" style="border: 1px solid white;">
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" rowspan="2" style="border: 1px solid white;" 
                    class="style41" >
                    <b>
                        <asp:Label ID="Label8" runat="server" Text="Key Performance" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" rowspan="2" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label23" runat="server" Text="Correct Treatment
or Student Intervention" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center"  style="border: 1px solid white;" >
                  <b>
                        <asp:Label ID="Label33" runat="server" Text="Not Performed" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                
                </td>
                  <td align="center"  style="border: 1px solid white;">
                  <b>
                        <asp:Label ID="Label34" runat="server" Text="Unsatisfied" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                
                </td>
                  <td align="center"  style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label35" runat="server" Text="Below satisfactory" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                
                </td>
                  <td align="center"  style="border: 1px solid white;" >
                   <b>
                        <asp:Label ID="Label36" runat="server" Text=" Satisfactory" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                
                </td>
                <td align="center"  style="border: 1px solid white;">
                <b>
                        <asp:Label ID="Label37" runat="server" Text="Exemplary" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
               </td>
                <td rowspan="2" align="center" style="border: 1px solid white;" 
                    class="style39" >
                    <b>
                        <asp:Label ID="Label4" runat="server" Text="Maximum Score" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label162" runat="server" Text="Remarks" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Instructions" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
            </tr>
            
             <tr bgcolor="#98272D">
                <td  align="center" style="border: 1px solid white;"  >
                     <b>
                        <asp:Label ID="Label32" runat="server" Text="0" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td  align="center"  style="border: 1px solid white;" >
                    <b>
                        <asp:Label ID="Label38" runat="server" Text="1" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td  align="center"  style="border: 1px solid white;">
                   <b>
                        <asp:Label ID="Label39" runat="server" Text="2" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td  align="center"  style="border: 1px solid white;" >
                     <b>
                        <asp:Label ID="Label40" runat="server" Text="3" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b></td>
                <td  align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label41" runat="server" Text="4" Font-Bold="True" Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b></td>
                
            </tr>
            
            
            
           <tr bgcolor="#98272D">
                <td  align="left"  colspan="11" style="border: 1px solid white;">
                    <asp:Label ID="Label5" runat="server" Text="PART A" Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
              <%------------------------------------PART A-QUEST NO :1 -------------------------------------------------------------%>
          <tr>
                <td>
                    1
                </td>
                <td align="left" class="style41">
                    Check doctor's order from progress notes
                </td>
                <td align="left">
                    The type of blood product and number of unit(s) ordered.
                </td>
                <td  colspan="5" align="center" valign="middle">
                    <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"    ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                  
                       <asp:RequiredFieldValidator 
            ID="ReqiredFieldValidator1"
            runat="server"
            ControlToValidate="RadioButtonList1"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks1" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td class="font-italic">
                    TSO:
                    <br />
                    Activate State 1 (Pre transfusion)
                    <br />
                    RR-22b/min, HR-100b/min, BP-95/64mmHg, SpO2-98%, Temp-37 deg C</td>
            </tr>
                  <tr>
                <td>
                    2
                </td>
                <td align="left" class="style41">
                    Check patient's FBC result
                </td>
                <td align="left" >
                    Able to verbalise that Hb is 7 and it&#39;s relationship with blood transfusion.</td>
                <td colspan="5" align="center" valign="middle">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList2"    runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table" Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                    
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="RadioButtonList2"
            ErrorMessage="Select One!"
            ForeColor="Red"
          
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="font-italic">
                    Refer case note or EMR system for result.</td>
           
            </tr>
            
            
             <tr>
                <td>
                   3
                </td>
                <td align="left" class="style41">
                    Assess for past medical history
                </td>
                <td align="left">
                   e.g. cardiac, renal or pulmonary condition or any s/s of fluid overload
                </td>
                <td colspan="5" align="center">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"   
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                   
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3"
            runat="server"
            ControlToValidate="RadioButtonList3"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="font-italic">
                    TSO:</br>
Patient appeared anxious and said, "I did not take all OM medications".
</td>
           
            </tr>  
            
        <%-- ---------------------------------------------------------------------------------------------%>
            <tr>
                <td>
                 4
                </td>
                <td align="left" class="style41">
                  Check consent
                </td>
                <td align="left">
                   Ensure consent if valid and for blood transfusion.
                </td>
                <td colspan="5" align="center">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"   
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                    
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator4"
            runat="server"
            ControlToValidate="RadioButtonList4"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td>
                    &nbsp;</td>
           
            </tr>  
            
             <%-- ---------------------------------------------------------------------------------------------%>
            <tr>
                <td>
               5
                </td>
                <td align="left" class="style41">
                  Perform hand hygiene
                </td>
                <td align="left">
                   Perform 7 steps and follow 5 moments
                </td>
                <td colspan="5" align="center" >
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList5" class="style_radio"     runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                  
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator5"
            runat="server"
            ControlToValidate="RadioButtonList5"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td>
                    &nbsp;</td>
           
            </tr>  
             <%-- ---------------------------------------------------------------------------------------------%>
             <%-- ---------------------------------------------------------------------------------------------%>
            <tr>
                <td rowspan="3">
                 6
                </td>
                
             
                <td align="left" class="style41" rowspan="3">
                  Display effective and professional communication with patient/relatives
                </td>
                  <td>
           Greet patient and introduce self</td>
                <td colspan="5" align="center" rowspan="3" >
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList6"    runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator6"
            runat="server"
            ControlToValidate="RadioButtonList6"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                
                <td align="center" class="style39" rowspan="3" >
                 4
                </td>
              
                <td rowspan="3"  >
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td  class="font-italic" rowspan="3">
                   Patient is alert and orientated: TSO: </br>
"My name is Lee Ho Yin, I am in the hospital because I met an accident"."The doctor said I needed to get some blood now"."I hope I feel better tomorrow, I just can't get up and get moving cause I get so dizzy".


</td>
           
            </tr>  
            <tr>
                  <td>
                      Identify the correct patient with 2 identifiers</td>
           
            </tr>  
            <tr>
                  <td>
                      Explain the procedure and its purpose to the patient
               </td>
           
            </tr>  
             <%-- ---------------------------------------------------------------------------------------------%>
            <tr>
                <td rowspan="5">
                 7
                </td>
                <td align="left" class="style41" rowspan="5">
                    **Obtain the patient's pre-transfusion vital signs
                </td>
                <td>
           Attach probe and check SpO2.</td>
                <td colspan="5" align="center" rowspan="5">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList7"    runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator7"
            runat="server"
            ControlToValidate="RadioButtonList7"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" rowspan="5">
                    4
                </td>
                <td rowspan="5" >
                    
                    <asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="font-italic" rowspan="5">
                    Lecturer:
                    <br />
                    **Accord &quot;0&quot; mark if student did not perform any steps from this category before 
                    blood transfusion.</td>
           
            </tr>  
            <tr>
                <td>
                    Apply cuff and check BP.</td>
           
            </tr>  
            <tr>
                <td>
                    Check pulse and RR</td>
           
            </tr>  
            <tr>
                <td>
                    Check temperature</td>
           
            </tr>  
            <tr>
                <td>
                    Measure and document patient&#39;s vital signs correctly.</td>
           
            </tr>  
             <%------------------------------------PART A-QUEST NO :8 -------------------------------------------------------------%>
			 
                        <tr>
                <td >
                                     8</td>
                <td align="left" class="style41" >
                ** Omits all oral medications (ordered in EIMR)

                </td>
                <td align="left" >
                  **Omits all oral medication and explains why</br>
                    a) Asprin and Ticagrelor (bleeding) (2)</br>
                    b) Hydroclorothiazide and Enalapril (BP low) (2)</br>

                </td>
                <td colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList class="style_radio" RepeatColumns="5" ID="RadioButtonList8" runat="server"    RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator8"
            runat="server"
            ControlToValidate="RadioButtonList8"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" >
                    4
                </td>
                <td >
                    
                    <asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                    
                </td>
           
                 <td class="font-italic" colspan="3" rowspan="6">
                    Lecturer:</br>
                    **Accord "0" mark if student did not perform any of the steps. Able to explain to the patient why medications omitted.</br></br>

                    TSO:</br>
                    I didn't take any of my morning medications before coming to the hospital.<br/>Do I need to take all of it?








                     </td>
           
            </tr> 

			 
			 
			 
			  <%------------------------------------PART A-QUEST NO :9-------------------------------------------------------------%>
            <tr>
                <td rowspan="2">
                9
                </td>
                <td align="left" class="style41" rowspan="2">
                    Auscultate lung sounds</td>
                <td align="left">
<%--<table border="1" bordercolor="#98272d" style="border-style:hidden; border-collapse: collapse;width:100%;">
                <tr ><td align="left" class="style20">
                  Use stetoscope correctly
                </td></tr>
                <tr ><td align="left" class="style20">
                  Assess 4 points of lung
                </td></tr>
               
                
                </table>--%>Use stetoscope correctly</td>
                <td colspan="5" align="center" rowspan="2">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList9" class="style_radio" runat="server"    RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                    
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator9"
            runat="server"
            ControlToValidate="RadioButtonList9"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                    
                    
                </td>
                <td align="center" class="style39" rowspan="2">
                    4
                </td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                
           
            </tr>  
            <tr>
                <td align="left">
                    Assess 4 points of lung</td>
           
            </tr>  
                <%------------------------------------PART A-QUEST NO :10 -------------------------------------------------------------%>
             <tr>
				<td rowspan="2">10</td>
				<td rowspan="3" align="left" class="style45">Assess dressing and drain</td>
				<td>Assess integrity of dressing</td>
				<td rowspan="2" colspan="5" align="center">
						 <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList10" runat="server" class="style_radio" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator10"
            runat="server"
            ControlToValidate="RadioButtonList10"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
				</td>
				<td rowspan="2"  align="center" class="style49">4</td>
				<td rowspan="2">
					<asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
				</td>
  
  
			</tr>
            
			
			
	
				<tr>
					<td  align="left">Assess for oozing/bleeding/abdominal drainage</td>
				</tr>





 <%------------------------------------PART A-QUEST NO :11-------------------------------------------------------------%>

			<tr>
				<td>11</td>
				<td  align="left">Apply pressure onto abdominal wound
</td>
				<td colspan="5" align="center">
					 <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList11" runat="server" class="style_radio" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator11"
            runat="server"
            ControlToValidate="RadioButtonList11"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
				
				</td>
				<td align="center">4</td>
				<td align="center" class="style49" >
						  <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
				</td>
			</tr>  
                
			
			
			
			
			
			
			
			
			
			
            
               <%------------------------------------PART A-QUEST NO :12-------------------------------------------------------------%>
            <tr>
                <td rowspan="4">
                 12
                </td>
                <td align="left" class="style41" rowspan="4">
                  Assess IV site
                </td>
                <td align="left">
                    <%--<table border="1" bordercolor="#98272d" style="border-style:hidden; border-collapse: collapse;width:100%;">
                <tr ><td align="left" class="style20" >
                 Expiry date  (≤ 3 days)</td></tr>
                <tr ><td align="left" class="style20">
                Inspect site for POET
                </td></tr>
               <tr ><td align="left" class="style20">
Ensure availability of IV cannula size 19G or larger</td></tr>
                <tr ><td align="left" class="style20">
                Flush line to ensure patency of IV line
                </td></tr>
                
                </table>--%>Expiry date (≤ 3 days)</td>
                <td colspan="5" align="center" rowspan="4">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList12" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator12"
            runat="server"
            ControlToValidate="RadioButtonList12"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" rowspan="4">
                    4
                </td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks12"  TextMode="MultiLine"    
                        class="RemarksTextarea" runat="server" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="" rowspan="4">
                    &nbsp;</td>
           
            </tr>  
            
            <tr>
                <td align="left">
                    Inspect site for POET</td>
           
            </tr>  
            
            <tr>
                <td align="left">
                    Ensure availability of IV cannula size 19G or larger</td>
           
            </tr>  
            
            <tr>
                <td align="left">
                    Flush line to ensure patency of IV line</td>
           
            </tr>  
            
              <%------------------------------------PART A-QUEST NO :13-------------------------------------------------------------%>
            <tr>
                <td rowspan="3">
                 13
                </td>
                <td align="left" class="style41" rowspan="3">
                  Prepare extension tubing
                </td>
                <td align="left">
               <%--  <table border="1" bordercolor="#98272d" style="border-style:hidden; border-collapse: collapse;width:100%;">
                <tr ><td align="left" class="style20">
                Prime extension tubing with normal saline
                </td></tr>
                <tr ><td align="left" class="style20">
                Wear latex gloves
                </td></tr>
               <tr ><td align="left" class="style20">
Swab IV port with alcohol swab before connecting</td></tr>
               
                
                </table> --%>Prime extension tubing with normal saline</td>
                <td colspan="5" align="center" rowspan="3">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList13" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator13"
            runat="server"
            ControlToValidate="RadioButtonList13"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" rowspan="3">
                    4
                </td>
                <td rowspan="3">
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="" rowspan="3">
                    &nbsp;</td>
           
            </tr>  
            
            <tr>
                <td align="left">
                    Wear latex gloves</td>
           
            </tr>  
            
            <tr>
                <td align="left">
                    Swab IV port with alcohol swab before connecting</td>
           
            </tr>  
            
              <%------------------------------------PART A-QUEST NO :14-------------------------------------------------------------%>
            <tr>
                <td>
                 14
                </td>
                <td align="left" class="style41" rowspan="2">
                    Administer IV Normal saline 0.9%</td>
                <td align="left">
                    **Priming the blood administration infusion set without contamination.</td>
                <td colspan="5" align="center">
                   <b >
                       <asp:RadioButtonList ID="RadioButtonList14" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="font-italic" rowspan="2">
                    Lecturer:
                    <br />
                    Accord &quot;0&quot; mark if student contaminated during priming or presence of bubbles in 
                    drip set.</td>
           
            </tr>  
              <%------------------------------------PART A-QUEST NO :15-------------------------------------------------------------%>
            <tr>
                <td>
                    15</td>
                <td align="left">
                    **Ensure no air bubbles</td>
                <td colspan="5" align="center">
                    <b>
                   <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList15" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator15"
            runat="server"
            ControlToValidate="RadioButtonList15"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4</td>
           
                <td>
                    
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
            </tr>  
            
             <%------------------------------------PART A-QUEST NO :16-------------------------------------------------------------%>
             
            <tr> 
            <td >16</td> 
             <td rowspan="6" class="style41" >Administer blood within the first 7 minutes correctly</td> 
            <td class="">**Double-check all labels and expiry date with another nurse.
</td> 
            <td colspan="5" align="center">  <b >
                        <asp:RadioButtonList ID="RadioButtonList16" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator></td>
            <td class="style36" align="center" >4</td>
              <td >
                    
                     <asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
              <td   class="font-italic" rowspan="6" >
                    TSO:
                    <br />
                    If student does not follow blood administration policy, the patient will 
                    question the nurse &quot;Are you sure that this is the right blood for me?&quot; Lecturer:
                    <br />
                    To accord &quot;0&quot; mark if student did not perform the highlighted required steps of 
                    checking prior blood administration.</td>
             </tr>
			  <%------------------------------------PART A-QUEST NO :17-------------------------------------------------------------%>
             <tr><td>17</td> <td>**Visually inspect blood product</td> 
                 <td align="center" 
                     colspan="5">
                    <b>
                   <asp:RadioButtonList ID="RadioButtonList17" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td class="style36" align="center" >4</td>
              <td >
                    
                   <asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr> 
			 <%------------------------------------PART A-QUEST NO :18-------------------------------------------------------------%>
           <tr><td>18</td> <td>**Check blood units and ensure blood is&nbsp; tallied with GXM and blood card</td> 
               <td align="center" colspan="5">
                    <b>
                     <asp:RadioButtonList ID="RadioButtonList18" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td class="style36" align="center" >4</td>
              <td >
                    
                   <asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
            </tr> 
         <%------------------------------------PART A-QUEST NO :19-------------------------------------------------------------%>
            <tr><td>19</td> <td>**Perform pre-transfusion check with a staff nurse correctly</td> 
                <td align="center" colspan="5">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="RadioButtonList19" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td class="style36" align="center" >4</td>
              <td >
                    
                    <asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr> 
            
 <%------------------------------------PART A-QUEST NO :20-------------------------------------------------------------%>
<tr><td>20</td> <td>Wear gloves</td> <td align="center" colspan="5"><b>
                   <asp:RadioButtonList ID="RadioButtonList20" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ControlToValidate="RadioButtonList20" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td class="style36" align="center" >4</td>
              <td >
                    
                    <asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
            </tr>
        
         <%------------------------------------PART A-QUEST NO :21-------------------------------------------------------------%>
        
        <tr><td>21</td> <td>Calculate and administer the blood unit slowly, manually adjust the drip 
                    rate to 20 drops/min (Total volume = 240mls to run over 4 hours).</td> 
            <td align="center" colspan="5">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ControlToValidate="RadioButtonList21" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td class="style36" align="center" >4</td>
              <td >
                    
                   <asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr>
            
             <%------------------------------------PART A-QUEST NO :22-------------------------------------------------------------%>
            <tr>
                <td >
                                     22</td>
                <td align="left" class="style41" >
                  Perform hand hygiene
                </td>
                <td align="left" >
                   Perform 7 steps and follow 5 moments
                </td>
                <td colspan="5" align="center" >
                    <b>
                     <asp:RadioButtonList ID="RadioButtonList22" runat="server" class="style_radio" 
                    RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                    Width="100%">
                    <asp:ListItem Text="" Value="0"></asp:ListItem>
                    <asp:ListItem Text="" Value="1"></asp:ListItem>
                    <asp:ListItem Text="" Value="2"></asp:ListItem>
                    <asp:ListItem Text="" Value="3"></asp:ListItem>
                    <asp:ListItem Text="" Value="4"></asp:ListItem>
                </asp:RadioButtonList>
                </b>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                    ControlToValidate="RadioButtonList22" ErrorMessage="Select One!" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" >
                    4
                </td>
                <td >
                    
                     <asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td >
                    &nbsp;</td>
           
            </tr>  
            
              <%------------------------------------PART A-QUEST NO :23-------------------------------------------------------------%>
           
            
             
            <tr> 
            <td  >23</td> 
             <td rowspan="4" class="style41" >Monitor for early s/s of blood reactions closely</td> 
            <td class="">**Vital signs every 10-15 minutes, for 1st hour</td> 
            <td colspan="5" align="center"> <b>
              <asp:RadioButtonList ID="RadioButtonList23" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                        ControlToValidate="RadioButtonList23" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
            <td align="center" class="style39" >4</td>
              <td  class="" align="center" >
                    
                     <asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
              <td  class="font-italic" rowspan="4" >
                    Lecturer:
                    <br />
                    To accord &quot;0&quot; mark if student did not perform the highlighted required step.</td>
             </tr>
			   <%------------------------------------PART A-QUEST NO :24-------------------------------------------------------------%>
             <tr><td >24</td> <td>**Vital signs every 30 minutes for 2nd hour</td> 
                 <td align="center" colspan="5">
                    <b>
                   <asp:RadioButtonList ID="RadioButtonList24" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                        ControlToValidate="RadioButtonList24" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td align="center" class="style39" >4</td>
              <td  class="" align="center" >
                    
                     <asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr> 
			<%------------------------------------PART A-QUEST NO :25-------------------------------------------------------------%>
           <tr><td >25</td> <td>**Vital signs hourly till completion or according to doctor's order</td> 
               <td align="center" colspan="5">
                    <b>
                   <asp:RadioButtonList ID="RadioButtonList25" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                        ControlToValidate="RadioButtonList25" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td align="center" class="style39" >4</td>
              <td  class="" align="center" >
                    
                    <asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr> 
        <%------------------------------------PART A-QUEST NO :26-------------------------------------------------------------%>
            <tr><td>26</td> <td>**Document in hourly chart</td> <td align="center" colspan="5"><b>
                    <asp:RadioButtonList ID="RadioButtonList26" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                        ControlToValidate="RadioButtonList26" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td> 
            <td align="center" class="style39" >4</td>
              <td  class="" align="center" >
                    
                    <asp:TextBox ID="remarks26" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
            </tr> 
            

            
             <%-- ---------------------------------------------------------------------------------------------%>
               <tr>
                <td align="left" colspan="11" class="styleCC" bgcolor="#98272D">
                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" Text="PART B - OPTION 3 (ANAPHYLACTIC SHOCK)"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        <asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="185px" Height="25px">
                                     <asp:ListItem Text="3-ANAPHYLACTIC SHOCK" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="1-HYPOVOLEMIC SHOCK" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="2-PULMONARY EDEMA" Value="2" ></asp:ListItem>
                                        
                                </asp:DropDownList>
                        
                        
                        <asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
 <%-- ---------------------------------------------------------------------------------------------%>
              
            <tr>
                <td align="left" colspan="10" class="styleCC" bgcolor="#29a329">
                    Cue: Activate this state if the students manage to administer the blood within 
                    the first 7 mins and run at the correct rate which is at 20 drops/min to 
                    complete the blood within 4 hours.</td>
                    
                    
                    <td bgcolor="#29a329" class="font-italic" >
                      TSO: <br/>
Activate State 4 (Anaphylactic shock):<br/>
RR- 30b/min, HR- 130b/min, BP- 82/52 mmHg, SpO2- 90%, Temp- 38.5 deg Celsius, ECG- ST.
</td>
            </tr>
			 <%------------------------------------PART B OPTION 3-QUEST NO :41-------------------------------------------------------------%>
                          <tr>
						  
                <td rowspan="8">41</td>
                <td align="left" class="style41" rowspan="8">
                    Recognise s/s of blood reaction</td>
                 <td>
               <%-- <table border="1" bordercolor="#98272d" style="border-style:hidden;width:100%;height:100%; border-collapse: collapse;">
                <tr>
                <td align="left" class="style44" >
                    Vomiting/Abdominal pain</td>
               </tr>
               <tr>
                 <td align="left" class="style44">
                     Hyperthermia/ Temperature ≥ 38.5 / chills</td></tr>
               <tr>
                 <td align="left" class="style44">
                     Restlessness/Anxiety/confusion caused by hypoxia</td></tr>
                <tr>
                 <td align="left" class="style44">
                     Urine output: Oliguria to anuria</td></tr>
                <tr>
                 <td align="left" class="style44">
                     Stridor/wheezes/Dyspnea</td></tr>
                  <tr>
                 <td align="left" class="style43">
                     Tachycardia/Dysrhythmias</td></tr>
                 <tr>
                 <td align="left" class="style44">
                     Hypotension</td></tr>
                 <tr>
                 <td align="left" class="style44">
                     Skin: warm, red, urticaria/edematous of lips, eyelids, tongue, hands, feet, 
                     genitals</td></tr>
                
                  
               
               </table >--%>Vomiting/Abdominal pain</td>
                <td colspan="5" align="center" rowspan="8">
                   <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList41" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator41"
            runat="server"
            ControlToValidate="RadioButtonList41"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" rowspan="8">
                    4
                </td>
                <td rowspan="8"  >
                    
                    <asp:TextBox ID="remarks41" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td class="font-italic" rowspan="8"  >
                    Lecturer: Inform the s/s of anaphylactic shock to students. <br />
                    <br />
                    TSO: Set manikin: Breath sounds- stridor/wheeze, heart sound- normal. Restless 
                    and anxiety.</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Hyperthermia/ Temperature ≥ 38.5 / chills</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Restlessness/Anxiety/confusion caused by hypoxia</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Urine output: Oliguria to anuria</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Stridor/wheezes/Dyspnea</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Tachycardia/Dysrhythmias</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Hypotension</td>
           
            </tr> 
            
                          <tr>
                 <td>
                     Skin: warm, red, urticaria/edematous of lips, eyelids, tongue, hands, feet, 
                     genitals</td>
           
            </tr> 
            
             <%------------------------------------PART B OPTION 3-QUEST NO :42-------------------------------------------------------------%>
             <tr> 
            <td class="style45" >42</td> 
             <td rowspan="6" class="style41" >Perform nursing intervention on anaphylactic shock</td> 
            <td class="style45">STOP blood transfusion STAT </td> 
            <td colspan="5" align="center" class="style45" > <b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList42" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator42"
            runat="server"
            ControlToValidate="RadioButtonList42"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator></td>
            <td  align="center" >4</td>
              <td  class="style45" align="center" >
                    
                    <asp:TextBox ID="remarks42" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
              <td   rowspan="6" class="font-italic" valign="top" >
                   TSO: </br>
				
Activate Recovery state (Only if students have perform all required nursing intervention as listed):
</br>RR- 21b/min, HR- 90b/min, BP- 100/60 mmHg, SpO2- 98%, Temp- 37 deg Celcius.
</br></br>

** Lecturer to accord "0" marks if any steps not done

</br></br>
For Info</br>
Nebulised salbutamol</br>
2nd line: IV Steroids</br>
3rd line: IV Antihistamine ( but would lower BP)








</td>
             </tr>
			  <%------------------------------------PART B OPTION 3-QUEST NO :43-------------------------------------------------------------%>
             <tr><td>43</td> <td>Remove the blood product and its administration set</td> <td align="center" colspan="5"><b >
                        <asp:RadioButtonList ID="RadioButtonList43" runat="server" class="style_radio" 
                            RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                            Width="100%">
                            <asp:ListItem Text="" Value="0"></asp:ListItem>
                            <asp:ListItem Text="" Value="1"></asp:ListItem>
                            <asp:ListItem Text="" Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                        </b>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                            ControlToValidate="RadioButtonList43" ErrorMessage="Select One!" 
                            ForeColor="Red">
                        </asp:RequiredFieldValidator></td> 
            <td  align="center" >4</td>
              <td   align="center" >
                    
                    <asp:TextBox ID="remarks43" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                </tr> 
				 <%------------------------------------PART B OPTION 3-QUEST NO :44-------------------------------------------------------------%>
             <tr><td>44</td> <td>(Verbalise) To send the incomplete blood product including the 
                    running set to the blood bank.</td> <td align="center" colspan="5"><b>
                        <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList44" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator44"
            runat="server"
            ControlToValidate="RadioButtonList44"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                    </td> 
            <td  align="center" >4</td>
              <td   align="center" >
                    
                    <asp:TextBox ID="remarks44" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                </tr> 
				 <%------------------------------------PART B OPTION 3-QUEST NO :45-------------------------------------------------------------%>
           <tr><td>45</td> <td>Establish airway and administer high flow oxygen</td> <td align="center" colspan="5"><b >
                      <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList45" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator45"
            runat="server"
            ControlToValidate="RadioButtonList45"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator></td> 
            <td  align="center" >4</td>
              <td   align="center" >
                    
                    <asp:TextBox ID="remarks45" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                </tr> 
         <%------------------------------------PART B OPTION 3-QUEST NO :46-------------------------------------------------------------%>
            <tr><td>46</td> <td>IV N/S 0.9% challenge using a new infusion set</td> <td align="center" colspan="5"><b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList46" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator46"
            runat="server"
            ControlToValidate="RadioButtonList46"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator></td> 
            <td  align="center" >4</td>
              <td   align="center" >
                    
                    <asp:TextBox ID="remarks46" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                </tr> 
            

 <%------------------------------------PART B OPTION 3-QUEST NO :47-------------------------------------------------------------%>
        <tr><td>47</td> <td>** Administer IM Adrenaline  0.5 mg safely</br>
a)Verify correct patient (Scan barcode on wrist tag, to ask  patient and compare against IMR)
</br>b) Verify any allergies
</br>c) Verify correct drug (scan drug and compare against IMR)
</br>d) Administer IM Adrenaline 0.5mg 
</br>(Check correct amount - 0.5 ml and IM route)


		</td> <td align="center" colspan="5"><b >
                       <asp:RadioButtonList RepeatColumns="5" ID="RadioButtonList47" class="style_radio" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%"   >
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                     <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator47"
            runat="server"
            ControlToValidate="RadioButtonList47"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator></td> 
            <td  align="center" >4</td>
              <td   align="center" >
                    
                    <asp:TextBox ID="remarks47" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                </tr> 
            


      
               
            
                 <%-- ---------------------------------------------------------------------------------------------%>
               <tr>
                <td align="left" colspan="11" class="styleCC" bgcolor="#98272D">
                    <asp:Label ID="Label43" runat="server" Font-Bold="True" Font-Size="Large" Text="PART C"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
                                     <%-------------------------------------------PART C-QUEST NO :48--------------------------------------------------------------%>
            <tr>
                <td >
                    48</td>
                <td align="left" class="style41">
                    Call doctor to inform patient&#39;s condition.</td>
                <td align="left">
                    Perform effective communication to doctor.</td>
                <td colspan="5" align="center">
                    <b>
                     <asp:RadioButtonList ID="RadioButtonList48" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                        ControlToValidate="RadioButtonList48" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                     <asp:TextBox ID="remarks48" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
           
                <td>
                    &nbsp;</td>
           
            </tr> 
                                    <%-------------------------------------------PART C-QUEST NO :49--------------------------------------------------------------%>
            <tr>
                <td >
                    49</td>
                <td align="left" class="style41">
                 Continuously monitor patient's parameters during and after the treatment
                </td>
                <td align="left">
                   1. monitor parameters
    closely<br />
2. monitor I/O strictly
                    <br />
                    3. Conscious level </td>
                <td colspan="5" align="center">
                    <b>
                     <asp:RadioButtonList ID="RadioButtonList49" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" 
                        ControlToValidate="RadioButtonList49" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                   <asp:TextBox ID="remarks49" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td>
                    &nbsp;</td>
           
            </tr> 
            
            
            <%-------------------------------------------PART C-QUEST NO :50--------------------------------------------------------------%>
            <tr>
                <td >
                    50</td>
                <td align="left" class="style41">
                    Analyze cardiac rhythm and/or 12 leads ECG</td>
                <td align="left">
                    Interpretation of cardiac rhythm and/or 12 leads ECG correctly.</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList50" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" 
                        ControlToValidate="RadioButtonList50" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks50" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td class="font-italic">
                    Refer to case notes for 12 leads ECG for pre- and post- transfusion.</td>
           
            </tr> 
            
            
          <%-------------------------------------------PART C-QUEST NO :51--------------------------------------------------------------%>
            <tr>
                <td >
                    51</td>
                <td align="left" class="style41">
                Follow up on blood test
                </td>
                <td align="left">
                FBC, Renal panel, ABG, Cardiac Enzyme

                </td>
                <td colspan="5" align="center">
                    <b>
                   <asp:RadioButtonList ID="RadioButtonList51" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" 
                        ControlToValidate="RadioButtonList51" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks51" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td class="font-italic">
                    Refer to case notes for blood result.</td>
           
            </tr> 
          <%-------------------------------------------PART C-QUEST NO :52--------------------------------------------------------------%>
            <tr>
                <td >
                    52</td>
                <td align="left" class="style41">
                    Complete the blood card accordingly.</td>
                <td align="left">
                    Ensure all aspects in the blood card are filled up correctly.</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList52" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" 
                        ControlToValidate="RadioButtonList52" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks52" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td>
                    &nbsp;</td>
           
            </tr> 
			   <%-------------------------------------------PART C-QUEST NO :53--------------------------------------------------------------%>
            <tr>
                <td >
                    53</td>
                <td align="left" class="style41">
              Provide proper and timely documentation of procedure in report.
                </td>
                <td align="left">
                    1. Patient&#39;s name and IC.
                    <br />
                    2. Detail of performed procedure.
                    <br />
                    3. Name with signature in report.
                    <br />
                    4. IMR is signed /E-IMR is marked as done.</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList53" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" 
                        ControlToValidate="RadioButtonList53" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                </td>
                <td>
                    
                   <asp:TextBox ID="remarks53" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td class="">
                    &nbsp;</td>
           
            </tr> 
              <%-------------------------------------------PART C-QUEST NO :54--------------------------------------------------------------%>
            <tr>
                <td >
                    54</td>
                <td align="left" class="style41">
                  Evaluate patient's condition post-fluid administration
</td>
                <td align="left">
                    1. Vital signs
                    <br />
                    2. Conscious Level</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList54" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" 
                        ControlToValidate="RadioButtonList54" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                
                    
                    </td>
           
                <td class="" >
                
                    
                     <asp:TextBox ID="remarks54" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
            </tr> 
			   <%-------------------------------------------PART C-QUEST NO :55--------------------------------------------------------------%>
            <tr>
                <td >
                    55</td>
                
                <td align="left" class="style41">
                    Display good team work, effort and leadership among team members.</td>
                <td align="left">
                    1. Role is well defined.
                    <br />
                    2. All team members coordinated well.
                    <br />
                    3. Display good leadership and delegation skills.</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList55" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" 
                        ControlToValidate="RadioButtonList55" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                
                    
                    </td>
           
                <td class="">
                
                    
                    <asp:TextBox ID="remarks55" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
            </tr> 
			   <%-------------------------------------------PART C-QUEST NO :56--------------------------------------------------------------%>
            
            
            
             <tr>
                <td >
                    56</td>
                <td align="left" class="style41"> Display critical thinking and holistic care to 
                    patient.</td>
                <td align="left">1. Able to rationalise on the treatment given.
                    <br />
                    2. Good evaluation of patient&#39;s condition.</td>
                <td colspan="5" align="center">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList56" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" 
                        ControlToValidate="RadioButtonList56" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39">
                    4
                
                    
                    </td>
           
                <td class="">
                
                    
                    <asp:TextBox ID="remarks56" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
            </tr> 
            
        
               <%-------------------------------------------PART C-QUEST NO :57-------------------------------------------------------------%>
            <tr>
                <td >
                    57</td>
                <td align="left" class="style41" >
            Display good reflective learning  </td>
                <td align="left" >
                    Able to identify strength, weakness and suggest improvement.</td>
                <td colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList57" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" 
                        ControlToValidate="RadioButtonList57" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style39" >
                    4
                </td>
                <td >
                    
                    <asp:TextBox ID="remarks57" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea"  Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
           
                <td class="" >
                    &nbsp;</td>
           
            </tr> 
           <%-- .......................................................
           --%>
            
            
          <tr>
            <td  rowspan="3" > </td>
              <td class="style42" > <asp:Label ID="Label53" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label> <asp:Label ID="Label52" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total"></asp:Label></td>
             <td  align="left" > <asp:Label ID="lb_total" runat="server" Font-Size="Medium" Font-Names="Arial" Font-Bold="true" Text=""></asp:Label></td>
        <td  colspan="5" > <asp:Label ID="Label55" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label> <asp:Label ID="Label56" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label> <asp:Label ID="Label57" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label> <asp:Label ID="Label58" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label> <asp:Label ID="Label59" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label></td>
          <td align="center" > <asp:Label ID="Label60" runat="server" Font-Names="Arial" Font-Bold="true" Text="172"></asp:Label></td>
           <td align="center" > &nbsp;</td>
           <td align="center" > <asp:Label ID="lb" runat="server" Font-Size="Medium" Font-Names="Arial" Font-Bold="true" Text="Part A+B+C"></asp:Label></td></tr>
            
            
          <tr>
              <td class="style42" > <asp:Label ID="Label62" runat="server" Font-Names="Arial" Font-Bold="true" Text="Actual Score upon 10%"></asp:Label> </td>
             <td  align="left" >   <asp:Label ID="lb_actualscore" runat="server" Text="" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                        <asp:Button ID="btn_show_currentscore" autopostback="false" runat="server" Text="Update" Font-Bold="true"  OnClientClick="return show_score()" 
       CausesValidation="false"
             />
                </td>
        <td  colspan="8" > &nbsp;</td>
            </tr>
         <tr>
              <td align="right" colspan="2" > 
                  <asp:Label ID="Label163" runat="server" Font-Bold="true" Font-Names="Arial" 
                      Text=" Calculation: Actual Score = "></asp:Label>
                  <br />
                  <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Names="Arial" 
                      Text="Total/172 X 10% "></asp:Label>
              </td>
        <td colspan="8" align="left"> &nbsp;</td>
</tr>
        </table>
    </div>
    <div align="center">
           <asp:ImageButton ID="btn_common_save" autopostback="false" runat="server" ImageUrl="~/images/BtnSave.png"  
        Style="margin-top: 20px" Width="145px" Height="48px" CausesValidation="false" OnClientClick="Confirm2()"    OnClick="onclick_Save" />
        <asp:ImageButton ID="btn_submit"  OnClientClick="Confirm();" runat="server" ImageUrl="~/images/BtnSubmit.png"
            CausesValidation="true" Style="margin-top: 20px" Width="145px" Height="48px"
            OnClick="btn_submit_click" /></div>
    </form>
</body>
</html>
