<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NSL_MGC_opt1.aspx.cs" Inherits="NSL_MGC_opt1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MEGACODE</title>
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
                document.forms[0].appendChild(confirm_value);
                return true;
            } else {
                confirm_value.value = "CANCEL";
                return false;
            }
            
        }
        function GetRDBValue1() {
        var radio = document.getElementsByName('<%=RadioButtonList1.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb = document.getElementById('<%=  label1.ClientID %>');
                lb.innerHTML =  (radio[i].value )*2 ;
                 document.getElementById("HiddenField1").value=(radio[i].value )*2 ;
            }
        }
    }
        function GetRDBValue2() {
        var radio = document.getElementsByName('<%=RadioButtonList2.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb = document.getElementById('<%=  label2.ClientID %>');
                lb.innerHTML =  (radio[i].value )*3 ;
                   document.getElementById("HiddenField2").value=(radio[i].value )*3 ;
            }
        }
    }
      function GetRDBValue3() {
        var radio = document.getElementsByName('<%=RadioButtonList3.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb = document.getElementById('<%=  label3.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6;
                   document.getElementById("HiddenField3").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue4() {
        var radio = document.getElementsByName('<%=RadioButtonList4.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label4.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField4").value=(radio[i].value )*9 ;
            }
        }
    }
        function GetRDBValue5() {
        var radio = document.getElementsByName('<%=RadioButtonList5.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label5.ClientID %>');
                lb.innerHTML =  (radio[i].value )*3 ;
                   document.getElementById("HiddenField5").value=(radio[i].value )*3 ;
            }
        }
    } 
        
      
       function GetRDBValue6() {
        var radio = document.getElementsByName('<%=RadioButtonList6.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label6.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField6").value=(radio[i].value )*6 ;
            }
        }
    }
       function GetRDBValue7() {
        var radio = document.getElementsByName('<%=RadioButtonList7.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label7.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField7").value=(radio[i].value )*9 ;
            }
        }
    }
       function GetRDBValue8() {
        var radio = document.getElementsByName('<%=RadioButtonList8.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label8.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField8").value=(radio[i].value )*6 ;
            }
        }
    }
   // ---------------------------------//
   
   function GetRDBValue9() {
        var radio = document.getElementsByName('<%=RadioButtonList9.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label9.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField9").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue10() {
        var radio = document.getElementsByName('<%=RadioButtonList10.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label10.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField10").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue11() {
        var radio = document.getElementsByName('<%=RadioButtonList11.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label11.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField11").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue12() {
        var radio = document.getElementsByName('<%=RadioButtonList12.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label12.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField12").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue13() {
        var radio = document.getElementsByName('<%=RadioButtonList13.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label13.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField13").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue14() {
        var radio = document.getElementsByName('<%=RadioButtonList14.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label14.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField14").value=(radio[i].value )*9 ;
            }
        }
    }
    function GetRDBValue15() {
        var radio = document.getElementsByName('<%=RadioButtonList15.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label15.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField15").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue16() {
        var radio = document.getElementsByName('<%=RadioButtonList16.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label16.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField16").value=(radio[i].value )*9 ;
            }
        }
    }
    function GetRDBValue17() {
        var radio = document.getElementsByName('<%=RadioButtonList17.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label17.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                document.getElementById("HiddenField17").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue18() {
        var radio = document.getElementsByName('<%=RadioButtonList18.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label18.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField18").value=(radio[i].value )*6 ;
            }
        }
    }
  
   // ---------------------------------------------//
     function GetRDBValue19() {
        var radio = document.getElementsByName('<%=RadioButtonList19.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label19.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField19").value=(radio[i].value )*9 ;
            }
        }
    }
   
    function GetRDBValue20() {
        var radio = document.getElementsByName('<%=RadioButtonList20.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label20.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField20").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue21() {
        var radio = document.getElementsByName('<%=RadioButtonList21.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label21.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField21").value=(radio[i].value )*9 ;
            }
        }
    }
    function GetRDBValue22() {
        var radio = document.getElementsByName('<%=RadioButtonList22.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label22.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField22").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue23() {
        var radio = document.getElementsByName('<%=RadioButtonList23.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label23.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField23").value=(radio[i].value )*9 ;
            }
        }
    }
    function GetRDBValue24() {
        var radio = document.getElementsByName('<%=RadioButtonList24.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label24.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField24").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue25() {
        var radio = document.getElementsByName('<%=RadioButtonList25.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label25.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField25").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue26() {
        var radio = document.getElementsByName('<%=RadioButtonList26.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label26.ClientID %>');
                lb.innerHTML =  (radio[i].value )*9 ;
                   document.getElementById("HiddenField26").value=(radio[i].value )*9 ;
            }
        }
    }
    function GetRDBValue27() {
        var radio = document.getElementsByName('<%=RadioButtonList27.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label27.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField27").value=(radio[i].value )*6 ;
            }
        }
    }
    function GetRDBValue28() {
        var radio = document.getElementsByName('<%=RadioButtonList28.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label28.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField28").value=(radio[i].value )*6 ;
            }
        }
    }
  // -----------------------------------------------//
      function GetRDBValue29() {
        var radio = document.getElementsByName('<%=RadioButtonList29.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label29.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField29").value=(radio[i].value )*6 ;
            }
        }
    }   
    function GetRDBValue30() {
        var radio = document.getElementsByName('<%=RadioButtonList30.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label30.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField30").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue31() {
        var radio = document.getElementsByName('<%=RadioButtonList31.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label31.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField31").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue32() {
        var radio = document.getElementsByName('<%=RadioButtonList32.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label32.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField32").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue33() {
        var radio = document.getElementsByName('<%=RadioButtonList33.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label33.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField33").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue34() {
        var radio = document.getElementsByName('<%=RadioButtonList34.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label34.ClientID %>');
                lb.innerHTML =  (radio[i].value )*3 ;
                   document.getElementById("HiddenField34").value=(radio[i].value )*3 ;
            }
        }
    }
     function GetRDBValue35() {
        var radio = document.getElementsByName('<%=RadioButtonList35.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label35.ClientID %>');
                lb.innerHTML =  (radio[i].value )*3 ;
                   document.getElementById("HiddenField35").value=(radio[i].value )*3 ;
            }
        }
    }
     function GetRDBValue36() {
        var radio = document.getElementsByName('<%=RadioButtonList36.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label36.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6;
                   document.getElementById("HiddenField36").value=(radio[i].value )*6 ;
            }
        }
    }
     function GetRDBValue37() {
        var radio = document.getElementsByName('<%=RadioButtonList37.UniqueID  %>');
        for (var i = 0; i < radio.length; i++) {
            if (radio[i].checked) {
                var  lb= document.getElementById('<%=  label37.ClientID %>');
                lb.innerHTML =  (radio[i].value )*6 ;
                   document.getElementById("HiddenField37").value=(radio[i].value )*6 ;
            }
        }
    }
     function  show_score()
{
 var total_score=0;
 var newLine = "\r\n";
  for (var i = 1; i <= 37; i++) 
 {
 var label_actual_score=  document.getElementById("label" + i);
         if (label_actual_score.innerHTML==null ||label_actual_score.innerHTML.trim()=="") 
          {
          }
          else
          { total_score = parseInt(total_score) + parseInt(label_actual_score.innerHTML);
   
          }          

  } 
//actual_score_float = (parseInt(total_score) / 576) *   100;//Total/576 X 4% 
 actual_score_float = (parseInt(total_score) / 562) * (10 / 100) * 100;//Total/570 X 8% 
       
actual_score_decimalValue= parseFloat(actual_score_float).toFixed(1);       
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
            height: 22px;
        }
        
       
        
       
        
        html
        {
            height: 100%;
            width: 100%;
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
                    <asp:Label ID="Labess" runat="server" Font-Bold="False" Font-Size="XX-Large" Font-Strikeout="False"
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
                        OnClick="Button4_Click" CausesValidation="False" ImageUrl="~/images/backToGroupsBtn.png"  Height="35px" Width="200px"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    
                    <asp:Label ID="Labelmm" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Black"
                        Text="MEGACODE" Font-Names="Arial"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div align="center" style="font-family: Arial; height: 100%; width: 100%;">
        <br/>
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
                    <asp:Label ID="Labelnn" runat="server" Font-Bold="True" Font-Size="Large" Text="Name of assessor"
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
                    <asp:Label ID="Labeltt" runat="server" Font-Bold="True" Font-Size="Medium" Text="Actual Percentage"
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
                    <asp:Label ID="Labelddd" runat="server" Font-Bold="True" Font-Size="Medium" Text="Date of Assessment"
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
    </br>
    </br>
    <div>
        <table bgcolor="White" border="1" bordercolor="#98272d" style="border-collapse: collapse;
            width: 100%; height: 100%" align="center">
            <tr>
                <td align="left" colspan="12" 
                    style="border: 1px solid white;">
                   * Please take note that some management/ interventions are done simultaneously and 
                    the checklist here serves as a guide for grading. Some skills can be done 
                    in sequence as shown in the list but it can also be done later if necessary.</td>
            </tr>
            <%-- ---------------------------------------------------------------------------------------------%>
           
               <tr>
                <td align="left" colspan="12" class="styleCC" bgcolor="#98272D" 
                       style="border: 1px solid white;">
                    <asp:Label ID="Labeloo" runat="server" Font-Bold="True" Font-Size="Large" Text= "OPTION 1 (Ventricular Fibrillation)"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                        
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Label ID="Labesss" runat="server" Font-Bold="True" Font-Size="Medium" Text="Select Option"
                        Font-Names="Arial" ForeColor="White"></asp:Label><asp:DropDownList ID="dl_option" runat="server" Style="margin-left: 8px;
                                    text-align: center; text-align: left; margin-right: 10px;" ForeColor="Black"
                                    Width="230px" Height="25px">
                                        
                                    <asp:ListItem Text="1-Ventricular Fibrillation"  Value="1"></asp:ListItem>
                                   
                                     <asp:ListItem Text="2-Pulseless Ventricular Tachycardia" Value="2"></asp:ListItem>
                                       
                                </asp:DropDownList><asp:Button ID="bt_start" runat="server" Font-Bold="True" Style="margin-left: 8px;"
                        OnClick="Bt_start_Click" Text="GO" CausesValidation="False" Height="30px"
                        Width="70px" />
                </td>
            </tr>
            <%-- ---------------------------------------------------------------------------------------------%>
           
            
            
            <tr>
                <td align="center" colspan="12" bgcolor="#98272D" 
                    style="border: 1px solid white;">
                    <asp:Label ID="Labempp" runat="server" Font-Bold="True" Font-Size="Large" Text="MEGACODE PRACTICAL TEST"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="border: 1px solid white;" bgcolor="#98272D" align="left" colspan="3">
                    <b ><font color="White" face="Arial">Ventricular Fibrillation<br />
Brief Summary: <br />
Mdm Lee Ho Yin is noted to be unconscious when you are about to take her parameters.</font></b>
                        
                </td>
                <td align="center" colspan="7" bgcolor="#98272D" 
                    style="border: 1px solid white;">
                    <asp:Label ID="Labelsscore" runat="server" Font-Bold="True" Font-Size="Medium" Text="Score"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;" rowspan="2">
                    <asp:Label ID="Laberemar0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Remarks"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;" rowspan="2">
                    <asp:Label ID="Label40" runat="server" Font-Bold="True" Font-Names="Arial" 
                        Font-Size="Large" ForeColor="White" Text="Action by TSO or Lecturers"></asp:Label>
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            <tr>
            <td bgcolor="#98272D" align="left" style="border: 1px solid white;" class="">
                    <asp:Label ID="Labelsn" runat="server" Font-Bold="True" Font-Size="Medium" Text="SN"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td bgcolor="#98272D" align="left" style="border: 1px solid white;" class="">
                    <asp:Label ID="Labekll" runat="server" Font-Bold="True" Font-Size="Medium" Text="Passing Criteria"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                
                <td style="border: 1px solid white;" bgcolor="#98272D" align="left" style="border: 1px solid white;">
                    <asp:Label ID="Labeljj" runat="server" Font-Bold="True" Font-Size="Medium" Text="Tester's Response"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;">
                    <asp:Label ID="Label1ii" runat="server" Font-Bold="True" Font-Size="Medium" Text="Raw Score"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;" 
                    style="border: 1px solid white;" >
                    <asp:Label ID="Label1kk" runat="server" Font-Bold="True" Font-Size="Medium" Text="C"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;">
                    <asp:Label ID="Labejj" runat="server" Font-Bold="True" Font-Size="Medium" Text="D"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" colspan="2" bgcolor="#98272D" style="border: 1px solid white;"
                    style="border: 1px solid white;">
                    <asp:Label ID="Labelnnnn" runat="server" Font-Bold="True" Font-Size="Medium" Text="C*D"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;" style="border: 1px solid white;">
                    <asp:Label ID="Labelxx" runat="server" Font-Bold="True" Font-Size="Medium" Text="Max Score"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
                <td align="center" bgcolor="#98272D" style="border: 1px solid white;" style="border: 1px solid white;">
                    <asp:Label ID="Labelxxcc" runat="server" Font-Bold="True" Font-Size="Medium" Text="Actual Score"
                        Font-Names="Arial" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            <tr>
            <td align="left">
                    1</td>
                <td align="left">
                    Check for responsiveness: <br/> 1) call patient's name and <br/> 2) gently tap the
                    patient
                </td>
                
                <td align="left">
                    No Response
                </td>
                <td align="center" bgcolor="#ffcccc">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server"  class="style_radio"    onclick="GetRDBValue1();"   
                        RepeatColumns="6" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                         <asp:RequiredFieldValidator 
            ID="ReqiredFieldValidator1"
            runat="server"
            ControlToValidate="RadioButtonList1"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >  </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    2
                </td>
                <td align="center" colspan="2" >
                    1
                </td>
                <td align="center">
                    2
                </td>
                <td align="center">
                    4
                </td>
                
                <td align="center">
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:Label Text="" runat="server" ID="label1"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks1" runat="server" TextMode="MultiLine"    class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            
            <tr>
            <td align="left">
                    2</td>
                <td align="left">
                    1) Activate code blue 
                    <br />
                    Prepare patient by:<br />
                    2) pulling out bed and
                    <br />
                    3) removing headboard and pillow</td>
                
                <td align="left">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc">
                    <asp:RadioButtonList ID="RadioButtonList2"  runat="server"  class="style_radio"    onclick="GetRDBValue2();"   
                        RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                         <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                         <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="RadioButtonList2"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >  </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3
                </td>
                <td align="center" colspan="2">
                    1</td>
                <td align="center">
                    3
                </td>
                <td align="center">
                    9</td>
                <td align="center"><asp:HiddenField ID="HiddenField2" runat="server" />
                    <asp:Label Text="" runat="server" ID="label2"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks2" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            
             <%--  -------------------------------------------------------------------------------- --%>
            <tr>
              <td align="left">
                    3</td>
              
                <td align="left">
                    ABC:
                    <br />
                  
