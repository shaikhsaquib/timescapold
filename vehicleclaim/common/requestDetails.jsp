
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPageClose.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" />  

<html>
<head>
    <title>B2E</title>
	<link rel="stylesheet" href="../style/global.css">
<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
            document.getElementById('button').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
            document.getElementById('button').style.visibility = 'visible'; 
        } 
    } 
</script>
</head>

 <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%
	//String txnId = (String)request.getParameter("id");

	int id = Integer.parseInt((String)request.getParameter("id"));
	String txnIds = (String)session.getAttribute("VEH_IDS");

	String txnArr[] = txnIds.split(",");

	ArrayList viewMedicalClaimDetails = null;
	viewMedicalClaimDetails = vehicleClaimController.viewTxnId(txnArr[id]);

if(viewMedicalClaimDetails.size()>0){

	Hashtable icons = new Hashtable( );
	Hashtable requestStatus = new Hashtable( );

	icons.put("L",     "ico_inprocess.gif");
	icons.put("A",  "ico_approved.gif");
	icons.put("P",  "ico_approved.gif");
	icons.put("R", "ico_rejected.gif");
	icons.put("C",  "ico_cancelled.gif");
	icons.put("O", "spacer.gif");
	icons.put("TB",  "images.jpg");

	requestStatus.put("L", "In Process");
	requestStatus.put("A", "Accepted");
	requestStatus.put("P", "Processed");
	requestStatus.put("R", "Rejected");
	requestStatus.put("C", "Cancelled");
	requestStatus.put("O", "Saved");
	requestStatus.put("TB", "TimeBarred");



	String headerData[]  = (String[])viewMedicalClaimDetails.get(0);

	if(headerData[12].equals("L") || headerData[12].equals("O")){
		//display '-' when request status is in process or open
		headerData[10] = "-";
		headerData[11] = "-";
	}
%>

		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<tr>
		<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff">VEHICLE LEASE REIMBURSEMENT CLAIM FORM</td>
		</tr>
		<tr>
			<td colspan="100%"align="right" class="redbold">
				<input name="printbutton" type="submit" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/>
			</td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20" >Txn No :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=txnArr[id]%></td>
			<td width="16%" align="right" class="bold" height="20">&nbsp;</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px">&nbsp;</td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20" >Name of Company :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[13]%></td>
			<td width="16%" align="right" class="bold" height="20">Name of Requester :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[14]%></td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20">PAY ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[15]%></td>
			<td width="16%" align="right" class="bold" height="20">SAP ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[16]%></td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20">Designation :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=headerData[17]%></td>
			<td width="16%" align="right" class="bold" height="20">Department :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=headerData[18]%></td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20" >Applied Date :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[9]%></td>
			<td width="16%" align="right" class="bold" height="20">Claim Amount :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px">Rs.<%=headerData[6]%></td>
		</tr>

		<tr>
			
			<td width="16%" align="right" class="bold" height="20">Procesed On :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=headerData[11]%></td>
			<td width="16%" align="right" class="bold" height="20" >&nbsp;</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px">&nbsp;</td>
		</tr>

		<tr>
			<td height="25"colspan="100%"><block type="spacer" height="25"></td>
		</tr>
		</table>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
		<tr bgcolor="#CCCCCC">
			<td class="boldsmall" width="15%" height="20">&nbsp;BILL DATE</td>
			<td class="boldsmall" width="15%" height="20">BILL NO.</td>
			<td class="boldsmall" width="25%" height="20">BILL DESCRIPTION</td>
			<td class="boldsmall" width="15%" height="20">BILL AMOUNT</td>
			<td class="boldsmall" width="15%" height="20">REMARK</td>
			<td class="boldsmall" width="15%" height="20">STATUS</td>
		</tr>


<%
	
	String[] arr = null;
	for(int kk=0; kk<viewMedicalClaimDetails.size(); kk++){
		
			arr = (String[])viewMedicalClaimDetails.get(kk);		
		
%>
		<tr>
			<td class="normal"  width="15%" height="30"><%=arr[1]%></td>
			<td class="normal"  width="15%" height="30"><%=arr[0]%></td>
			<td class="normal"  width="25%" height="30"><%=arr[2]%></td>
			<td class="normal"  width="15%" height="30">Rs.<%=arr[3]%></td>
			<td class="normal"  width="15%" height="30"><%=arr[4]%></td>
			<td class="normal"  width="15%" height="30">
			<img src="../images/<%=icons.get(arr[5])%>">&nbsp;&nbsp;<%=requestStatus.get(arr[5])%></td>
		</tr>
<%
		}
%>
		<tr>
			<td colspan="6" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr >
			<td class="boldsmall" height="30" width="15%">&nbsp;</td>
			<td class="boldsmall" height="30" width="15%">&nbsp;</td>
			<td class="boldsmall" height="30" width="25%">&nbsp;</td>
			<td class="boldsmall" height="30" width="15%">Rs.<%=arr[6]%>&nbsp;(Total Amount)</td>
			<td class="boldsmall" height="30" width="15%">&nbsp;</td>
			<td class="boldsmall" height="30" width="15%">&nbsp;</td>
		</tr>

		<tr>
			<td colspan="6" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>

		<tr>
			<td height="20"></td>
		</tr>
        <tr>
			<td colspan="100%"align="left" height="15" class="normal"><b>NOTE : All claims including thru Timescape, submitted on or after 13th of the month will be reimbursed with next month’s salary.</b></td>
		</tr>
        <tr>
			<td height="20"></td>
		</tr>
		<tr>
			<td colspan="4" class="normal"> </td>
			<td colspan="2" class="normal"> Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</td>
		</tr>
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td colspan="4" class="normal"> </td>
			<td colspan="2" class="normal"> Signature :</td>
		</tr>

		<tr>
			<td colspan="6" align="center" height="40"><input name="button" type="submit" class="style4" id="button" value="Close" onclick="javascript:window.close();"/></td>
		</tr>
</table>
<%
}else{
%>
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
        <tr>
			<td height="20"></td>
		</tr>
        <tr>
			<td class="bold" colspan="100%" align="center" height="40">There are no bills filled, Please edit and add bills first!!</td>
		</tr>
        <tr>
			<td height="20"></td>
		</tr>
</table>
<%
}
%>
</body>
</html>