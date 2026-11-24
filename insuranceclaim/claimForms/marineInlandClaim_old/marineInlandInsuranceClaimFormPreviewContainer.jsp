<%
	String formsHeaderValue = (String)request.getParameter("hiddformsHeaderValue");
	//out.println(formsHeaderValue);
%>
		<%@ include file="../../includes/formsHeader.jsp"%>

<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);
	String form = "marine";

	String fillDate = (String)request.getParameter("fillDate");
	String stationName = (String)request.getParameter("stationName");
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
		mark[i] = (String)request.getParameter("mark"+i);
		if(mark[i].equals(null) || mark[i].equals(""))
			mark[i] = "0";
		shortage[i] = (String)request.getParameter("shortage"+i);
		if(shortage[i].equals(null) || shortage[i].equals(""))
			shortage[i] = "-";
		breakage[i] = (String)request.getParameter("breakage"+i);
		if(breakage[i].equals(null) || breakage[i].equals(""))
			breakage[i] = "-";
		repair[i] = (String)request.getParameter("repair"+i);
		if(repair[i].equals(null) || repair[i].equals(""))
			repair[i] = "-";
		cost[i] = (String)request.getParameter("cost"+i);
		if(cost[i].equals(null) || cost[i].equals(""))
			cost[i] = "-";
		salvage[i] = (String)request.getParameter("salvage"+i);
		if(salvage[i].equals(null) || salvage[i].equals(""))
			salvage[i] = "-";
	}
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;

	Hashtable claimHash = new Hashtable();
	claimHash.put("queryId", "1000");
	claimHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimDetails(claimHash);

	System.out.println("myClaimRequest "+myClaimRequest.size());

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
	String retainSalvage = (String)approverClaimDetails.get("retainSalvage-");
	String proximateLoss = (String)approverClaimDetails.get("proximateLoss-");
	String carrierClaims = (String)approverClaimDetails.get("carrierClaims-");
	String supplier = (String)approverClaimDetails.get("supplier-");
	String repaid = (String)approverClaimDetails.get("repaid-");
	String inspection = (String)approverClaimDetails.get("inspection-");
	String inspectionDate = (String)approverClaimDetails.get("inspectionDate-");
	String delayReason = (String)approverClaimDetails.get("delayReason-");
	String otherInfo = (String)approverClaimDetails.get("otherInfo-");
	String dispatchDate = (String)approverClaimDetails.get("dispatchDate-");
	String finalAddr = (String)approverClaimDetails.get("finalAddr-");
	String distance = (String)approverClaimDetails.get("distance-");
	String finalDate = (String)approverClaimDetails.get("finalDate-");
	String delayReasonFinal = (String)approverClaimDetails.get("delayReasonFinal-");
	String transport = (String)approverClaimDetails.get("transport-");
	String attributedDamage = (String)approverClaimDetails.get("attributedDamage-");
	String condition = (String)approverClaimDetails.get("condition-");

	String claimForm []  = {"marineClaimForm", "assuredName", "assuredAddr", "consignorName", "consignorAddr", "consigneeName", "consigneeAddr", "stationConsignment","stationDestination","carrierReceipt","carrierDate", "carrierStation","goods","dispatch", "packingDetails","damageDescription", "certificate", "consignmentDate","deliveryDate","warehousesDate","lossDescription", "goodsDescription", "retainSalvage","proximateLoss","carrierClaims", "supplier", "repaid", "inspection", "inspectionDate", "delayReason","otherInfo","dispatchDate","finalAddr","distance","finalDate", "delayReasonFinal", "transport","condition","attributedDamage", "fillDate", "stationName", "mark1", "shortage1", "breakage1","repair1","cost1","salvage1", "mark2", "shortage2", "breakage2","repair2","cost2","salvage2", "mark3", "shortage3", "breakage3","repair3","cost3","salvage3", "mark4", "shortage4", "breakage4","repair4","cost4","salvage4", "mark5", "shortage5", "breakage5","repair5","cost5","salvage5" };

	String claimFormValues[] ={"subNode", assuredName, assuredAddr, consignorName, consignorAddr, consigneeName, consigneeAddr, stationConsignment,stationDestination,carrierReceipt,carrierDate, carrierStation,goods,dispatch, packingDetails,damageDescription, certificate, consignmentDate,deliveryDate,warehousesDate,lossDescription, goodsDescription,retainSalvage,proximateLoss,carrierClaims, supplier, repaid, inspection, inspectionDate, delayReason,otherInfo,dispatchDate,finalAddr,distance,finalDate, delayReasonFinal, transport,condition,attributedDamage, fillDate, stationName, mark[1], shortage[1], breakage[1],repair[1],cost[1],salvage[1], mark[2], shortage[2], breakage[2],repair[2],cost[2],salvage[2], mark[3], shortage[3], breakage[3],repair[3],cost[3],salvage[3], mark[4], shortage[4], breakage[4], repair[4],cost[4],salvage[4], mark[5], shortage[5], breakage[5],repair[5],cost[5],salvage[5]};	

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
	formsHeaders.put("part", "final");

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
		Object objArr1[] = new Object[3];
		objArr1[0] = "'DD-MON-YYYY'";
		objArr1[1] = requestNo;

		Hashtable claimRequestHash1 = new Hashtable();
		claimRequestHash1.put("queryId", "1001");
		claimRequestHash1.put("arguments", objArr1);

		ArrayList myClaimRequestView = insuranceClaimController.viewClaimRequest(claimRequestHash1);

		String[] myClaimRequestViewValues = (String[])myClaimRequestView.get(0);

		Hashtable approverViewClaimDetails = xmlObj.readSubNode(myClaimRequestViewValues[13], "approverClaimDetails");
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF">
	<table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE INLAND TRANSIT CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>
		</td></tr></table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Claim No:</span></div></td>
		 <td align="left" class="style3"><%=myClaimRequestViewValues[1]%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Policy No:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverViewClaimDetails.get("policyNumber-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company Name:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverViewClaimDetails.get("policyInsuCompany-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		</tbody></table>





		
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="2" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>




		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
          <td height="30" align="right" class="style4"><div align="left">1. Name and Address Of Assured: &nbsp;</div></td>
		  <tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=assuredName%></div></td>
			<td colspan="4" width="56%"height="50"  class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=assuredAddr%></div></td>
		</tr></tr></tbody></table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
<tr>
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
         
          </tr></tbody></table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
        <tr>			   
	  <td height="30" align="right" class="style4"><div align="left">2. Name and Address Of Consignor: &nbsp;</div></td>
		  <tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=consignorName%></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=consignorAddr%></div></td>
		</tr></tr>


<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="4"  align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr></tbody></table>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
<tr>        
          <td height="30" align="right" class="style4"><div align="left">3. Name and Address Of Consignee: &nbsp;</div></td></tr>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=consigneeName%></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=consigneeAddr%></div></td>
		</tr>
		
		</tbody></table>


		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        
		</tbody>
		</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
          <td height="30" align="right" class="style4"><div align="left">4. Station Of Origin and Destination Of &nbsp;&nbsp;&nbsp;&nbsp;Consignment: &nbsp;</div></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Station:
			<%=stationConsignment%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">Destination:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=stationDestination%></div></td>
		</tr>
		
		</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="1" colspan="4" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr></tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>     

		<tr>
          <td height="30" align="right" class="style4" colspan="3"><div align="left">5. Carrier's Receipt No and Date and &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Station: &nbsp;</div></td>
		</tr>
		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">Receipt No:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=carrierReceipt%></div></td>

			<td colspan="4" width="36%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=carrierDate%></td>

			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;Station:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=carrierStation%></div></td>

		</tr>		
		</tbody></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="4" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td></tr>



<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">6. Goods Carried At Owner's Risk or Carrier's Risk &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=goods%> </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	   <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">7. Carrier's Endorsement, If Any  Respecting <br>&nbsp;&nbsp;&nbsp;&nbsp;The Condition Of;The Packing or Container <br>&nbsp;&nbsp;&nbsp;&nbsp;Of The Consignment At The Time Of Dispatch :</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=dispatch%> </td>
        </tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        </tbody></table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	   <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">8. Give Full Description Of goods Consigned <br>&nbsp;&nbsp;&nbsp;&nbsp;and Their Value &nbsp;&nbsp;&nbsp;</div></td>
		<td width="74%" height="20" align="left" class="style3"><%=goodsDescription%>  </td>
		<tr>
<td>   &nbsp  </td>
<td>   &nbsp  </td>
</tr>
<tr>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
            </tbody></table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
  
<tbody>
 <tr><td>&nbsp</td></tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">9. Details Of Mode Of Packing &nbsp;&nbsp;&nbsp;</div></td>
		<td width="74%" height="20" align="left" class="style3"><%=packingDetails%> </td>

		<tr>
<td>   &nbsp  </td>
<td>   &nbsp  </td>
</tr>
<tr>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr></tbody></table>
        
		<table cellspacing="0" cellpadding="0" width="700" border="0">
     
<tbody> <tr><td>&nbsp</td></tr>

<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">10. When Delivery Of The Consignment Was <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Taken, Was The Outward Condition Of It <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Such As To Rouse  Suspicion About <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal Damage or  Shortage? <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Give Details. </div></td>
		<td width="74%" height="20" align="left" class="style3"><%=damageDescription%> </td>
		<tr>
<td>   &nbsp  </td>
<td>   &nbsp  </td>
</tr></tbody><table>

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
          <td width="56%" height="30" align="right" class="style4"><div align="left">11. Was Open Delivery Of The Consignment <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Obtained and Appropriate Certificate From <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Represntative Of Carriers Obtained ? <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;If Obtained The Certificate May Be Enclosed. </div></td>
		<td width="74%" height="20" align="left" class="style3"><%=certificate%> </td>
		<tr>
<td>   &nbsp  </td>
<td>   &nbsp  </td>
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
          <td width="56%" height="30" align="right" class="style3"><div align="left"><b>12.</b> (a) Date On Which Consignement Reached <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Destination (Railway Station or Careers Godowm) : &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=consignmentDate%>  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) Date On Which Delivery Was Taken: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=deliveryDate%>  </td>
        </tr>
