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
<jsp:useBean id ="xmlObj" class ="com.bccl.util.XMLUtility"/>


<%
	String currLink = "../requestor/submissionDateSubmit.jsp";
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
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%

	String submissionDate = (String)request.getParameter("submissionDate");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String claimNumber = (String)request.getParameter("hiddClaimNo");
	//out.println(requestNo);
	String[] date = new String[3];
	Hashtable claimRequestHash = new Hashtable();

//	DateFormat formater = new SimpleDateFormat("yyyy/mm/dd");
//	Date submissionDate1 = formater.parse(submissionDate);
//	String submissionDate2 = df.format(submissionDate);

	Object objArr[] = new Object[3];
	objArr[0] = "'YYYYMONDD'";
	objArr[1] = requestNo;

	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);
	String requestNumber = myClaimRequestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
	Hashtable claimDetails = xmlObj.readSubNode(myClaimRequestValues[4], "claimAttachmentDetails");
	String emailid = (String)userDetails.get("emailId-");
	String form = (String)claimDetails.get("claimFormValue-");

	StringTokenizer st = new StringTokenizer(submissionDate,"-");
	for(int i=0;st.hasMoreTokens();i++)
	{
		date[i]=st.nextToken(); //Here you will get A, sg, fall as separated tokens
	}

	if(date[1].equals("JAN"))
	{
		date[1] = "1";
	}
	else if(date[1].equals("FEB"))
	{
		date[1] = "2";
	}
	else if(date[1].equals("MAR"))
	{
		date[1] = "3";
	}
	else if(date[1].equals("APR"))
	{
		date[1] = "4";
	}
	else if(date[1].equals("MAY"))
	{
		date[1] = "5";
	}
	else if(date[1].equals("JUN"))
	{
		date[1] = "6";
	}
	else if(date[1].equals("JUL"))
	{
		date[1] = "7";
	}
	else if(date[1].equals("AUG"))
	{
		date[1] = "8";
	}
	else if(date[1].equals("SEP"))
	{
		date[1] = "9";
	}
	else if(date[1].equals("OCT"))
	{
		date[1] = "10";
	}
	else if(date[1].equals("NOV"))
	{
		date[1] = "11";
	}
	else if(date[1].equals("DEC"))
	{
		date[1] = "12";
	}

	Hashtable updationHash = new Hashtable();
	updationHash.put("submissionDate", date[2]+"/"+date[1]+"/"+date[0]);
	updationHash.put("requestNo", requestNo);

	boolean status = insuranceClaimController.updateSubmissionDate(updationHash);
	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		SendMessage postMan = new SendMessage( );

		String fromAddr = "timescape.admin@timesgroup.com";
		//String toAddr = "amit.choudhary1@timesgroup.com";
		String toAddr = "insurance.bcclmumbai@timesgroup.com";
		String content = "Insurance request number "+requestNumber+" and claim number "+myClaimRequestValues[1]+"has been updated. \n\nThe user has filled the Claim Form : "+form+"\n\nRegards,\n\nTimescape Admin";
		String subject = "Insurance Claim Form Filled : Claim Number - "+myClaimRequestValues[1];
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
		//mailSendStatus2 = postMan.sendPinMail(mailer2);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your submission date has been submitted successfully !!!
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
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while submitting the Submission Date !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../requestor/viewInsuranceClaim.jsp">here</a> to try again
				</td> 
			</tr>
<%
	}
%>
</table>
</body>
</html>