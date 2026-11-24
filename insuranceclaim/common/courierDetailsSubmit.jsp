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
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String courierNumber = (String)request.getParameter("courierNumber");
	String courierName = (String)request.getParameter("courierName");
	String courierDate = (String)request.getParameter("courierDate");
	String courierRemark = (String)request.getParameter("courierRemark");	
	String value = "";	
	Hashtable claimRequestHash = new Hashtable();

	Object objArr1[] = new Object[3];
	objArr1[0] = "'YYYYMONDD'";
	objArr1[1] = requestNo;

	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);
	String requestNumber = myClaimRequestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
	String emailid = (String)userDetails.get("emailId-");
	String name = (String)userDetails.get("name-");

	String courierDetails []  = {"courierDetails",  "courier", "user", "date", "courierNumber", "courierName","courierRemark"};
	String courierDetailsValues[] ={"subNode", "details", emailId, courierDate, courierNumber, courierName, Utility.replaceQuoteOracle(courierRemark)};

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
	if(claimFormDetailValues[23].equals("18"))				
	{		
		miscellaneousHash.put("courierXML","<courierDetails />");
		//out.println("yes");
	}
	else
	{
		miscellaneousHash.put("courierXML",claimFormDetailValues[17]);
	}
		
	miscellaneousHash.put("claimNumber", claimNumber);
	miscellaneousHash.put("formStatus", "L");
	miscellaneousHash.put("form", "None");
	//out.println(miscellaneousHash);

	Hashtable updateRequestHash = new Hashtable();
	updateRequestHash.put("modifiedBy", timescapeUserOId);
	updateRequestHash.put("status", "UC");
	updateRequestHash.put("requestNo", requestNo);

	ArrayList updateCourierDetail = new ArrayList();
	updateCourierDetail.add(courierDetails);
	updateCourierDetail.add(courierDetailsValues);
	updateCourierDetail.add(miscellaneousHash);
	updateCourierDetail.add(updateRequestHash);


	boolean status = insuranceClaimController.updateCourierDetail(updateCourierDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		SendMessage postMan = new SendMessage( );

		String fromAddr = "timescape.admin@timesgroup.com";
		//String toAddr = "amit.choudhary1@timesgroup.com";
		String toAddr = "insurance.bcclmumbai@timesgroup.com";
		String content = "Insurance request number "+requestNumber+" and claim number "+myClaimRequestValues[1]+" has been updated by "+name+" . The details are as follows:\n\nCourier Number : "+courierNumber+"\n\nCourier Name : "+courierName+"\n\nCourier Date : "+courierDate+"\n\nRemark : "+courierRemark+"\n\nRegards,\n\nTimescape Admin";
		String subject = "Insurance Courier Sent : Claim Number - "+myClaimRequestValues[1];
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

		//String toAddr2 = "yogesh.sharma@timesgroup.com";// commented on 31-MAY-2023 on request of Ms. Nafisa.
		String toAddr2 = "nafisa.danyal@timesgroup.com";

		mailer2.put("fromAddr", fromAddr);
		mailer2.put("toAddr", toAddr2);
		mailer2.put("subject", subject);
		mailer2.put("content", content);
		boolean mailSendStatus2 = false;
		mailSendStatus2 = postMan.sendPinMail(mailer2);

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