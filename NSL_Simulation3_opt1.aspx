<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_Simulation3_opt1.aspx.cs" Inherits="NSL_Simulation3_opt1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Tracheostomy Care-Dressing</title>
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

 for (var i = 1; i <= 47; i++) 
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

       
    actual_score_float = (parseInt(total_score) / 188) * (10 / 100) * 100;//Total/188 X 10% 
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
        .RemarksTextarea
        {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        .style_radio
        {
            text-align: center !important;
            
        }
        .style7
        {
            height: 47px;
        }
        .style8
        {
            height: 22px;
        }
        .style9
        {
            height: 117px;
        }
        .style10
        {
            height: 41px;
        }
        .style11
        {
            height: 77px;
        }
        html
        {
            height: 100%;
            width: 100%;
        }
  .font-italic {
    font-style: italic;
     }
        .auto-style1 {
            font-family: Arial;
            font-weight: bold;
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
                        OnClick="Button4_Click"  CausesValidation="False" ImageUrl="~/images/backToGroupsBtn.png"  Height="35px" Width="200px"  />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label161" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="Tracheostomy Care- DRESSING" Font-Names="Arial"></asp:Label>
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
                <td align="left">
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
                <td>
                    <b>
                        <asp:Label ID="lb_actualscore2" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date of Assessment"
                        Font-Names="Arial"></asp:Label>
                </td>
                <td>
                    <b>
                        <asp:Label ID="lb_date" runat="server" Text=" " Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial"></asp:Label>
                    </b>
                </td>
            </tr>
        </table>
    </div>
    <br/>
    <div>
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;
            width: 100%; height: 100%" align="center">
             <%-- ---------------------------------------------------------------------------------------------%>
               <tr>
                <td align="left" colspan="11" class="styleCC" bgcolor="#98272D" 
                       style="border: 1px solid white;">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" Text= "OPTION 1 (DRESSING)"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label><asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="180px" Height="25px">
                                        
                                    <asp:ListItem Text="1-DRESSING" Value="1"></asp:ListItem>
                                   
                                     <asp:ListItem Text="2-SUCTIONING" Value="2"></asp:ListItem>
                                         <asp:ListItem Text="3-SUCTIONING With PVC" Value="3"></asp:ListItem>
                                </asp:DropDownList><asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
            <%-- ---------------------------------------------------------------------------------------------%>
            
            <tr>
                <td align="center" colspan="11" bgcolor="#98272D">
                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" Text="Tracheostomy Dressing"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left" style="text-align:justify" colspan="11" class="styleCC">
                    Brief Summary: 
                    <br />
                     
Mdm Lee Ho Yin is a 58-year-old housewife who was admitted to Surgical Intensive Care Unit (SICU) one month ago due to severe sepsis and poor wound healing that required VAC dressing.  Tracheostomy placement was done two weeks ago due to difficulty in weaning from ventilator. The patient had been self-ventilating on a tracheostomy collar for one week. Subsequently, she was transferred to the ward from SICU and on recovery and weaning phase of a tracheostomy insertion. The patient usually required tracheostomy suctioning every four hours. The characteristics of the secretions have been tan, thick and moderate in amount. The patient had an episode of frequent PVCs 2 days ago and was therefore placed on a bedside monitor for assessment. No further ectopy was noted. She is presently in normal sinus rhythm. Doctor ordered to keep her NBM.
<br />Past Medical History: She has a history of hypertension. She states that she takes “water pills” for her blood pressure and has been trying to exercise. She had multiple wound debridement done over the right leg due to necrotising fascitis.
<br />
Social: Lives with husband.<br />
Drug Allergy: NKDA
								

					
					
					</td>
            </tr>
            <tr bgcolor="#98272D">
                <td rowspan="2" style="border: 1px solid white;">
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" rowspan="2" style="border: 1px solid white;">
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
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label33" runat="server" Text="Not Performed" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label34" runat="server" Text="Unsatisfied" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label35" runat="server" Text="Below satisfactory" Font-Bold="True"
                            Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label36" runat="server" Text=" Satisfactory" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label37" runat="server" Text="Examplary" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label4" runat="server" Text="Maximum Score" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label162" runat="server" Text="Remarks" Font-Bold="True"
                            Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td rowspan="2" align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label9" runat="server" Text="Action by TSO or Lecturers" Font-Bold="True"
                            Font-Size="Large" Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr bgcolor="#98272D">
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label32" runat="server" Text="0" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label38" runat="server" Text="1" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label39" runat="server" Text="2" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label40" runat="server" Text="3" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
                <td align="center" style="border: 1px solid white;">
                    <b>
                        <asp:Label ID="Label41" runat="server" Text="4" Font-Bold="True" Font-Size="Large"
                            Font-Names="Arial" ForeColor="White"></asp:Label>
                    </b>
                </td>
            </tr>
            <tr >
                <td align="left" colspan="10" >
                    <asp:Label ID="Label5" runat="server" Text="Current Situation: At 1100 hours, the patient has transferred in from SICU. Demonstrate the plan of care after taking over the patient."
                     Font-Names="Arial"  ForeColor="Red"></asp:Label>
                </td>
                <td class="font-italic">Lecturer: 
                    <br />
                    To brief students of current situation.</td>
            </tr>
            <%-- ----------------------------1--------------------------------------------------- --%>
            <tr>
                <td rowspan="4">
                    1
                </td>
                <td align="left" rowspan="4">
                    Verify and carry out latest healthcare providers&#39; orders.
                </td>
                <td align="left">
                    Take over report from the previous group and perform follow up care.</td>
                <td colspan="5" align="center" rowspan="4">
                    <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList1"
                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1"
                        ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="4">
                    4
                </td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks1" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    TSO:
                    <br />
                  Prepare the charts as last suctioning at 1030hrs, vital signs at 1000 hours and previously on pump feeding at 60mls/hr.
Trachy dressing: stained with yellow secretion.
</td>
            </tr>
            <tr>
                <td align="left">
                    Review all orders from progress note (Step down care from ICU).</td>
                <td class="font-italic">
                    Lecturer:
                    <br />
                    To insert the progress note with doctor&#39;s review and orders for &quot;Post ICU 
                    transfer&quot;.</td>
            </tr>
            <tr>
                <td align="left">
                    Review all nursing documentation and charts from previous shift.</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    Carry out all orders in a systematic manner.</td>
                <td class="font-italic">
                </td>
            </tr>
            <%--------------------------------------2---------------------------------------------%>
            <tr>
                <td>
                    2
                </td>
                <td align="left">
                    Perform medical hand hygiene.

                </td>
                <td align="left">
                    Follow 5 moments of hand hygiene.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList2"
                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2"
                        ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
            <%-----------------------------------3------------------------------------------------%>
            <tr>
                <td rowspan="3">
                    3
                </td>
                <td align="left" rowspan="3">
                    Display effective and professional communication with client / relatives throughout
                    simulation.
                </td>
                <td align="left">
                    Greet client and introduce self.
                </td>
                <td colspan="5" align="center" rowspan="3">
                    <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList3"
                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="RadioButtonList3"
                        ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="3">
                    4
                </td>
                <td rowspan="3">
                    
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    Identify the client by 2 identifiers (checking ID band against charts).
                </td>
            </tr>
            <tr>
                <td align="left">
                    Explain procedure to client and obtain verbal consent.
                </td>
            </tr>
            <%--  ---------------------------4-------------------------------------------%>
            <tr>
                <td rowspan="2">
                    4
                </td>
                <td align="left" rowspan="2">
                    Check client&#39;s bedside for tracheostomy care equipment and supplies.
                </td>
                <td align="left">
                    Presence of trachy dilator.
                </td>
                <td colspan="5" align="center" rowspan="2">
                    <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList4"
                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="RadioButtonList4"
                        ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="2">
                    4
                </td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    Similar size tracheostomy tube set is available.
                </td>
            </tr>
            <%--  -------------------------------5---------------------------------------%>
            
            
             <tr>
                <td>
                    5</td>
                <td align="left" rowspan="3">
                    Assess the VAC dressing and therapy system.
                </td>
                <td align="left">
                    Troubleshoot for alarms / abnormality of dressing.</td>
                <td colspan="5" align="center">
                     <asp:RadioButtonList RepeatColumns="5" class="style_radio" ID="RadioButtonList5"
                        runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RadioButtonList5"
                        ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    Lecturer to note: 
                    <br />
                    To simulate for presence of system leakage / blockage/ low 
                    battery /oozing of dressing due to therapy not activated.</td>
            </tr>
            <%--------------------------------6--------------------------------%>
            
             <tr>
                <td>
                    6</td>
                <td align="left">
                    Verify that the VAC therapy indicated on machine is running according to 
                    treatment order.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList6" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList6" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    TSO:
                    <br />
                    VAC therapy - Continuous 125 mmHg</td>
            </tr>
            <%----------------------------7---------------------------------------%>
            
             <tr>
                <td>
                    7</td>
                <td align="left">
                    Perform pain assessment.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList7" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator7" runat="server" 
                        ControlToValidate="RadioButtonList7" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
            <%-----------------------------------8-------------------------------------------%>
             <tr>
                <td rowspan="2">
            
                    8</td>
                <td align="left" rowspan="2">
                    Assess the need for the change of dressing.</td>
                <td align="left">
                    Assess the tracheostomy dressing for stained or soiled with discharge or blood.</td>
                <td colspan="5" align="center" rowspan="2">
                    <asp:RadioButtonList ID="RadioButtonList8" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator8" runat="server" 
                        ControlToValidate="RadioButtonList8" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="2">
                    4
                </td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="2" class="font-italic">
                    TSO: 
                    <br />
                   To prepare the yellowish color stained gauze on trachy dressing.</td>
            </tr>
            
            <tr>
                <td align="left">
                    Routine change at least once daily.</td>
            </tr>
           
            <%--  --------------------------------9--------------------------------------%>
            <tr>
                <td rowspan="4">
                    &nbsp;
                    9</td>
                <td align="left" rowspan="5">
                    Obtain the vital signs timely and correctly according to treatment order. (must 
                    be checked prior suctioning)</td>
                <td align="left">
                    Apply ECG monitor.
                </td>
                <td colspan="5" align="center" rowspan="4">
                    <asp:RadioButtonList ID="RadioButtonList9" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator9" runat="server" 
                        ControlToValidate="RadioButtonList9" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="4">
                    4
                </td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="4" class="font-italic">
                    State1: Respiratory distress<br />
                    RR=30, HR=105, BP=150/88,SpO2=92%<br />
                    TSO/Lecturer:<br />
                    Patient is not on oxygen therapy after transfer</td>
            </tr>
            <tr>
                <td align="left">
                    Apply SpO2 probe.
                </td>
            </tr>
            <tr>
                <td align="left">
                    Apply BP cuff.
                </td>
            </tr>
            <tr>
                <td align="left" class="style9">
                    Measure and document client&#39;s BP, pulse, respiratory rate, temperature and SpO2 
                    accurately follow doctor&#39;s order.
                </td>
            </tr>
             <%--  -------------------------10---------------------------------------------%>
            <tr>
                <td>
                    10</td>
                <td align="left">
                    **Interprete parameters and relate to client&#39;s condition (If high BP, 
                    tachycardia, tachypnea, drop SpO2 - signs of respiratory distress).</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator10" runat="server" 
                        ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    **Accord &quot;0&quot; mark if student did not assess the vital signs prior suctioning.</td>
            </tr>
            <%--  -----------------------------11-----------------------------------------%>
            
           
            <tr>
                <td>
                                        11</td>
                <td align="left" rowspan="3">
                    Confirm client&#39;s need for suctioning
                </td>
                <td align="left">
                    Check suctioning chart for previous suction performed.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList11" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator11" runat="server" 
                        ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td class="font-italic">
                    Last suctioning was done at 1030hr with minimal secretion (30mins from current 
                    time).</td>
            </tr>
             <%--  ------------------------------12----------------------------------------%>
            <tr>
                <td>
                    12</td>
                <td align="left">
                    Perform 4-point auscultation for presence of seceretion.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList12" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator12" runat="server" 
                        ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
             <%--  ------------------------------13----------------------------------------%>
            <tr>
                <td>
                    13</td>
                <td align="left">
                    Students observe for:<br />
                    ●Audible adventitious sounds<br />
                    ●Bubbles of mucus in tracheostomy opening.<br />
                    ●Increase respiratory rate, drop in SpO2, decrease LOC.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList13" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator13" runat="server" 
                        ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
          <%----------------------------------14--------------------------------------%>

              <tr>
                <td>
                    14</td>
                <td align="left" rowspan="2">
                   Administer medications without errors
                </td>
                <td align="left">
                   **Check for presence of allergy<br/>
					a) Ask patient for presence of allergy<br/>
					b) Compare with eIMR
					</td>
                <td colspan="5" align="center">
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
                <td align="center">
                    4</td>
                <td>
                    
                  <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                            </td>
                <td class="font-italic">
                    </td>
            </tr>
             <%--  ----------------------------------15------------------------------------%>
            
             <tr>
                <td>
                   15</td>
                <td align="left">
                    **Administer Nebuliser Salbutamol:N/S 2:2 at the correct dose & dilution<br />
					a) Scans vials & compare with eIMR order<br/>
					b) Administer 4mls into nebuliser tracheostomy mask<br/>
					c) On O2 flowmeter to 5-8L/min 
				</td>
                <td colspan="5" align="center">
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
                    </asp:RequiredFieldValidator></td>
                <td align="center">
                    4</td>
                <td>
                    
                     
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                          </td>
                <td class="font-italic">
                   TSO/Lecturer: <br/>
				   To increase heart rate to 120bpm after initiation of Nebuliser.  (After 1-2mins, To inform student nebulisation is completed)
