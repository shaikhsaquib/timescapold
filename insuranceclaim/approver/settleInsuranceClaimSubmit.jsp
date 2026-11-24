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
	String currLink = "../approver/settleInsuranceClaimSubmit.jsp";
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
	String chequeName  = (String) request.getParameter("chequeName");
	String chequeNumber  = (String) request.getParameter("chequeNumber");
	String chequeAmount  = (String) request.getParameter("chequeAmount");
	String chequeDate  = (String) request.getParameter("chequeDate");
	String settleRemark  = (String) request.getParameter("settleRemark");
	String bankName  = (String) request.getParameter("bankName");

	String chequeDetails []  = {"chequeDetails", "cheque", "chequeName", "chequeNumber", "chequeAmount", "chequeDate", "settleRemark","bankName"};
	String chequeDetailsValues[] ={"subNode", "details", chequeName, chequeNumber, chequeAmount, chequeDate, settleRemark, bankName};

	Object objArr[] = new Object[2];
	objArr[0] = "'YYYYMONDD'";
	objArr[1] = requestNo;
	
	Hashtable searchClaimHash = new Hashtable();
	searchClaimHash.put("queryId", "1001");
	searchClaimHash.put("arguments", objArr);
	ArrayList requestDetails = insuranceClaimController.viewClaimRequest(searchClaimHash);

	String[] requestValues = (String[])requestDetails.get(0);
	String requestNumber = requestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(requestValues[2], "userDetails");
	Hashtable userClaimDetails = xmlObj.readSubNode(requestValues[3], "userClaimDetails");
	String emailid = (String)userDetails.get("emailId-");
    String employeeCompanyName = (String)userDetails.get("company-");
	String name = (String)userDetails.get("name-");
	String item = (String)userClaimDetails.get("claimItemName-");

	Hashtable updateClaimHash = new Hashtable();
	updateClaimHash.put("modifiedBy", timescapeUserOId);
	updateClaimHash.put("miscellaneousXML", "<miscellaneousDetails />");
	updateClaimHash.put("requestNo", requestNo);
	updateClaimHash.put("status", "S");

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateClaimHash);
	updateClaimDetail.add(chequeDetails);
	updateClaimDetail.add(chequeDetailsValues);

	boolean status = insuranceClaimController.updateClaimRequestStatus(updateClaimDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		SendMessage postMan = new SendMessage( );

		String fromAddr = "timescape.admin@timesgroup.com";
		String toAddr = emailid;
	    //String toAddr = "shreedhar.godbole@timesgroup.com";
		String content = "Dear "+name+"\n\nWe are pleased to inform you that your insurance request number "+requestNumber+" and claim number "+requestValues[1]+" for "+item+"has been settled by the Insurance Company. The details are: \n\nCheque Name : "+chequeName+"\n\nCheque Number : "+chequeNumber+"\n\nCheque Amount : " +chequeAmount+"\n\nCheque Date : "+chequeDate+"\n\nApprover Remark : "+settleRemark+"\n\nRegards, \n\nTimescape Admin";
		String subject = "Insurance Request Settled by Insurance Company("+employeeCompanyName+")";
		Hashtable mailer = new Hashtable();

		mailer.put("fromAddr", fromAddr);
		mailer.put("toAddr", toAddr);
		mailer.put("subject", subject);
		mailer.put("content", content);
		boolean mailSendStatus = false;
		mailSendStatus = postMan.sendPinMail(mailer);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your have settled the Insurance Claim successfully !!!
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