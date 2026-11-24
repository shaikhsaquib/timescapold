<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.text.*" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<html>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" >
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
	//System.out.println(formsHeaderValue);
%>
		<%@ include file="../../includes/formsHeader.jsp"%>

<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String flag = (String)request.getParameter("hiddFlag");
	String form = "marine";
	//System.out.println(flag);
	String retainSalvage = "";
	//System.out.println(retainSalvage);
	String proximateLoss = "";
	String carrierClaims = "";
	String supplier = "";
	String repaid = "";
	String inspection = "";
	String inspectionDate = "";
	String delayReason = "";
	String otherInfo = "";
	String dispatchDate = "";
	String finalAddr = "";
	String distance = "";
	String finalDate = "";
	String delayReasonFinal = "";
	String transport = "";
	String condition = "";
	String attributedDamage = "";
	String fillDate = "";
	String stationName = "";
	String mark[] = new String[6];
	String shortage[] = new String[6];
	String breakage[] = new String[6];
	String repair[] = new String[6];
	String cost[] = new String[6];
	String salvage[] = new String[6];
	boolean status = false;


	String assuredName = (String)request.getParameter("assuredName");
	String assuredAddr = (String)request.getParameter("assuredAddr");
	String consignorName = (String)request.getParameter("consignorName");
	String consignorAddr = (String)request.getParameter("consignorAddr");
	String consigneeName = (String)request.getParameter("consigneeName");
	String consigneeAddr = (String)request.getParameter("consigneeAddr");
	String stationConsignment = (String)request.getParameter("stationConsignment");
	String stationDestination = (String)request.getParameter("stationDestination");
	String carrierReceipt = (String)request.getParameter("carrierReceipt");
	String carrierDate = (String)request.getParameter("carrierDate");
	String carrierStation = (String)request.getParameter("carrierStation");
	String goods = (String)request.getParameter("goods");
	String dispatch = (String)request.getParameter("dispatch");
	String goodsDescription = (String)request.getParameter("goodsDescription");
	String packingDetails = (String)request.getParameter("packingDetails");
	String damageDescription = (String)request.getParameter("damageDescription");
	String certificate = (String)request.getParameter("certificate");
	String consignmentDate = (String)request.getParameter("consignmentDate");
	String deliveryDate = (String)request.getParameter("deliveryDate");
	String warehousesDate = (String)request.getParameter("warehousesDate");
	String lossDescription = (String)request.getParameter("lossDescription");
	//String delayReasonFinal = (String)request.getParameter("delayReasonFinal");

	if(flag.equals("partialUpdateClaim"))
	{
		Object objArr1[] = new Object[3];
		objArr1[0] = "'DD-MON-YYYY'";
		objArr1[1] = claimNumber;

		Hashtable claimDetailsHash = new Hashtable();
		claimDetailsHash.put("queryId", "1000");
		claimDetailsHash.put("arguments", objArr1);

		ArrayList myViewClaimRequest = insuranceClaimController.viewClaimDetails(claimDetailsHash);



		if(myViewClaimRequest.size() >0)
		{
			//System.out.println("IN");
			String[] myViewClaimRequestValues = (String[])myViewClaimRequest.get(0);
			
			Hashtable claimFormDetails = xmlObj.readSubNode(myViewClaimRequestValues[2], "marineClaimForm");

			retainSalvage = (String)claimFormDetails.get("retainSalvage-");
			//System.out.println(retainSalvage);
			proximateLoss = (String)claimFormDetails.get("proximateLoss-");
			carrierClaims = (String)claimFormDetails.get("carrierClaims-");
			supplier = (String)claimFormDetails.get("supplier-");
			repaid = (String)claimFormDetails.get("repaid-");
			inspection = (String)claimFormDetails.get("inspection-");
			inspectionDate = (String)claimFormDetails.get("inspectionDate-");
			delayReason = (String)claimFormDetails.get("delayReason-");
			otherInfo = (String)claimFormDetails.get("otherInfo-");
			dispatchDate = (String)claimFormDetails.get("dispatchDate-");
			finalAddr = (String)claimFormDetails.get("finalAddr-");
			distance = (String)claimFormDetails.get("distance-");
			finalDate = (String)claimFormDetails.get("finalDate-");
			delayReasonFinal = (String)claimFormDetails.get("delayReasonFinal-");
			transport = (String)claimFormDetails.get("transport-");
			condition = (String)claimFormDetails.get("condition-");
			attributedDamage = (String)claimFormDetails.get("attributedDamage-");
			fillDate = (String)claimFormDetails.get("fillDate-");
			stationName = (String)claimFormDetails.get("stationName-");
			int i,j;
			for(i = 1; i<6; i++)
			{
				mark[i] = (String)claimFormDetails.get("mark"+i+"-");
				shortage[i] = (String)claimFormDetails.get("shortage"+i+"-");
				breakage[i] = (String)claimFormDetails.get("breakage"+i+"-");
				repair[i] = (String)claimFormDetails.get("repair"+i+"-");
				cost[i] = (String)claimFormDetails.get("cost"+i+"-");
				salvage[i] = (String)claimFormDetails.get("salvage"+i+"-");
				System.out.println(salvage[i]);
			}
		}

		String claimForm []  = {"marineClaimForm", "assuredName", "assuredAddr", "consignorName", "consignorAddr", "consigneeName", "consigneeAddr", "stationConsignment","stationDestination","carrierReceipt","carrierDate", "carrierStation","goods","dispatch", "packingDetails","damageDescription", "certificate", "consignmentDate","deliveryDate","warehousesDate","lossDescription", "goodsDescription" };

		String claimFormValues[] ={"subNode", assuredName, assuredAddr, consignorName, consignorAddr, consigneeName, consigneeAddr, stationConsignment,stationDestination,carrierReceipt,carrierDate, carrierStation,goods,dispatch, packingDetails,damageDescription, certificate, consignmentDate,deliveryDate,warehousesDate,lossDescription, goodsDescription};	

		formsHeaders.put("claimNumber", claimNumber);
		formsHeaders.put("reviewerXML", "<reviewerDetails />");
		formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
		formsHeaders.put("courierXML", "<courierDetails />");
		formsHeaders.put("createdBy", timescapeUserOId);
		formsHeaders.put("modifiedBy", timescapeUserOId);
		formsHeaders.put("formStatus", "L");
		formsHeaders.put("flag", flag);
		formsHeaders.put("form", form);
		formsHeaders.put("part", "second");

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
		status = insuranceClaimController.updateClaimFormDetail(insuranceclaimForm);
	}
	else{

		String claimForm []  = {"marineClaimForm", "assuredName", "assuredAddr", "consignorName", "consignorAddr", "consigneeName", "consigneeAddr", "stationConsignment","stationDestination","carrierReceipt","carrierDate", "carrierStation","goods","dispatch", "packingDetails","damageDescription", "certificate", "consignmentDate","deliveryDate","warehousesDate","lossDescription", "goodsDescription" };

		String claimFormValues[] ={"subNode", assuredName, assuredAddr, consignorName, consignorAddr, consigneeName, consigneeAddr, stationConsignment,stationDestination,carrierReceipt,carrierDate, carrierStation,goods,dispatch, packingDetails,damageDescription, certificate, consignmentDate,deliveryDate,warehousesDate,lossDescription, goodsDescription};	

		formsHeaders.put("claimNumber", claimNumber);
		formsHeaders.put("reviewerXML", "<reviewerDetails />");
		formsHeaders.put("courierAttachmentXML", "<courierAttachmentDetails />");
		formsHeaders.put("courierXML", "<courierDetails />");
		formsHeaders.put("createdBy", timescapeUserOId);
		formsHeaders.put("modifiedBy", timescapeUserOId);
		formsHeaders.put("formStatus", "L");
		formsHeaders.put("flag", flag);
		formsHeaders.put("form", form);
		formsHeaders.put("part", "second");

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
		status = insuranceClaimController.submitClaimFormValues(insuranceclaimForm);
	}
	if(status){
		if(retainSalvage != null)
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
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
<tr>


          <td width="56%" height="30" align="right" class="style4"><div align="left">14. Are You Interested In Retaining Salvage ? <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is so, What Is Your offer ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="retainSalvage" class="style3" size="26" value="<%=retainSalvage%>">  </td>
        </tr></tbody></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">15. Please State The Proximate Cause Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Such Damage or Loss. </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="proximateLoss" cols="35" class="style3"><%=proximateLoss%></textarea>  </td>
		<tr><td>&nbsp;</td></tr></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">16: As Per Policy Conditions Did You <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Immediately Lodge Claims On the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers ? If So Copies Of The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Correspondence Exchanged With The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers May Be Enclosed. </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="carrierClaims" cols="35" class="style3"><%=carrierClaims%></textarea>  </td>
		<tr><td>&nbsp</td></tr>

		
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">17: In Case Of Shortage Did You Make A <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Reference Of Supplier To Ascertain <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;If A Short Supply Was Made By Them <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Through Error ? </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="supplier" cols="35" class="style3"><%=supplier%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">18. If The Damaged  Articles Could Be <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Repaied or Reconditioned <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Indicate &nbsp;The Cost That Would <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Be Involved </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="repaid" class="style3" size="26" value="<%=repaid%>">  </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
		<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">19. After Arrival Of Goods At Final <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination On What Date Did The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Consignee  Start Opening up And <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inspection Of Goods.</div></td> 
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspection" class="style3" size="26" onfocus="showCalendarControl(this);" value="<%=inspection%>" readonly>  </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left"><b>20.</b> (a) After Completion Of Inspection As <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stated Above On What Date Were  The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descrepancies Notified To The Insurance <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Co ? Please State The Ref.No & Date: </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspectionDate" class="style3" size="26" onfocus="showCalendarControl(this);" value="<%=inspectionDate%>" readonly>  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) If There Is Any Delay In Intimating, Please <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;give The Reasons : &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReason" cols="35" class="style3"><%=delayReason%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        
<tr><td>&nbsp</td></tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">21. Any Other Information That Relates To This Claim :</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="otherInfo" cols="35" class="style3"><%=otherInfo%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        



<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



		
<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">If Goods Are Despatched To Consignee's Warehouse From Destination Railway Station   </span></div></td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr> 
		<tr>
          <td height="1" colspan="10" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



  <td height="30" colspan="10" align="right" class="style3"><div align="left"><b>22.</b>(a): Give The Full Address Of The Final Destinations Of Goods And State On What Date The Goods Were Dispatched To That Place From &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station</div></td>
  <tr><td>&nbsp</tr></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="dispatchDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=dispatchDate%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="finalAddr" class="style3"><%=finalAddr%></textarea></div></td>
		</tr>


<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Distance Of Consignee's Warehouse From <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station  </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="distance" class="style3" size="26" value="<%=distance%>">  </td>
        </tr>
<tr><td>&nbsp</td></tr>

	<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c) On What Date Did The Goods Reached <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Final destination Named Above :</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="finalDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=finalDate%>">  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

