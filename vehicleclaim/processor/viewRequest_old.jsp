<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="medicalClaimController" class="com.bccl.claim.web.controllerbeans.MedicalClaimController" />  

 <html>
	<head>
		<title></title>
		<link rel="stylesheet" href="../style/global.css">
		<script Language="JavaScript" src="../jscripts/util.js">
		</script>
		<script Language="JavaScript" src="../jscripts/common.js">
		</script>
		<script Language="JavaScript" src="../jscripts/viewRequest.js">
		</script>
	 </head>

<%	//Legacy Data
	String companyCode	= (String)request.getParameter("companyCode");
	String payId		= (String)request.getParameter("payId");
	String effectiveMonth	= (String)request.getParameter("effectiveMonth");
	String claimAmount	= (String)request.getParameter("claimAmount");
	String txnId = (String)request.getParameter("txnId");

	ArrayList viewMedicalClaimDetails = medicalClaimController.viewTxnId(txnId);
	int noOfBills = viewMedicalClaimDetails.size();
%>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="addBills(<%=noOfBills%>)">
 <%@ include file="../includes/medicalClaimHeader.html" %>
 <%@ include file="../includes/medicalClaimMenu.jsp" %> 
<table width="100%" border="0" cellspacing="0" cellpadding="2" align="center">
<form name="frmViewRequest" method="post">

	<input type="hidden" name="noOfBills" value="<%=noOfBills%>">
	<input type="hidden" name="txnId" value="<%=txnId%>">

	<input type="hidden" name="companyCode" value="<%=companyCode%>">
	<input type="hidden" name="payId" value="<%=payId%>">
	<input type="hidden" name="effectiveMonth" value="<%=effectiveMonth%>">
	<input type="hidden" name="claimAmount" value="<%=claimAmount%>">


		<tr><td bgcolor="#000000" colspan="100%" class="whitesmall" height="20">Medical Reimbursement details of Transaction ID:<%=txnId%></td></tr>

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="3%"  height="20">SR NO.</td>
			<td class="boldsmall" width="10%" height="20">&nbsp;BILL DATE</td>
			<td class="boldsmall" width="10%" height="20">BILL NO.</td>
			<td class="boldsmall" width="25%" height="20">BILL DESCRIPTION</td>
			<td class="boldsmall" width="10%" height="20">BILL AMOUNT</td>
			<td class="boldsmall" width="25%" height="20">REMARK</td>
			<td class="boldsmall" width="17%" height="20">PROCESS BILL(s)</td>
		</tr>

<%
	String claimedAmt = "";
	for(int kk=1; kk<=viewMedicalClaimDetails.size(); kk++)
	{	
		String remarkName = "remark" + kk;
		String[] appl = (String[])viewMedicalClaimDetails.get(kk-1);	
		claimedAmt = appl[6];
%>

		<tr>
			<input type="hidden" name="billNo<%=(kk)%>" value="<%=appl[0]%>">
			<td class="normal" width="3%" ><%=(kk)%></td>
			<td class="normal" width="10%" noWrap><%=appl[1]%></td>
			<td class="normal" width="7%" ><%=appl[0]%></td>
			<td class="normal" width="25%" ><%=appl[2]%></td>
			<td class="normal" width="10%">Rs.
				<input type="text" name="billAmount<%=(kk)%>" value="<%=appl[3]%>" class="normal" size="4" onblur="addBills(<%=noOfBills%>)" >
			</td>
			<td class="normal" width="25%">
				<textarea name="<%=remarkName%>" class="formFields"  maxlength="255" style="height:35px;width:120px;"/></textarea>
			</td>
			<td class="normal" valign="top" width="20%">
				<input type="checkbox" name="billCheck<%=kk%>" value="<%=appl[0]%>" checked onclick="addBills(<%=noOfBills%>)" />
			</td>
		</tr>
<%
	}
%>
		<tr >
			<td class="bold"  >&nbsp;</td>
			<td class="bold"  >&nbsp;</td>
			<td class="bold"  >&nbsp;</td>
			<td class="bold" align="right" >(Claimed Amount):&nbsp;</td>
			<td class="bold"  style="border-top:1px solid #330000"; >Rs.<%=claimedAmt%>&nbsp;</td>
			<td class="bold" align="right" >(Processed Amount):&nbsp;</td>
			<td class="bold" valign="middle" >
				Rs.<input type="text" id="actualAmount" name="actualAmount" value="0"  class="normal"size="5" maxlength="10" readOnly/>
			</td>
		</tr>

		<tr>
			<td height="25"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

		<tr>
			<td colspan="100%"align="center" >
				
				<a href="javascript:process(<%=noOfBills%>)"><img src="../images/but_process.gif"border="0"><a/>&nbsp;&nbsp;
				<a href="javascript:history.back()"><img src="../images/but_back.gif"border="0"><a/>
			</td>
		</tr>
</table>
</body>
</html>