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
	String currLink = "../../GPAClaim/GPAClaimFormSubmit.jsp";
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
	String form = "gpa";
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String periodOfInsurance = (String)request.getParameter("hiddPeriodOfInsurance");
	String accidentDate = (String)request.getParameter("hiddAccidentDate");
	String insuredName = (String)request.getParameter("hiddInsuredName");
	String insuredTelephone = (String)request.getParameter("hiddInsuredTelephone");
	String address = (String)request.getParameter("hiddAddress");
	String injuredName = (String)request.getParameter("hiddInjuredName");
	String address1 = (String)request.getParameter("hiddAddress1");
	String age = (String)request.getParameter("hiddAge");
	String injuryDate = (String)request.getParameter("hiddInjuryDate");
	String placeOfInjury = (String)request.getParameter("hiddPlaceOfInjury");
	String accidentdetails = (String)request.getParameter("hiddAccidentdetails");
	String r1 = (String)request.getParameter("hiddr1");
	String address2 = (String)request.getParameter("hiddAddress2");
	String r2 = (String)request.getParameter("hiddr2");
	String address3 = (String)request.getParameter("hiddAddress3");
	String r3 = (String)request.getParameter("hiddr3");
	String insuranceCompanyname = (String)request.getParameter("hiddInsuranceCompanyname");
	String address4 = (String)request.getParameter("hiddAddress4");
	String period = (String)request.getParameter("hiddPeriod");
	String r4 = (String)request.getParameter("hiddr4");
	String absenseDetails = (String)request.getParameter("hiddAbsenseDetails");
	String nameAndAddress = (String)request.getParameter("hiddNameAndAddress");
	String dateOfAdmission = (String)request.getParameter("hiddDateOfAdmission");
	String dateOfDischarge = (String)request.getParameter("hiddDateOfDischarge");
	String natureOfInjury = (String)request.getParameter("hiddNatureOfInjury");
	String treatmentdetails = (String)request.getParameter("hiddTreatmentdetails");
	String r5 = (String)request.getParameter("hiddr5");
	String Details = (String)request.getParameter("hiddDetails");
	String nomineeName = (String)request.getParameter("hiddNomineeName");
	String address5 = (String)request.getParameter("hiddAddress5");
	String nomineeAge = (String)request.getParameter("hiddNomineeAge");
	String relation = (String)request.getParameter("hiddRelation");
	String fillDate = (String)request.getParameter("hiddFillDate");
    String fileName[] = new String[directorySize1];

	int j;
	
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
	}

	String claimForm []  = {"gpaClaimForm", "periodOfInsurance", "accidentDate", "insuredName",          "insuredTelephone","address", "injuredName", "address1", "age", "injuryDate",
		                    "placeOfInjury","accidentdetails","r1","address2","r2","address3",
                            "r3","insuranceCompanyname","address4","period","r4","absenseDetails","nameAndAddress",
		                    "dateOfAdmission","dateOfDischarge","natureOfInjury","treatmentdetails","r5","Details",
			                "nomineeName","address5","nomineeAge","relation","fillDate"};

	String claimFormValues[] ={"subNode", periodOfInsurance, accidentDate, insuredName, insuredTelephone,                                      address, injuredName, address1, age, injuryDate,
		                       placeOfInjury,accidentdetails,r1,address2,r2,address3,
                               r3,insuranceCompanyname,address4,period,r4,absenseDetails,nameAndAddress,
		                       dateOfAdmission,dateOfDischarge,natureOfInjury,treatmentdetails,r5,Details,
			                   nomineeName,address5,nomineeAge,relation,fillDate};	

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
	//formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
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
			<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the Marine Insurance Claim Form !!!
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