<tr><td>&nbsp</td></tr>
<tr>


          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(c) Date Of Receipt At Consignee's Warehouse: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=warehousesDate%>  </td>
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
          <td width="56%" height="30" align="right" class="style4"><div align="left">13. State The Exact Nature Of Damage or Loss <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;and The Approximate Cause Of Loss. </div></td>
		<td width="74%" height="20" align="left" class="style3"><%=lossDescription%> </td>
		<tr><td>&nbsp;</td></tr>

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
          <td width="74%" height="20" align="left" class="style3"><%=retainSalvage%> </td>
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
          <td width="56%" height="30" align="right" class="style4"><div align="left">15. Please State The Proximate Cause Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Such Damage or Loss. </div></td>
		<td width="74%" height="20" align="left" class="style3"><%=proximateLoss%> </td>
		<tr><td>&nbsp;</td></tr>
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

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">16: As Per Policy Conditions Did You <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Immediately Lodge Claims On the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers ? If So Copies Of The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Correspondence Exchanged With The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers May Be Enclosed. </div></td>
		<td width="74%" height="20" align="left" class="style3"><%=carrierClaims%> </td>
		<tr><td>&nbsp</td></tr>
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
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">17: In Case Of Shortage Did You Make A <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Reference Of Supplier To Ascertain <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;If A Short Supply Was Made By Them <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Through Error ? </div></td>
		<td width="74%" height="20" align="left" class="style3"> <%=supplier%> </td>
		<tr><td>&nbsp;</td></tr>
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

 <tr><td>&nbsp</td></tr>
