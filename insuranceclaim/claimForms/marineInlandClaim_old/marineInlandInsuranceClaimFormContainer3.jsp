<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<html>
<%
	String requestNo = (String)request.getParameter("hiddRequestNo");
%>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" onload = "onLoadDetail(<%=requestNo%>, 'frmMarineInsuranceClaim')" >
	<form name  = "frmMarineInsuranceClaim" method = "post"  >
		<%@ include file="../../includes/header.jsp"%>
<title>Insurance Claim</title>
	<link rel="stylesheet" href="../../style/global.css">
	<script Language="JavaScript" src="../../jscripts/common.js"></script>
	<script Language="JavaScript" src="../../jscripts/util.js"></script>
	<script Language="JavaScript" src="../../jscripts/calendarControl.js"></script>
	<script Language="JavaScript" src="../../jscripts/insuranceClaimForms.js"></script>
	<link href="../../style/calendarControl.css"rel="stylesheet">
	<script src="../../jscripts/calendarControl.js"language="javascript"></script>
<%
	String formsHeaderValue = (String)request.getParameter("hiddformsHeaderValue");
	//out.println(formsHeaderValue);
%>
		<%@ include file="../../includes/formsHeader.jsp"%>

<%
GregorianCalendar thisDay = new GregorianCalendar( );
	String date = "";
	int monthNum = thisDay.get(Calendar.MONTH);
	monthNum = monthNum+1;
	String month = Integer.toString(monthNum);
	if(date == null || date.equals("")){
		date = Integer.toString(thisDay.get(Calendar.DAY_OF_MONTH));

		if(date.length() == 1){
			date = "0" + date;
		}
		if(month.length() == 1){
			month = "0" + month;
		}
		date += "/" + month;
		
		date += "/" +Integer.toString(thisDay.get(Calendar.YEAR));
	}
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	System.out.println(flag);
	String form = "marine";

	String retainSalvage = (String)request.getParameter("retainSalvage");
	String proximateLoss = (String)request.getParameter("proximateLoss");
	String carrierClaims = (String)request.getParameter("carrierClaims");
	String supplier = (String)request.getParameter("supplier");
	String repaid = (String)request.getParameter("repaid");
	String inspection = (String)request.getParameter("inspection");
	String inspectionDate = (String)request.getParameter("inspectionDate");
	String delayReason = (String)request.getParameter("delayReason");
	String otherInfo = (String)request.getParameter("otherInfo");
	String dispatchDate = (String)request.getParameter("dispatchDate");
	String finalAddr = (String)request.getParameter("finalAddr");
	String distance = (String)request.getParameter("distance");
	String finalDate = (String)request.getParameter("finalDate");
	String delayReasonFinal = (String)request.getParameter("delayReasonFinal");
	String transport = (String)request.getParameter("transport");
	String condition = (String)request.getParameter("condition");
	String attributedDamage = (String)request.getParameter("attributedDamage");
	String fillDate = (String)request.getParameter("hiddFillDate");
	System.out.println((String)request.getParameter("hiddFillDate"));
	String stationName = (String)request.getParameter("hiddStationName");
	String mark[] = new String[6];
	String shortage[] = new String[6];
	String breakage[] = new String[6];
	String repair[] = new String[6];
	String cost[] = new String[6];
	String salvage[] = new String[6];

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

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;

	Hashtable claimHash = new Hashtable();
	claimHash.put("queryId", "1000");
	claimHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimDetails(claimHash);

	//System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[2], "marineClaimForm");

	String assuredName = (String)approverClaimDetails.get("assuredName-");
	String assuredAddr = (String)approverClaimDetails.get("assuredAddr-");
	String consignorName = (String)approverClaimDetails.get("consignorName-");
	String consignorAddr = (String)approverClaimDetails.get("consignorAddr-");
	String consigneeName = (String)approverClaimDetails.get("consigneeName-");
	String consigneeAddr = (String)approverClaimDetails.get("consigneeAddr-");
	String stationConsignment = (String)approverClaimDetails.get("stationConsignment-");
	String stationDestination = (String)approverClaimDetails.get("stationDestination-");
	String carrierReceipt = (String)approverClaimDetails.get("carrierReceipt-");
	String carrierDate = (String)approverClaimDetails.get("carrierDate-");
	String carrierStation = (String)approverClaimDetails.get("carrierStation-");
	String goods = (String)approverClaimDetails.get("goods-");
	String dispatch = (String)approverClaimDetails.get("dispatch-");
	String goodsDescription = (String)approverClaimDetails.get("goodsDescription-");
	String packingDetails = (String)approverClaimDetails.get("packingDetails-");
	String damageDescription = (String)approverClaimDetails.get("damageDescription-");
	String certificate = (String)approverClaimDetails.get("certificate-");
	String consignmentDate = (String)approverClaimDetails.get("consignmentDate-");
	String deliveryDate = (String)approverClaimDetails.get("deliveryDate-");
	String warehousesDate = (String)approverClaimDetails.get("warehousesDate-");
	String lossDescription = (String)approverClaimDetails.get("lossDescription-");

	String claimForm []  = {"marineClaimForm", "assuredName", "assuredAddr", "consignorName", "consignorAddr", "consigneeName", "consigneeAddr", "stationConsignment","stationDestination","carrierReceipt","carrierDate", "carrierStation","goods","dispatch", "packingDetails","damageDescription", "certificate", "consignmentDate","deliveryDate","warehousesDate","lossDescription", "goodsDescription", "retainSalvage","proximateLoss","carrierClaims", "supplier", "repaid", "inspection", "inspectionDate", "delayReason","otherInfo","dispatchDate","finalAddr","distance","finalDate", "delayReasonFinal", "transport","condition","attributedDamage"};

	String claimFormValues[] ={"subNode", assuredName, assuredAddr, consignorName, consignorAddr, consigneeName, consigneeAddr, stationConsignment,stationDestination,carrierReceipt,carrierDate, carrierStation,goods,dispatch, packingDetails,damageDescription, certificate, consignmentDate,deliveryDate,warehousesDate,lossDescription, goodsDescription,retainSalvage,proximateLoss,carrierClaims, supplier, repaid, inspection, inspectionDate, delayReason,otherInfo,dispatchDate,finalAddr,distance,finalDate, delayReasonFinal, transport,condition,attributedDamage};

	formsHeaders.put("claimNumber", claimNumber);
	formsHeaders.put("reviewerXML", "<reviewerDetails />");
	formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
	formsHeaders.put("courierXML", "<courierDetails />");
	formsHeaders.put("createdBy", timescapeUserOId);
	formsHeaders.put("modifiedBy", timescapeUserOId);
	formsHeaders.put("formStatus", "L");
	formsHeaders.put("flag", flag);
	formsHeaders.put("form", form);
	formsHeaders.put("part", "third");

	Hashtable updateClaimRequest = new Hashtable();
	updateClaimRequest.put("modifiedBy", timescapeUserOId);
	//updateClaimRequest.put("status", "UF");
	updateClaimRequest.put("requestNo", requestNo );

	//out.println(formsHeaders);
	//out.println(updateClaimRequest);
	
	
	
	ArrayList insuranceclaimForm = new ArrayList();
	insuranceclaimForm.add(claimForm);
	insuranceclaimForm.add(claimFormValues);
	insuranceclaimForm.add(formsHeaders);
	insuranceclaimForm.add(updateClaimRequest);
	//insuranceclaimForm.add(fileForm);
	//insuranceclaimForm.add(fileFormValues);

	boolean status = insuranceClaimController.submitClaimFormValues(insuranceclaimForm);
	if(status)
	{
		//out.println(mark[1]);
		if(!(mark[1].equals("null")))
		{
%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
	  <tr>
		<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
			<div align="left"><img src="../../images/header.jpg" width="825" height="62"/></div>
		</td>
		</tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE INLAND TRANSIT CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
	<tr>
		<td width="56%" height="30" align="right" class="style4"><div align="left">Kindly fill the next part of the form </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		</tbody>
	</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>&nbsp;


	<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">Details Of Discrepancies</span></div></td>
	</tr>
	</tbody>
</table>

  <table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr> &nbsp
<td width="25%" height="25" align="right" class="style3"><div align="left"> Mark & No. </div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Shortage</div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Breakage </div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Reapairable or replacement.</div></td>
<td width="15%" height="25" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp; Cost </div></td>
<td width="15%" height="25" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Offer For &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retaining The &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salavage </div></td>

		 </tr>
		 <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark1" class="style3" size="15" value="<%=mark[1]%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage1" class="style3" size="15" value="<%=shortage[1]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage1" class="style3" size="15" value="<%=breakage[1]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair1" class="style3" size="15" value="<%=repair[1]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost1" class="style3" size="15" value="<%=cost[1]%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage1" class="style3" size="15" value="<%=salvage[1]%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark2" class="style3" size="15" value="<%=mark[2]%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage2" class="style3" size="15" value="<%=shortage[2]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage2" class="style3" size="15" value="<%=breakage[2]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair2" class="style3" size="15" value="<%=repair[2]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost2" class="style3" size="15" value="<%=cost[2]%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage2" class="style3" size="15" value="<%=salvage[2]%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark3" class="style3" size="15" value="<%=mark[3]%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage3" class="style3" size="15" value="<%=shortage[3]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage3" class="style3" size="15" value="<%=breakage[3]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair3" class="style3" size="15" value="<%=repair[3]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost3" class="style3" size="15" value="<%=cost[3]%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage3" class="style3" size="15" value="<%=salvage[3]%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark4" class="style3" size="15" value="<%=mark[4]%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage4" class="style3" size="15" value="<%=shortage[4]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage4" class="style3" size="15" value="<%=breakage[4]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair4" class="style3" size="15" value="<%=repair[4]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost4" class="style3" size="15" value="<%=cost[4]%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage4" class="style3" size="15" value="<%=salvage[4]%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark5" class="style3" size="15" value="<%=mark[5]%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage5" class="style3" size="15" value="<%=shortage[5]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage5" class="style3" size="15" value="<%=breakage[5]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair5" class="style3" size="15" value="<%=repair[5]%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost5" class="style3" size="15" value="<%=cost[5]%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage5" class="style3" size="15" value="<%=salvage[5]%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>
		 </table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readOnly> </td>
		 
         <td height="30"  align="left" class="style3"> Station Name :&nbsp;&nbsp;&nbsp;
         <input type="text" name="stationName" size="26" class="style3" value="<%=stationName%>"> </td>
		 </tr>		 
	</tbody>
</table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="attachment"></td>
		 </tr>		 
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
	</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part3()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Next
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 
 
	<table cellspacing="0" cellpadding="0" width="700" border="0">
        
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
<%
		}else{
%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE INLAND TRANSIT CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
	<tr>
		<td width="56%" height="30" align="right" class="style4"><div align="left">Kindly fill the next part of the form </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		</tbody>
	</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
	<tbody>&nbsp;


	<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">Details Of Discrepancies</span></div></td>
	</tr>
	</tbody>
</table>

  <table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr> &nbsp
<td width="25%" height="25" align="right" class="style3"><div align="left"> Mark & No. </div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Shortage</div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Breakage </div></td>
<td width="25%" height="25" align="right" class="style3"><div align="left">Reapairable or replacement.</div></td>
<td width="15%" height="25" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp; Cost </div></td>
<td width="15%" height="25" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Offer For &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retaining The &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salavage </div></td>

		 </tr>
		 <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark1" class="style3" size="15">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage1" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage1" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair1" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost1" class="style3" size="15">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage1" class="style3" size="15">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark2" class="style3" size="15">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage2" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage2" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair2" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost2" class="style3" size="15">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage2" class="style3" size="15">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark3" class="style3" size="15">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage3" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage3" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair3" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost3" class="style3" size="15">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage3" class="style3" size="15">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark4" class="style3" size="15">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage4" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage4" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair4" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost4" class="style3" size="15">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage4" class="style3" size="15">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark5" class="style3" size="15">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage5" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage5" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair5" class="style3" size="15">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost5" class="style3" size="15">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage5" class="style3" size="15">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>
		 </table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=date%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readOnly> </td>
		 
         <td height="30"  align="left" class="style3"> Station Name :&nbsp;&nbsp;&nbsp;
         <input type="text" name="stationName" size="26" class="style3"> </td>
		 </tr>		 
	</tbody>
</table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="attachment"></td>
		 </tr>		 
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
	</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part3()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Next
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 
 
	<table cellspacing="0" cellpadding="0" width="700" border="0">
        
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
<%
		}}else{
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
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddformsHeaderValue" value = "2">
<input type = "hidden" name = "hiddFlag" value = "updateClaim">