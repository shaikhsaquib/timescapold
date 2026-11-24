<%--
 -- @(#)rejectInsuranceClaimSubmit.jsp - 1-APR-2010
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
<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility, java.util.GregorianCalendar, java.util.Calendar, java.util.*, java.text.*, javax.mail.*, javax.mail.internet.*, javax.activation.*, java.sql.*, com.bccl.util.SendMessage, java.io.*, java.util.Date " %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<%
	String currLink = "../approver/cancelClaimRequestSubmit.jsp";
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
	String cancelRemark  = (String) request.getParameter("cancelRemark");
	System.out.println(cancelRemark);
	//String claimNumber = (String) request.getParameter("claimNumber");


	Object objArr[] = new Object[2];
	objArr[0] = "'YYYYMONDD'";
	objArr[1] = requestNo;
	
	Hashtable searchClaimHash = new Hashtable();
	searchClaimHash.put("queryId", "1001");
	searchClaimHash.put("arguments", objArr);
	ArrayList requestDetails = insuranceClaimController.viewClaimRequest(searchClaimHash);

	String[] requestValues = (String[])requestDetails.get(0);
	String requestNumber = requestValues[9].toLowerCase() + requestNo;	

	Hashtable updateClaimHash = new Hashtable();
	updateClaimHash.put("reviewerXML", requestValues[5]);
	updateClaimHash.put("modifiedBy", timescapeUserOId);
	updateClaimHash.put("requestNo", requestNo);
	//updateClaimHash.put("claimNumber", claimNumber);
	updateClaimHash.put("status", "W");

/*	Hashtable formsHeaders = new Hashtable();	
	formsHeaders.put("claimNumber", claimNumber);
	formsHeaders.put("reviewerXML", "<reviewerDetails />");
	formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
	formsHeaders.put("courierXML", "<courierDetails />");
	formsHeaders.put("createdBy", timescapeUserOId);
	formsHeaders.put("modifiedBy", timescapeUserOId);
	formsHeaders.put("formStatus", "L");
	formsHeaders.put("flag", "rejectClaim");*/

	String reviewerDetails []  = {"reviewerDetails", "reviewer", "user", "date", "remark"};
	String reviewerDetailsValues[] ={"subNode", "details", emailId, Utility.returnCurrentDate(), Utility.replaceQuoteOracle(cancelRemark)};

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateClaimHash);
	updateClaimDetail.add(reviewerDetails);
	updateClaimDetail.add(reviewerDetailsValues);

	boolean status = insuranceClaimController.updateClaimRequest(updateClaimDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		SendMessage postMan = new SendMessage( );

		String fromAddr = "timescape.admin@timesgroup.com";
		//String toAddr = "amit.choudhary1@timesgroup.com";
		String toAddr = "insurance.bcclmumbai@timesgroup.com";
		String content = "";
		if(!requestValues[1].equals("0"))
			content = "The user has withdrawn the claim of insurance request number "+requestNumber+" and claim number "+requestValues[1]+". The details are as follows:\n\nUser Remark :  "+cancelRemark+"\n\nRegards,\n\nTimescape Admin";
		else
			content = "The user has withdrawn the claim of insurance request number "+requestNumber+". The details are as follows:\n\nUser Remark :  "+cancelRemark+"\n\nRegards,\n\nTimescape Admin";
		String subject = "Insurance Request Withdrawn";
		Hashtable mailer = new Hashtable();

		mailer.put("fromAddr", fromAddr);
		mailer.put("toAddr", toAddr);
		mailer.put("subject", subject);
		mailer.put("content", content);
		boolean mailSendStatus = false;
		mailSendStatus = postMan.sendPinMail(mailer);

		Hashtable mailer1 = new Hashtable();

		String toAddr1 = "anurag.reja@timesgroup.com";

		mailer1.put("fromAddr", fromAddr);
		mailer1.put("toAddr", toAddr1);
		mailer1.put("subject", subject);
		mailer1.put("content", content);
		boolean mailSendStatus1 = false;
		mailSendStatus1 = postMan.sendPinMail(mailer1);

		Hashtable mailer2 = new Hashtable();

		//String toAddr2 = "yogesh.sharma@timesgroup.com"; // commented on 31-MAY-2023 on request of Ms. Nafisa.
		String toAddr2 = "nafisa.danyal@timesgroup.com";

		mailer2.put("fromAddr", fromAddr);
		mailer2.put("toAddr", toAddr2);
		mailer2.put("subject", subject);
		mailer2.put("content", content);
		boolean mailSendStatus2 = false;
		mailSendStatus2 = postMan.sendPinMail(mailer2);

%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >You have withdrawn the claim successfully !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
<%
	}else{
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		//return;
	}
%>
</table>
</body>
</html>