<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">18. If The Damaged  Articles Could Be <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Repaied or Reconditioned <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Indicate &nbsp;The Cost That Would <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Be Involved </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=repaid%> </td>
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

 <tr><td>&nbsp</td></tr>
		<tr>

          <td width="56%" height="30" align="right" class="style4"><div align="left">19. After Arrival Of Goods At Final <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Destination On What Date Did The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Consignee  Start Opening up And <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Inspection Of Goods.</div></td> 
		  <td width="74%" height="20" align="left" class="style3"><%=inspection%> </td>
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
		</tbody>
	</table>

 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left"><b>20.</b> (a) After Completion Of Inspection As <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stated Above On What Date Were  The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descrepancies Notified To The Insurance <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Co ? Please State The Ref.No & Date: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=inspectionDate%> </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) If There Is Any Delay In Intimating, Please <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;give The Reasons : &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=delayReason%> </td>
		<tr><td>&nbsp;</td></tr>
        
<tr><td>&nbsp</td></tr>
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
 <tr><td>&nbsp</td></tr>
<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">21. Any Other Information That Relates To This Claim :</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=otherInfo%> </td>
		<tr><td>&nbsp;</td></tr>
        
</tbody>
	</table>


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
</tbody>
	</table>
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
			<%=dispatchDate%> </div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=finalAddr%> </div></td>
		</tr>