1) Maintain patent airway by performing head tilt chin lift    <br />                                                       
                    2) Look for chest rise and fall <br />
3) Check carotid pulse
                </td>
                
                <td align="left">
                    No breathing
                    <br />
                    No pulse</td>
                <td align="center" bgcolor="#ffcccc">
                    <asp:RadioButtonList ID="RadioButtonList3" runat="server"  class="style_radio"    onclick="GetRDBValue3();"   
                        RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                         <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                         <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3"
            runat="server"
            ControlToValidate="RadioButtonList3"
            ErrorMessage="Select One!"
            ForeColor="Red"
            >  </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3
                </td>
                <td align="center" colspan="2">
                    2
                </td>
                <td align="center">
                    6
                </td>
                <td align="center">
                    18</td>
                <td align="center"><asp:HiddenField ID="HiddenField3" runat="server" />
                    <asp:Label Text="" runat="server" ID="label3"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks3" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            
            <tr>
            <td align="left">
                    4</td>
                <td align="left">
                    Perform CPR immediately until defibrillator is available:<br />
1)Correct landmark for chest compression<br />
2)Compression:Ventilation ratio is 30:2<br />
4)Apply manual resuscitator correctly after oral airway insertion</td>
            
                
                <td align="left">
                   CPR should only be stopped just before defibrillation.
                    <br />
                    <br />
                    <br />
                   </td>
                <td align="center" bgcolor="#ffcccc">
                    <asp:RadioButtonList ID="RadioButtonList4" runat="server"  class="style_radio"    onclick="GetRDBValue4();"   
                        RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                         <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="RadioButtonList4" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3
                </td>
                <td align="center" colspan="2">
                    3</td>
                <td align="center">
                    9</td>
                <td align="center">
                    36</td>
                <td align="center"><asp:HiddenField ID="HiddenField4" runat="server" />
                    <asp:Label Text="" runat="server" ID="label4"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks4" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            
             
            <tr>
            <td align="left">
                    5</td>
                <td align="left">
                    Place spinal board</td>
                
                <td align="left">
                    E-trolley is available</td>
                <td align="center" bgcolor="#ffcccc">
                   <asp:RadioButtonList ID="RadioButtonList5" 
                        runat="server"  class="style_radio"    onclick="GetRDBValue5();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="RadioButtonList5" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3
                </td>
                <td align="center" colspan="2">
                    1</td>
                <td align="center">
                    3</td>
                <td align="center">
                    3</td>
                <td align="center"><asp:HiddenField ID="HiddenField5" runat="server" />
                    <asp:Label Text="" runat="server" ID="label5"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks5" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
      
           
         
            
             <tr>
            <td align="left">
                    6&nbsp;</td>
                <td align="left">
                    D:<br />
