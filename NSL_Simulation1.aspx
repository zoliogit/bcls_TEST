<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_Simulation1.aspx.cs" Inherits="NSL_Simulation1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title>Acute Coronary Syndrome</title>
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
 for (var i = 1; i <= 47; i++) 
 {    
 var rb = document.getElementById("RadioButtonList" + i); //Client ID of the radiolist
 var actual_score_float;
 var actual_score_decimalValue ;

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

    actual_score_float = (parseInt(total_score) / 188) * (10 / 100) * 100;//Total/188 X 10% 
    actual_score_decimalValue= parseFloat(actual_score_float).toFixed(1);
       // actual_score_decimalValue= Math.round(actual_score_float, 1);
      //actual_score_decimalValue=Math.round(actual_score_float*100)/100  //returns 28.45
     //alert("Total Score: "+ total_score+ newLine +"Actual Score upon 4%: " + actual_score_decimalValue);         
document.getElementById('lb_total').innerHTML = total_score;
document.getElementById('lb_actualscore').innerHTML = actual_score_decimalValue+"%";

     return false;
}

function highlightListControl(elementRef, foreColor, backColor)
{
 var inputElementArray = elementRef.getElementsByTagName('input');

 for (var i=0; i<inputElementArray.length; i++)
 {
  var inputElementRef = inputElementArray[i];
  var parentElement = inputElementRef.parentNode;

  if ( parentElement )
  {
   if ( inputElementRef.checked == true )
   {
    parentElement.style.color = foreColor;
    parentElement.style.backgroundColor = backColor;
   }
   else
   {
    parentElement.style.color = elementRef.style.color;
    parentElement.style.backgroundColor = elementRef.style.backgroundColor;
   }
  }
 }

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
          .style6
        {
            width: 153px;
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
       
      .font-italic {
    font-style: italic;
}
         .RemarksTextarea
        {
            width: 100%;
            height: 100%;
            margin:0;padding:0;
         }
      .style_radio
        {text-align:center!important;
       
        }
        html
        {
            height: 100%;
            width: 100%;
        }

        .style7
        {
            height: 41px;
        }

        .style8
        {
            height: 60px;
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
                        ForeColor="#F9FAFA" Text="SIMPract V3.1" Font-Names="Arial"></asp:Label>
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
                        OnClick="Button4_Click"  CausesValidation="False" 
                        ImageUrl="~/images/backToGroupsBtn.png"  Height="35px" Width="200px" />
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;  
                  <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Acute Coronary Syndrome" Font-Names="Arial"></asp:Label>
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
                <td align="left">
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Large" Text="Name of assessor"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td  align="left">
                    <b>
                        <asp:Label ID="lb_assessor" runat="server" Text="" Font-Bold="True" Font-Size="Medium"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text="Total percentage upon 10%"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td >
                    <b>
                        <asp:Label ID="lb_actualscore2" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td  align="left">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date of Assessment"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td >
                    <b>
                        <asp:Label ID="lb_date" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
        </table></div></br>
        
    <div>
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;
            width: 100%;height:100%" align="center">
            
             <tr>
                <td align="center" colspan="11"  bgcolor="#98272D">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Text="Acute Coronary Syndrome"		
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
              <tr>
                <td align="left" colspan="11" class="styleCC">
                    Brief Summary:
                    <br />
          
Mdm Lee Ho Yin is a 58- year-old housewife who came to the Emergency Department due to substernal “crushing” chest pain radiating to the left side of her neck and jaw. 
<br />Upon assessment, she was responsive and able to answer all the questions. Her initial vital signs were RR – 22b/min, HR – 105b/min, BP – 108/64mmhg, SpO2 – 95% on room air, Temperature 37.5 degree Celsius.
<br />Past medical history: She has a history of hypertension. She states that she takes “water pills” for her blood pressure and has been trying to exercise. She was last admitted for sepsis secondary to wound infection.
<br />Social: Lives with husband.
<br />Drug Allergy: Allergic to NSAIDs
							
								
								

                </td>
            </tr>
             <tr bgcolor="#98272D" >
                <td  rowspan="2" style="border: 1px solid white;">
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" rowspan="2" style="border: 1px solid white;" 
               >
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
                     >
                    <b>
                        <asp:Label ID="Label4" runat="server" Text="Maximum Score" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label162" runat="server" Text="Remarks" 
                        Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Action by TSO or Lecturers" Font-Bold="True" Font-Size="Large"
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
                <td  align="left"  colspan="11" style="border: 1px solid white;" class="style2">
                    <asp:Label ID="Label5" runat="server" Text="Immediate action upon arrival to Emergency Department:" Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
                
          
             <%-- ------------------------------------------------------------------------------- --%> 
               <tr>
                <td>
                    1
                </td>
                <td align="left" >
                   Follow 5 moments of hand hygiene.
                </td>
                <td align="left">
                   Perform hand hygiene.
                </td>
                <td  colspan="5" align="center" >
                  
                  <asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" 
                       >    <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="RadioButtonList1"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks1" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    TSO: 
                    <br />
                    Activate state 1: 
RR-22b/min, HR-105b/min, BP-108/64mmHg, SpO2-95%, Temp-37.5 degree Celsius,<br/>
ECG- ST segment depression(1st scenario);<br/> ST elevation(2nd scenario)<br/>
Pain score - 6/10.
 
</td>
            </tr>
            <%-- ------------------------------------------------------------------------------- --%>  
         
			<tr>
			<td align="left">2</td>
			<td rowspan="3" align="left">Display effective and professional communication with patient / relatives throughout simulation.
			</td>
			<td  align="left">Greet patient and introduce self.</td>
			  <td  colspan="5" align="center" >
                     <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
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
                <td align="center"   >
                    4</td>
                <td >
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
							 <td class="font-italic">
                   Patient is alert, short of breath, diaphoretic, pale and anxious when talking to students; complains of chest pain.
</td>
						</tr>	
						<tr>	
						
				<td align="left">3</td>			
				<td  align="left">Identify the patient by 2 identifiers.</td>
				<td  colspan="5" align="center" >
                     <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
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
							ForeColor="Red">
					</asp:RequiredFieldValidator>
                </td>
				
                <td align="center"   >
                    4</td>
                <td>
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                </td>	<td></td>
			</tr>	
						<tr>
			<td align="left">4</td>			
				<td  align="left">Obtain subjective data from patient/relative to plan intervention.</td>
				<td  colspan="5" align="center" >
                     <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"
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
							ForeColor="Red">
					</asp:RequiredFieldValidator>
                </td>
                <td align="center"   >
                    4</td>
                <td>
                    <asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                </td>	
			<td></td>
			
			</tr>
			
			
			  <%-- ------------------------------------------------------------------------------- --%>  
			  
			  
			    <tr>
                <td>
                    5</td>
                <td align="left" rowspan="4" >
                    Obtain the patient's initial haemodynamic status timely and correctly. (Within 5 
                    minutes post arrival)</td>
                <td align="left">
                    Measure and document patient's BP, pulse, respiratory rate, temperature and SpO2 
                    accurately.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RadioButtonList5" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td rowspan="4" class="font-italic" valign="top">
                   Lecturer:</br>

**Accord "0" mark if student:</br>
-did not assess the vital signs within 5 min post arrival OR did not re-evaluate the vital signs every 2-5mins
</br></br>
TSO: Patient will verbalised having mild-moderate pain"






</td>
            </tr>
            
                      <tr>
                <td>
                    6</td>
                <td align="left">
                    Interpret parameters and relate to patient's condition.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList6" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                          </td>
            </tr>
            
                        <tr>
                <td>
                    7</td>
                <td align="left">
                    Pain assessment: Use OLDCART, pain score.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="RadioButtonList7" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            
                        <tr>
                <td >
                    8</td>
                <td align="left">
                    **Re-evaluate vital signs every 2-5 mins..</td>
                <td  colspan="5" align="center"  >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="RadioButtonList8" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
			  
			  <%----------------------------------------------------------------------------------------%>
			  
			  
			  
			   <%-- ----------------------------------------------------------------------------- --%>  
                 
                  <tr>
                <td>
                    9</td>
                <td align="left" rowspan="3" >
                    Obtain 12 lead ECG correctly.</td>
                <td align="left">
                    Explain procedures and place the patient in supine position.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="RadioButtonList9" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                      </td>
                <td rowspan="3" class="font-italic" valign="top">
                   TSO:
                    <br />
 After student performed the 12 lead ECG, TSO to flash the 12 lead ECG result on the monitoring screen 


</td>
            </tr>
           <tr>
                <td>
                    10</td>
                <td align="left">
                    Perform 12 lead ECG correctly.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
            </tr>
            
                        <tr>
                <td >
                    11</td>
                <td align="left" >
                   Interpret the ECG correctly.</td>
                <td  colspan="5" align="center"  >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
			  <%--------------------------------------------------------------------------------------------------------------%>
			  
			   <%--   ------------------------------------------------------------------  --%>
            
                <tr>
                <td>
                    12</td>
                <td align="left" rowspan="3" >
                   Administer medications without errors</td>
                <td align="left">
                    **Scan patient's ID band
</br>a) Ask patient for name & IC number
</br>b) Compare with eIMR
</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    
                    
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    <%--<asp:RadioButtonList ID="RadioButtonList12" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                <td >
                  </td>
            </tr>
        <tr>   
                <td>
                    13</td>
                <td align="left">
                    **Check for presence of allergy 
