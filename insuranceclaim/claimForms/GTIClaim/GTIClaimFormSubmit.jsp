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
	String currLink = "../../GTIClaim/GTIClaimFormSubmit.jsp";
%>

<%--
	Make all your global declarations over here 
--%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../../style/global.css">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
<%
	String formsHeaderValue = (String)request.getParameter("formsHeaderValue");
%>
		<%@ include file="../../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<%@ include file="../../includes/formsHeader.jsp"%>
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
	String flag = (String)request.getParameter("hiddFlag");
	String form = "gti";
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String grPolicy = (String)request.getParameter("hiddGrPolicy");
	String memberId = (String)request.getParameter("hiddMemberId");
	String policyHolder = (String)request.getParameter("hiddPolicyHolder");
	String deceasedMember = (String)request.getParameter("hiddDeceasedMember");
	dateOfBirth = (String)request.getParameter("hiddDateOfBirth");
	String dateOfJoining = (String)request.getParameter("hiddDateOfJoining");
	String joiningPolicy = (String)request.getParameter("hiddJoiningPolicy");
	String dateOfDeath = (String)request.getParameter("hiddDateOfDeath");
	String deathCause = (String)request.getParameter("hiddDeathCause");
	String lastDuties = (String)request.getParameter("hiddLastDuties");
	String c1 = (String)request.getParameter("hiddC1");
	String beneficiaryName = (String)request.getParameter("hiddBeneficiaryName");
	String relationship = (String)request.getParameter("hiddRelationship");
	String age = (String)request.getParameter("hiddAge");
	String beneficiaryAddress = (String)request.getParameter("hiddBeneficiaryAddress");
	String c2 = (String)request.getParameter("hiddC2");
	String accountHolder = (String)request.getParameter("hiddAccountHolder");
	String bankName = (String)request.getParameter("hiddBankName");
	String accountType = (String)request.getParameter("hiddAccountType");
	String accountNumber = (String)request.getParameter("hiddAccountNumber");
	String branchAddress = (String)request.getParameter("hiddBranchAddress");
	String micrCode = (String)request.getParameter("hiddMicrCode");
	String ifscCode = (String)request.getParameter("hiddIfscCode");

	
	String fillDate = (String)request.getParameter("hiddFillDate");
    String fileName[] = new String[directorySize1];

	int j;
	
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
	}
   
	int noOfRows = 5;
	String fromdate[] = new String[6];
	String todate[] = new String[6];
	String noofdays[] = new String[6];
	String leavetype[] = new String[6];
	String reasons[] = new String[6];
	String resumptiondate[] = new String[6];
    for(int ii = 0; ii < noOfRows; ii++){

	fromdate[ii] = (String)request.getParameter("hiddFromdate" +ii);
	todate[ii] = (String)request.getParameter("hiddTodate" +ii);
	noofdays[ii] = (String)request.getParameter("hiddNoofdays" +ii);
	leavetype[ii] = (String)request.getParameter("hiddLeavetype" +ii);
	reasons[ii] = (String)request.getParameter("hiddReasons" +ii);
	resumptiondate[ii] = (String)request.getParameter("hiddResumptiondate" +ii);
	}

	String claimForm []  = {"gtiClaimForm", "memberId", "policyHolder",                                                                     "deceasedMember", "dateOfBirth", "dateOfJoining", "joiningPolicy", 
		                    "dateOfDeath", "deathCause", "lastDuties", "c1", "beneficiaryName",
		                    "relationship", "age", "beneficiaryAddress", "c2", "fromdate0", 
		                     "todate0", "noofdays0", "leavetype0", "reasons0", 
		                    "resumptiondate0", "fromdate1", "todate1", "noofdays1", "leavetype1", "reasons1", 
		                    "resumptiondate1", "fromdate2", "todate2", "noofdays2", "leavetype2", "reasons2", 
		                    "resumptiondate2", "fromdate3", "todate3", "noofdays3", "leavetype3", "reasons3", 
		                    "resumptiondate3", "fromdate4", "todate4", "noofdays4", "leavetype4", "reasons4", 
		                    "resumptiondate4", "fillDate"};

	String claimFormValues[] ={"subNode", memberId, policyHolder,                                                                              deceasedMember, dateOfBirth, dateOfJoining, joiningPolicy, 
		                       dateOfDeath, deathCause, lastDuties, c1, beneficiaryName,
		                       relationship, age, beneficiaryAddress, c2, 
		                       fromdate[0], todate[0], noofdays[0], leavetype[0], reasons[0], 
		                       resumptiondate[0], fromdate[1], todate[1], noofdays[1], leavetype[1], reasons[1], 
		                       resumptiondate[1], fromdate[2], todate[2], noofdays[2], leavetype[2], reasons[2], 
		                       resumptiondate[2], fromdate[3], todate[3], noofdays[3], leavetype[3], reasons[3], 
		                       resumptiondate[3], fromdate[4], todate[4], noofdays[4], leavetype[4], reasons[4], 
		                       resumptiondate[4], fillDate};	

	
	
	

	String file = "attachmentDetails";
	String fileForm[] = new String[directorySize1+1];
	fileForm[0] = file ;

	String fileNames = "subNode";

	String fileFormValues[] = new String[directorySize1+1];
	fileFormValues[0] = fileNames ;
	System.out.println(directorySize1);
	

	for(int k=0;k < directorySize1; k++)
	{
		fileForm[k+1]= "attachment"+(k+1);
		fileFormValues[k+1]= fileName[k];
	}

	formsHeaders.put("claimNumber", claimNumber);
	if(flag.equals("updateClaim"))
	{
		Object objArr[] = new Object[2];
		objArr[0] = "'DD-MON-YYYY'";
		objArr[1] = claimNumber;

		Hashtable claimFormDetailHash = new Hashtable( );
		claimFormDetailHash.put("queryId", "1000");
		claimFormDetailHash.put("arguments", objArr);

		ArrayList myClaimFormDetails = new ArrayList();
		myClaimFormDetails = insuranceClaimController.viewClaimDetails(claimFormDetailHash);

		String claimFormDetail[] = (String[]) myClaimFormDetails.get(0);		

		formsHeaders.put("reviewerXML", claimFormDetail[15]);
	}

	else
		formsHeaders.put("reviewerXML", "<reviewerDetails />");
		formsHeaders.put("courierXML", "<courierDetails />");
		formsHeaders.put("createdBy", timescapeUserOId);
		formsHeaders.put("modifiedBy", timescapeUserOId);
		formsHeaders.put("formStatus", "L");
		formsHeaders.put("flag", flag);
		formsHeaders.put("form", form);

	Hashtable updateClaimRequest = new Hashtable();
	updateClaimRequest.put("modifiedBy", timescapeUserOId);
	updateClaimRequest.put("status", "UF");
	updateClaimRequest.put("requestNo", requestNo );

	//out.println(formsHeaders);
	//out.println(updateClaimRequest);
	
	
	 ArrayList insuranceclaimForm = new ArrayList();
	insuranceclaimForm.add(claimForm);
	insuranceclaimForm.add(claimFormValues);
	
	insuranceclaimForm.add(formsHeaders);
	insuranceclaimForm.add(updateClaimRequest);
	insuranceclaimForm.add(fileForm);
	insuranceclaimForm.add(fileFormValues);

	boolean status = insuranceClaimController.submitClaimFormValues(insuranceclaimForm);

	if(status)
	{
		response.sendRedirect("../../requestor/submissionDate.jsp?requestNo="+requestNo+"&claimNumber="+claimNumber);
}else{
	//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
	//return;

	
%>		
		<tr>
			<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the Group Term Life Insurance Claim Form !!!
			</td> 
		</tr>
		<tr>
			<td colspan= "100%" align = "center" >&nbsp;</td>
		</tr>
		<tr>
			<td colspan= "100%" align = "center" class = "style5" >Click <a href="../../requestor/viewInsuranceClaim.jsp">here</a> to try again
			</td> 
		</tr>
<%
}
%>

</table>
</body>
</html>
</table>
</body>
</html>