1) Attach ECG leads to patient correctly<br />
2) Select lead II<br />
3) Analyse rhythm  </td>
                
                <td align="left">
                    Select VF</td>
                <td align="center" bgcolor="#ffcccc">
                   <asp:RadioButtonList 
                        ID="RadioButtonList6" runat="server"  class="style_radio"    onclick="GetRDBValue6();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                   </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList6" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2">
                    2</td>
                <td align="center">
                    6</td>
                <td align="center">
                    18</td>
                <td align="center"><asp:HiddenField ID="HiddenField6" runat="server" />
                    <asp:Label Text="" runat="server" ID="label6"></asp:Label>
                </td>
                <td align="center">
                    
                    <asp:TextBox ID="remarks6" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            
            
             <tr>
            <td align="left" class="">
                    7</td>
                <td align="left" class="">
                    &nbsp;Interpret rhythm correctly
                    <br />
                    </td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  
                    <asp:RadioButtonList ID="RadioButtonList7" runat="server"  class="style_radio"    onclick="GetRDBValue7();"   
                        RepeatColumns="7" RepeatDirection="Horizontal" RepeatLayout="Table" 
                        Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                     </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="RadioButtonList7" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField7" runat="server" />
                    <asp:Label Text="" runat="server" ID="label7"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks7" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
            <%--  -------------------------------------------------------------------------------- --%>
            
            
             
             <tr>
            <td align="left" class="">
                    8</td>
                <td align="left" class="">
                    Continue CPR while someone prepares defibrillation</td>
                
                <td align="left" class="">
                    Select VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList8" runat="server" 
                         class="style_radio"    onclick="GetRDBValue8();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="RadioButtonList8" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                 </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField8" runat="server" />
                    <asp:Label Text="" runat="server" ID="label8"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks8" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
            
      
            <%--  ----------------------------------------------------------------------%>
              <tr>
            <td align="left" class="">
                    9</td>
                <td align="left" class="">
                    Immediate defibrillation: (1st shock)<br />
