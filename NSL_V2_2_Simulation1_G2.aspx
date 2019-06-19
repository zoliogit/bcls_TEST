﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_V2_2_Simulation1_G2.aspx.cs" Inherits="NSL_V2_2_Simulation1_G2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title>V2.2-Simulation 1</title>
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
 for (var i = 1; i <= 38; i++) 
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

    actual_score_float = (parseInt(total_score) / 152) * (5 / 100) * 100;//Total/152 X 5% 
    actual_score_decimalValue= parseFloat(actual_score_float).toFixed(1);       
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
        }
        .style8
        {
            font-style: italic;
            height: 22px;
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
                        ForeColor="#F9FAFA" Text="SIMPract V2.2" Font-Names="Arial"></asp:Label>
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
                        Text="SIMULATION 1" Font-Names="Arial"></asp:Label>
                        
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
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text="Total % upon 5%"
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
                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" Text="SIM1-OPTION 2"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                    <asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="183px" Height="25px">
                                   
                                    <asp:ListItem Text="SIM1-OPTION2" Value="2" ></asp:ListItem>
                                    <asp:ListItem Text="SIM1-OPTION3" Value="3"></asp:ListItem>
                                     <asp:ListItem Text="SIM1-OPTION1" Value="1"></asp:ListItem>
                                         
                                </asp:DropDownList><asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
 <%-- ---------------------------------------------------------------------------------------------%>
             
               <tr>
                <td align="center" colspan="11"  bgcolor="#98272D">
                 
                           <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Text="SIMULATION 1: Pre-eclampsia"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
             
              <tr>
                <td align="left" colspan="11" class="styleCC">
                  Scenario:
                    <br />
Mrs Lee Ho Yin, a 35-year-old, gravida 1 para 0 at 32 weeks of gestation, came to the antenatal clinic today with complaints of decreased in micturition, swelling of face, hands and legs, feeling of lethargic and irritable since 2 days ago. She had been diagnosed to have gestational hypertension at 26 weeks of gestation and was on regular follow-up. Upon physical examination, general oedema was seen on her face, abdomen, hands and legs. Her BP-152/90, RR 24, HR 106, temperature 37.2°C, SpO2 98% and urine for protein on dipstick 2+. She was admitted to the antenatal ward for further management. Past medical and surgical history: Nil. Family history: Mother has hypertension. Drug allergy: Nil.										
                
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
                    <asp:Label ID="Label163" runat="server" 
                        Text="State #2" 
                        Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            
                
          
             <%-- ------------------------------------------------------------------------------- --%> 
             
            <tr>
                <td>
                    1
                </td>
                <td align="left" rowspan="3" >
                   Take over report from the previous group and perform follow up care
				</td>
                <td align="left">
                   Review all orders from progress notes
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
                <td class="font-italic" rowspan="3">
                  
                    &nbsp;</td>
            </tr>
			 <%-- ------------------------------------------------------------------------------- --%> 
           
			
			
			    <tr>
                <td>
                    2</td>
                <td align="left">
                   Review all nursing documentation and charts from previous shift
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="RadioButtonList2" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            
			
			
			 <%-- ------------------------------------------------------------------------------- --%> 
              <tr>
                <td>
                    3</td>
                <td align="left">
                   Carry out all orders in a systematic manner
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="RadioButtonList3" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            
          
             <%-- ------------------------------------------------------------------------------- --%>   
                                              
			
                        <tr>
                <td>
                    4</td>
                <td align="left" >
                   Perform hand hygiene
				</td>
                <td align="left">
                    Follow 5 moments of hand hygiene
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="RadioButtonList4" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                  
                    &nbsp;</td>
            </tr>
              <%-- ------------------------------------------------------------------------------- --%>   
           
			      <tr>
                <td >
                    5</td>
                <td align="left" rowspan="4" >
                    Displayed effective and professional communication with patient/relatives throughout simulation
				</td>
                <td align="left">
                   Greet patient and introduce self
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList5" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RadioButtonList5" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center"  >
                    4</td>
                <td >
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic" rowspan="4">
                  
                  Patient is awake, alert and oriented to person, place and time when talking to students.<br/>
General oedema on the face, abdomen, hands and legs seen.



</td>
            </tr>
               <%-- ------------------------------------------------------------------------------- --%>   
           
			
                        <tr>
                <td>
                    6</td>
             
                <td align="left">
                  Check patient name and ID
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList6" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
           
            </tr>
			
			   <%-- ------------------------------------------------------------------------------- --%>   
           
			
                        <tr>
                <td>
                    7</td>
                <td align="left">
                    Obtain subjective data from patient/relatives to plan nursing interventions for the shif
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="RadioButtonList7" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            
			   <%-- ------------------------------------------------------------------------------- --%>   
           
                        <tr>
                <td>
                    8</td>
                <td align="left">
                 Update  the patient and relatives on her progress
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="RadioButtonList8" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%-- ------------------------------------------------------------------------------- --%>   
             <tr>
                <td>
                    9</td>
                <td align="left" rowspan="4">
                    Obtain patient's initial haemodynamic status timely and correctly(After taking over nursing report)
				</td>
				 <td align="left" >
				 Measure and document patient's BP, pulse, respiration rate, temperature, SpO2 and urine analysis
				</td>

                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="RadioButtonList9" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
							 <td class="font-italic" rowspan="4">
								TSO:<br/>
								Activate state 1:  <br/>
								RR-28b/min, HR-106b/min, BP-165/98 mmHg, SpO2-98%, Temp-36.5°C, fetal heart rate 130b/min. CTG shows late deceleration
								<br/><br/>
								Lecturer:<br/>
								** Accord ""0"" mark if student: <br/><br/>
								- did not assess the vital signs within 5 minutes  of admission. <br/>
								- did not check the pain score (for  uterine contraction or frontal headache).<br/>
								- did not re-evaluate the vital signs every 15 minutes.
								</td>
            </tr>
            
              <%-- ------------------------------------------------------------------------------- --%>   
			
			
                        <tr>
                <td class="style7">
                    10</td>
                <td align="left" class="style7" >
                  Interpret parameters and relate to patient's condition
				</td>
              
                <td  colspan="5" align="center" class="style7" >
                      <asp:RadioButtonList ID="RadioButtonList10" runat="server" class="style_radio" 
                          RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                          Width="100%">
                          <asp:ListItem Text="" Value="0"></asp:ListItem>
                          <asp:ListItem Text="" Value="1"></asp:ListItem>
                          <asp:ListItem Text="" Value="2"></asp:ListItem>
                          <asp:ListItem Text="" Value="3"></asp:ListItem>
                          <asp:ListItem Text="" Value="4"></asp:ListItem>
                      </asp:RadioButtonList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                          ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" ForeColor="Red">
                      </asp:RequiredFieldValidator>
                      </td>
                <td align="center" class="style7" >
                      4</td>
                <td class="style7">
                    
                    <asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                      </td>
             
            </tr>
			  <%-- ------------------------------------------------------------------------------- --%>   
			
			  <tr>
                <td>
                    11</td>
                <td align="left" >
                   Pain assessment: Use of OLDCART, pain score (for uterine contraction or frontal headache)
				</td>
             
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
              
            </tr>
            
              <%-- ------------------------------------------------------------------------------- --%>   
			
			    <tr>
                <td>
                    12</td>
                <td align="left"  >
                  ** Re-evaluate vital signs every 15 minutes
				</td>
              
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            
            </tr>
			     <%-- ------------------------------------------------------------------------------- --%>   
			   <tr>
                <td>
                    13</td>
                <td align="left">
                   Monitor urine output closely

				</td>
				<td align="left">
                  Urine output - 10mLs/hr

				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
							 <td class="font-italic" >
                  Lecturer:<br/>
** Accord "0" mark if student:<br/> <br/>
- did not monitor hourly urine output. <br/>
- did not inform doctor when urine output is 10mLs/hr.
</td>
            </tr>
			
			  <%-- ------------------------------------------------------------------------------- --%> 
			
			 <tr>
                <td>
                    14</td>
                <td align="left">
                    Call doctor to inform patient's urine output 10mLs/hr, BP 165/98mmHg and fetal heart rate shows late deceleration seen on CTG
				</td>
				<td align="left"></td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList14" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
							 <td class="font-italic" >
                  Lecturer:<br/>

					** Accord "0" mark if student: <br/><br/>
					- Inefficient situation update/background on poor urine output, BP and fetal heart rate status to doctor.<br/>
					- did not trace daily blood test.

					</td>
            </tr>
            
			
			 <%-- ------------------------------------------------------------------------------- --%> 
			  <tr>
                <td>
                    15</td>
                <td align="left" rowspan="4">
                   Verify and carry out doctor's orders timely and correctly</td>
					 <td align="left">
                    1. Patient's  name and IC<br/>
					2. Detail of performed procedures<br/>
					3. Name with signature in report<br/>
					4. IMR is signed/E-IMR is marked as done</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList15" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="RadioButtonList15" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                </td>
				 <td class="font-italic" >
				  </td>
            </tr>
			
			 <%-- ------------------------------------------------------------------------------- --%> 
			
			 <tr>
                <td>
                    16</td>
               
                <td align="left">
                    Check doctor's latest orders from case notes:<br/>
- Start magnesium sulfate infusionto prevent seizure

</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList16" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks16" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
					   <td> </td>
              
            </tr>
			
			 <%-- ------------------------------------------------------------------------------- --%> 
			
			  <tr>
                <td>
                    17</td>
                <td align="left">
                   Instruct  patient to lie on the left lateral position for imporve placental fetal circulation
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList17" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks17" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td> <td> </td>
            </tr>
             <%-- ------------------------------------------------------------------------------- --%> 
			<tr>
                <td>
                    18</td>
                <td align="left">
                   Trace daily blood test
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks18" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td><td> </td>
            </tr>
			 <%-- ------------------------------------------------------------------------------- --%> 
			
			
                        <tr>
                <td>
                    19</td>
                <td align="left" rowspan="4">
                    Trace daily  blood test
				</td>
					 <td align="left">
                  # Hct
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="RadioButtonList19" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks19" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
					    <td class="font-italic" rowspan="4">
						Lecturer:<br/>
After the students despatched the blood and urine investigation, Lecturer is to inform students when the results are back for them to interpret.<br/>
Platelets - 125,000, Hct - 31%, Liver enzymes: Alk Phos - 200, ALT - 70, Bilirubin - 8, Urea - 15, Creatinine - 180

			</td>
            </tr>
			 <%-- ------------------------------------------------------------------------------- --%> 
			
                        <tr>
                <td>
                    20</td>
             
                <td align="left">
                    # Liver function tests:<br/>
				 To exclude liver failure 
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ControlToValidate="RadioButtonList20" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks20" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
               
            </tr>
            
			<%-- ------------------------------------------------------------------------------- --%> 
			<tr>
                <td>
                    21</td>
                <td align="left">
                   # Renal panel 1 & 2:<br/>
				U/E/Cr/Uric  acid<br/>
				to check renal function 

				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ControlToValidate="RadioButtonList21" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks21" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
            	<%-- ------------------------------------------------------------------------------- --%> 
			    <tr>
                <td>
                    22           <td align="left">
                        # Platelet count<br/>
					To check the bleeding and clotting time
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList22" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                        ControlToValidate="RadioButtonList22" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks22" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
            
			<%-- ------------------------------------------------------------------------------- --%> 
			
			     <tr>
                <td>
                    23   </td> 
					<td align="left" rowspan="7">
                  Administer magnesium sulfate (MgSO4) 8mLs of 50% MgSO4 to 12 mLs of 5% Dextrose over 10 - 15mins<br/><br/>
				Follow by infusion -  10mLs MgSO4 to 100mLs of 5% Dextrose at 20mLs/hr

				</td>
					<td align="left">
                  ** Identify the patient by 2 identifiers
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                        ControlToValidate="RadioButtonList23" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks23" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
					   <td class="font-italic" rowspan="7">
                    Lecturer:<br/>
					**Accord "0" mark if<br/>
					- student run the IV MgSO4 fast without calculating the drop factor.<br/>
					- no priming of the infusion set and air bubbles present.<br/>
					- fail to perform the required steps before administration of medication.<br/>
					- fail to identify side effects of MgSO4.

					</td>
            </tr>
            
			<%-- ------------------------------------------------------------------------------- --%> 
			
			 
          
                        <tr>
                <td>
                    24</td><td align="left">
                    ** Observe 5 rights and obtain allergy history
</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList24" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                        ControlToValidate="RadioButtonList24" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks24" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
			
				<%-- ------------------------------------------------------------------------------- --%> 
		
                        <tr>
                <td>
                    25</td><td align="left">
                    Explain drug indications to patient
</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                        ControlToValidate="RadioButtonList25" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks25" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
            	<%-- ------------------------------------------------------------------------------- --%> 
		
                        <tr>
                <td>
                    26</td><td align="left">
                   ** Priming the infusion set without contamination

</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList26" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                        ControlToValidate="RadioButtonList26" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks26" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
            
			<%-- ------------------------------------------------------------------------------- --%> 
		
			  <tr>
                <td>
                    27</td>
                <td align="left">
                  ** Ensure no air bubbles
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                        ControlToValidate="RadioButtonList27" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks27" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
              
          
                        </tr>
			<%-- ------------------------------------------------------------------------------- --%> 
		
			 <tr>
                <td>
                    28</td>
                <td align="left">
                   ** Ensure administer the correct amount of medication
</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList28" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                        ControlToValidate="RadioButtonList28" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks28" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
            <%-- ------------------------------------------------------------------------------- --%> 
		  <tr>
                <td>
                    29    </td>
                <td align="left">
                    ** Observe for side effects of MgSO4
				</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList29" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                        ControlToValidate="RadioButtonList29" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks29" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            
            </tr>
          <%-- ------------------------------------------------------------------------------- --%>    
			
			
			
                        <tr>
                <td class="style7">
                    30</td>
                <td align="left" class="style7" rowspan="2" >
                Continue  IV 5% Dextrose  at 100mLs/hr


</td>
                <td align="left" class="style7">
                   ** Ensure no air bubbles
</td>
         
                <td  colspan="5" align="center" class="style7" >
                      <asp:RadioButtonList ID="RadioButtonList30" runat="server" class="style_radio" 
                          RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                          Width="100%">
                          <asp:ListItem Text="" Value="0"></asp:ListItem>
                          <asp:ListItem Text="" Value="1"></asp:ListItem>
                          <asp:ListItem Text="" Value="2"></asp:ListItem>
                          <asp:ListItem Text="" Value="3"></asp:ListItem>
                          <asp:ListItem Text="" Value="4"></asp:ListItem>
                      </asp:RadioButtonList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                          ControlToValidate="RadioButtonList30" ErrorMessage="Select One!" ForeColor="Red">
                      </asp:RequiredFieldValidator>
                      </td>
                <td align="center" class="style7" >
                      4</td>
                <td class="style7">
                    
                    <asp:TextBox ID="remarks30" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                    
                      </td>   <td class="font-italic" rowspan="2" >
					  Lecturer:<br/>
** Accord "0" mark if student<br/><br/>
- run the IV infusion running fast without calculating the drop factor. <br/>
- no priming of the infusion set. <br/>
- air bubbles present.<br/>
- did not observe for signs of  fluid overload (dyspneoa, breathlessness, cyanosis).


                   </td>
            </tr>
			
			   <%-- ------------------------------------------------------------------------------- --%>    
			
		
			<tr>
			
			 <td>
                    31</td> 
					<td align="left"> Ensure administer the correct amount of IV fluids
					</td>
           
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList31" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                        ControlToValidate="RadioButtonList31" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks31" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
            </tr>
			   <%-- ------------------------------------------------------------------------------- --%>    
			
		
			 <tr>
                <td>
                    32</td>
					<td>Continuous cardiotocograph monitoring (CTG)
					</td>
				   <td>Fetal heart rate dcreased to 106b/min and CTG shows continuous late deceleration
					</td>
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList32" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                        ControlToValidate="RadioButtonList32" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks32" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
					  <td class="font-italic" rowspan="3">Lecturer:<br/>
					** Accord "0" mark if student: <br/>
					- did not know how to interpret the CTG graph and identify late deceleration.<br/>
					- did not inform doctor CTG shows continously late deceleration.

					</td>
            </tr>
            
			   <%-- ------------------------------------------------------------------------------- --%>    
			
		  <tr>
                <td>
                    33</td><td rowspan="2" align="left">Call doctor to inform that fetal heart rate shows continuously late deceleration

				</td>
                <td align="left">
                   Prepare patient for delivery in labour ward
				</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList33" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                        ControlToValidate="RadioButtonList33" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks33" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
           
          </tr>
			  <%-- ------------------------------------------------------------------------------- --%>    
			
			 <tr>
                <td>
                    34</td>
                <td align="left">
                  Nil by mouth (NBM)
				</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList34" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                        ControlToValidate="RadioButtonList34" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks34" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
              
            </tr>
			  <%-- ------------------------------------------------------------------------------- --%>    
			   <tr>
                <td>
                    35</td>
					<td>Monitor seizure percaution closely

				</td>
                <td align="left">
                  ** Vital signs every 15 minutes till review by doctor<br/>
- To inform doctor if BP 175/98mmHg, RR 12b/min or HR 120b/min<br/>
** Document in CLC and PE chart
</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList35" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                        ControlToValidate="RadioButtonList35" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks35" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
                <td class="font-italic">
                  
                 Lecturer:<br/>
- To accord "0" mark if student did not perform as ordered.<br/>
- did not inform the doctor immediately when the urine output is < 30mLs/hr, BP is > 175/98, respiration < 12b/min, HR > 120b/min.

</td>
            </tr>
         <%-- ------------------------------------------------------------------------------- --%> 
      <tr>
                <td>
                    36</td>
					<td>Evaluate patient's condition
				</td>
                <td align="left">
                 Nursing intervention performed resulted in desired outcome<br/>
Patient's vital signs, pain status and patient eduction (if required)

</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList36" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                        ControlToValidate="RadioButtonList36" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks36" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
                <td class="font-italic">
                 </td>
            </tr>
       		
   <%-- ------------------------------------------------------------------------------- --%> 
      <tr>
                <td>
                    37</td>
					<td>Display good team work, effort and leadership among team members
</td>
                <td align="left">
                   1. Role is well defined <br/>
2. All team members co ordinated well<br/>
3. Display good leadership and delegation skills
</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList37" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                        ControlToValidate="RadioButtonList37" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks37" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
                <td class="font-italic">
                  
                    Lecturer:</br>
Deduct marks to "1" or "2" marks for this category if students:</br>
- did not conduct the required assessment or management within the stipulated time.
</td>
            </tr>
             <%-- ------------------------------------------------------------------------------- --%> 
      <tr>
                <td>
                    38</td>
					<td>Display critical thinking and holistic management of patient care

</td>
                <td align="left">
                   Able to rationalise on the nursing management and treatment given
Good evaluation of patient's condition

</td>
            
                <td  colspan="5" align="center" >
                    <asp:RadioButtonList ID="RadioButtonList38" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                        ControlToValidate="RadioButtonList38" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks38" runat="server" class="RemarksTextarea" 
                        Font-Names="Arial" Text="" TextMode="MultiLine"></asp:TextBox>
                      </td>
                <td class="font-italic">
                  
                    Lecturer:</br>

Deduct marks to "1" or "2" marks for this category if students:</br>
- did not  inform the doctor immediately when the urine output is < 30mLs/hr, BP is > 175/98, respiration < 12b/min, HR > 120b/min, deep tendon reflexes is 4+ or absent, fetal heart rate showed with late deceleration seen on CTG.
</td>
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
                    <asp:Label ID="Label60" runat="server" Font-Names="Arial" Font-Bold="true" Text="152"></asp:Label>
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
                    <asp:Label ID="Label62" runat="server" Font-Names="Arial" Font-Bold="true" Text="Actual Score upon 5%"></asp:Label>
                    
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
              </br>  <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total/152 X 5% "></asp:Label>
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




