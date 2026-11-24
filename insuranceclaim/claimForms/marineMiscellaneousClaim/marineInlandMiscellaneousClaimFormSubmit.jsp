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
	String currLink = "../../marineMiscellaneousClaim/marineInlandMiscellaneousClaimFormSubmit.jsp";
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
	String form = "marine";
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String invoiceNo = (String)request.getParameter("hiddInvoiceNo");
	String invoiceDate = (String)request.getParameter("hiddInvoiceDate");
	String lrNo = (String)request.getParameter("hiddLrNo");
	String lrDate = (String)request.getParameter("hiddLrDate");
	String item = (String)request.getParameter("hiddItem");
	String repairCos = (String)request.getParameter("hiddRepairCos");
	String charges = (String)request.getParameter("hiddCharges");
	String cost = (String)request.getParameter("hiddCost");
	String claimAmt = (String)request.getParameter("hiddClaimAmt");
	String lessExcess = (String)request.getParameter("hiddLessExcess");
	String netClaimAmt = (String)request.getParameter("hiddNetClaimAmt");
	String fillDate = (String)request.getParameter("hiddFillDate");
	String fileName[] = new String[directorySize1];

	
	//String grossWt = (String)request.getParameter("hiddGrossWt");
	//String damaged = (String)request.getParameter("hiddDamaged");
	//String rate = (String)request.getParameter("hiddRate");
	//String material = (String)request.getParameter("hiddMaterial");
	//String damageValue = (String)request.getParameter("hiddDamageValue");
	//String salvageRate = (String)request.getParameter("hiddSalvageRate");
	//String salvageMaterial = (String)request.getParameter("hiddSalvageMaterial");
	//String claimAmt = (String)request.getParameter("hiddClaimAmt");
	//String rewind = (String)request.getParameter("hiddRewind");
	//String cfr = (String)request.getParameter("hiddCfr");
	//String total = (String)request.getParameter("hiddTotal");
	//String netAmt = (String)request.getParameter("hiddNetAmt");
	//String fillDate = (String)request.getParameter("hiddFillDate");
	//String fileName[] = new String[directorySize1];

	int j;
	
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
	}

	String claimForm []  = {"marineClaimForm", "invoiceNo", "invoiceDate", "lrNo", "lrDate", "item", "repairCos", "charges", "cost", "claimAmt", "lessExcess", "netClaimAmt","fillDate"};

	String claimFormValues[] ={"subNode", invoiceNo, invoiceDate, lrNo, lrDate, item, repairCos, charges, cost, claimAmt, lessExcess, netClaimAmt, fillDate};	

	String file = "attachmentDetails";
	String fileForm[] = new String[directorySize1+1];
	fileForm[0] = file ;

	String fileNames = "subNode";

	String fileFormValues[] = new String[directorySize1+1];
	fileFormValues[0] = fileNames ;

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