1) Apply defibrillation pads to patient correctly<br />
2) Apply defibrillator external paddles to patient<br />
3) Charge to 150J (first shock should be within 60 sec, student selects 2J)<br />
4) Shout "Stand clear" and look around including self<br />
5) Confirm rhythm is VF by looking at the monitor screen<br />
6) Then discharge with eyes looking at the monitor </td>
                
                <td align="left" class="">
                    Observe the safety precautions of defibrillation
                    <br />
                    <br />
                    <br />
                    Select VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                 <asp:RadioButtonList 
                        ID="RadioButtonList9" runat="server"  class="style_radio"    onclick="GetRDBValue9();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="RadioButtonList9" ErrorMessage="Select One!" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    36</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField9" runat="server" />
                    <asp:Label Text="" runat="server" ID="label9"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks9" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
            
      
            <%--  ----------------------------------------------------------------------%>
            
               <tr>
            <td align="left" >
                    10</td>
                <td align="left" >
                   Resume CPR immediately for 2 min</td>
                
                <td align="left" >
                    </td>
                <td align="center" bgcolor="#ffcccc" >
                    <asp:RadioButtonList ID="RadioButtonList10" runat="server" 
                         class="style_radio"    onclick="GetRDBValue10();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="RadioButtonList10" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" class="style7">
                    3</td>
                <td align="center" colspan="2" >
                    2</td>
                <td align="center" >
                    6</td>
                <td align="center" >
                    6</td>
                <td align="center" ><asp:HiddenField ID="HiddenField10" runat="server" />
                    <asp:Label Text="" runat="server" ID="label10"></asp:Label>
                </td>
                <td align="center" >
                    
                    <asp:TextBox ID="remarks10" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" >
                </td>
            </tr>
            
            
             <%--  ----------------------------------------------------------------------%>
            
               <tr>
            <td align="left" class="">
                    11</td>
                <td align="left" class="">
                   Secondary ABCD:<br />
