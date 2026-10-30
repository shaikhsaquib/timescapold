<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>   

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Create Gatepass Request</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/jquery.js"language="javascript"></script>
<script src="../jscripts/createInwardRequest.js"language="javascript"></script>
<script type="text/javascript" src="../jscripts/jquery.showLoading.js"></script>

<script type="text/javascript" src="../jscripts/jquery.autocomplete.js"></script>
<style type="text/css">
body {
	margin-left: 0px;  
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;  
	background-image: url('../images/header_BG.jpg');
	background-repeat: repeat-x;
}
</style>
<script type="text/javascript">
	var counter1 = 2;

	function addRow()
	{  
		counter1 = parseInt(counter1) + 1;
		document.frmCreateInwordRequest.movCounter.value = counter1;
		
		tabBody = document.getElementById("movDetails");
		row	  = document.createElement("TR");
		
		//cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		//cell.innerHTML = counter1;
		//row.appendChild(cell); 

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' maxlength='50'  name='purchaseOrderNo"+counter1+"' type='text' id='purchaseOrderNo"+counter1+"' size='18' />";
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' maxlength='50' name='dcInvoice"+counter1+"' type='text' id='dcInvoice"+counter1+"' size='18' />";
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' maxlength='50' name='materialDesc"+counter1+"' type='text' id='materialDesc"+counter1+"' size='22' />";
		row.appendChild(cell);

		cell    = document.createElement("TD");
		//cell.setAttribute("align","left");

		var selectBox = "";	

		selectBox = "<select class='normal' name='uomId"+counter1+"' id='uomId"+counter1+"'>";
		selectBox += "<option value='NOS'>NOS</option>";
		selectBox += "<option value='KGS'>KGS</option>";
		selectBox += "<option value='LTS'>LTS</option>";
		selectBox += "<option value='MTS'>MTS</option>";
		selectBox += "<option value='PACKET'>PACKET</option>";
		selectBox += "<option value='LOTS'>LOTS</option>";
		selectBox += "<option value='BAGS'>BAGS</option>";
		selectBox += "<option value='CARTONS'>CARTONS</option>";
		selectBox += "<option value='CM' >CM</option></select>";

		cell.innerHTML = selectBox;
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' name='quantity"+counter1+"' type='text' id='quantity"+counter1+"' size='4' />";
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' name='remarks"+counter1+"' maxlength='100' type='text' id='remarks"+counter1+"' size='36' />";
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' name='rejectQuan"+counter1+"' type='text' id='rejectQuan"+counter1+"' size='10' onblur='onClickCheckMul("+counter1+")' />";
		row.appendChild(cell);

		cell   = document.createElement("TD"); 
		//cell.setAttribute("align","left");
		cell.innerHTML = "<input class='normal' name='receivedQuan"+counter1+"' type='text' id='receivedQuan"+counter1+"' size='10' />";
		row.appendChild(cell);

		tabBody.appendChild(row);
	}

</script>
</head>

<body onload = "getDataOnClick(0,'R'); showAll(0);">
<form name="frmCreateInwordRequest" method="post">
<%@ include file="../includes/relatedLinks.jsp" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="100%" height="20px" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;INWARD GATEPASS</td>
    </tr>
    <tr>
      <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
	</tr>   
</table>

<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
          <tr>
           <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" onclick="showMyCols();" checked/>&nbsp;RETURNABLE INWARD GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" onclick="showMyCols();" />NON- RETURNABLE INWARD GATE PASS
             </td>
          </tr>

		   <tr class="normal">
            <td width="40%" align="right" valign="middle">VMS Reference ID</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input maxlength="50" size="30" name="vmsReferenceId" value = "0" class="normal"/>
             </td>
          </tr> 
		   <tr class="normal">
            <td width="40%" align="right" valign="middle">Outward Reference Number</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input maxlength="60" size="30" name="outReferenceNum" class="normal" value = "0"/><a href="#" onClick="getData()"><img src="../images/go_button.png" border="0" ><a/>
            </td>
          </tr>
	 
		  <tr> 
			<td colspan="100%"><div id="showRequests"></div>
		 </td>
	</tr>
		  
</table>
</form>
 </body>
</html>
