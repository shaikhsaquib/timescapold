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
	String surveyorLocation = "" ;
	String surveyorName = "" ;
	String surveyorAddr = "";
	String surveyorPhone = "" ;
	String surveyorMobile = "" ;
	String surveyorFax = "" ;
	String surveyorEmailId = "" ;
	Hashtable claimRequestHash = new Hashtable();

	String requestNo  = (String) request.getParameter("hiddRequestNo1");

	Object objArr[] = new Object[3];
	objArr[0] = "'YYYYMONDD'";
	objArr[1] = requestNo;

	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);
	String requestNumber = myClaimRequestValues[9].toLowerCase() + requestNo;
	Hashtable userDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
    Hashtable userClaimDetails = xmlObj.readSubNode(myClaimRequestValues[3], "userClaimDetails");
	Hashtable claimDetails = xmlObj.readSubNode(myClaimRequestValues[4], "claimAttachmentDetails");
	String emailid = (String)userDetails.get("emailId-");
    String contactMobileNo = (String)userClaimDetails.get("contactMobileNo-");
	String contactEmailId = (String)userClaimDetails.get("contactEmailId-");
	String userLocation = (String)userDetails.get("location-");
    String employeeCompanyName = (String)userDetails.get("company-");
	String form = (String)claimDetails.get("claimFormValue-");

	Hashtable approverClaimDetails1 = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
	//System.out.println(approverClaimDetails1);

	String entity = (String)approverClaimDetails1.get("entity-");
	String policyName = (String)approverClaimDetails1.get("policyName-");
	String policyNumber = (String)approverClaimDetails1.get("policyNumber-");
	String policyInsuCompany = (String)approverClaimDetails1.get("policyInsuCompany-");
	//System.out.println(entity+"	"+policyName+"	"+policyNumber+"	"+policyInsuCompany);
	String surveyorApp = (String)request.getParameter("surveyorApp");

	if(surveyorApp.equals("0"))
	{
		 surveyorLocation = (String)request.getParameter("surveyorLocation");
		 surveyorName = (String)request.getParameter("surveyorName");
		 surveyorAddr = (String)request.getParameter("surveyorAddress");
		 surveyorPhone = (String)request.getParameter("surveyorPhone");
		 surveyorMobile = (String)request.getParameter("surveyorMobile");
		 surveyorFax = (String)request.getParameter("surveyorFax");
		 surveyorEmailId = (String)request.getParameter("surveyorEmailid");
		 System.out.println(surveyorLocation+"	"+surveyorName+"	"+surveyorAddr+"	"+surveyorPhone+"		"+surveyorMobile+"	"+surveyorFax+"	"+surveyorEmailId);
	}else{

		 surveyorLocation = "NA";
		 surveyorName = "NA";
		 surveyorAddr = "NA";
		 surveyorPhone = "00000000";
		 surveyorMobile = "00000000";
		 surveyorFax = "00000000";
		 surveyorEmailId = "NA";

	}
	//Creating a Sub Node "approverClaimDetails"
	String approverClaimDetails []  = {"approverClaimDetails", "entity", "policyName", "policyNumber", "policyInsuCompany", "surveyorLocation", "surveyorName" , "surveyorAddr", "surveyorPhone", "surveyorMobile", "surveyorFax", "surveyorEmailId","approverOId"};

	String approverClaimDetailsValues[] ={"subNode", entity, policyName, policyNumber, policyInsuCompany, Utility.replaceQuoteOracle(surveyorLocation), Utility.replaceQuoteOracle(surveyorName), Utility.replaceQuoteOracle(surveyorAddr), surveyorPhone, surveyorMobile, surveyorFax, Utility.replaceQuoteOracle(surveyorEmailId), timescapeUserOId};	

	Hashtable updateApproverClaimHash = new Hashtable();
	updateApproverClaimHash.put("modifiedBy", timescapeUserOId);
	//updateApproverClaimHash.put("reviewerXML", requestValues[5]);
	updateApproverClaimHash.put("requestNo", requestNo);
	//updateApproverClaimHash.put("claimNumber", claimNumber);
	updateApproverClaimHash.put("status", "A");

	ArrayList updateClaimDetail = new ArrayList();
	updateClaimDetail.add(updateApproverClaimHash);
	updateClaimDetail.add(approverClaimDetails);
	updateClaimDetail.add(approverClaimDetailsValues);

	boolean status = insuranceClaimController.updateClaimRequest(updateClaimDetail);

	if(status){
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		SendMessage postMan = new SendMessage( );

		String fromAddr = "timescape.admin@timesgroup.com";
		String toAddr = emailid;
		//String toAddr = "shreedhar.godbole@timesgroup.com";
		String content = "Your insurance request number "+requestNumber+" and claim number "+myClaimRequestValues[1]+"has been accepted by the Approver. The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nClaim Form : "+form+"\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
		String subject = "Insurance Claim Form("+employeeCompanyName+")";
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
			mailer.put("content", content);
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
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			mailer.clear();
			mailSendStatus = false;
			toAddr	=	"seema.chaudhary@almondz.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

			/*mailer.clear();
			mailSendStatus = false;
			toAddr	=	"anita.bhasin@timesgroup.com";
			//toAddr	=	"vijay.suri@almondz.com"; changed on 9/10/13 as per the requirement.

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);*/


			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"jyoti.thakur@almondz.com";
			toAddr	=	"jyoti.thakur@willistowerswatson.com";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);


			mailer.clear();
			mailSendStatus = false;
			toAddr	=	"hari.dulgas@orientalinsurance.co.in";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);


			/*mailer.clear();
			mailSendStatus = false;
			toAddr	=	"brijesh_kumar@orientalinsurance.co.in";

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);*/


			mailer.clear();
			mailSendStatus = false;
			//toAddr	=	"amit.choudhary1@timesgroup.com";
			//toAddr	=	"yogesh.sharma@timesgroup.com";  // commented on 31-MAY-2023 on request of Ms. Nafisa.
			toAddr	=	"nafisa.danyal@timesgroup.com";  
			//toAddr	=	"shreedhar.godbole@timesgroup.com";
			
			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", subject);
			mailer.put("content", content);
			//boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);

		if(policyInsuCompany.equals("OIC") && entity.equals("1000"))
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

				content = "Claim number "+myClaimRequestValues[1]+"has been accepted by the Approver. The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
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
				fromAddr = "timescape.admin@timesgroup.com";
				toAddr = "tchand@orientalinsurance.co.in";
				String toAddr1 = "lackadaisicalsidd@gmail.com";
				content = "Claim number "+myClaimRequestValues[1]+"has been accepted by the Approver. The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
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
			}
			else if(policyInsuCompany.equals("ICICI LOMBARD") && entity.equals("1005"))
			{
				fromAddr = "timescape.admin@timesgroup.com";
				toAddr = "ajay.s@icicilombard.com";
				String toAddr1 = "raman.bhalla@icicilombard.com";
				String toAddr2 = "ajay.samaddar@icicilombard.com";
				String toAddr3 = "mohit.suri@icicilombard.com";
				content = "Claim number "+myClaimRequestValues[1]+"has been accepted by the Approver . The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
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
			else if((policyInsuCompany.equals("ICICI LOMBARD") || policyInsuCompany.equals("ICICI") )&& entity.equals("1001"))

			{
				fromAddr = "timescape.admin@timesgroup.com";
				//toAddr = "rajni.taneja@icicilombard.com";	
				toAddr = "anand.vyas@bharti-axagi.co.in";	
                //String toAddr1 = "ajay.s@icicilombard.com";
                String toAddr1 = "claims@bharti-axagi.co.in";
				content = "Claim number "+myClaimRequestValues[1]+"has been accepted by the Approver. The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
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

		String fromAddr1 = "timescape.admin@timesgroup.com";
		String toAddr3 = surveyorEmailId;
		String content1 = "Claim number "+myClaimRequestValues[1]+"has been accepted by the Approver. The surveyor for the same has been appointed as advised by "+policyInsuCompany+". The details are as follows:\n\nUser Details:\n\nUser EmailId : "+contactEmailId+"\n\nUser Contact Number : "+contactMobileNo+"\n\nUser Location : "+userLocation+"\n\nPolicy Name : "+policyName+"\n\nPolicy Number : "+policyNumber+"\n\nPolicy Insurance Company : "+policyInsuCompany+"\n\nSurveyor Details:\n\nSurveyor Name : "+surveyorName+"\n\nSurveyor Email Id : "+surveyorEmailId+"\n\nSurveyor Address : "+surveyorAddr+"\n\nSurveyor Location : "+surveyorLocation+"\n\nRegards,\n\nTimescape Admin";
		String subject1 = "Insurance Claim Form";
		Hashtable mailer2 = new Hashtable();

		mailer2.put("fromAddr", fromAddr1);
		mailer2.put("toAddr", toAddr3);
		mailer2.put("subject", subject1);
		mailer2.put("content", content1);
		boolean mailSendStatus2 = false;
		mailSendStatus2 = postMan.sendPinMail(mailer2);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >You have successfully accepted the Insurance Claim and sent the Surveyor Details!!!
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
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while accepting the Insurance Claim request !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
<%
	}
%>
</table>
</body>
</html>