1) Establish IV access correctly and safely / Assess for availability of IV access 
                    (this should be performed by the IV nurse while the other members are placing airway device)<br />
                    2) Prepare Normal Saline solution
                </td>
                
                <td align="left" class="">
                    Persistent VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList11" runat="server" 
                         class="style_radio"    onclick="GetRDBValue11();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="RadioButtonList11" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField11" runat="server" />
                    <asp:Label Text="" runat="server" ID="label11"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks11" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
            
            
             <%--  ----------------------------------------------------------------------%>
            
               <tr>
            <td align="left" class="">
                    12</td>
                <td align="left" class="">
                   1) Prepare IV Adrenaline 1 mg correctly (1ml with 9ml N/S to total volume of 10mls) and <br />
2) Normal saline for flushing</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList ID="RadioButtonList12" runat="server" 
                         class="style_radio"    onclick="GetRDBValue12();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="RadioButtonList12" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField12" runat="server" />
                    <asp:Label Text="" runat="server" ID="label12"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks12" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
            
      
         
           
             <%--  ----------------------------------------------------------------------%>
            
               <tr>
            <td align="left" class="">
                    13</td>
                <td align="left" class="">
                   1) Administer IV Adrenaline 1mg (1:10,000)<br />
2) Administer IV N/S infusion fast</td>
                
                <td align="left" class="">
                    Adrenaline to be administered every 3-5min</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList 
                        ID="RadioButtonList13" runat="server"  class="style_radio"    onclick="GetRDBValue13();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                        ControlToValidate="RadioButtonList13" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField13" runat="server" />
                    <asp:Label Text="" runat="server" ID="label13"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks13" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
               <tr>
            <td align="left" class="">
                    14</td>
                <td align="left" class="">
                   1) Prepare intubation <br />
2) Assist to intubate correctly <br />
3) Confirm tube placement <br />
4) Secure tube correctly<br />
 (Allow this step to do later if necessary)</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList ID="RadioButtonList14" runat="server" 
                         class="style_radio"    onclick="GetRDBValue14();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                        ControlToValidate="RadioButtonList14" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                   </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    36</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField14" runat="server" />
                    <asp:Label Text="" runat="server" ID="label14"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks14" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
                <tr>
            <td align="left" class="style7">
                    15</td>
                <td align="left" class="style7">
                    Continue CPR throughout. </td>
                
                <td align="left" class="style7">
                    Persistent VF</td>
                <td align="center" bgcolor="#ffcccc" class="style7">
                    <asp:RadioButtonList ID="RadioButtonList15" 
                        runat="server"  class="style_radio"    onclick="GetRDBValue15();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                        ControlToValidate="RadioButtonList15" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style7">
                    3</td>
                <td align="center" colspan="2" class="style7">
                    2</td>
                <td align="center" class="style7">
                    6</td>
                <td align="center" class="style7">
                    6</td>
                <td align="center" class="style7"><asp:HiddenField ID="HiddenField15" runat="server" />
                    <asp:Label Text="" runat="server" ID="label15"></asp:Label>
                </td>
                <td align="center" class="style7">
                    
                    <asp:TextBox ID="remarks15" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="style7">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
                <tr>
            <td align="left" class="">
                    16</td>
                <td align="left" class="">
                    Analyse rhythm</td>
                
                <td align="left" class="">
                    Select VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList16" runat="server" 
                         class="style_radio"    onclick="GetRDBValue16();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                     
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                        ControlToValidate="RadioButtonList16" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField16" runat="server" />
                    <asp:Label Text="" runat="server" ID="label16"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks16" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
                <tr>
            <td align="left" class="">
                    17</td>
                <td align="left" class="">
                    Immediate defibrillation: (2nd Shock)<br />