</br>a) Ask patient for presence of allergy
</br>b) Compare with eIMR 
</br>c) eIMR indicates patient is allergic to  NSAIDs. Scans eIMR for NSAIDs
</br>** d) Withhold S/L Aspirin 
</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td> <td >
                  </td>
            </tr>
            
                        <tr>
                <td >
                    14</td>
                <td align="left" >
                   **Administer S/L GTN 1 tablet at correct dose and route
</br>a) Scan GTN bottle and compare with eIMR order</br>
b) Instruct patient to put tablet under the tongue 
</td>
                <td  colspan="5" align="center"  >
                    
                    <b>
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
                        ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td> <td >
                  </td>
            </tr>
			  
			    <%-- -----------------------------------------------------------------------
            --%>                      
            <tr>
                <td>
                    15</td>
                <td align="left"  >
                                        Display effective and efficient respond and communication among team members 
                    (roles specific).</td>
                <td align="left">
                    Inform doctor immediately when patient&#39;s condition change using SBAR.</td>
                <td  colspan="5" align="center" >
                    <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList15" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
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
                <td align="center" >
                    4</td>
                
                <td>
                    
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                
                <td>
                    &nbsp;</td>
            </tr> 
			  <%----------------------------------------------------------------------------------------%>
			  
			  
            <%--   ------------------------------------------------------------------  --%>
            
                <tr>
                <td>
                    16</td>
                <td align="left" rowspan="3" >
                   Management to improve oxygenation to heart muscle and prevent hypoxia. (Within 10 minutes post arrival)</td>
                <td align="left">
                    Patient is propped up to ease difficulty in breathing/ chest pain.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    
                    
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList16" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    <%--<asp:RadioButtonList ID="RadioButtonList11" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>--%>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                    </td>
                <td rowspan="3" class="font-italic" valign="top">
                    TSO:
                    <br />
                    If students fail to administer oxygen timely, patient will say, &quot;I can&#39;t seem to 
                    get enough air.&quot;</td>
            </tr>
        <tr>   
                <td>
                    17</td>
                <td align="left">
                    Administer oxygen therapy 2-4L/min as ordered. (Correct device and flow)</td>
                <td  colspan="5" align="center" >
                    
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
                        ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
            </tr>
            
                        <tr>
                <td >
                    18</td>
                <td align="left" >
                    Re-evaluate to ensure SpO2 is improved to above 95%.</td>
                <td  colspan="5" align="center"  >
                    
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
                        ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    
                    </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
           <%-- -------------------------------------------------------------------------%>
			  
			   <tr>
                <td>
                    19</td>
                <td align="left" >
                    Review and carry out physician&#39;s orders timely and correctly.</td>
                <td align="left">
                    Check physician&#39;s latest orders from progress note.</td>
                <td  colspan="5" align="center" >
                    <b >
                       <asp:RadioButtonList RepeatColumns="5" class="style_radio"   ID="RadioButtonList19" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%">
                            <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                    </b>
                  
                       <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator19"
            runat="server"
            ControlToValidate="RadioButtonList19"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >
        </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
                <td>
                    &nbsp;</td>
            </tr>                
			 <%---------------------------------------------------------------------------------------------%>
 <%--  ----------------------------------------------------------------------%>
         
                          
            
             <tr>
                <td>
                    20</td>
                <td align="left" rowspan="5" >
                    Obtain and interpret blood investigation.</td>
                <td align="left">
                   Prepare venepuncture as ordered (Cardiac enzymes/Renal Panel/FBC/PT/PTT/GXM) with correct blood tubes.
