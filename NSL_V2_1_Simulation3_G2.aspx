<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_V2_1_Simulation3_G2.aspx.cs" Inherits="NSL_V2_1_Simulation3_G2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    
    <title>V2.1-Simulation 3</title>
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
 for (var i = 1; i <= 32; i++) 
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

    actual_score_float = (parseInt(total_score) / 128) * (4 / 100) * 100;//Total/128 X 4% 
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

        .style8
        {
        }
        .style9
        {
            font-style: italic;
            height: 22px;
        }

        .style11
        {
            height: 60px;
        }

        .style12
        {
            height: 48px;
        }

        .style13
        {
            height: 98px;
        }

        .style14
        {
            height: 41px;
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
                        ForeColor="#F9FAFA" Text="SIMPract V2.1" Font-Names="Arial"></asp:Label>
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
                        Text="SIMULATION 3" Font-Names="Arial"></asp:Label>
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
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="Medium" Text="Total % upon 4%"
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
                    <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="Large" Text="SIM3-OPTION 2"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label><asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="185px" Height="25px">
                                     <asp:ListItem Text="SIM3-OPTION2" Value="2" ></asp:ListItem>
                                    <asp:ListItem Text="SIM3-OPTION3" Value="3"></asp:ListItem>
                                      <asp:ListItem Text="SIM3-OPTION1" Value="1"></asp:ListItem>   
                                </asp:DropDownList><asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
            
               <tr>
                <td align="center" colspan="11" bgcolor="#98272D">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Text="Gastrointestinal Bleed Secondary to Aspirin Abuse"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            
            
 <%-- ---------------------------------------------------------------------------------------------%>
             
              <tr>
                <td align="left" colspan="11" class="styleCC">
                    Brief Summary:
                    <br />
                     Mr. Lee Ho Yin is a 67 -year-old male was brought to the ED by his family after complaining of severe abdominal pain. He vomited twice at home. His wife described the vomitus as being "dark brown with something like coffee grounds." The family also stated that he looked really pale. For the past two years he has complained about his joints hurting and swelling in his hands. The patient stated that during the last month he had been taking four regular aspirin every 3-4 hours because he heard it helped arthritis and was good for this heart. History: Former smoker. He is in general good health. He was last seen by his healthcare provider about three years ago. He has no known allergies. In the ED his baseline vital signs were BP: 146/85, RR 21 and unlabored, Temp: 36.4 degree Celsius, SpO2 95% on room air. His only complain was being "extremely tired". An IV was started and blood specimens obtained and sent to the lab. The on-call Endoscopy team has been notified that an urgent endoscopy has been ordered. The urgent blood results found haemoglobin (Hb) 9.0 and haematocrit (Hct) 27%; other results were not back yet. Two peripheral IV lines with 0.9% Normal Saline solutions were started at 125ml/hr. Since the ED was extremely busy, and no beds were available in the Intensive Care Unit, the patient was transferred to the Medical - Surgical ward as soon as the room was available, while waiting the endoscopy team to arrive. On the way, the patient vomited.
         
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
                    <asp:Label ID="Label5" runat="server" Text="PART A" Font-Bold="True" Font-Size="Large"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
                
          
             <%-- ------------------------------------------------------------------------------- --%> 
                        <tr>
                <td>
                    1
                </td>
                <td align="left" >
                    Perform hand hygiene.</td>
                <td align="left">
                    Perform 7 steps and follow 5 moments.</td>
                <td  colspan="5" align="center" >
               <%--  onclick="highlightListControl(this, 'Red', 'Yellow');"
                 --%>     
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
                    All members of the team. </td>
            </tr>
            
          
             <%-- ------------------------------------------------------------------------------- --%>   
                        <tr>
                <td rowspan="3">
                    2</td>
                <td align="left" rowspan="3" >
                    Display effective and professional communication with patient/relatives</td>
                <td align="left">
                    Greet patient and introduce self and team.</td>
                <td  colspan="5" align="center" rowspan="3" >
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
                <td align="center" rowspan="3"  >
                    4</td>
                <td rowspan="3">
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="3"  class="font-italic">
                    Patient is alert and orientated: </br>  TSO: </br> &quot;My name is Lee Ho Yin, I am in the 
                    hospital because I vomitted and had blood in my poo. I am feeling very tired.&quot;</td>
            </tr>
            
             <%-- ------------------------------------------------------------------------------- --%> 
                      <tr>
                <td align="left">
                    Identify the correct patient with 2 identifiers.</td>
            </tr>
            
                        <tr>
                <td align="left" class="style11">
                    Explain the procedure and its purpose of doing a physical assessment to the 
                    patient.</td>
            </tr>
            
             <%-- ------------------------------------------------------------------------------- --%>                
                 <tr>
                <td rowspan="6">
                    3</td>
                <td align="left" rowspan="6" >
                    Continue to monitor patient&#39;s vital signs. </td>
                <td align="left">
                    Attach probe and check SpO2.</td>
                <td  colspan="5" align="center" rowspan="6" >
                   
                    
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="RadioButtonList3" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                      </td>
                <td align="center" rowspan="6"  >
                    4</td>
                <td rowspan="6">
                    
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                      </td>
                <td rowspan="6" class="font-italic">
                    Lecturer: **Accord &quot;0&quot; mark if student did not perform any steps. </br> TSO: </br>Activate 
                    State 2 (Condition Deteoriorates) RR-28b/min, HR-150b/min, BP-86/50mmHg, 
                    SpO2-89%, Temp-36.9 deg Celcius</td>
            </tr>
            
                 <tr>
                <td align="left">
                    Apply cuff and check BP.</td>
            </tr>
            
                      <tr>
                <td align="left">
                    Check pulse and RR.</td>
            </tr>
            
                        <tr>
                <td align="left">
                    Check temperature.</td>
            </tr>
            
                        <tr>
                <td align="left" >
                    Assess pain using the pain scale.</td>
            </tr>
                 <%-- ----------------------------------------------------------------------------- --%>  
                 
                  
           <%-- -----------------------------------------------------------------------
            --%>                      
                        
                        <tr>
                <td align="left" >
                    Measure and document patient&#39;s vital signs correctly on hourly parameters chart.</td>
            </tr>
            <tr>
                <td>
                    4</td>
                <td align="left"  >
                                        Recognise the abnormal vital signs </td>
                <td align="left">
                    Apply critical thinking and explain the abnormal readings : Hypotension, 
                    tachycardia and decreased O2 saturation.</td>
                <td  colspan="5" align="center" >
                 
                   
                 
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
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
                    Lecturer: BP is low and PR &amp; RR is increased: indicates significant blood loss. 
                    SpO2 is low as oxygen carrying capacity with blood loss. Patient is going into 
                    hypovolemic shock.</td>
            </tr>                
            <%--   ------------------------------------------------------------------  --%>
            
                <tr>
                <td rowspan="4">
                    5</td>
                <td align="left" rowspan="4" >
                    Assess for the proper administration of oxygen therapy</td>
                <td align="left">
                    Patient is propped up 30 degree angle. </td>
                <td  colspan="5" align="center" rowspan="4" >
                         
                    
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
                <td align="center" rowspan="4"  >
                    4</td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="4" class="font-italic">
                    Lecturer:</br> Check with student if humidication is necessary. Humidifier will 
                    be used if more than 4L is administered to prevent mucous membrance from drying 
                    (NSL Book 1, 4th ed, 2011).</td>
            </tr>
        <tr>   
                <td align="left">
                    Nasal cannula is in place. Assess for facial skin condition. </td>
            </tr>
            
                        <tr>
                <td align="left" class="style14" >
                    Check that the flow is at the correct level. </td>
            </tr>
           <%-- -----------------------------------------------------------------------
            --%>
            
                        <tr>
                <td align="left" >
                    Cannula is correctly positioned on the patient. </td>
            </tr>
            
             <tr>
                <td rowspan="10">
                    6</td>
                <td align="left" rowspan="10" >
                    Recognise signs and symptoms (s/s) of hypovolemic shock timely</td>
                <td align="left">
                    Hypotension</td>
                <td  colspan="5" align="center" rowspan="10" >
                   
               
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
                <td align="center" rowspan="10"  >
                    4
                </td>
                <td rowspan="10">
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                 </td>
                <td rowspan="10" class="font-italic">
                    Lecturer: </br> Inform the s/s of hypovolemia to students.  </br> </br>TSO: </br> Set manikin: Breath 
                    sounds- clear, heart sound- normal. Slow to respond and confuse.</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Anxiety&nbsp;or agitation</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Cool, clammy skin</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Confusion</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Decreased or no urine output</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Pale skin color&nbsp;(pallor)</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Rapid breathing/Tachypnea</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Sweating, moist skin</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Unconsciousness</td>
            </tr>                
            
             <tr>
                <td align="left">
                    Perform CLC.</td>
            </tr>                
          <%--  ----------------------------------------------------------------------%>
         
                          
            
             <tr>
                <td>
                    7</td>
                <td align="left" >
                    Manage the signs of shock</td>
                <td align="left">
                    Increase the infusion rate of IV Hartmann&#39;s.</td>
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
                <td>
                    &nbsp;</td>
            </tr>                
          
             <tr>
                <td>
                    8</td>
                <td align="left" >
                    Check doctor&#39;s order from progress notes &amp; IMR. </td>
                <td align="left">
                    The type of blood product and number of unit(s) ordered.</td>
                <td  colspan="5" align="center" >
                          
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
                <td>
                    &nbsp;</td>
            </tr>                
         
                          
            
             <tr>
                <td>
                    9</td>
                <td align="left" >
                    Assess for past medical history.</td>
                <td align="left">
                    e.g. cardiac, renal or pulmonary condition or any s/s of fluid overload.</td>
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
                <td>
                    &nbsp;</td>
            </tr>                
   
             <tr>
                <td>
                    10</td>
                <td align="left" >
                    Check consent.</td>
                <td align="left">
                    Ensure consent is valid for blood transfusion, with patient name, ID and 
                    signature, witness name, ID and signature, Dr&#39;s name, MCR no. &amp; signature.</td>
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
                        ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   
                  
                    
                 </td>
                <td align="center"  >
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                      </td>
                <td>
                    &nbsp;</td>
            </tr>                
         
                          
            
             <tr>
                <td rowspan="4">
                    11</td>
                <td align="left" rowspan="4" >
                    Assess IV site.</td>
                <td align="left">
                    Expiry date (≤ 3 days).</td>
                <td  colspan="5" align="center" rowspan="4" >
            
            
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
                         ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" 
                         ForeColor="Red">
                     </asp:RequiredFieldValidator>
   
                     </td>
                <td align="center" rowspan="4"  >
                    4</td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td rowspan="4" class="font-italic">
                    &nbsp;</td>
            </tr>                
            
             <tr>
                <td align="left" class="style11">
                    Inspect site for signs of pain, oedema, erythema and increased temperature 
                    (POET).</td>
            </tr>                
            
             <tr>
                <td align="left" class="style12">
                    Ensure availability of IV cannula size 19G or larger.</td>
            </tr>                
            
             <tr>
                <td align="left">
                    (Verbalise) Flush line to ensure patency of IV line.</td>
            </tr>                
            
       <%--  ---------------------------------------------------------------------------
        --%>   
        
        
        
        
        
             <tr>
                <td class="style13">
                    12</td>
                <td align="left" rowspan="4" >
                    Receive the blood product from the laboratory.</td>
                <td align="left" class="style13">
                    Check </br> 1)blood unit</br> 2)blood card </br>3)request form </br> 4)ice pack is in the box.</td>
                <td  colspan="5" align="center" class="style13" >

                  
                     <b>
                     <asp:RadioButtonList ID="RadioButtonList12" runat="server" class="style_radio" 
                         RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                         Width="100%">
                         <asp:ListItem Text="" Value="0"></asp:ListItem>
                         <asp:ListItem Text="" Value="1"></asp:ListItem>
                         <asp:ListItem Text="" Value="2"></asp:ListItem>
                         <asp:ListItem Text="" Value="3"></asp:ListItem>
                         <asp:ListItem Text="" Value="4"></asp:ListItem>
                     </asp:RadioButtonList>
                     </b>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                         ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" 
                         ForeColor="Red">
                     </asp:RequiredFieldValidator>
       
                     </td>
                <td align="center" class="style13"  >
                                        4</td>
                <td class="style13">
                    
                    <asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
                <td class="font-italic" rowspan="4">
                    Ensure that the student change from the tubing for blood administration. 
                    Hartmanns solution may contain Dextrose 5% which can cause haemolysis and must 
                    not be mixed with blood. </td>
            </tr>      
    
          <tr>
                <td>
                    13</td>
                <td align="left">
                    **Priming the blood administration infusion set without contamination.</td>
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
                        ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  
         </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>      
    
          <tr>
                <td>
                    14</td>
                <td align="left">
                    Apply critical thinking to explain why Hartmans solution cannot be used prior to 
                    blood transfusion</td>
                <td  colspan="5" align="center" >
                  
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
                          ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" 
                          ForeColor="Red">
                      </asp:RequiredFieldValidator>
     

                      </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>      
        
      
          <tr>
                <td>
                    15</td>
                <td align="left">
                    **Ensure no air bubbles.</td>
                <td  colspan="5" align="center" >
              
                    <b>
                    <asp:RadioButtonList ID="RadioButtonList15" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    </b>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="RadioButtonList15" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  
         </td>
                <td align="center"  >
                                        4</td>
                <td>
                    
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                     </td>
            </tr>      
        
    
            
         <%-- ------------------------------------------------------------------------------- --%>                
     
          <tr>
                <td class="style8">
                    16</td>
                <td align="left" class="style8" rowspan="7" >
                    Administer blood product correctly.</td>
                <td align="left" class="style8">
                    **Double-check all labels and expiration date with another nurse.</td>
                <td  colspan="5" align="center" class="style8" >
                  
                 <b>
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
                     </asp:RequiredFieldValidator>
                  
       
                  
                     </td>
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                  </td>
                <td class="style9" rowspan="7">
                      TSO: </br> If student does not follow blood administration policy, the patient will 
                      question the nurse &quot;Are you sure that this is the right blood for me?&quot; </br></br> Lecturer: </br>
                      **To accord &quot;0&quot; mark if student did not perform the highlighted required steps 
                      of checking prior blood administration.</td>
            </tr>      
    
          <tr>
                <td class="style8">
                    17</td>
                <td align="left" class="style8">
                    Visually inspect blood product.</td>
                <td  colspan="5" align="center" class="style8" >     
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
       
          <tr>
                <td class="style8">
                    18</td>
                <td align="left" class="style8">
                    **Check blood units and ensure blood is tallied with GXM and blood card.</td>
                <td  colspan="5" align="center" class="style8" >
   
                   
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
     
            
          <tr>
                <td class="style8">
                    19</td>
                <td align="left" class="style8">
                    **Perform pre-transfusion check with a staff nurse correctly.</td>
                <td  colspan="5" align="center" class="style8" >
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
        
            
          <tr>
                <td class="style8">
                    20</td>
                <td align="left" class="style8">
                    Wear gloves.</td>
                <td  colspan="5" align="center" class="style8" >
               
                   
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
        
        
        
        
         
            
          <tr>
                <td class="style8">
                    21</td>
                <td align="left" class="style8">
                    Calculate the flow rate and show workings</td>
                <td  colspan="5" align="center" class="style8" >
                  
             
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
        
        
        
        
         
            
          <tr>
                <td class="style8">
                    22</td>
                <td align="left" class="style8">
                    Administer the blood unit slowly, manually adjust the drip rate to 20 drops/min 
                    (Total volume = 300mls to run over 4 hours).</td>
                <td  colspan="5" align="center" class="style8" >
                  
                   
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
        
        
        
        
         
            
          <tr>
                <td class="style8">
                    23</td>
                <td align="left" class="style8" rowspan="4" >
                    Monitor for early s/s of blood reactions closely.</td>
                <td align="left" class="style8">
                    **Vital signs every 10-15 minutes, for 1st hour.</td>
                <td  colspan="5" align="center" class="style8" >
                  
                   
                   
                  
                   
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="style9" rowspan="4">
                      Lecturer: **To accord &quot;0&quot; mark if student did not perform the highlighted 
                      required step.</td>
            </tr>      
        
  
          <tr>
                <td class="style8">
                    24</td>
                <td align="left" class="style8">
                    **Vital signs every 30 minutes for 2nd hour.</td>
                <td  colspan="5" align="center" class="style8" >
                  
                  
                   
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
        
        
        
        
         
            
          <tr>
                <td class="style8">
                    25</td>
                <td align="left" class="style8">
                    **Vital signs hourly till completion or according to doctor&#39;s order.</td>
                <td  colspan="5" align="center" class="style8" >
                  
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
  
          <tr>
                <td class="style8">
                    26</td>
                <td align="left" class="style8">
                    **Document in hourly parameters chart.</td>
                <td  colspan="5" align="center" class="style8" >
                  
        
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
                <td align="center" class="style8"  >
                                        4</td>
                <td class="style8">
                    
                    <asp:TextBox ID="remarks26" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>      
        
               <tr>
                <td>
                    27</td>
                <td align="left" >
                    Recognise the need to inform doctor of status and request for blood product from 
                    lab.</td>
                <td align="left" class="style8">
                    Contact the doctor to update the about the blood results and change in condition 
                    if any. Contact the blood bank and request for blood product. </td>
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
                <td align="center"> 4                 </td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks27" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                      </td>
                <td class="font-italic">
                    Lecturer: Doctor orders to monitor patient closely and administer IM anti 
                    emetics as ordered. Student to prepare correct analgesics and PPI in kidney dish 
                    for administration by Staff Nurse. </td>
            </tr>                
           <%--   ------------------------------------------------------------------  --%>
                             
        
               <tr>
                <td>
                    28</td>
                <td align="left" >
                    Provide proper and timely documentation of procedures in report.</td>
                <td align="left" class="style8">
                    1. Patient&#39;s name and IC. </br> 2. Detail of performed procedure.</br> 3. Name with 
                    signature in report.</br> 4. IMR is signed /E-IMR is marked as done.</td>
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
                <td align="center"> 4</td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks28" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    &nbsp;</td>
            </tr>                
                             
        
        
        
         
            
                     <tr>
                <td>
                    29</td>
                <td align="left" >
                    Evaluate patient&#39;s condition post-fluid administration.</td>
                <td align="left" class="style8">
                    1. Vital signs </br> 2. Conscious Level </br> 3. Update intake and output chart</td>
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
                <td align="center"> 4</td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks29" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    &nbsp;</td>
            </tr>                
                             
   
                     <tr>
                <td>
                    30</td>
                <td align="left" >
                    Display good team work, effort and leadership among team members.</td>
                <td align="left" class="style8">
                    1. Role is well defined. </br> 2. All team members coordinated well.  </br> 3. Display good 
                    leadership and delegation skills.</td>
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
                <td align="center"> 4</td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks30" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    &nbsp;</td>
            </tr>                

                     <tr>
                <td>
                    31</td>
                <td align="left" >
                    Display critical thinking and holistic care to patient.</td>
                <td align="left" class="style8">
                    1. Able to rationalise on the treatment given. </br>2. Good evaluation of patient&#39;s 
                    condition.</td>
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
                <td align="center"> 4</td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks31" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    &nbsp;</td>
            </tr>                

        
        
        
        
         
            
                     <tr>
                <td>
                    32</td>
                <td align="left" >
                    Display good reflective learning.</td>
                <td align="left" class="style8">
                    Able to identify strength, weakness and suggest improvement.</td>
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
                <td align="center"> 4</td>
                    <td class="style8">
                    
                    <asp:TextBox ID="remarks32" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    &nbsp;</td>
            </tr>                

          <tr>
                <td rowspan="4">
                    &nbsp;</td>
                <td align="left" colspan="2">
                    &nbsp;</td>
                <td colspan="5" align="center">
                    &nbsp;</td>
                <td align="center">
                    <asp:Label ID="Label60" runat="server" Font-Names="Arial" Font-Bold="true" Text="128"></asp:Label>
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
                    <asp:Label ID="Label62" runat="server" Font-Names="Arial" Font-Bold="true" Text="Actual Score upon 4%"></asp:Label>
                    
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
              </br>  <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total/128 X 4% "></asp:Label>
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



