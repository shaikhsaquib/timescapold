 <%--
 -- @(#)nominationSubmit.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Insurance Claim
 -- @author  -  Megha Maheshwari & Afroz Sayed
 -- @version -  1.0
 -- This page is used to apply for Insurance Claim
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility, java.util.GregorianCalendar, java.util.Calendar, java.util.*, java.text.* " %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>

<%
	String currLink = "../approver/approveInsuranceClaim.jsp";
%>

<%--
	Make all your global declarations over here 
--%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" width="825" width="62"/></div>
				</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%
	String requestNo  = (String) request.getParameter("hiddRequestNo");
	String claimNumber  = (String) request.getParameter("hiddClaimNo");


	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;
	
	Hashtable searchClaimHash = new Hashtable();
	searchClaimHash.put("queryId", "1001");
	searchClaimHash.put("arguments", objArr);
	ArrayList requestDetails = insuranceClaimController.viewClaimRequest(searchClaimHash);

	String[] requestValues = (String[])requestDetails.get(0);

	Hashtable updateClaimHash = new Hashtable();
	updateClaimHash.put("modifiedBy", timescapeUserOId);
//	updateClaimHash.put("reviewerXML", requestValues[5]);
	updateClaimHash.put("requestNo", requestNo);
	updateClaimHash.put("status", "P");

	Hashtable updateClaimFormHash = new Hashtable();
	updateClaimFormHash.put("claimNumber", claimNumber);
	updateClaimFormHash.put("modifiedBy", timescapeUserOId);
	updateClaimFormHash.put("formStatus", "A");

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateClaimHash);
	updateClaimDetail.add(updateClaimFormHash);
//	updateClaimDetail.add(reviewerDetailsValues);

	boolean status = insuranceClaimController.updateClaimRequestStatus(updateClaimDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your request for Insurance Claim has been filed successfully !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
<%
	}else{
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		//return;
%>		
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the Insurance Claim request !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../requestor/insuranceClaimApply.jsp">here</a> to try again
				</td> 
			</tr>
<%
	}
%>
</table>
</body>
</html>