</td>
            </tr>
            <%-----------------------------16-----------------------------------------%>
            
            <tr>
                <td>
                    16</td>
                <td align="left">
                   Re-evaluate patient's hemodynamic status and ECG correctly.
</td>
                <td align="left">
                    Evaluate to ensure SpO2 is improved to above 95%.
</td>
                <td colspan="5" align="center">
                
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
                        ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>

            <%--  ---------------------------17-------------------------------------------%>
            <tr>
                <td>
                    17</td>
                <td align="left" rowspan="3">
                    Management to improve oxygenation and prevent hypoxia.
                </td>
                <td align="left">
                    Prop the patient up to 30 degrees to ease difficulty in breathing.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList17" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator17" runat="server" 
                        ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5" class="font-italic">
                    TSO/Lecturer to note:
                    <br />
                 
Recovery state<br />
HR-90bpm, BP- 130/80mmhg, RR-25, SpO2 98%.<br />
This state is activated if students have done troubleshooting by: <br />
*Prop up the patient<br />
*Administer the oxygen therapy appropriately<br />
*Change of inner tube




</td>
            </tr>
             <%--  ------------------------18----------------------------------------------%>
            <tr>
                <td>
                    18</td>
                <td align="left" >
                    Administer oxygen at 5L/min via tracheostomy mask as ordered.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList18" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator18" runat="server" 
                        ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  ----------------------19------------------------------------------------%>
            <tr>
                <td class="style7">
                    19</td>
                <td align="left" class="style7">
                    Evaluate to ensure SpO2 is improved to above 95%.</td>
                <td colspan="5" align="center" class="style7">
                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator19" runat="server" 
                        ControlToValidate="RadioButtonList19" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                     </td>
                <td align="center" class="style7">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <%--  ---------------------------20-------------------------------------------%>
            <tr>
                <td rowspan="2">
                    20</td>
                <td align="left" rowspan="2">
                    To change tracheostomy inner tube to:
                    <br />
                    *non-fenestrated before suctioning.
                    <br />
                    *fenestrated or nonfenestrated if suctioning is not required.</td>
                <td align="left">
                    Wear disposable latex gloves.
                </td>
                <td colspan="5" align="center" rowspan="2">
                    <asp:RadioButtonList ID="RadioButtonList20" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator20" runat="server" 
                        ControlToValidate="RadioButtonList20" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="2">
                    4
                </td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <tr>
                <td align="left">
                    Change the inner tube in correct manner by holding on the plate.
                </td>
            </tr>
            <%--  -----------------------21-----------------------------------------------%>
            <tr>
                <td rowspan="2">
                    21</td>
                <td align="left" rowspan="5">
                    Prepare the requisites and environment well.
                </td>
                <td align="left">
                    Prepare sterile dressing set, N/S, 1 inch micropore tape, tracheostomy tape, 
                    latex gloves, plastic apron, scissors.</td>
                <td colspan="5" align="center" rowspan="2">
                    <asp:RadioButtonList ID="RadioButtonList21" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator21" runat="server" 
                        ControlToValidate="RadioButtonList21" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="2">
                    4
                </td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    Check expiry date for all requisites.</td>
            </tr>
             <%--  -------------------------22---------------------------------------------%>
            <tr>
                <td>
                    22</td>
                <td align="left">
                    Don surgical mask and disposable apron.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList22" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator22" runat="server" 
                        ControlToValidate="RadioButtonList22" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  -------------------------------23---------------------------------------%>
            <tr>
                <td>
                    23</td>
                <td align="left">
                    Prepare environment.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator23" runat="server" 
                        ControlToValidate="RadioButtonList23" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  ------------------------24----------------------------------------------%>
            <tr>
                <td>
                    24</td>
                <td align="left">
                    Ensure HOB remains at 30-45 degree with neck in slight extension.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList24" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator24" runat="server" 
                        ControlToValidate="RadioButtonList24" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <%--  ------------------------------25----------------------------------------%>
            <tr>
                <td rowspan="2">
                    25</td>
                <td align="left" rowspan="3">
                    Assess tracheostoma site.</td>
                <td align="left">
                    Remove old dressing with clean gloves.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator25" runat="server" 
                        ControlToValidate="RadioButtonList25" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="3" class="font-italic">
                    #Lecturer to observe if students update the client regarding his tracheostoma 
                    condition.</td>
            </tr>
            <tr>
                <td align="left" rowspan="2">
                    #Assess the tracheostoma for signs of trauma, infection and inflammation 
                    (redness &amp; discharges).</td>
                <td colspan="5" align="center" rowspan="2">
                    <asp:RadioButtonList ID="RadioButtonList26" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator26" runat="server" 
                        ControlToValidate="RadioButtonList26" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="2">
                    4</td>
                <td rowspan="2">
                    
                    <asp:TextBox ID="remarks26" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <tr>
                <td class="style11">
                    26</td>
            </tr>
            <%--  -------------------------------27---------------------------------------%>
            <tr>
                <td>
                    27</td>
                <td align="left" rowspan="4">
                    **Prepare dressing set without contamination before surgical handrub.</td>
                <td align="left">
                    Remove gloves and perform hand hygiene.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator27" runat="server" 
                        ControlToValidate="RadioButtonList27" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks27" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="4" class="font-italic">
                    Note:
                    <br />
                    **Accord &quot;0&quot; if there is any contamination for the particular step/s.</td>
            </tr>
             <%--  ---------------------------28-------------------------------------------%>
            <tr>
                <td>
                    28</td>
                <td align="left">
                    Open dressing set.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList28" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator28" runat="server" 
                        ControlToValidate="RadioButtonList28" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks28" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  ---------------------------29-------------------------------------------%>
            <tr>
                <td>
                    29</td>
                <td align="left">
                    Pour N/S correctly.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList29" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator29" runat="server" 
                        ControlToValidate="RadioButtonList29" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks29" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  ---------------------------30-------------------------------------------%>
            <tr>
                <td>
                    30</td>
                <td align="left">
                    Prepare trachy tape.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList30" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator30" runat="server" 
                        ControlToValidate="RadioButtonList30" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks30" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <%--  ---------------------------------31-------------------------------------%>
            <tr>
                <td>
                    31</td>
                <td align="left" rowspan="3">
                    **Prepare dressing set without contamination after surgical handrub.</td>
                <td align="left">
                    Perform surgical handrub.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList31" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator31" runat="server" 
                        ControlToValidate="RadioButtonList31" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks31" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="3" class="font-italic">
                    Note:
                    <br />
                    **Accord &quot;0&quot; mark if there is any contamination for the particular step/s.</td>
            </tr>
             <%--  ------------------------------32----------------------------------------%>
            <tr>
                <td>
                    32</td>
                <td align="left">
                    Squeeze cotton swabs dry.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList32" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator32" runat="server" 
                        ControlToValidate="RadioButtonList32" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks32" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  -----------------------------33-----------------------------------------%>
            <tr>
                <td>
                    33</td>
                <td align="left">
                   Prefold 2 or more pieces of gauze into half  for key hole dressing.