</td>
                <td  colspan="5" align="center" >
                    <b>
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
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td rowspan="5" class="font-italic" valign="top">
                    Lecturer:</br>
#After students sent out the blood investigation, lecturers are to inform students the results were back for them to interpret





</td>
            </tr>                
            
             <tr>
                <td>
                    21</td>
                <td align="left">
                    #Cardiac Enzyme: 
                    <br />
                    CK/CKMB is raised in 24 hours due to damage to myocardium 
                    tissue; Raised Troponin T indicates MI.</td>
                <td  colspan="5" align="center" >
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
            
             <tr>
                <td>
                    22</td>
                <td align="left">
                    #PT/PTT: 
                    <br />
                    Before initiation of thrombolytic therapy or PCI procedure.</td>
                <td  colspan="5" align="center" >
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
            
             <tr>
                <td>
                    23</td>
                <td align="left">
                    #FBC:<br />
-HB &amp; WBC to exclude anemia and infection. 
                    <br />
                    -Check platelets prior 
                    antiplatelet therapy.</td>
                <td  colspan="5" align="center" >
                    <b>
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
            
             <tr>
                <td>
                    24</td>
                <td align="left">
                    # U/E/Cr: 
                    <br />
                    To check renal function prior to invasive procedure with contrast.</td>
                <td  colspan="5" align="center" >
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>       			 
			  
			  <%--------------------------------------------------------------------------------------%>
			     
        
        
        
          
        
            <tr>
                <td>
                    25</td>
                <td align="left" >
                    Perform radiological investigation to rule out CCF.</td>
                <td align="left">
                    CXR is ordered and reviewed.</td>
                <td  colspan="5" align="center" >
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td class="font-italic">
                    TSO/Lecturer: To remind students to check EMR / patient&#39;s monitor when report / 
                    X-ray film is out.</td>
            </tr>  
        
        <%-----------------------------------------------------------------------------------------------------%>
		
          <tr>
                <td>
                    26</td>
                <td align="left" rowspan="7" >
                    Administer medications without errors</td>
                <td align="left">
                    **Scans patient&#39;s ID band </br>a)Ask patient for name &amp; IC number  </br>b)Compare with 
                    eIMR</td>
                <td  colspan="5" align="center" >
                    <b>
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
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks26" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
                <td class="font-italic" rowspan="7" valign="top">
                    TSO: </br> Patient still complains of pain upon students&#39; re-assessment after GTN.
                    <br /></br>
                    Lecturer:</br>
