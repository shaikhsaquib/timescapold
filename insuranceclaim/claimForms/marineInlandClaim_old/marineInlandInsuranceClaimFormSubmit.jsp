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
	String currLink = "../../marineInlandClaim/marineInlandInsuranceClaimFormSubmit.jsp";
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
				<td  background = "../../images/logo2.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../../images/tshome_logo.jpg" /></div>
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
	String form = "marine";
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	System.out.println("directorySize"+directorySize);
	int directorySize1 = Integer.parseInt(directorySize);

	String assuredName = (String)request.getParameter("hiddAssuredName");
	String assuredAddr = (String)request.getParameter("hiddAssuredAddr");
	String consignorName = (String)request.getParameter("hiddConsignorName");
	String consignorAddr = (String)request.getParameter("hiddConsignorAddr");
	String consigneeName = (String)request.getParameter("hiddConsigneeName");
	String consigneeAddr = (String)request.getParameter("hiddConsigneeAddr");
	String stationConsignment = (String)request.getParameter("hiddStationConsignment");
	String stationDestination = (String)request.getParameter("hiddStationDestination");
	String carrierReceipt = (String)request.getParameter("hiddCarrierReceipt");
	String carrierDate = (String)request.getParameter("hiddCarrierDate");
	String carrierStation = (String)request.getParameter("hiddCarrierStation");
	String goods = (String)request.getParameter("hiddGoods");
	String dispatch = (String)request.getParameter("hiddDispatch");
	String packingDetails = (String)request.getParameter("hiddPackingDetails");
	String damageDescription = (String)request.getParameter("hiddDamageDescription");
	String certificate = (String)request.getParameter("hiddCertificate");
	String consignmentDate = (String)request.getParameter("hiddConsignmentDate");
	String deliveryDate = (String)request.getParameter("hiddDeliveryDate");
	String warehousesDate = (String)request.getParameter("hiddWarehousesDate");
	String lossDescription = (String)request.getParameter("hiddLossDescription");
	String retainSalvage = (String)request.getParameter("hiddRetainSalvage");
	String proximateLoss = (String)request.getParameter("hiddProximateLoss");
	String carrierClaims = (String)request.getParameter("hiddCarrierClaims");
	String supplier = (String)request.getParameter("hiddSupplier");
	String repaid = (String)request.getParameter("hiddRepaid");
	String inspection = (String)request.getParameter("hiddInspection");
	String inspectionDate = (String)request.getParameter("hiddInspectionDate");
	String delayReason = (String)request.getParameter("hiddDelayReason");
	String otherInfo = (String)request.getParameter("hiddOtherInfo");
	String dispatchDate = (String)request.getParameter("hiddDispatchDate");
	String finalAddr = (String)request.getParameter("hiddFinalAddr");
	String distance = (String)request.getParameter("hiddDistance");
	String finalDate = (String)request.getParameter("hiddFinalDate");
	String goodsDescription = (String)request.getParameter("hiddGoodsDescription");
	String transport = (String)request.getParameter("hiddTransport");
	String condition = (String)request.getParameter("hiddCondition");
	String attributedDamage = (String)request.getParameter("hiddAttributedDamage");
	String fillDate = (String)request.getParameter("hiddFillDate");
	String stationName = (String)request.getParameter("hiddStationName");
	String mark[] = new String[6];
	String shortage[] = new String[6];
	String breakage[] = new String[6];
	String repair[] = new String[6];
	String cost[] = new String[6];
	String salvage[] = new String[6];
	String fileName[] = new String[directorySize1];

	int i,j;
	for(i = 1; i<6; i++)
	{
		mark[i] = (String)request.getParameter("hiddMark"+i);
		shortage[i] = (String)request.getParameter("hiddShortage"+i);
		breakage[i] = (String)request.getParameter("hiddBreakage"+i);
		repair[i] = (String)request.getParameter("hiddRepair"+i);
		cost[i] = (String)request.getParameter("hiddCost"+i);
		salvage[i] = (String)request.getParameter("hiddSalvage"+i);
	}

	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
	}

	String claimForm []  = {"marineClaimForm", "assuredName", "assuredAddr", "consignorName", "consignorAddr", "consigneeName", "consigneeAddr", "stationConsignment","stationDestination","carrierReceipt","carrierDate", "carrierStation","goods","dispatch", "packingDetails","damageDescription", "certificate", "consignmentDate","deliveryDate","warehousesDate","lossDescription", "goodsDescription", "retainSalvage","proximateLoss","carrierClaims", "supplier", "repaid", "inspection", "inspectionDate", "delayReason","otherInfo","dispatchDate","finalAddr","distance","finalDate", "delayReason", "transport","condition","attributedDamage", "fillDate", "stationName", "mark1", "shortage1", "breakage1","repair1","cost1","salvage1", "mark2", "shortage2", "breakage2","repair2","cost2","salvage2", "mark3", "shortage3", "breakage3","repair3","cost3","salvage3", "mark4", "shortage4", "breakage4","repair4","cost4","salvage4", "mark5", "shortage5", "breakage5","repair5","cost5","salvage5" };

	String claimFormValues[] ={"subNode", assuredName, assuredAddr, consignorName, consignorAddr, consigneeName, consigneeAddr, stationConsignment,stationDestination,carrierReceipt,carrierDate, carrierStation,goods,dispatch, packingDetails,damageDescription, certificate, consignmentDate,deliveryDate,warehousesDate,lossDescription, goodsDescription,retainSalvage,proximateLoss,carrierClaims, supplier, repaid, inspection, inspectionDate, delayReason,otherInfo,dispatchDate,finalAddr,distance,finalDate, delayReason, transport,condition,attributedDamage, fillDate, stationName, mark[1], shortage[1], breakage[1],repair[1],cost[1],salvage[1], mark[2], shortage[2], breakage[2],repair[2],cost[2],salvage[2], mark[3], shortage[3], breakage[3],repair[3],cost[3],salvage[3], mark[4], shortage[4], breakage[4], repair[4],cost[4],salvage[4], mark[5], shortage[5], breakage[5],repair[5],cost[5],salvage[5]};	

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
			<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the Marine Inland Insurance Claim Form !!!
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
</table>
</body>
</html>