</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList33" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator33" runat="server" 
                        ControlToValidate="RadioButtonList33" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks33" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <%--  ----------------------------------------------------------------------%>
            <tr>
                <td>
                    34</td>
                <td align="left" rowspan="5">
                    **Clean tracheostomy site using 3 forcep technique without contamination.</td>
                <td align="left">
                    Lift tracheostomy plate in the direction of cleaning.
                </td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList34" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator34" runat="server" 
                        ControlToValidate="RadioButtonList34" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks34" runat="server" TextMode="MultiLine"    class="RemarksTextarea" 
                                            Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5" class="font-italic">
                                        Note: 
                                        <br />
                                        **Accord &quot;0&quot; mark if there is any contamination for the particular step/s.</td>
            </tr>
             <%--  ------------------------------35----------------------------------------%>
            <tr>
                <td>
                    35</td>
                <td align="left">
                    Clean close to the tracheostomy site followed by surrounding skin then 
                    tracheostomy plate.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList35" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator35" runat="server" 
                        ControlToValidate="RadioButtonList35" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks35" runat="server" TextMode="MultiLine"    class="RemarksTextarea" 
                                            Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  -----------------------------36-----------------------------------------%>
            <tr>
                <td>
                    36</td>
                <td align="left">
                    Dry tracheostoma site then lastly the plate with gauze.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList36" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator36" runat="server" 
                        ControlToValidate="RadioButtonList36" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks36" runat="server" TextMode="MultiLine"    class="RemarksTextarea" 
                                            Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
             <%--  ---------------------------37-------------------------------------------%>
            <tr>
                <td>
                    37</td>
                <td align="left" class="style7">
                    Insert half folded gauze under the tracheostomy plate for both sides.</td>
                <td colspan="5" align="center" class="style7">
                    <asp:RadioButtonList ID="RadioButtonList37" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator37" runat="server" 
                        ControlToValidate="RadioButtonList37" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
                <td align="center" class="style7">
                    4</td>
                <td class="style7">
                    
                    <asp:TextBox ID="remarks37" runat="server" TextMode="MultiLine"    class="RemarksTextarea" 
                                            Font-Names="Arial" Text=""></asp:TextBox>
                    
                                        </td>
            </tr>
             <%--  ------------------------------38----------------------------------------%>
            <tr>
                <td>
                    38</td>
                <td align="left">
                    Tape upper and lower edges of gauze with micropore tape.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList38" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator38" runat="server" 
                        ControlToValidate="RadioButtonList38" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks38" runat="server" TextMode="MultiLine"    class="RemarksTextarea" 
                                            Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
            </tr>
            <%--  ---------------------------------39-------------------------------------%>
            <tr>
                <td rowspan="5">
                    39</td>
                <td align="left" rowspan="5">
                    Change trachy tape physically.</td>
                <td align="left">
                    Use gloves or dressing forceps to change the tape.</td>
                <td colspan="5" align="center" rowspan="5">
                    <asp:RadioButtonList ID="RadioButtonList39" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator39" runat="server" 
                        ControlToValidate="RadioButtonList39" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="5">
                    4
                </td>
                <td rowspan="5">
                    
                    <asp:TextBox ID="remarks39" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5" class="font-italic">
                    Note:
                    <br />
                    **Accord &quot;0&quot; mark should be accorded if the student removed the old tape before 
                    securing the new tape.</td>
            </tr>
            <tr>
                <td align="left">
                    **Ensure new trachy tape is well secured before removing old tape.</td>
            </tr>
            <tr>
                <td align="left" class="style10">
                    Allow 2 fingers&#39; spacing between tape and skin.</td>
            </tr>
            <tr>
                <td align="left">
                    Tie only dead knot.</td>
            </tr>
            <tr>
                <td align="left">
                    Discard old tape with gloves and ensure trachy mask is placed back.</td>
            </tr>
            <%------------------------------------40------------------------------------------
       --%>
            <tr>
                <td>
                    40</td>
                <td align="left">
                    Check tracheostomy cuff pressure.</td>
                <td align="left">
                    Ensure cuff pressure is maintained at 15-25cm H2O.</td>
                <td colspan="5" align="center">
                    <asp:RadioButtonList ID="RadioButtonList40" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator40" runat="server" 
                        ControlToValidate="RadioButtonList40" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center">
                    4</td>
                <td>
                    
                    <asp:TextBox ID="remarks40" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
            <%--  ------------------------------41----------------------------------------%>
              <tr>
                <td rowspan="5">
                    41</td>
                <td align="left" rowspan="5">
                    **Demonstrate care of tracheostomy inner cannula.</td>
                <td align="left">
                    Flush with running water.</td>
                <td colspan="5" align="center" rowspan="5">
                    <asp:RadioButtonList ID="RadioButtonList41" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator41" runat="server" 
                        ControlToValidate="RadioButtonList41" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="5">
                    4</td>
                <td rowspan="5">
                    
                    <asp:TextBox ID="remarks41" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5"  class="font-italic">
                    Pls allow the students to perform it physically, not just verbalise. 
                    <br />
                    Note: 
                    <br />
                    Accord &quot;0&quot; mark if student did not physically perform the cleaning.</td>
            </tr>
            <tr>
                <td align="left">
                    Clean with trachy brush.</td>
            </tr>
			<tr>
                <td align="left">
                   Soak in sodium bicarbonate solution for 10 minutes if mucus crust is still present