<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Distance Of Consignee's Warehouse From <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station  </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=distance%> </td>
        </tr>
<tr><td>&nbsp</td></tr>

	<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c) On What Date Did The Goods Reached <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Final destination Named Above :</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=finalDate%> </td>
        </tr>
		<tr><td>&nbsp</td></tr>

<tr>
          <td width="56%" colspan="5" height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) If There Is Any Delay In The Goods  Reaching The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Final Destination State Reasons For The Same :</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=delayReason%> </td>
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
		  <td width="74%" height="20" align="left" class="style3"><%=transport%> </td></tr>
                
		<tr><td>&nbsp;</td></tr>
		</tbody>
	</table>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        


<tr><td>&nbsp;</td></tr>
<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> <b>24.</b>(a) What Was The External Condition Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Package When Delivered At <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Final Destination  ? </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=condition%> </td>
		<tr><td>&nbsp;</td></tr>

		<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) If Damages State The  Nature Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Damage And Attributed Cost For The Same ? </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=attributedDamage%> </td>
		<tr><td>&nbsp;</td></tr>
</tbody>
	</table>


		
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
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, Clearify That The Information Herein Given is  best of my/our knowledge and belief,  I/We Also agree To Render The Oriental Insurance Co. Ltd. All Necessary Help Requiring The Amount OF Full Loss or a part Of It Either From carriers Or From Anybody Whososever Ultimately Become Liable To Make Good The Loss .</div></td>
		</tr>

		</tbody>
		</table>&nbsp;
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=fillDate%>"> </td>
		 
         <td height="30"  align="left" class="style3"> Station Name :&nbsp;&nbsp;&nbsp;
         <%=stationName%> </td>
		 </tr>		 
		</tbody>
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
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>&nbsp;


<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">Details Of Discrepancies</span></div></td>        </tr>
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
<td width="15%" height="25" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Offer For &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retaining  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salavage </div></td>

		 </tr>
		</tr>
		 <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=mark[1]%> </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=shortage[1]%>  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=breakage[1]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=repair[1]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=cost[1]%> </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <%=salvage[1]%>  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=mark[2]%> </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=shortage[2]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=breakage[2]%>  </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=repair[2]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=cost[2]%>  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <%=salvage[2]%>  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp; <%=mark[3]%> </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=shortage[3]%>  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp; <%=breakage[3]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=repair[3]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=cost[3]%> </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <%=salvage[3]%> </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp; <%=mark[4]%> </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=shortage[4]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=breakage[4]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=repair[4]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=cost[4]%> </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <%=salvage[4]%>  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=mark[5]%> </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp; <%=shortage[5]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<%=breakage[5]%> </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=repair[5]%>  </td>
		 <td width="20%" height="20" align="left" class="style3"> <%=cost[5]%> </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <%=salvage[5]%>  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>
		 </table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="right" class="style5" id="viewAttachment"></td>
		 </tr>		 