**Accord "0" mark if student fail to perform any of the required steps before serving medication.
                </br></br>
                
                Lecturer: </br>
To distract  or interrupt while student is preparing IV GTN /Morphine</td>
            </tr>      
        
        
        
        
        
          <tr>
                <td>
                    27</td>
                <td align="left">
                    **Check for presence of allergy </br>a) Ask patient for presence of allergy  </br>b) 
                    Compare with eIMR  </br>c) eIMR indicates patient is allergic to NSAIDs. Scans eIMR 
                    for NSAIDs  </br>** d) Withhold S/L Aspirin </td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                        ControlToValidate="RadioButtonList27" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks27" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>      
        
        
        
        
        
          <tr>
                <td>
                    28</td>
                <td align="left">
                  **Assess for vital signs to ensure patient is not hypotensive  (Systolic BP <90mmHg)
</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList28" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                        ControlToValidate="RadioButtonList28" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks28" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>      
        
        
        
        
        
          <tr>
                <td>
                    29</td>
                <td align="left">
                  **Administer IV GTN to 10-20 mcg/min 
at the correct dose, rate & dilution </br>
a) Scan GTN vials & compare with eIMR order </br>
b)Dilute 30 mg/30ml GTN with 20 ml   of N/S  (Total volume 50 ml)</br>
c) Administer 1-2 ml/hr via syringe pump</br>
d)Administer on an alternate IV line</br>

</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList29" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                        ControlToValidate="RadioButtonList29" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks29" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>   
			
			
			 <tr>
                <td>
                    30</td>
                <td align="left">
                   Assess for the side effects of GTN including hypotension and headache.

</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList30" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                        ControlToValidate="RadioButtonList30" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks30" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>   
			 <tr>
                <td>
                    31</td>
                <td align="left">
                  **Prepare IV bolus Morphine 2 mg prn </br>
a)Scan Morphine vial and compare with eIMR order </br>
b)Dilute 10 mg/1ml Morphine with 9 ml   of N/S  (Total Volume 10 ml)</br>
c) Doctor to administer accordingly</br>
d) Administer on an alternate IV line & not concurently with IV GTN.