</td>
            </tr>
            <tr>
                <td align="left">
                    Flush with water for irrigation.</td>
            </tr>
            <tr>
                <td align="left">
                   Shake dry before keeping in covered container.
</td>
            </tr>
            <%--  -----------------------------42-----------------------------------------%>
             <tr>
                <td rowspan="4">
                    42</td>
                <td align="left" rowspan="4">
                    **Maintain client&#39;s safety throughout all procedures rendered.</td>
                <td align="left">
                    Place call bells within reach.</td>
                <td colspan="5" align="center" rowspan="4">
               
                    <asp:RadioButtonList ID="RadioButtonList42" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator42" runat="server" 
                        ControlToValidate="RadioButtonList42" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
               
                </td>
                <td align="center" rowspan="4">
                    4
                </td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks42" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="4" class="font-italic">
                    **Accord &quot;0&quot; mark if students breach any of the safety measures. </td>
            </tr>
            <tr>
                <td align="left">
                   Ensure side rails are up.
</td>
            </tr>
            <tr>
                <td align="left">
                    Ensure bed is locked.</td>
            </tr>
         
            <tr>
                <td align="left" class="style7">
                    Adjust bed to lowest height.</td>
            </tr>
          
         
           <%---------------------------------43------------------------------------------ --%>
        
          <tr>
                <td rowspan="6">
                   43</td>
                <td align="left" rowspan="6">
                    Documentation for dressing.</td>
                <td align="left">
                    Date and time.</td>
                <td colspan="5" align="center" rowspan="6">
                    <asp:RadioButtonList ID="RadioButtonList43" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidato43" runat="server" 
                        ControlToValidate="RadioButtonList43" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" rowspan="6">
                    4
                </td>
                <td rowspan="6">
                    
                    <asp:TextBox ID="remarks43" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    Client&#39;s tolerance to procedure.</td>
            </tr>
            <tr>
                <td align="left" class="style8">
                    Assessment of tracheostomy site.</td>
            </tr>
            <tr>
                <td align="left">
                    Characteristics of discharges.</td>
            </tr>
            <tr>
                <td align="left">
                    Any unusual findings or interventions.</td>
            </tr>
            <tr>
                <td align="left">
                    Change of inner cannula or suctioning.</td>
            </tr>
        
        
           <%---------------------------------------44------------------------------------ --%>
         
           <tr>
                <td rowspan="5">
                    44</td>
                <td align="left" rowspan="5">
                    Display effective and efficient respond and communication among team members 
                    (roles specific).</td>
                <td align="left">
                    Communicate directly with physician for client&#39;s plan of care.</td>
                <td colspan="5" align="center" rowspan="5">
                  
                    <asp:RadioButtonList ID="RadioButtonList44" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator44" runat="server" 
                        ControlToValidate="RadioButtonList44" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  
                </td>
                <td align="center" rowspan="5">
                    4
                </td>
                <td rowspan="5">
                    
                    <asp:TextBox ID="remarks44" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="5">
                    &nbsp;</td>
            </tr>
         
           <tr>
                <td align="left">
                    Inform physician immediately when client&#39;s condition change. </td>
            </tr>
         
           <tr>
                <td align="left">
                    Adopted SBAR in communication.</td>
            </tr>
         
           <tr>
                <td align="left">
                    Give clear direction.</td>
            </tr>
         
           <tr>
                <td align="left">
                    Stay calm and control.</td>
            </tr>
           <%----------------------------------45----------------------------------------- --%>
           	<tr>
                <td rowspan="4">
                    45</td>
                <td align="left" rowspan="4">
                    Display good team work, effort and leadership among the team.</td>
                <td align="left">
             The role of each team was well defined  prior to simulation.
