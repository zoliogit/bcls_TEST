<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_V1_1_Simulation2_G4.aspx.cs" Inherits="NSL_V1_1_Simulation2_G4" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title>V1.1-Consolidation 2</title>
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
 for (var i = 1; i <= 25; i++) 
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

    actual_score_float = (parseInt(total_score) / 100) * (10 / 100) * 100;//Total/100X 10% 
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
            height: 79px;
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
                        ForeColor="#F9FAFA" Text="SIMPract V1.1" Font-Names="Arial"></asp:Label>
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
                        Text="CONSOLIDATION 2" Font-Names="Arial"></asp:Label>
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
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text="Total % upon 10%"
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
              <%-- ---------------------------------------------------------------------------------------------%>
               <tr>
                <td align="left" colspan="11" class="styleCC" bgcolor="#98272D">
                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" Text="Consolidation Skills 2 (Case scenario 1)"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label><asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="185px" Height="25px">
                                   
                                    <asp:ListItem Text="Case scenario 4" Value="4"></asp:ListItem>
									<asp:ListItem Text="Case scenario 1" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Case scenario 2" Value="2" ></asp:ListItem>
                                    <asp:ListItem Text="Case scenario 3" Value="3"></asp:ListItem>
                                </asp:DropDownList><asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
 <%-----------------------------------------------------------------------------------------------%>
             
              <tr>
                <td align="left" colspan="11" class="styleCC" style="text-align:justify">
 
 
 Brief Summary:   <br />Mr. James, 35 years old was admitted for chickenpox. His temperature was 38.5°C and complained of muscle aches and a productive cough. 
 <br /> <br />Group tasks:
 <br />Nurse 1: Don and remove PPE (personal protective equipments).
 <br />Nurse 2 & 3 : Perform MRSA swab (nasal, axilla & groin) and change patient to hospital clothes.
 <br />Nurse 4: Obtain pain score, SpO2 level and document in the clinical chart.
 <br />Nurse 5: Collect sputum C&S speciemen
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
               
           <tr>
                <td  align="left"  colspan="11" >
                    <asp:Label ID="Label5" runat="server" Text="Assessment:" Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="black"></asp:Label>
                </td>
            </tr>
                <%---------------------------------------------------------------------------------------------------------------------------------------------%>
    
                <tr>
					<td>
						1
					</td>
					<td align="left" >
					  Perform hand hygiene.
					</td>
					<td align="left">
					   Perform 7 steps and adhere to the 5 moments.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
							ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
								RepeatLayout="Table"  Width="100%" >    
								<asp:ListItem Text=""  Value="0"></asp:ListItem>
								<asp:ListItem Text=""  Value="1"></asp:ListItem>
								<asp:ListItem Text=""  Value="2"></asp:ListItem>
								<asp:ListItem Text="" Value="3"></asp:ListItem>
								<asp:ListItem  Text="" Value="4"></asp:ListItem>
						</asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
						ControlToValidate="RadioButtonList1" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks1" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td class="font-italic">
						All members of the team. 
					</td>
				</tr>
            <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>2</td>
					<td align="left" rowspan="3">
						Display effective and professional communication with patient/relatives
					</td>
					<td align="left">
						  Greet patient and introduce self and team.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >    
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="Select One!" ForeColor="Red">
						</asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td rowspan="3">
					  
					</td>
				</tr>
		     <%---------------------------------------------------------------------------------------------------------------------------------------------%>
		
				<tr>
					<td>3</td>
					<td align="left">
						 Identify the correct patient with 2 identifiers.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
                           <asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList3" ErrorMessage="Select One!"
						ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
				</tr>
		  
		     <%---------------------------------------------------------------------------------------------------------------------------------------------%>
		
				<tr>
					<td>4</td>
					<td align="left">
						Explain the procedure and its purpose of doing a physical assessment to the patient.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList4" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
				</tr>
				 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
			   <tr>
					<td  align="left"  colspan="11" >
						<asp:Label  runat="server" Text="Planning:" Font-Bold="True" Font-Size="Large"
							Font-Names="Arial" ForeColor="black"></asp:Label>
					</td>
				</tr>
		     <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>5</td>
					<td align="left" rowspan="2">Prepare environment 
					</td>
					<td align="left" >Ensure patient's safety when necessary.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList5" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList5" 
					   ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td rowspan="2"></td>
				</tr>
				
		    <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>6</td>
					
					<td align="left">Ensure privacy.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList6" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RadioButtonList6" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
				</tr>
		  
		   <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>7</td>
					<td align="left">Gather requisites 
					</td>
					<td align="left">In timely manner without any delay.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList7" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList7" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
		  		  
		   <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				
				
				 <tr>
					<td  align="left"  colspan="11" >
						<asp:Label runat="server" Text="Implementation:" Font-Bold="True" Font-Size="Large"
							Font-Names="Arial" ForeColor="black"></asp:Label>
					</td>
				</tr>
           <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>8</td>
					<td align="left">Don PPE correctly

					</td>
					<td align="left">In correct sequence (mask, gown, and glove).

					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList8" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="RadioButtonList8" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
		  		  
		   <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>9</td>
					<td align="left" rowspan="2">Remove PPE correctly 
					</td>
					<td align="left" >In correct sequence (mask, gown, and glove) without contamination and perform hand hygiene as necessary.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList9" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="RadioButtonList9" 
					   ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td rowspan="2"></td>
				</tr>
				
		    <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>10</td>
					
					<td align="left">Discard the gloves, mask & gown into biohazard bag/bin.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
				</tr>
		  <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>11</td>
					<td align="left" rowspan="4">Perform MRSA swabs (nasal, axilla & groin) appropriately.
					</td>
					<td align="left">Moist the swab with 2 drops of sterile normal saline and insert the swab stick into patient's nostril about 2.5cm or until resistance is felt at the root of the nose.
				</td><td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList11" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td rowspan="4"></td>
				</tr>
				  <%---------------------------------------------------------------------------------------------------------------------------------------------%>
		
				<tr>
					<td>12</td>
					
					<td align="left">Twirl the swab stick at least 5 times with friction in order to scrape the nasal mucosa.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList12" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
			  <%---------------------------------------------------------------------------------------------------------------------------------------------%>
		
				<tr>
					<td>13</td>
					
					<td align="left">Moist the swab with 2 drops of sterile normal saline and twirl the swab stick over the skin of each side of axilla 10 times.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList13" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
			<%---------------------------------------------------------------------------------------------------------------------------------------------%>
				<tr>
					<td>14</td>
					<td align="left" >Roll the swab stick along the area of skin on the inner part of each thigh closet to genitalia 10 times.
					</td>
					
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList14" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
			
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				
				<tr>
					<td>15</td>
					
					<td align="left" rowspan="2">Change patient to hospital clothes
					</td>
					<td align="left" >Performed changing of clothes without causing injury and shearing of patient's skin.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList15" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="RadioButtonList15" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
			
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
				
				<tr>
					<td>16</td>
					
					<td align="left">Safe and proper body alignment and movements were achieved for patient and nurses during the positioning.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList16" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
			
			
				 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
					<tr>
					<td>17</td>
					
					<td align="left" rowspan="3">Take pain score, SpO2 level and document  in the clinical chart.
					</td>
					<td align="left" >Accurate SpO2 obtained by applying the probe and connect it to the pulse oximeter and make sure that LED and photo detector are aligned on opposite sides.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList17" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
				<%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>18</td>
					
					
					<td align="left">Assessed pain score using OLDCART (Onset, Loaction, Duration, Characteristics, Aggravating factors, Reliving factors and treatment).</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList18" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td></td>
				</tr>
				<%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>19</td>
					
					<td align="left">Document  Pain score and SpO2 findings in clinical chart accurately.
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList19" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="RadioButtonList19" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
			
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>20</td>
					
					<td align="left" rowspan="3">Assist in collection of sputum C&S (Culture & Sensitivity)</td>
					<td align="left" >Assist patient to a standing position or sitting position and instruct patient to take slow and deep inspirations, hold their breath, pause at the end of the inspiration; and then finally end with a cough.</td>
					
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList20" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="RadioButtonList20" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
				<td align="left" rowspan="3"></td>
				</tr>
			 
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>21</td>
					
				
					<td align="left">Collect the sputum only when the patient is triggered to cough. (Do not ask patient to cough deliberately with force.)
					</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList21" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="RadioButtonList21" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
			
				<tr>
					<td>22</td>
					
					<td align="left">Dispatch all all specimens  labelled with patient's name and IC number in the biohazard bag with request form to the Lab.</td>
					<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList22" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="RadioButtonList22" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
				</tr>
				
			
                <%---------------------------------------------------------------------------------------------------------------------------------------------%>
          		
			 <tr>
                <td  align="left"  colspan="11" >
                    <asp:Label  runat="server" Text="Evaluation / Communication / Teamwork:" Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="black"></asp:Label>
                </td>
            </tr>
			
			 <%---------------------------------------------------------------------------------------------------------------------------------------------%>
            
			<tr>
				<td>23
				</td>
				<td align="left" rowspan="3">Displayed good team work, effort and leadership among team members
				</td>
				<td align="left">Role of each member is well defined.
				</td>
				<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList23" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="RadioButtonList23" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					<td rowspan="3"></td>
				
			</tr>
			
			<tr>
				<td>24
				</td>
				<td align="left">All team members coordinated well for the nursing interventions provided to the patient.
				</td>
				<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList24" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="RadioButtonList24" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
			</tr>
			
			<tr>
				<td>25
				</td>
				<td align="left">Group leader had displayed good leadership and delegation skills.
				</td>
				<td  colspan="5" align="center" >
               
						<asp:RadioButtonList RepeatColumns="5" class="style_radio"   
                        ID="RadioButtonList25" runat="server" RepeatDirection="Horizontal"
                            RepeatLayout="Table"  Width="100%" >
							<asp:ListItem Text=""  Value="0"></asp:ListItem>
                            <asp:ListItem Text=""  Value="1"></asp:ListItem>
                            <asp:ListItem Text=""  Value="2"></asp:ListItem>
                            <asp:ListItem Text="" Value="3"></asp:ListItem>
                            <asp:ListItem  Text="" Value="4"></asp:ListItem>
                        </asp:RadioButtonList>
                   
                  
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="RadioButtonList25" ErrorMessage="Select One!" ForeColor="Red"></asp:RequiredFieldValidator>
					</td>
					<td align="center" >
						4
					</td>
					<td>
						<asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    </td>
					
			</tr>
			
			
			
			
			
		  
             <%---------------------------------------------------------------------------------------------------------------------------------------------%>
          
          <tr>
                <td rowspan="4">
                    &nbsp;</td>
                <td align="left" colspan="2">
                    &nbsp;</td>
                <td colspan="5" align="center">
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="Label60" runat="server" Font-Names="Arial" Font-Bold="true" Text="100"></asp:Label>
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
                        <asp:Button ID="btn_show_currentscore" autopostback="false" runat="server" Text="Update" 
                                            Font-Bold="true"  OnClientClick="return show_score()" 
       CausesValidation="false" 
             />
                &nbsp;</td>
            </tr>
            <%--  ----------------------------------------------------------------------%>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label65" runat="server" Font-Names="Arial" Font-Bold="true" Text=" Calculation: Actual Score = "></asp:Label>
              </br>  <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total/100 X 10% "></asp:Label>
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