</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList31" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                        ControlToValidate="RadioButtonList31" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks31" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>   
			
			 <tr>
                <td>
                    32</td>
                <td align="left">
                  Assess for side effects of morphine by checking RR and SpO2.
				</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList32" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                        ControlToValidate="RadioButtonList32" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks32" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
            </tr>   
			
			<%--------------------------------------------------------------------------------------------%>
			   <tr>
                <td>
                    33</td>
                <td align="left" rowspan="6" >
                    Re-evaluate patient&#39;s hemodynamic status and ECG correctly.</td>
                <td align="left">
                    Interpret the ECG correctly.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList33" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                        ControlToValidate="RadioButtonList33" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks33" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td rowspan="6" class="font-italic">
                 TSO:</br> Activate state 2
RR- 28b/min, HR-118b/min, BP-82/52mmHg, SpO2-93%, Temp-37.8 degree Celsius.
</br></br>
The patient shouts in pain. Inform pain score 8/10 upon asking by student.
</br></br>
Lecturer:</br>
**Accord "0 mark" if student is running IV N/S slow or did not stop or reduce IV GTN infusion.








                     </td>
            </tr>
            
                      <tr>
                <td>
                    34</td>
                <td align="left">
                    Re-evaluate patient&#39;s parameters including pain score.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList34" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                        ControlToValidate="RadioButtonList34" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks34" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                          </td>
            </tr>
            
                      <tr>
                <td>
                   35</td>
                <td align="left">
                    Inform doctor immediately when patient's condition changes using SBAR.
</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList35" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                        ControlToValidate="RadioButtonList35" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks35" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>
            
			
			
			
			
			
			
			
			
			
			
			
                        <tr>
                <td>
                    36</td>
                <td align="left">
                    Increase oxygen to 100% NRM</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList36" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                        ControlToValidate="RadioButtonList36" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks36" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            
                        <tr>
                <td>
                    37</td>
                <td align="left">
                    Hold off or reduce IV GTN infusion when patient is hypotensive as ordered.</td>
                <td  colspan="5" align="center" >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList37" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                        ControlToValidate="RadioButtonList37" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks37" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>
            
                        <tr>
                <td >
                    38</td>
                <td align="left" >
                    **Verbalise: administer IV Dopamine to increase BP.</td>
                <td  colspan="5" align="center"  >
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList38" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                        ControlToValidate="RadioButtonList38" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks38" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
			
			  <%-------------------------------------------------------------------------------------------%>
			       <tr>
                <td>
                    39</td>
                <td align="left" rowspan="6" >
                    Prepare patient for PCI (student verbalised &lt; 3hrs since onset of AMI).</td>
                <td align="left">
                                        Assess knowledge of the procedure, expectations of treatment and explain the 
                                        procedure to the patient.</td>
                <td  colspan="5" align="center" >
                   
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList39" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                        ControlToValidate="RadioButtonList39" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks39" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td rowspan="6" class="font-italic" valign="top">
                    TSO:
                    <br />
                    Activate recovery state (if students perform MONA correctly, verbalize Dopamine 
                    administration, hold off IV GTN infusion and increase O2 to 100% in state 2) 
                    <br />
                    RR- 
                    21b/min, HR-100b/min, BP-92/60mmHg, SpO2 96% Pain score- 5/10</td>
            </tr>                
         
             <tr>
                <td>
                                        40           </td>
                <td align="left">
                    Ensure availability of all latest laboratory result in the patient&#39;s case file, 
                    including FBC, PT/PTT, Renal panel, GXM.</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList40" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                        ControlToValidate="RadioButtonList40" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center">4</td>
                <td>
                    
                    <asp:TextBox ID="remarks40" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
         
             <tr>
                <td class="style8">
                   41                  </td>
                <td align="left" class="style8">
                    Monitor patient’s hemodynamic status closely including continuous ECG 
                    monitoring.</td>
                <td  colspan="5" align="center" class="style8" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList41" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                        ControlToValidate="RadioButtonList41" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" class="style8" >
 4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks41" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
         
             <tr>
                <td>
                    42</td>
                <td align="left">
                    NBM and IV drip.</td>
                <td  colspan="5" align="center" >
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList42" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                        ControlToValidate="RadioButtonList42" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" >
 4</td>
                <td>
                    
                    <asp:TextBox ID="remarks42" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
         
             <tr>
                <td>
                                        43</td>
                <td align="left">
                    ** Administer Ticagrelor 180mg stat</br>