</td>
                <td colspan="5" align="center" rowspan="4">
                 
                    <asp:RadioButtonList ID="RadioButtonList45" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator45" runat="server" 
                        ControlToValidate="RadioButtonList45" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                 
                 </td>
                <td align="center" rowspan="4">
                    4
                </td>
                <td rowspan="4">
                    
                    <asp:TextBox ID="remarks45" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="4">
                    &nbsp;</td>
            </tr>
             <tr>
                <td align="left">
                    All team members are working well with one another.</td>
            </tr>
             <tr>
                <td align="left">
                    Work together to be on time in completing the tasks / assignments</td>
            </tr>
			  <tr>
                
                <td align="left">
                    Display good leadership: dedication of assignment, guiding the peers.</td>
               
            </tr>
           <%--------------------------------------46------------------------------------- --%>
         
            <tr>
                <td rowspan="5">
                    46</td>
                <td align="left" rowspan="5">
                    Display critical thinking and holistic management of client care.</td>
                <td align="left" class="style8">
                    Focus on the most relevant and important data for explaining client&#39;s condition.</td>
                <td colspan="5" align="center" rowspan="5">
                
                    <asp:RadioButtonList ID="RadioButtonList46" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator46" runat="server" 
                        ControlToValidate="RadioButtonList46" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                
                </td>
                <td align="center" rowspan="5">
                    4
                </td>
                <td rowspan="5">
                    
                    <asp:TextBox ID="remarks46" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td rowspan="3" class="font-italic">
                    &nbsp;</td>
            </tr>
         
            <tr>
                <td align="left">
                    Make sense of patterns in client&#39;s data and develop appropriate plans.</td>
            </tr>
         
            <tr>
                <td align="left">
                    Regularly observe and monitor client&#39;s subjective and objective data.</td>
            </tr>
         
            <tr>
                <td align="left">
                    Seeks information from client and relatives to plan intervention.</td>
                <td rowspan="2" class="font-italic">
                    To deduct marks when student perform tracheostomy suctioning without checking parameters.

