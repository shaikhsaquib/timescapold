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
	String currLink = "../approver/processCourierDetailsSubmit.jsp";
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
	String buttonValue = (String)request.getParameter("hiddButtonValue");
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String approverCourierRemark = (String)request.getParameter("approverRemark");
	Hashtable claimRequestHash = new Hashtable();

	Object objArr1[] = new Object[2];
	objArr1[0] = "'YYYYMONDD'";
	objArr1[1] = requestNo;

	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);
	String requestNumber = myClaimRequestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
	Hashtable claimDetails = xmlObj.readSubNode(myClaimRequestValues[4], "claimAttachmentDetails");
	String emailid = (String)userDetails.get("emailId-");
    String employeeCompanyName = (String)userDetails.get("company-");

	String reviewerDetails []  = {"reviewerDetails", "reviewer", "user", "date", "remark"};
	String reviewerDetailsValues[] ={"subNode", "details", emailId, Utility.returnCurrentDate(), Utility.replaceQuoteOracle(approverCourierRemark)};

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;
	
	Hashtable searchClaimFormDetailHash = new Hashtable();
	searchClaimFormDetailHash.put("queryId", "1000");
	searchClaimFormDetailHash.put("arguments", objArr);
	ArrayList claimFormDetail = insuranceClaimController.viewClaimDetails(searchClaimFormDetailHash);

	String[] claimFormDetailValues = (String[])claimFormDetail.get(0);

	Hashtable miscellaneousHash = new Hashtable();
	miscellaneousHash.put("modifiedBy", timescapeUserOId);
	miscellaneousHash.put("reviewerXML", claimFormDetailValues[15]);
	miscellaneousHash.put("claimNumber", claimNumber);
	miscellaneousHash.put("formStatus", "A");
	miscellaneousHash.put("form", "process");
	miscellaneousHash.put("flag", "process");

	Hashtable updateRequestHash = new Hashtable();
	updateRequestHash.put("modifiedBy", timescapeUserOId);

	if(buttonValue.equals("0"))
		updateRequestHash.put("status", "AC");
	else if (buttonValue.equals("1"))
		updateRequestHash.put("status", "P");

	updateRequestHash.put("requestNo", requestNo);

	ArrayList updateClaimFormDetail = new ArrayList();
	updateClaimFormDetail.add(reviewerDetails);
	updateClaimFormDetail.add(reviewerDetailsValues);
	updateClaimFormDetail.add(miscellaneousHash);
	updateClaimFormDetail.add(updateRequestHash);


	boolean status = insuranceClaimController.updateClaimFormDetail(updateClaimFormDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		if(buttonValue.equals("0"))
		{
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailid;
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "The Approver has rejected the courier of your insurance request number "+requestNumber+". The details are as follows:\n\nClaim Number : "+myClaimRequestValues[1]+"\n\nApprover Remark :  "+approverCourierRemark+"\n\nRegards,\n\nTimescape Admin";
			String subject = "Insurance Courier Rejected("+employeeCompanyName+")";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);
		}
	else if(buttonValue.equals("1"))
		{
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailid;
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "The Approver has approved the courier of your insurance request number "+requestNumber+". The details are as follows:\n\nApprover Remark :  "+approverCourierRemark+"\n\nRegards,\n\nTimescape Admin";
			String subject = "Insurance Courier Approved("+employeeCompanyName+")";
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
				<td colspan= "100%" align = "center" class = "style5" >Your request has been processed successfully !!!
				</td> 
			</tr>
<%
	}else{
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		//return;
%>		
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while processing the request !!!
				</td> 
			</tr>
<%
	}
%>
</table>
</body>
</html>