1) Apply defibrillator external paddles to patient<br />
2) Charge to 150J (first shock should be within 60 sec, student selects 2J)<br />
3) Shout "Stand clear" and look around including self<br />
4) Confirm rhythm is VF by looking at the monitor screen<br />
5) Then discharge with eyes looking at the monitor </td>
                
                <td align="left" class="">
                    Observe the safety precautions of defibrillation<br />
                    <br />
                    Select VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                 <asp:RadioButtonList ID="RadioButtonList17" runat="server" 
                         class="style_radio"    onclick="GetRDBValue17();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                        ControlToValidate="RadioButtonList17" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    30</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField17" runat="server" />
                    <asp:Label Text="" runat="server" ID="label17"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks17" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
                <tr>
            <td align="left" class="">
                    18</td>
                <td align="left" class="">
                   1) Resume CPR immediately for 2 min<br />
2) Administer IV Adrenaline 1mg (1:10,000)</td>
                
                <td align="left" class="">
                    Persistent VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                 <asp:RadioButtonList ID="RadioButtonList18" runat="server" 
                         class="style_radio"    onclick="GetRDBValue18();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                       </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                        ControlToValidate="RadioButtonList18" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField18" runat="server" />
                    <asp:Label Text="" runat="server" ID="label18"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks18" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
                <tr>
            <td align="left" class="">
                    19</td>
                <td align="left" class="">
                    Analyse rhythm
                    <br />
                    </td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList19" runat="server" 
                         class="style_radio"    onclick="GetRDBValue19();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                        ControlToValidate="RadioButtonList19" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                    </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField19" runat="server" />
                    <asp:Label Text="" runat="server" ID="label19"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks19" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
               <tr>
            <td align="left" class="">
                    20</td>
                <td align="left" class="">
                   Immediate defibrillation: (3rd Shock)<br />
1) Apply defibrillator external paddles to patient<br />
2) Charge to 150J (first shock should be within 60 sec, student selects 2J)<br />
3) Shout "Stand clear" and look around including self<br />
4) Confirm rhythm is VF by looking at the monitor screen<br />
5) Then discharge with eyes looking at the monitor  </td>
                
                <td align="left" class="">
                    Observe the safety precautions of defibrillation
                    <br />
                    <br />
                    Persistent VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList 
                        ID="RadioButtonList20" runat="server"  class="style_radio"    onclick="GetRDBValue20();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                        ControlToValidate="RadioButtonList20" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    30</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField20" runat="server" />
                    <asp:Label Text="" runat="server" ID="label20"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks20" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
              <tr>
            <td align="left" class="">
                    21</td>
                <td align="left" class="">
                    Resume CPR immediately for 2 mins </td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList ID="RadioButtonList21" 
                        runat="server"  class="style_radio"    onclick="GetRDBValue21();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                        ControlToValidate="RadioButtonList21" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField21" runat="server" />
                    <asp:Label Text="" runat="server" ID="label21"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks21" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
              <tr>
            <td align="left" >
                    22</td>
                <td align="left" >
                    Administer:<br />
IV Amiodarone 300 mg IV bolus or <br />
IV Lignocaine 50-100mg IV bolus</td>
                
                <td align="left" >
                  Neat dose OR diluted in 20mls D5W
</td>
                <td align="center" bgcolor="#ffcccc" >
                   <asp:RadioButtonList ID="RadioButtonList22" runat="server" 
                         class="style_radio"    onclick="GetRDBValue22();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                     
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                        ControlToValidate="RadioButtonList22" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" >
                    2</td>
                <td align="center" >
                    6</td>
                <td align="center" >
                    6</td>
                <td align="center" ><asp:HiddenField ID="HiddenField22" runat="server" />
                    <asp:Label Text="" runat="server" ID="label22"></asp:Label>
                </td>
                <td align="center" >
                    
                    <asp:TextBox ID="remarks22" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" >
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
              <tr>
            <td align="left" >
                    23</td>
                <td align="left" >
                    &nbsp;Analyse rhythm
                    <br />
                    </td>
                
                <td align="left" >
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" >
                    <asp:RadioButtonList ID="RadioButtonList23" runat="server" 
                         class="style_radio"    onclick="GetRDBValue23();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                        ControlToValidate="RadioButtonList23" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  </td>
                <td align="center" class="style7">
                    3</td>
                <td align="center" colspan="2" >
                    3</td>
                <td align="center" >
                    9</td>
                <td align="center" >
                    9</td>
                <td align="center" ><asp:HiddenField ID="HiddenField23" runat="server" />
                    <asp:Label Text="" runat="server" ID="label23"></asp:Label>
                </td>
                <td align="center" >
                    
                    <asp:TextBox ID="remarks23" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" >
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
              <tr>
            <td align="left" class="">
                    24</td>
                <td align="left" class="">
                    Immediate defibrillation: (4th Shock)<br />
1) Apply defibrillator external paddles to patient<br />
2) Charge to 150J (first shock should be within 60 sec, student selects 2J)<br />
3) Shout "Stand clear" and look around including self<br />
4) Confirm rhythm is VF by looking at the monitor screen<br />
5) Then discharge with eyes looking at the monitor </td>
                
                <td align="left" class="">
                    Observe the safety precautions of defibrillation
                    <br />
                    <br />
                   