<tr>
          <td width="56%" colspan="5" height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) If There Is Any Delay In The Goods  Reaching The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Final Destination State Reasons For The Same :</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReasonFinal" cols="35" class="style3"><%=delayReasonFinal%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        

 	
		<tr><td>&nbsp</td></tr></tbody></table>


		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">23.What Is The Mode Of Transportation :</div></td>
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="transport" class="style3" size="26" value="<%=transport%>">  </td></tr>
                
		<tr><td>&nbsp;</td></tr>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        


<tr><td>&nbsp;</td></tr>
<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> <b>24.</b>(a) What Was The External Condition Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Package When Delivered At <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Final Destination  ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="condition" cols="35" class="style3"><%=condition%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>

		<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) If Damages State The  Nature Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Damage And Attributed Cost For The Same ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="attributedDamage" cols="35" class="style3"><%=attributedDamage%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>



		
		 <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="5" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>&nbsp;



		<tr>
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, Clearify That The Information Herein Given is  best of my/our knowledge and belief,  I/We Also agree To Render All Necessary Help Requiring The Amount OF Full Loss or a part Of It Either From carriers Or From Anybody Whososever Ultimately Become Liable To Make Good The Loss .</div></td>
		</tr>

		</tbody>
		</table>&nbsp;
			
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
	<table width="300" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part2()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Next
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 
 
	<table cellspacing="0" cellpadding="0" width="700" border="0">
        
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
	<input type = "hidden" name = "hiddStationName" value = "<%=stationName%>">
	<%
	for(int i = 1;i<6;i++)
	{
	%>
		<input type = "hidden" name = "hiddMark<%=i%>" value = "<%=mark[i]%>">
		<input type = "hidden" name = "hiddShortage<%=i%>" value = "<%=shortage[i]%>">
		<input type = "hidden" name = "hiddBreakage<%=i%>" value = "<%=breakage[i]%>">
		<input type = "hidden" name = "hiddRepair<%=i%>" value = "<%=repair[i]%>">
		<input type = "hidden" name = "hiddCost<%=i%>" value = "<%=cost[i]%>">
		<input type = "hidden" name = "hiddSalvage<%=i%>" value = "<%=salvage[i]%>">
	<%
	}
	%>
	<input type = "hidden" name = "hiddFillDate" value = "<%=fillDate%>">
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
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
<tr>


          <td width="56%" height="30" align="right" class="style4"><div align="left">14. Are You Interested In Retaining Salvage ? <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Is so, What Is Your offer ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="retainSalvage" class="style3" size="26">  </td>
        </tr></tbody></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">15. Please State The Proximate Cause Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Such Damage or Loss. </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="proximateLoss" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">16: As Per Policy Conditions Did You <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Immediately Lodge Claims On the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers ? If So Copies Of The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Correspondence Exchanged With The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers May Be Enclosed. </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="carrierClaims" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp</td></tr>

		
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">17: In Case Of Shortage Did You Make A <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Reference Of Supplier To Ascertain <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;If A Short Supply Was Made By Them <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Through Error ? </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="supplier" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">18. If The Damaged  Articles Could Be <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Repaied or Reconditioned <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Indicate &nbsp;The Cost That Would <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Be Involved </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="repaid" class="style3" size="26">  </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
		<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">19. After Arrival Of Goods At Final <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination On What Date Did The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Consignee  Start Opening up And <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inspection Of Goods.</div></td> 
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspection" class="style3" size="26">  </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left"><b>20.</b> (a) After Completion Of Inspection As <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stated Above On What Date Were  The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descrepancies Notified To The Insurance <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Co ? Please State The Ref.No & Date: </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspectionDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly>  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) If There Is Any Delay In Intimating, Please <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;give The Reasons : &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReason" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        
<tr><td>&nbsp</td></tr

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">21. Any Other Information That Relates To This Claim :</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="otherInfo" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        