a) Check for correct dosage:2 tablets( 90 mg/tab)</td>
                <td  colspan="5" align="center" >
                   
                    <b>
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
                    </asp:RequiredFieldValidator>
                 </td>
                <td align="center" >
 4</td>
                <td>
                    
                    <asp:TextBox ID="remarks43" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
         
             <tr>
                <td class="style7">
                    44</td>
                <td align="left" class="style7">Check for presence of a valid consent.
                    &nbsp;</td>
                <td  colspan="5" align="center" class="style7" >
                   
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList44" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                        ControlToValidate="RadioButtonList44" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   
                    </td><td align="center" class="style7">4</td>
                <td class="style7">
                    
                    <asp:TextBox ID="remarks44" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>                
          <%--   ------------------------------------------------------------------  --%>
			  
			  
			     
               <tr>
                <td>
                    45</td>
                <td align="left" >
                    Display good team work, effort and leadership among team members</td>
                <td align="left">
                    Role is well defined.
                    <br />
                    All team members coordinated well.</br> Displayed good leadership and delegation 
                    skills.</td>
                <td  colspan="5" align="center" class="style7">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList45" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                        ControlToValidate="RadioButtonList45" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks45" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td>
                    Lecturer:</br> Deduct marks to &quot;1 or 2&quot; marks for this category if students: </br>-did not 
                    conduct the required assessment or management for AMI within the stipulated 
                    time.</td>
            </tr>                
         
               <tr>
                <td>
                    46</td>
                <td align="left" >
                    Display critical thinking and holistic management of patient care</td>
                <td align="left">
                    Able to rationalise on the treatment given. </br>Good evaluation of patient&#39;s 
                    condition.</td>
                <td  colspan="5" align="center" class="style7">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList46" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                        ControlToValidate="RadioButtonList46" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks46" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td>
                  Lecturer:</br>
Deduct marks to "1 or 2" marks for this category if students: </br>
-did not execute MONA correctly.

</td>
            </tr>                
         
               <tr>
                <td>
                    47</td>
                <td align="left" >
                    Display good reflective learning</td>
                <td align="left">
                   Able to identify strength, weakness and suggest improvement</td>
                <td  colspan="5" align="center" class="style7">
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList47" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                        ControlToValidate="RadioButtonList47" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
4                 </td>
                <td>
                    
                    <asp:TextBox ID="remarks47" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td>
                    &nbsp;</td>
            </tr>                
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  
			  
			    <%-- ------------------------------------------------------------------------------- --%>  
			  
			  
         
          <tr>
                <td rowspan="4">
                    &nbsp;</td>
                <td align="left" colspan="2">
                    &nbsp;</td>
                <td colspan="5" align="center">
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="Label60" runat="server" Font-Names="Arial" Font-Bold="true" Text="188"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
         
        
        
        
        
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label53" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label52" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total"></asp:Label>
                    <asp:Label ID="Label54" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                </td>
                <td colspan="8">
                    <asp:Label ID="Label55" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label56" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label57" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label58" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label59" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lb_total" runat="server" Font-Bold="true" Font-Names="Arial" 
                        Font-Size="Medium" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label62" runat="server" Font-Names="Arial" Font-Bold="true" Text="Actual Score upon 10%"></asp:Label>
                    
                </td>
                <td colspan="8" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lb_actualscore" runat="server" Font-Size="Medium" Font-Names="Arial"
                        Font-Bold="true" Text=""></asp:Label>&nbsp;
                        <asp:Button ID="btn_show_currentscore" autopostback="false" runat="server" Text="Update" Font-Bold="true"  OnClientClick="return show_score()" 
       CausesValidation="false"
             />
                &nbsp;</td>
            </tr>
            <%--  ----------------------------------------------------------------------%>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label65" runat="server" Font-Names="Arial" Font-Bold="true" Text=" Calculation: Actual Score = "></asp:Label>
              </br>  <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total/188 X 10% "></asp:Label>
                </td>
                <td colspan="8" align="left">
                    &nbsp;</td>
            </tr>
         
         
         
         
        <%--  ----------------------------------------------------------------------%>

            </table>
    </div>
     <div align="center">
           <asp:ImageButton ID="btn_common_save" autopostback="false" runat="server" ImageUrl="~/images/BtnSave.png"  
        Style="margin-top: 20px" Width="145px" Height="48px" CausesValidation="false" OnClientClick="Confirm2()"     OnClick="onclick_Save" />
        <asp:ImageButton ID="btn_submit"  OnClientClick="Confirm();" runat="server" ImageUrl="~/images/BtnSubmit.png"
            CausesValidation="true" Style="margin-top: 20px" Width="145px" Height="48px"
            OnClick="btn_submit_click" /></div>
    </form>
    </body>
</html>