Persistent VF</td>
                <td align="center" bgcolor="#ffcccc" class="">
               <asp:RadioButtonList 
                        ID="RadioButtonList24" runat="server"  class="style_radio"    onclick="GetRDBValue24();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                  </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                        ControlToValidate="RadioButtonList24" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    30</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField24" runat="server" />
                    <asp:Label Text="" runat="server" ID="label24"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks24" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
              <tr>
            <td align="left" class="">
                    25</td>
                <td align="left" class="">
                    Resume CPR immediately for 2 mins</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList25" runat="server" 
                         class="style_radio"    onclick="GetRDBValue25();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                        ControlToValidate="RadioButtonList25" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                  </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField25" runat="server" />
                    <asp:Label Text="" runat="server" ID="label25"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks25" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
              <tr>
            <td align="left" class="">
                    26</td>
                <td align="left" class="">
                    Analyse rhythm</td>
                
                <td align="left" class="">
                    Return of spontaneous circulation, select normal sinus rhythm.</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList26" 
                        runat="server"  class="style_radio"    onclick="GetRDBValue26();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                        ControlToValidate="RadioButtonList26" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    3</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class="">
                    9</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField26" runat="server" />
                    <asp:Label Text="" runat="server" ID="label26"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks26" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
             <tr>
            <td align="left" class="">
                    27</td>
                <td align="left" class="">
                    1) Stop CPR
                    <br />
                    2) Check carotid pulse.</td>
                
                <td align="left" class="">
                    Adjust BP and pulse rate or verbalise to students - Pulse present, BP (74/ 48mmHg).</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList27" runat="server" 
                         class="style_radio"    onclick="GetRDBValue27();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                        ControlToValidate="RadioButtonList27" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                 </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField27" runat="server" />
                    <asp:Label Text="" runat="server" ID="label27"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks27" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
            <tr>
            <td align="left" class="">
                    28</td>
                <td align="left" class="">
                    1) Assess vital signs<br />
2) Support airway: verbalise to connect ETT to mechanical ventilator or oxylog<br />
3) Verbalise to administer Dopamine and its rationale</td>
                
                <td align="left" class="">
                    No breathing
                    <br />
                    </td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList 
                        ID="RadioButtonList28" runat="server"  class="style_radio"    onclick="GetRDBValue28();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                     
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                        ControlToValidate="RadioButtonList28" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    18</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField28" runat="server" />
                    <asp:Label Text="" runat="server" ID="label28"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks28" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
            <tr>
            <td align="left" class="">
                    29</td>
                <td align="left" class="">
                   Arrange post resuscitation care: <br />
1) A- secure airway (verbalise)<br />
2) B- Blood investigation: CE, U/E/Cr, and ABG (verbalise)<br />
3) C- Circulation line to secure, CXR (verbalise)
</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList ID="RadioButtonList29" runat="server" 
                         class="style_radio"    onclick="GetRDBValue29();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                   
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                        ControlToValidate="RadioButtonList29" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    18</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField29" runat="server" />
                    <asp:Label Text="" runat="server" ID="label29"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks29" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
            <tr>
            <td align="left" class="">
                    30</td>
                <td align="left" class="">
                   1) D- Drug and documentation (document on Resuscitation Record)<br />
2) E-  Perform 12 leads ECG<br />
3) F- Follow up skin care<br />
4) G- Insert NGT to decompress stomach</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList30" runat="server" 
                         class="style_radio"    onclick="GetRDBValue30();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                     
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                        ControlToValidate="RadioButtonList30" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    24</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField30" runat="server" />
                    <asp:Label Text="" runat="server" ID="label30"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks30" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    31</td>
                <td align="left" class="">
                    Arrange for transfer to ICU:<br />
Verbalise the 5 equipments / items to bring along with patient to ICU:<br />
1) Portable O2 cyclinder<br />
2)Portable defibrillator<br />
3)Portable vital signs monitor<br />
4)Manual resuscitator<br />
5)E-drug kit</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList31" runat="server" 
                         class="style_radio"    onclick="GetRDBValue31();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                        ControlToValidate="RadioButtonList31" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    30</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField31" runat="server" />
                    <asp:Label Text="" runat="server" ID="label31"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks31" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    32</td>
                <td align="left" class="">
                   Documentation in Multidisciplinary Notes:<br />
1) Date and time of collapse<br />
2) Place where patient was found collapsed<br />
3) Duration of collapse before Code Blue was activated<br />
4) Number of defibrillations and joules delivered to patient<br />
5) Name, dosage and route of drugs given<br />
6) Outcome of resuscitation</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                 <asp:RadioButtonList 
                        ID="RadioButtonList32" runat="server"  class="style_radio"    onclick="GetRDBValue32();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                        ControlToValidate="RadioButtonList32" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    36</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField32" runat="server" />
                    <asp:Label Text="" runat="server" ID="label32"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks32" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    33</td>
                <td align="left" class="">
                    Documentation in Multidisciplinary Notes:<br />
