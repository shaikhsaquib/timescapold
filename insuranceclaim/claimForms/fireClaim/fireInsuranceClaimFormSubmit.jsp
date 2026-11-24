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
	String currLink = "../../fireClaim/fireInsuranceClaimFormSubmit.jsp";
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
	String form = "fire";
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String insuredName = (String)request.getParameter("hiddInsuredName");
	String area = (String)request.getParameter("hiddArea");
	String lossArea = (String)request.getParameter("hiddLossArea");
	String insuredTelephone = (String)request.getParameter("hiddInsuredTelephone");
	String insuredFax = (String)request.getParameter("hiddInsuredFax");
	String mortgageName = (String)request.getParameter("hiddMortgageName");
	String fireTime = (String)request.getParameter("hiddFireTime");
	String fireDate = (String)request.getParameter("hiddFireDate");
	String fireCause = (String)request.getParameter("hiddFireCause");
	String fireItem = (String)request.getParameter("hiddFireItem");
	String fireOccupation = (String)request.getParameter("hiddFireOccupation");
	String fireFir = (String)request.getParameter("hiddFireFir");
	String fireEstimatedLoss = (String)request.getParameter("hiddFireEstimatedLoss");
	String fireDetails = (String)request.getParameter("hiddFireDetails");
	String fileName[] = new String[directorySize1];

	String name[] = new String[4];
	String period[] = new String[4];
	String policy[] = new String[4];
	String details[] = new String[4];
	int i;
	int j;
	for(i = 1; i<4; i++)
	{
		name[i] = (String)request.getParameter("hiddName"+i);
		period[i] = (String)request.getParameter("hiddPeriod"+i);
		details[i] = (String)request.getParameter("hiddDetails"+i);
		policy[i] = (String)request.getParameter("hiddPolicy"+i);
	}
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
	}
	String itemPolicy[] = new String[6];
	String claimedArticle[] = new String[6];
	String articleValue[] = new String[6];
	String salvageValue[] = new String[6];
	String claimedAmmount[] = new String[6];

	for(i = 1; i<6; i++)
	{
		itemPolicy[i] = (String)request.getParameter("hiddItemPolicy"+i);
		claimedArticle[i] = (String)request.getParameter("hiddClaimedArticle"+i);
		articleValue[i] = (String)request.getParameter("hiddArticleValue"+i);
		salvageValue[i] = (String)request.getParameter("hiddSalvageValue"+i);
		claimedAmmount[i] = (String)request.getParameter("hiddClaimedAmmount"+i);
	}
	String fillDate = (String)request.getParameter("hiddFillDate");

	String claimForm []  = {"fireClaimForm", "insuredName", "area", "lossArea", "insuredTelephone", "insuredFax", "mortgageName", "fireTime","fireDate","fireCause","fireItem", "fireOccupation","fireFir","fireEstimatedLoss", "fireDetails","name1", "period1", "details1","policy1","name2","period2", "details2","policy2","name3", "period3", "details3","policy3","itemPolicy1","claimedArticle1","articleValue1","salvageValue1", "claimedAmmount1", "itemPolicy2","claimedArticle2","articleValue2","salvageValue2", "claimedAmmount2", "itemPolicy3","claimedArticle3","articleValue3","salvageValue3", "claimedAmmount3","itemPolicy4","claimedArticle4","articleValue4","salvageValue4", "claimedAmmount4","itemPolicy5","claimedArticle5","articleValue5","salvageValue5", "claimedAmmount5","fillDate"};
	String claimFormValues[] ={"subNode", insuredName, area, lossArea, insuredTelephone, insuredFax, mortgageName, fireTime, fireDate, fireCause, fireItem, fireOccupation, fireFir, fireEstimatedLoss, fireDetails, name[1], period[1], details[1], policy[1], name[2], period[2], details[2], policy[2], name[3], period[3], details[3], policy[3],itemPolicy[1], claimedArticle[1], articleValue[1], salvageValue[1], claimedAmmount[1],itemPolicy[2], claimedArticle[2],articleValue[2], salvageValue[2], claimedAmmount[2], itemPolicy[3],  claimedArticle[3],articleValue[3], salvageValue[3], claimedAmmount[3], itemPolicy[4], claimedArticle[4],articleValue[4], salvageValue[4], claimedAmmount[4], itemPolicy[5], claimedArticle[5],articleValue[5], salvageValue[5], claimedAmmount[5],fillDate};	

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

	//String fileFormValues[] = "{"+fileNames+"}";
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
			<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the FIre Insurance Claim Form !!!
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