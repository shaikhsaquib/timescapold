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

<%
	String currLink = "../requestor/insuranceClaimApply.jsp";
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
					<div align="left"><img src="../images/header.jpg" width="825" height="62"/></div>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/insuranceClaimMenu.jsp"%>
				<td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%

	String entity = (String)request.getParameter("hiddCompanyCode");
	String claimItemName = (String)request.getParameter("hiddClaimItemName");
	String claimItemDesc = (String)request.getParameter("hiddClaimItemDesc");
	String damageDate = (String)request.getParameter("hiddDamageDate");
	String damageCause = (String)request.getParameter("hiddDamageCause");
	String damageAmount = (String)request.getParameter("hiddDamageAmount");
	String contactName = (String)request.getParameter("hiddContactName");
	String contactAddress = (String)request.getParameter("hiddContactAddress");
	String contactPhoneNo = (String)request.getParameter("hiddContactPhoneNo");
	String contactFaxNo = (String)request.getParameter("hiddContactFaxNo");
	String contactMobileNo = (String)request.getParameter("hiddContactMobileNo");
	String contactEmailId = (String)request.getParameter("hiddContactEmailId");
	String submissionDate = (String)request.getParameter("hiddSubmissionDate");
	String placeOfLoss = (String)request.getParameter("hiddPlaceOfLoss");
	//out.println(placeOfLoss);

	//Creating a Sub Node "userDetails"
	String userDetails []  = {"userDetails", "name", "company", "designation", "emailId", "branch", "location", "department"};
	String userDetailsValues[] ={"subNode", displayName, companyName, designation, emailId, branchName, locationName, deptName};	

	//Creating a Sub Node "userClaimDetails"
	String userClaimDetails []  = {"userClaimDetails", "entity", "claimItemName", "claimItemDesc", "damageDate", "damageCause", "damageAmount", "contactName", "contactAddress", "contactPhoneNo", "contactFaxNo" , "contactMobileNo" , "contactEmailId", "submissionDate"};
	String userClaimDetailsValues[] ={"subNode", entity, Utility.replaceQuoteOracle(claimItemName),Utility.replaceQuoteOracle(claimItemDesc), damageDate, Utility.replaceQuoteOracle(damageCause), damageAmount, Utility.replaceQuoteOracle(contactName),Utility.replaceQuoteOracle(contactAddress) ,contactPhoneNo, contactFaxNo, contactMobileNo, contactEmailId, submissionDate };	

	Hashtable updationHash = new Hashtable();
	updationHash.put("approverclaimXML", "<approverclaimdetails />");
	updationHash.put("attachmentXML", "<attachmentDetails />");
	updationHash.put("reviewerXML", "<reviewerDetails />");
	updationHash.put("miscellaneousXML", "<miscellaneousDetails />");
	updationHash.put("placeOfLoss", placeOfLoss);
	updationHash.put("createdBy", timescapeUserOId);
	updationHash.put("modifiedBy", timescapeUserOId);
	updationHash.put("status", "L");
	
	ArrayList insuranceClaimRequest = new ArrayList();
	insuranceClaimRequest.add(userDetails);
	insuranceClaimRequest.add(userDetailsValues);
	insuranceClaimRequest.add(userClaimDetails);
	insuranceClaimRequest.add(userClaimDetailsValues);
	insuranceClaimRequest.add(updationHash);

	//boolean alertStatus = false;
	//boolean status = true;
	boolean status = insuranceClaimController.createClaimRequest(insuranceClaimRequest);
	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
			
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			//String toAddr = "amit.choudhary1@timesgroup.com";
			String toAddr = "insurance.bcclmumbai@timesgroup.com";
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "A new request for insurance has been created by "+contactName+". The details are:\n\nClaim Item : "+claimItemName+"\n\nPlace of loss : "+placeOfLoss+"\n\nDate of damage : "+damageDate+"\n\nDamage Amount : "+damageAmount+"\n\nContact Person Name : "+contactName+"\n\nContact Mobile Number : "+contactMobileNo+"\n\nRegards,\n\nTimescape Admin";
			String subject = "Insurance Request Created ("+companyName+")";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
            boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			//String toAddr1 = "anurag.reja@timesgroup.com";
			//String toAddr1 = "mahim.dubey@timesgroup.com";
			String toAddr1 = "abhishek.gandhi@timesgroup.com";
			Hashtable mailer1 = new Hashtable();

			mailer1.put("fromAddr", fromAddr);
			mailer1.put("toAddr", toAddr1);
			mailer1.put("subject", subject);
			mailer1.put("content", content);
            boolean mailSendStatus1 = false;
			mailSendStatus1 = postMan.sendPinMail(mailer1);

			//String toAddr2 = "yogesh.sharma@timesgroup.com"; // commented on 31-MAY-2023 on request of Ms. Nafisa.
			String toAddr2 = "nafisa.danyal@timesgroup.com";
			Hashtable mailer2 = new Hashtable();

			mailer2.put("fromAddr", fromAddr);
			mailer2.put("toAddr", toAddr2);
			mailer2.put("subject", subject);
			mailer2.put("content", content);
            boolean mailSendStatus2 = false;
		    mailSendStatus2 = postMan.sendPinMail(mailer2);

			//mailSendStatus = postMan.sendMail(fromAddr,toAddr,subject,content);
			//out.println("Mail Send Status="+mailSendStatus);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your request for Insurance Claim has been filed successfully !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="http://timescapews.timesgroup.com/timescape/sapep/insuranceclaim/requestor/viewInsuranceClaim.jsp">here</a> to view your Claim request(s)
				</td> 
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="http://timescapews.timesgroup.com/timescape/sapep/insuranceclaim/requestor/insuranceClaimApply.jsp">here</a> to send a new claim
				</td> 
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