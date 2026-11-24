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
<%
	String formsHeaderValue = (String)request.getParameter("formsHeaderValue");
%>
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<%@ include file="../includes/formsHeader.jsp"%>
			<tr>
				<td  background = "../images/logo2.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/tshome_logo.jpg" /></div>
				<td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String flag = (String)request.getParameter("hiddFlag");

	String weekDay = (String)request.getParameter("hiddWeekDay");
	String area = (String)request.getParameter("hiddArea");
	String areaDesc = (String)request.getParameter("hiddAreaDesc");
	String fireCause = (String)request.getParameter("hiddFireCause");
	String otherInterest = (String)request.getParameter("hiddOtherInterest");

	String ammount[] = new String[4];
	String company[] = new String[4];
	String policy[] = new String[4];
	int i;
	for(i = 1; i<4; i++)
	{
		ammount[i] = (String)request.getParameter("hiddAmmount"+i);
		company[i] = (String)request.getParameter("hiddCompany"+i);
		policy[i] = (String)request.getParameter("hiddPolicy"+i);

	}
	String claimedArticle[] = new String[6];
	String articleValue[] = new String[6];
	String salvageValue[] = new String[6];
	String claimedAmmount[] = new String[6];

	for(i = 1; i<6; i++)
	{
		claimedArticle[i] = (String)request.getParameter("hiddClaimedArticle"+i);
		articleValue[i] = (String)request.getParameter("hiddArticleValue"+i);
		salvageValue[i] = (String)request.getParameter("hiddSalvageValue"+i);
		claimedAmmount[i] = (String)request.getParameter("hiddClaimedAmmount"+i);
	}
	String fillDate = (String)request.getParameter("hiddFillDate");

	String claimForm []  = {"fireClaimForm", "weekDay", "area", "areaDesc", "fireCause", "otherInterest", "ammount1", "company1","policy1","ammount2", "company2","policy2","ammount3", "company3","policy3","claimedArticle1","articleValue1","salvageValue1", "claimedAmmount1","claimedArticle2","articleValue2","salvageValue2", "claimedAmmount2","claimedArticle3","articleValue3","salvageValue3", "claimedAmmount3","claimedArticle4","articleValue4","salvageValue4", "claimedAmmount4","claimedArticle5","articleValue5","salvageValue5", "claimedAmmount5","fillDate"};
	String claimFormValues[] ={"subNode", weekDay, area, areaDesc, fireCause, otherInterest, ammount[1], company[1], policy[1],ammount[2], company[2], policy[2],ammount[3], company[3], policy[3],claimedArticle[1],articleValue[1], salvageValue[1], claimedAmmount[1],claimedArticle[2],articleValue[2], salvageValue[2], claimedAmmount[2],claimedArticle[3],articleValue[3], salvageValue[3], claimedAmmount[3],claimedArticle[4],articleValue[4], salvageValue[4], claimedAmmount[4],claimedArticle[5],articleValue[5], salvageValue[5], claimedAmmount[5],fillDate};	

	formsHeaders.put("claimNumber", claimNumber);
	formsHeaders.put("reviewerXML", "<reviewerDetails />");
	formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
	formsHeaders.put("courierXML", "<courierDetails />");
	formsHeaders.put("createdBy", timescapeUserOId);
	formsHeaders.put("modifiedBy", timescapeUserOId);
	formsHeaders.put("formStatus", "L");
	formsHeaders.put("flag", flag);

	Hashtable updateClaimRequest = new Hashtable();
	updateClaimRequest.put("modifiedBy", timescapeUserOId);
	updateClaimRequest.put("status", "UF");
	updateClaimRequest.put("requestNo", requestNo );

	ArrayList insuranceclaimForm = new ArrayList();
	insuranceclaimForm.add(claimForm);
	insuranceclaimForm.add(claimFormValues);
	insuranceclaimForm.add(formsHeaders);
	insuranceclaimForm.add(updateClaimRequest);

	boolean status = insuranceClaimController.submitClaimFormValues(insuranceclaimForm);
	if(status)
	{
%>
	<tr>
			<td colspan= "100%" align = "center" class = "style5" >Your Claim Form has been submitted successfully !!!
			</td> 
		</tr>
		<tr>
			<td colspan= "100%" align = "center" >&nbsp;</td>
		</tr>
		<tr>
			<td colspan= "100%" align = "center" class = "style5" >Click <a href="#">here</a> to view your Claim request(s)
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
</table>
</body>
</html>