</table>
<% } %>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
</td></tr>
</tbody></table>
<input type = "hidden" name = "hiddAssuredName" value = "<%=assuredName%>">
<input type = "hidden" name = "hiddAssuredAddr" value = "<%=assuredAddr%>">
<input type = "hidden" name = "hiddConsignorName" value = "<%=consignorName%>">
<input type = "hidden" name = "hiddConsignorAddr" value = "<%=consignorAddr%>">
<input type = "hidden" name = "hiddConsigneeName" value = "<%=consigneeName%>">
<input type = "hidden" name = "hiddConsigneeAddr" value = "<%=consigneeAddr%>">
<input type = "hidden" name = "hiddStationConsignment" value = "<%=stationConsignment%>">
<input type = "hidden" name = "hiddStationDestination" value = "<%=stationDestination%>">
<input type = "hidden" name = "hiddCarrierReceipt" value = "<%=carrierReceipt%>">
<input type = "hidden" name = "hiddCarrierDate" value = "<%=carrierDate%>">
<input type = "hidden" name = "hiddCarrierStation" value = "<%=carrierStation%>">
<input type = "hidden" name = "hiddGoods" value = "<%=goods%>">
<input type = "hidden" name = "hiddDispatch" value = "<%=dispatch%>">
<input type = "hidden" name = "hiddPackingDetails" value = "<%=packingDetails%>">
<input type = "hidden" name = "hiddDamageDescription" value = "<%=damageDescription%>">
<input type = "hidden" name = "hiddCertificate" value = "<%=certificate%>">
<input type = "hidden" name = "hiddConsignmentDate" value = "<%=consignmentDate%>">
<input type = "hidden" name = "hiddDeliveryDate" value = "<%=deliveryDate%>">
<input type = "hidden" name = "hiddWarehousesDate" value = "<%=warehousesDate%>">
<input type = "hidden" name = "hiddLossDescription" value = "<%=lossDescription%>">
<input type = "hidden" name = "hiddRetainSalvage" value = "<%=retainSalvage%>">
<input type = "hidden" name = "hiddProximateLoss" value = "<%=proximateLoss%>">
<input type = "hidden" name = "hiddCarrierClaims" value = "<%=carrierClaims%>">
<input type = "hidden" name = "hiddSupplier" value = "<%=supplier%>">
<input type = "hidden" name = "hiddRepaid" value = "<%=repaid%>">
<input type = "hidden" name = "hiddInspection" value = "<%=inspection%>">
<input type = "hidden" name = "hiddInspectionDate" value = "<%=inspectionDate%>">
<input type = "hidden" name = "hiddDelayReason" value = "<%=delayReason%>">
<input type = "hidden" name = "hiddOtherInfo" value = "<%=otherInfo%>">
<input type = "hidden" name = "hiddDispatchDate" value = "<%=dispatchDate%>">
<input type = "hidden" name = "hiddFinalAddr" value = "<%=finalAddr%>">
<input type = "hidden" name = "hiddDistance" value = "<%=distance%>">
<input type = "hidden" name = "hiddFinalDate" value = "<%=finalDate%>">
<input type = "hidden" name = "hiddTransport" value = "<%=transport%>">
<input type = "hidden" name = "hiddCondition" value = "<%=condition%>">
<input type = "hidden" name = "hiddAttributedDamage" value = "<%=attributedDamage%>">
<input type = "hidden" name = "hiddStationName" value = "<%=stationName%>">
<input type = "hidden" name = "hiddGoodsDescription" value = "<%=goodsDescription%>">
<input type = "hidden" name = "hiddDirectorySize" value = "<%=directorySize1%>">
<%
for(i = 0;i<directorySize1;i++)
{
%>
	<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName[i]%>">
<%
}
for(i = 1;i<6;i++)
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
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "formsHeaderValue" value = "2">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "<%=flag%>">
