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
	String currLink = "../approver/acceptInsuranceClaim.jsp";
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
	/*String surveyorName = "" ;
	String surveyorPhoneNo = "" ;
	String surveyorMobileNo = "" ;
	String surveyorEmailId = "" ;*/

	String requestNo  = (String) request.getParameter("hiddRequestNo1");

	String entity = (String)request.getParameter("entity");
	String policyNameConcanateValues = (String)request.getParameter("policyName");
	StringTokenizer tokenizer = new StringTokenizer(policyNameConcanateValues, "|");
	String[] policyName = new String[tokenizer.countTokens()];
	int ij = 0;
	while(tokenizer.hasMoreTokens()){
		policyName[ij] = tokenizer.nextToken();
		ij++;
	}

	String policyNumber = (String)request.getParameter("policyNumber");
	/*tokenizer = new StringTokenizer(policyNumberConcanateValues, "|");
	String[] policyNumber = new String[tokenizer.countTokens()];
	ij = 0;
	while(tokenizer.hasMoreTokens()){
		policyNumber[ij] = tokenizer.nextToken();
		ij++;
	}*/

	String policyInsuCompany = (String)request.getParameter("policyInsuComapny");
	String claimFormValue = (String)request.getParameter("claimFormValue");
	String surveyorApp = (String)request.getParameter("surveyorApp");
	String remark = (String)request.getParameter("remark");
	String claimNumber = (String)request.getParameter("claimNumber");
	if(remark.equals("") || remark == null)
	{
		remark = "NA";
	}

	/*if(surveyorApp.equals("0"))
	{
		 surveyorName = (String)request.getParameter("surveyorName");
		 surveyorPhoneNo = (String)request.getParameter("phoneNo");
		 surveyorMobileNo = (String)request.getParameter("mobileNo");
		 surveyorEmailId = (String)request.getParameter("emailId");
	}else{
		 surveyorName = "NA"; 
		 surveyorPhoneNo = "00000000";
		 surveyorMobileNo = "0000000000";
		 surveyorEmailId = "NA";

	}*/
	//Creating a Sub Node "approverClaimDetails"
	String approverClaimDetails []  = {"approverClaimDetails", "entity", "policyName", "policyNumber", "policyInsuCompany", "approverOId"};
	String approverClaimDetailsValues[] ={"subNode", entity, policyName[1], policyNumber, policyInsuCompany,  timescapeUserOId};	

	String claimAttachmentDetails [] = {"claimAttachmentDetails", "claimFormValue"};
	String claimAttachmentDetailsValues[] = {"subNode", claimFormValue } ;

	String reviewerDetails []  = {"reviewerDetails", "reviewer", "user", "date", "remark"};
	String reviewerDetailsValues[] ={"subNode", "details", emailId, Utility.returnCurrentDate(), Utility.replaceQuoteOracle(remark)};

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
	String emailid = (String)userDetails.get("emailId-");
	String companyName1 = (String)userDetails.get("company-");
	
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


	Hashtable updateApproverClaimHash = new Hashtable();
	updateApproverClaimHash.put("modifiedBy", timescapeUserOId);
	updateApproverClaimHash.put("reviewerXML", requestValues[5]);
	updateApproverClaimHash.put("requestNo", requestNo);
	updateApproverClaimHash.put("claimNumber", claimNumber);
	updateApproverClaimHash.put("status", "HA");

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateApproverClaimHash);
	updateClaimDetail.add(approverClaimDetails);
	updateClaimDetail.add(approverClaimDetailsValues);
	updateClaimDetail.add(claimAttachmentDetails);
	updateClaimDetail.add(claimAttachmentDetailsValues);
	updateClaimDetail.add(reviewerDetails);
	updateClaimDetail.add(reviewerDetailsValues);

	boolean status = insuranceClaimController.updateClaimRequest(updateClaimDetail);

	ArrayList requestDetails1 = insuranceClaimController.viewClaimRequest(searchClaimHash);

	String[] requestValues1 = (String[])requestDetails1.get(0);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
			SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = emailid;
			//String toAddr = "shreedhar.godbole@timesgroup.com";
			String content = "Your insurance request number "+requestNumber+" and claim number "+claimNumber+" has been accepted by the Approver. You will receive the Claim Form and Surveyor details shortly.The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+companyName+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";

			String approverContent	= "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";

			String subject = "Insurance Request Accepted ("+companyName1+")";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"amit.choudhary1@timesgroup.com";
			toAddr	=	"insurance.bcclmumbai@timesgroup.com";
			//toAddr	=	"shreedhar.godbole@timesgroup.com";
			
			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"anurag.reja@timesgroup.com";
			//toAddr	=	"mahim.dubey@timesgroup.com";
			toAddr	=	"abhishek.gandhi@timesgroup.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			mailer.clear();
			mailSendStatus = false;
			toAddr	=	"seema.chaudhary@almondz.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			/*mailer.clear();
			mailSendStatus = false;
			toAddr	=	"anita.bhasin@timesgroup.com";
			//toAddr	=	"vijay.suri@almondz.com"; changed on 9/10/13 as per the requirement.

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);*/


			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"jyoti.thakur@almondz.com";
			toAddr	=	"jyoti.thakur@willistowerswatson.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);


			mailer.clear();
			mailSendStatus = false;
			toAddr	=	"hari.dulgas@orientalinsurance.co.in";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);


			/*mailer.clear();
			mailSendStatus = false;
			toAddr	=	"brijesh_kumar@orientalinsurance.co.in";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);*/


			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"yogesh.sharma@timesgroup.com"; // commented on 31-MAY-2023 on request of Ms. Nafisa.
			toAddr	=	"nafisa.danyal@timesgroup.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", approverContent);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			if((policyInsuCompany.equals("ICICI LOMBARD")||policyInsuCompany.equals("ICICI")) && entity.equals("1001"))
			{
				fromAddr = "timescape.admin@timesgroup.com";
				//toAddr   = "ajay.s@icicilombard.com";
				//toAddr   = "shreedhar.godbole@timesgroup.com";
				//String toAddr1 = "fasttrack.support@icicilombard.com";
				String toAddr1 = "anand.vyas@bharti-axagi.co.in";
				//String toAddr2 = "anand.singhal@icicilombard.com";
				String toAddr2 = "claims@bharti-axagi.co.in";
				content = "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";
                
                //"The claim number "+requestValues[1]+" has been accepted by the Approver. The details are as follows:\n\nClaim Form : "+claimFormValue+"\n\nPolicy Name : "+policyName[1]+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nRegards,\n\nTimescape Admin";

				subject = "Insurance Request Accepted";

				//Hashtable mailer1 = new Hashtable();
				Hashtable mailer2 = new Hashtable();
				Hashtable mailer3 = new Hashtable();

				/*mailer1.put("fromAddr", fromAddr);
				mailer1.put("toAddr", toAddr);
				mailer1.put("subject", subject);
				mailer1.put("content", content);
				boolean mailSendStatus1 = false;
				mailSendStatus1 = postMan.sendPinMail(mailer1);*/

				mailer2.put("fromAddr", fromAddr);
				mailer2.put("toAddr", toAddr1);
				mailer2.put("subject", subject);
				mailer2.put("content", content);
				boolean mailSendStatus2 = false;
				mailSendStatus2 = postMan.sendPinMail(mailer2);
				
				mailer3.put("fromAddr", fromAddr);
				mailer3.put("toAddr", toAddr2);
				mailer3.put("subject", subject);
				mailer3.put("content", content);
				boolean mailSendStatus3	=	false;
				mailSendStatus3	=	postMan.sendPinMail(mailer3);

			
			} else if(policyInsuCompany.equals("OIC") && entity.equals("1000"))
			{
				fromAddr = "timescape.admin@timesgroup.com";
				//toAddr = "rajendersingh@orientalinsurance.co.in";commented on 11-SEP-2018
				toAddr = "mandakini.balodhi@orientalinsurance.co.in";
				//String toAddr1 = "siddharth.roy@orientalinsurance.co.in"; commented on 11-SEP-2018
				String toAddr1 = "gopalkrishan@orientalinsurance.co.in";
				//String toAddr2 = "jlgupta@orientalinsurance.co.in";
				//String toAddr2 = "gaurishankar@orientalinsurance.co.in";
				//String toAddr2 = "kumarsatish@orientalinsurance.co.in";commented on 11-SEP-2018
				String toAddr2 = "manju.gupta@orientalinsurance.co.in";

				content = "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";
                
                //"The claim number "+requestValues[1]+" has been accepted by the Approver. The details are as follows:\n\nClaim Form : "+claimFormValue+"\n\nPolicy Name : "+policyName[1]+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nRegards,\n\nTimescape Admin";

				subject = "Insurance Request Accepted";

				Hashtable mailer1 = new Hashtable();
				Hashtable mailer2 = new Hashtable();
				Hashtable mailer3 = new Hashtable();

				mailer1.put("fromAddr", fromAddr);
				mailer1.put("toAddr", toAddr);
				mailer1.put("subject", subject);
				mailer1.put("content", content);
				boolean mailSendStatus1 = false;
				mailSendStatus1 = postMan.sendPinMail(mailer1);

				mailer2.put("fromAddr", fromAddr);
				mailer2.put("toAddr", toAddr1);
				mailer2.put("subject", subject);
				mailer2.put("content", content);
				boolean mailSendStatus2 = false;
				mailSendStatus2 = postMan.sendPinMail(mailer2);


                mailer3.put("fromAddr", fromAddr);
				mailer3.put("toAddr", toAddr2);
				mailer3.put("subject", subject);
				mailer3.put("content", content);
				boolean mailSendStatus3 = false;
				mailSendStatus3 = postMan.sendPinMail(mailer3);
			}
			else if(policyInsuCompany.equals("OIC") && entity.equals("1008"))
			{	
				
				Hashtable mailer3 = new Hashtable();
				Hashtable mailer4 = new Hashtable();

				fromAddr = "timescape.admin@timesgroup.com";
				toAddr = "tchand@orientalinsurance.co.in";
                //toAddr   = "shreedhar.godbole@timesgroup.com";
				String toAddr1 = "lackadaisicalsidd@gmail.com";
				String toAddr2 = "rajendersingh@orientalinsurance.co.in";
				String toAddr3 = "siddharth.roy@orientalinsurance.co.in";
				
				content = "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";
                
                //"The claim number "+requestValues[1]+" has been accepted by the Approver. The details are as follows:\n\nClaim Form : "+claimFormValue+"\n\nPolicy Name : "+policyName[1]+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nRegards,\n\nTimescape Admin";

				subject = "Insurance Request Accepted";
				
				Hashtable mailer1 = new Hashtable();
				Hashtable mailer2 = new Hashtable();

				mailer1.put("fromAddr", fromAddr);
				mailer1.put("toAddr", toAddr);
				mailer1.put("subject", subject);
				mailer1.put("content", content);
				boolean mailSendStatus1 = false;
				mailSendStatus1 = postMan.sendPinMail(mailer1);

				mailer2.put("fromAddr", fromAddr);
				mailer2.put("toAddr", toAddr1);
				mailer2.put("subject", subject);
				mailer2.put("content", content);
				boolean mailSendStatus2 = false;
				mailSendStatus2 = postMan.sendPinMail(mailer2);

				mailer3.put("fromAddr", fromAddr);
				mailer3.put("toAddr", toAddr2);
				mailer3.put("subject", subject);
				mailer3.put("content", content);
				boolean mailSendStatus23 = false;
				mailSendStatus23 = postMan.sendPinMail(mailer3);

				mailer4.put("fromAddr", fromAddr);
				mailer4.put("toAddr", toAddr3);
				mailer4.put("subject", subject);
				mailer4.put("content", content);
				boolean mailSendStatus24 = false;
				mailSendStatus24 = postMan.sendPinMail(mailer4);

			}
			else if(policyInsuCompany.equals("ICICI LOMBARD") && entity.equals("1005"))
			{
				fromAddr = "timescape.admin@timesgroup.com";
				toAddr = "ajay.s@icicilombard.com";
                //toAddr   = "shreedhar.godbole@timesgroup.com";
				String toAddr1 = "raman.bhalla@icicilombard.com";
				String toAddr2 = "ajay.samaddar@icicilombard.com";
				String toAddr3 = "mohit.suri@icicilombard.com";
				content = "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";
                
                //"The claim number "+requestValues[1]+" has been accepted by the Approver. The details are as follows:\n\nClaim Form : "+claimFormValue+"\n\nPolicy Name : "+policyName[1]+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nRegards,\n\nTimescape Admin";


				subject = "Insurance Request Accepted";

				Hashtable mailer1 = new Hashtable();
				Hashtable mailer2 = new Hashtable();
				Hashtable mailer3 = new Hashtable();
				Hashtable mailer4 = new Hashtable();

				mailer1.put("fromAddr", fromAddr);
				mailer1.put("toAddr", toAddr);
				mailer1.put("subject", subject);
				mailer1.put("content", content);
				boolean mailSendStatus1 = false;
				mailSendStatus1 = postMan.sendPinMail(mailer1);

				mailer2.put("fromAddr", fromAddr);
				mailer2.put("toAddr", toAddr1);
				mailer2.put("subject", subject);
				mailer2.put("content", content);
				boolean mailSendStatus2 = false;
				mailSendStatus2 = postMan.sendPinMail(mailer2);

				mailer3.put("fromAddr", fromAddr);
				mailer3.put("toAddr", toAddr2);
				mailer3.put("subject", subject);
				mailer3.put("content", content);
				boolean mailSendStatus3 = false;
				mailSendStatus3 = postMan.sendPinMail(mailer3);

				mailer4.put("fromAddr", fromAddr);
				mailer4.put("toAddr", toAddr3);
				mailer4.put("subject", subject);
				mailer4.put("content", content);
				boolean mailSendStatus4 = false;
				mailSendStatus4 = postMan.sendPinMail(mailer4);
			}
			//else if(policyInsuCompany.equals("ICICI LOMBARD") && entity.equals("1001"))
			else if ((policyInsuCompany.equals("ICICI LOMBARD") || policyInsuCompany.equals("ICICI") )&& entity.equals("1001"))

			{
				fromAddr = "timescape.admin@timesgroup.com";
				//toAddr = "rajni.taneja@icicilombard.com";
				toAddr = "anand.vyas@bharti-axagi.co.in";
				String toAddr1 = "claims@bharti-axagi.co.in";
                //toAddr   = "shreedhar.godbole@timesgroup.com";
				content = "The insurance request number "+requestNumber+" and claim number "+requestValues1[1]+" has been accepted by the Approver. The details are as follows:\n\nCLAIM DETAILS :\n\nEntity: "+entity+"\n\nItem Name: "+claimItemName+"\n\nDescription of Damaged Item: "+claimItemDesc+"\n\nDate of Loss: "+damageDate+"\n\nCause of Loss: "+damageCause+"\n\nProbable of Estimated Loss/ Damaged Amount: "+damageAmount+"\n\nPlace of Loss: "+requestValues[7]+"\n\nCONTACT PERSON DETAILS:\n\nName: "+contactName+"\n\nAddress: "+contactAddress+"\n\nPhone No: "+contactPhoneNo+"\n\nFax No: "+contactFaxNo+"\n\nMobile No: "+contactMobileNo+"\n\nEmail Id: "+contactEmailId+"\n\nAPPROVED CLAIM DETAILS:\n\nClaim Number: "+claimNumber+"\n\nPolicy Name: "+policyName[1]+"\n\nPolicy Number "+policyNumber+"\n\nInsurance Company: "+policyInsuCompany+"\n\nClaim Form: "+claimFormValue+"\n\nRegards,\n\nTimescape Admin";
                
                //"The claim number "+requestValues[1]+" has been accepted by the Approver. The details are as follows:\n\nClaim Form : "+claimFormValue+"\n\nPolicy Name : "+policyName[1]+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nRegards,\n\nTimescape Admin";


				subject = "Insurance Request Accepted";

				Hashtable mailer1 = new Hashtable();
				Hashtable mailer2 = new Hashtable();
				Hashtable mailer3 = new Hashtable();
				Hashtable mailer4 = new Hashtable();

				mailer1.put("fromAddr", fromAddr);
				mailer1.put("toAddr", toAddr);
				mailer1.put("subject", subject);
				mailer1.put("content", content);
				boolean mailSendStatus1 = false;
				mailSendStatus1 = postMan.sendPinMail(mailer1);	
				
				mailer2.put("fromAddr", fromAddr);
				mailer2.put("toAddr", toAddr1);
				mailer2.put("subject", subject);
				mailer2.put("content", content);
				boolean mailSendStatus2 = false;
				mailSendStatus2 = postMan.sendPinMail(mailer2);	
			}
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >You have successfully accepted the Insurance Claim !!!
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
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../approver/acceptInsuranceClaim.jsp">here</a> to try again
				</td> 
			</tr>
<%
	}
%>
</table>
</body>
</html>