<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility, java.util.GregorianCalendar, java.util.Calendar, java.util.*, java.text.* " %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class ="com.bccl.util.XMLUtility"/>
<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
<%@ include file="../includes/header.jsp"%>
<%
	String requestNo  = (String) request.getParameter("requestNo");
	String claimNumber  = (String) request.getParameter("claimNo");
	String updatedDamageAmount = (String) request.getParameter("updatedDamageValue");

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;
	
	Hashtable searchClaimHash = new Hashtable();
	searchClaimHash.put("queryId", "1001");
	searchClaimHash.put("arguments", objArr);
	
	
	
	ArrayList requestDetails = insuranceClaimController.viewClaimRequest(searchClaimHash);

	String[] requestValues = (String[])requestDetails.get(0);
	
	Hashtable userClaimDetails = xmlObj.readSubNode(requestValues[3], "userClaimDetails");
	String claimItemName		= (String)userClaimDetails.get("claimItemName-");
	String claimItemDesc		= (String)userClaimDetails.get("claimItemDesc-");
	String damageDate			= (String)userClaimDetails.get("damageDate-");
	String damageCause			= (String)userClaimDetails.get("damageCause-");
	String damageAmount			= (String)userClaimDetails.get("damageAmount-");
	String contactName			= (String)userClaimDetails.get("contactName-");
	String contactAddress		= (String)userClaimDetails.get("contactAddress-");
	String contactPhoneNo		= (String)userClaimDetails.get("contactPhoneNo-");
	String contactFaxNo			= (String)userClaimDetails.get("contactFaxNo-");
	String contactMobileNo		= (String)userClaimDetails.get("contactMobileNo-");
	String contactEmailId		= (String)userClaimDetails.get("contactEmailId-");
	
	//Creating a Sub Node "userClaimDetails"
	String userClaimDetailsArray []  = {"userClaimDetails", "entity", "claimItemName", "claimItemDesc", "damageDate", "damageCause","damageAmount","updatedDamageAmount","contactName","contactAddress","contactPhoneNo","contactFaxNo","contactMobileNo","contactEmailId"};
	String userClaimDetailsValuesArray[] ={"subNode", "1001", claimItemName, claimItemDesc, damageDate,  damageCause, damageAmount, updatedDamageAmount, contactName, contactAddress, contactPhoneNo, contactFaxNo, contactMobileNo, contactEmailId};	

	//out.println(requestValues[3]);

	Hashtable updateClaimHash = new Hashtable();
	updateClaimHash.put("modifiedBy", timescapeUserOId);
	//updateClaimHash.put("userClaimXML", requestValues[3]);
	updateClaimHash.put("requestNo", requestNo);
	//updateClaimHash.put("status", "P");
	updateClaimHash.put("claimNumber", claimNumber);

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateClaimHash);
	updateClaimDetail.add(userClaimDetailsArray);
	updateClaimDetail.add(userClaimDetailsValuesArray);
	

	//boolean status = insuranceClaimController.updateClaimRequestStatus(updateClaimDetail);

	boolean status = insuranceClaimController.updateUserClaimDetailsRequest(updateClaimDetail);
	
	if(status){
		
%>
Updated.
<%
	
	response.sendRedirect("../common/checkRequestDetails.jsp?requestno="+requestNo);
	return;
	}else{
		
%>		
Not Updated.
<%
	}
%>
</table>
</body>
</html>