7) Level of consciousness and vital signs before and after resuscitation<br />
8) Name of the doctor informed
</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                   <asp:RadioButtonList 
                        ID="RadioButtonList33" runat="server"  class="style_radio"    onclick="GetRDBValue33();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                        ControlToValidate="RadioButtonList33" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    12</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField33" runat="server" />
                    <asp:Label Text="" runat="server" ID="label33"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks33" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    34</td>
                <td align="left" class="">
                    Handover to the staff nurse in charge of ICU</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                    <asp:RadioButtonList ID="RadioButtonList34" 
                        runat="server"  class="style_radio"    onclick="GetRDBValue34();"   RepeatColumns="7" 
                        RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                        ControlToValidate="RadioButtonList34" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    1</td>
                <td align="center" class="">
                    3</td>
                <td align="center" class="">
                    3</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField34" runat="server" />
                    <asp:Label Text="" runat="server" ID="label34"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks34" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    35</td>
                <td align="left" class="">
                    Roles of team members are well defined.</td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList35" runat="server" 
                         class="style_radio"    onclick="GetRDBValue35();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                       
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                        ControlToValidate="RadioButtonList35" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    1</td>
                <td align="center" class="">
                    3</td>
                <td align="center" class="">
                    3</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField35" runat="server" />
                    <asp:Label Text="" runat="server" ID="label35"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks35" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
            
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" class="">
                    36</td>
                <td align="left" class="">
                   Demonstrate effective communication with team members </td>
                
                <td align="left" class="">
                    &nbsp;</td>
                <td align="center" bgcolor="#ffcccc" class="">
                  <asp:RadioButtonList ID="RadioButtonList36" runat="server" 
                         class="style_radio"    onclick="GetRDBValue36();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                        ControlToValidate="RadioButtonList36" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" >
                    3</td>
                <td align="center" colspan="2" class="">
                    2</td>
                <td align="center" class="">
                    6</td>
                <td align="center" class="">
                    18</td>
                <td align="center" class=""><asp:HiddenField ID="HiddenField36" runat="server" />
                    <asp:Label Text="" runat="server" ID="label36"></asp:Label>
                </td>
                <td align="center" class="">
                    
                    <asp:TextBox ID="remarks36" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" class="">
                </td>
            </tr>
   
            
            <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="left" >
                    37</td>
                <td align="left" >
                    Overall teamwork</td>
                
                <td align="left" >
                    </td>
                <td align="center" bgcolor="#ffcccc" >
                   <asp:RadioButtonList ID="RadioButtonList37" runat="server" 
                         class="style_radio"    onclick="GetRDBValue37();"   RepeatColumns="7" RepeatDirection="Horizontal" 
                        RepeatLayout="Table" Width="100%">
                        <asp:ListItem Text="0" Value="0"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                        ControlToValidate="RadioButtonList37" ErrorMessage="Select One!" 
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </td>
                <td align="center" class="style9">
                    3</td>
                <td align="center" colspan="2" >
                    2</td>
                <td align="center" >
                    6</td>
                <td align="center" >
                    6</td>
                <td align="center" ><asp:HiddenField ID="HiddenField37" runat="server" />
                    <asp:Label Text="" runat="server" ID="label37"></asp:Label>
                </td>
                <td align="center" >
                    
                    <asp:TextBox ID="remarks37" runat="server" TextMode="MultiLine"    
                        class="RemarksTextarea" Font-Names="Arial" Text=""></asp:TextBox>
                    
                </td>
                <td align="center" >
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
           
                <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="right"  colspan="9">
                    <asp:Label ID="Labelactual" runat="server" Font-Bold="True" Font-Size="Medium" Text="Actual Total Mark"
                        Font-Names="Arial" ></asp:Label>
                </td>
                <td align="center"  bgcolor="#9fdfbf" >
                    <asp:Label ID="lb_total" runat="server" Font-Bold="true" Font-Names="Arial" 
                        Font-Size="Medium" Text=""></asp:Label>
                </td>
                <td align="center" >
                    562</td>
                <td align="center" >
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
               <%--  ----------------------------------------------------------------------%>
            <tr>
            <td align="right"  colspan="9">
                    <asp:Label ID="lb175" runat="server" Font-Bold="True" Font-Size="Medium" Text="Actual Percentage"
                        Font-Names="Arial" ></asp:Label>
                </td>
                <td align="center"  bgcolor="#9fdfbf" >
                    <asp:Label ID="lb_actualscore" runat="server" Font-Size="Medium" Font-Names="Arial"
                        Font-Bold="true" Text=""></asp:Label>
                        <asp:Button ID="btn_show_currentscore" autopostback="false" runat="server" Text="Update" Font-Bold="true"  OnClientClick="return show_score()" 
       CausesValidation="false"
             />
                </td>
                <td align="center" >
                    10%</td>
                <td align="center" >
                </td>
            </tr>
   
            <%--  ----------------------------------------------------------------------%>
          
        
        </table>
        <font color="Red">Note:
        <br />
        1. Defribillator mode is Biphasic and the shock delivered is 150J for 4  shocks.
        <br />
        2. Follow SBAR when calling the doctor.</font> </div>
    <div align="center">
           <asp:ImageButton ID="btn_common_save" autopostback="false" runat="server" ImageUrl="~/images/BtnSave.png"  
        Style="margin-top: 20px" Width="145px" Height="48px" CausesValidation="false"  OnClientClick="return Confirm2()"   OnClick="onclick_Save" />
        <asp:ImageButton ID="btn_submit" OnClientClick="Confirm();"
            runat="server" ImageUrl="~/images/BtnSubmit.png" CausesValidation="true" Width="145px" Height="48px"
            Style="margin-top: 20px"  OnClick="btn_submit_click" /></div>
    </form>
</body>
</html>