</td>
            </tr>
         
            <tr>
                <td align="left">
                    Effectively apply theories or concepts / critical thinking in managing client 
                    care.</td>
            </tr>
           <%----------------------------------------47----------------------------------- --%>
         
            <tr>
                <td>
                    47</td>
                <td align="left">
                    Display good reflective learning.</td>
                <td align="left">
                    Able to identify strength, weakness and suggest improvement.</td>
                <td colspan="5" align="center">
                
                    <asp:RadioButtonList ID="RadioButtonList47" runat="server" class="style_radio" 
                        RepeatColumns="5" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="" Value="0"></asp:ListItem>
                        <asp:ListItem Text="" Value="1"></asp:ListItem>
                        <asp:ListItem Text="" Value="2"></asp:ListItem>
                        <asp:ListItem Text="" Value="3"></asp:ListItem>
                        <asp:ListItem Text="" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="ReqiredFieldValidator47" runat="server" 
                        ControlToValidate="RadioButtonList47" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                
                </td>
                <td align="center">
                    4
                </td>
                <td>
                    
                    <asp:TextBox ID="remarks47" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
           <%--------------------------------------------------------------------------- --%>
         
            <%--------------------------------------------------------------------------- --%>
         
        
        
        
        
        
            <tr>
                <td rowspan="4">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td align="left">
                    &nbsp;</td>
                <td colspan="5" align="center">
                    &nbsp;</td>
                <td align="center" class="auto-style1">
                    188</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
         
        
        
        
        
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label53" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label52" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total Raw Mark"></asp:Label>
                    <asp:Label ID="Label54" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                </td>
                <td colspan="8">
                    <asp:Label ID="Label55" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label56" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label57" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label58" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                    <asp:Label ID="Label59" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                <asp:Label ID="lb_total" runat="server" Font-Bold="true" Font-Names="Arial" 
                        Font-Size="Medium" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label62" runat="server" Font-Names="Arial" Font-Bold="true" Text="Actual Score upon 10%"></asp:Label>
                    <asp:Label ID="Label63" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total"></asp:Label>
                    <asp:Label ID="Label64" runat="server" Font-Names="Arial" Font-Bold="true" Text=" "></asp:Label>
                </td>
                <td colspan="8" align="left">
                                        
                    <asp:Label ID="lb_actualscore" runat="server" Font-Size="Medium" Font-Names="Arial"
                        Font-Bold="true" Text=""></asp:Label>&nbsp;
                        <asp:Button ID="btn_show_currentscore" autopostback="false" runat="server" Text="Update" Font-Bold="true"  OnClientClick="return show_score()" 
       CausesValidation="false"
             />
                </td>
            </tr>
            <%--  ----------------------------------------------------------------------%>
            <tr>
                <td colspan="2" align="right">
                    <asp:Label ID="Label65" runat="server" Font-Names="Arial" Font-Bold="true" Text=" Calculation: Actual Score = "></asp:Label>
              </br>  <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Bold="true" Text="Total Raw Mark/188 X 10% "></asp:Label>
                </td>
                <td colspan="8" align="left">
                    &nbsp;</td>
            </tr>
            </table>
    </div>
    <div align="center">
           <asp:ImageButton ID="btn_common_save" autopostback="false" runat="server" ImageUrl="~/images/BtnSave.png"  
        Style="margin-top: 20px" Width="145px" Height="48px" CausesValidation="false"  OnClientClick="Confirm2()"   OnClick="onclick_Save" />
        <asp:ImageButton ID="btn_submit" OnClientClick="Confirm();"
            runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Style="margin-top: 20px" Width="145px" Height="48px"   OnClick="btn_submit_click" /></div>
    </form>
</body>
</html>