<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



		
<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">If Goods Are Despatched To Consignee's Warehouse From Destination Railway Station   </span></div></td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr> 
		<tr>
          <td height="1" colspan="10" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



  <td height="30" colspan="10" align="right" class="style3"><div align="left"><b>22.</b>(a): Give The Full Address Of The Final Destinations Of Goods And State On What Date The Goods Were Dispatched To That Place From &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station</div></td>
  <tr><td>&nbsp</tr></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="dispatchDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="finalAddr" class="style3"></textarea></div></td>
		</tr>


<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Distance Of Consignee's Warehouse From <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station  </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="distance" class="style3" size="26">  </td>
        </tr>
<tr><td>&nbsp</td></tr>

	<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c) On What Date Did The Goods Reached <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Final destination Named Above :</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="finalDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly>  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

<tr>
          <td width="56%" colspan="5" height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) If There Is Any Delay In The Goods  Reaching The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Final Destination State Reasons For The Same :</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReasonFinal" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
        

 	
		<tr><td>&nbsp</td></tr></tbody></table>


		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>



<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">23.What Is The Mode Of Transportation :</div></td>
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="transport" class="style3" size="26">  </td></tr>
                
		<tr><td>&nbsp;</td></tr>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        


<tr><td>&nbsp;</td></tr>
<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> <b>24.</b>(a) What Was The External Condition Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Package When Delivered At <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Final Destination  ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="condition" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>

		<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) If Damages State The  Nature Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Damage And Attributed Cost For The Same ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="attributedDamage" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>



		
		 <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="5" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>&nbsp;



		<tr>
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, Clearify That The Information Herein Given is  best of my/our knowledge and belief,  I/We Also agree To Render All Necessary Help Requiring The Amount OF Full Loss or a part Of It Either From carriers Or From Anybody Whososever Ultimately Become Liable To Make Good The Loss .</div></td>
		</tr>

		</tbody>
		</table>&nbsp;
			
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
	<table width="300" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part2()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Next
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
		}
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
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "updateClaim">
<input type = "hidden" name = "hiddformsHeaderValue" value = "2">
</body>
</html>