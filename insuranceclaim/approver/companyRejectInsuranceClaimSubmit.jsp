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
<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility, java.util.GregorianCalendar, java.util.Calendar, java.util.*, java.text.*, javax.mail.*, javax.mail.internet.*, javax.activation.*, java.sql.*, com.bccl.util.SendMessage, java.io.*, java.util.Date " %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<%
	String currLink = "../approver/compantRejectInsuranceClaimSubmit.jsp";
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
	String rejectRemark  = (String) request.getParameter("rejectRemark");
	String claimNumber = (String) request.getParameter("hiddClaimNo");
	String value = (String) request.getParameter("value");
	//out.println(rejectRemark);


	Object objArr[] = new Object[2];
	objArr[0] = "'YYYYMONDD'";
	objArr[1] = requestNo;
	
	Object objArr1[] = new Object[2];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = claimNumber;

	Hashtable searchClaimHash = new Hashtable();
	searchClaimHash.put("queryId", "1001");
	searchClaimHash.put("arguments", objArr);
	ArrayList requestDetails = insuranceClaimController.viewClaimRequest(searchClaimHash);

	Hashtable searchClaimFormDetailHash = new Hashtable();
	searchClaimFormDetailHash.put("queryId", "1000");
	searchClaimFormDetailHash.put("arguments", objArr1);
	ArrayList claimFormDetail = insuranceClaimController.viewClaimDetails(searchClaimFormDetailHash);

	String[] claimValues = (String[])claimFormDetail.get(0);
	String[] requestValues = (String[])requestDetails.get(0);
	String requestNumber = requestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(requestValues[2], "userDetails");
	String emailid = (String)userDetails.get("emailId-");
    String employeeCompanyName = (String)userDetails.get("company-");
    String companyName1 = (String)userDetails.get("company-");

	Hashtable updateClaimHash = new Hashtable();
	updateClaimHash.put("reviewerXML", requestValues[5]);
	updateClaimHash.put("modifiedBy", timescapeUserOId);
	updateClaimHash.put("requestNo", requestNo);
	if(value.equals("0"))
		updateClaimHash.put("status", "IR");
	else if(value.equals("1"))
		updateClaimHash.put("status", "W");

	Hashtable formsHeaders = new Hashtable();	
	formsHeaders.put("claimNumber", claimNumber);
	formsHeaders.put("reviewerXML", claimValues[15] );
	formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
	formsHeaders.put("courierXML", claimValues[17]);
	formsHeaders.put("modifiedBy", timescapeUserOId);
	formsHeaders.put("formStatus", "C");
	formsHeaders.put("flag", "rejectClaim");
	formsHeaders.put("form", "None");

	String reviewerDetails []  = {"reviewerDetails", "reviewer", "user", "date", "remark"};
	String reviewerDetailsValues[] ={"subNode", "details", emailId, Utility.returnCurrentDate(), Utility.replaceQuoteOracle(rejectRemark)};

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateClaimHash);
	updateClaimDetail.add(reviewerDetails);
	updateClaimDetail.add(reviewerDetailsValues);
	updateClaimDetail.add(formsHeaders);

	boolean status = insuranceClaimController.updateClaimRequestStatus(updateClaimDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		if(value.equals("0"))
		{
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailid;
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "The Insurance Company has rejected the claim of your insurance request number "+requestNumber+". The details are as follows:\n\nApprover Remark :  "+rejectRemark+"\n\nPlease contact BCCL Insurance Cell for further clarification.\n\nRegards,\n\nTimescape Admin";
			String subject = "Insurance Claim Rejected by Insurance Company("+employeeCompanyName+")";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);
		}
	else if(value.equals("1"))
		{
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailid;
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "The Approver has withdrawn the claim of your insurance request number "+requestNumber+" and claim number "+requestValues[1]+" on your behalf. The details are as follows:\n\nApprover Remark :  "+rejectRemark+"\n\nPlease contact BCCL Insurance Cell for further clarification.\n\nRegards,\n\nTimescape Admin";
			String subject = "Insurance Claim Rejected by Insurance Company("+employeeCompanyName+")";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);
		}
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your have rejected the Insurance Claim successfully !!!
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