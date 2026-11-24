<%
	String claimNumber = (String)request.getParameter("claimNumber");
	String requestNo = (String)request.getParameter("requestNo");

	Object objArr1[] = new Object[3];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = requestNo;

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;

	Hashtable claimFormDetailHash = new Hashtable( );
	claimFormDetailHash.put("queryId", "1000");
	claimFormDetailHash.put("arguments", objArr);

	ArrayList myClaimFormDetails = new ArrayList();
	myClaimFormDetails = insuranceClaimController.viewClaimDetails(claimFormDetailHash);

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");

	for (int j = 0; j < myClaimFormDetails.size(); j++)
	{
		String claimFormDetail[] = (String[]) myClaimFormDetails.get(j);

		Hashtable marineClaimDetailHash = xmlObj.readSubNode(claimFormDetail[2],"marineClaimForm");

%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE INLAND TRANSIT CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Claim No:</span></div></td>
		 <td align="left"><%=myClaimRequestValues[1]%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Policy No:</span></div></td>
		 <td align="left"><%=(String)approverClaimDetails.get("policyNumber-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company Name:</span></div></td>
		 <td align="left"><%=(String)approverClaimDetails.get("policyInsuCompany-")%></td> 
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
			<input type="text" name="assuredName" class="style3" size="26" value = "<%=(String)marineClaimDetailHash.get("assuredName-")%>"></div></td>
			<td colspan="4" width="56%"height="50"  class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="assuredAddr" class="style3"><%=(String)marineClaimDetailHash.get("assuredAddr-")%></textarea></div></td>
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
			<input type="text" name="consignorName" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("consignorName-")%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consignorAddr" class="style3"><%=(String)marineClaimDetailHash.get("consignorAddr-")%></textarea></div></td>
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
			<input type="text" name="consigneeName" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("consigneeName-")%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consigneeAddr" class="style3"><%=(String)marineClaimDetailHash.get("consigneeAddr-")%></textarea></div></td>
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
			<input type="text" name="stationConsignment" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("stationConsignment-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">Destination:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="stationDestination" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("stationDestination-")%>"></div></td>
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
			<input type="text" name="carrierReceipt" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("carrierReceipt-")%>"></div></td>

			<td colspan="4" width="36%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("carrierDate-")%>"></div></td>

			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;Station:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierStation" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("carrierStation-")%>"></div></td>

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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="goods" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("goods-")%>">  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="dispatch" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("dispatch-")%>">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="goodsDescription" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("goodsDescription-")%></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="packingDetails" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("packingDetails-")%></textarea>  </td>

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
		<td width="74%" height="20" align="left" class="style3"><textarea name="damageDescription" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("damageDescription-")%></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="certificate" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("certificate-")%></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="consignmentDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("consignmentDate-")%>">  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) Date On Which Delivery Was Taken: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="deliveryDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("deliveryDate-")%>">  </td>
        </tr>
<tr><td>&nbsp</td></tr>
<tr>


          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(c) Date Of Receipt At Consignee's Warehouse: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="warehousesDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("warehousesDate-")%>">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="lossDescription" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("lossDescription-")%></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="retainSalvage" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("retainSalvage-")%>">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="proximateLoss" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("proximateLoss-")%></textarea>  </td>
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
          <td width="56%" height="30" align="right" class="style4"><div align="left">16: As Per Policy Conditions Did You <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Immediately Lodge Claims On the <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers ? If So Copies Of The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Correspondence Exchanged With The <br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;Carriers May Be Enclosed. </div></td>
		<td width="74%" height="20" align="left" class="style3"><textarea name="carrierClaims" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("carrierClaims-")%></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="supplier" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("supplier-")%></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="repaid" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("repaid-")%>">  </td>
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
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspection" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("inspection-")%>">  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="inspectionDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("inspectionDate-")%>">  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) If There Is Any Delay In Intimating, Please <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;give The Reasons : &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReason" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("delayReason-")%></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><textarea name="otherInfo" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("otherInfo-")%></textarea>  </td>
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
			<input type="text" name="dispatchDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("dispatchDate-")%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="finalAddr" class="style3"> <%=(String)marineClaimDetailHash.get("finalAddr-")%></textarea></div></td>
		</tr>


<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) Distance Of Consignee's Warehouse From <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Destination Railway Station  </div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="distance" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("distance-")%>">  </td>
        </tr>
<tr><td>&nbsp</td></tr>

	<tr>
          <td width="56%" colspan="5"height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c) On What Date Did The Goods Reached <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Final destination Named Above :</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="finalDate" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("finalDate-")%>">  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

<tr>
          <td width="56%" colspan="5" height="30" align="right" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(d) If There Is Any Delay In The Goods  Reaching The <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Final Destination State Reasons For The Same :</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="delayReason" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("delayReason-")%></textarea>  </td>
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
		  <td width="74%" height="20" align="left" class="style3"><input type="text" name="transport" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("transport-")%>">  </td></tr>
                
		<tr><td>&nbsp;</td></tr>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="5" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        


<tr><td>&nbsp;</td></tr>
<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> <b>24.</b>(a) What Was The External Condition Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;The Package When Delivered At <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Final Destination  ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="condition" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("condition-")%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>

		<tr>
          <td width="56%"  height="30" align="right" class="style3"><div align="left"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(b) If Damages State The  Nature Of <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;Damage And Attributed Cost For The Same ? </div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="attributedDamage" cols="35" class="style3"><%=(String)marineClaimDetailHash.get("attributedDamage-")%></textarea>  </td>
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
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, Clearify That The Information Herein Given is  best of my/our knowledge and belief,  I/We Also agree To Render The Oriental Insurance Co. Ltd. All Necessary Help Requiring The Amount OF Full Loss or a part Of It Either From carriers Or From Anybody Whososever Ultimately Become Liable To Make Good The Loss .</div></td>
		</tr>

		</tbody>
		</table>&nbsp;
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=(String)marineClaimDetailHash.get("fillDate-")%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readonly> </td>
		 
         <td height="30"  align="left" class="style3"> Station Name :&nbsp;&nbsp;&nbsp;
         <input type="text" name="stationName" size="26" class="style3" value="<%=(String)marineClaimDetailHash.get("stationName-")%>"> </td>
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
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("mark1-")%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("shortage1-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("breakage1-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("repair1-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("cost1-")%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage1" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("salvage1-")%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("mark2-")%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("shortage2-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("breakage2-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("repair2-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("cost2-")%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage2" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("salvage2-")%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("mark3-")%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("shortage3-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("breakage3-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("repair3-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("cost3-")%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage3" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("salvage3-")%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("mark4-")%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("shortage4-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("breakage4-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("repair4-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("cost4-")%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage4" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("salvage4-")%>">  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>

		  <tr>
 		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="mark5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("mark5-")%>">  </td>
		 <!-- <td width="15%" height="20" align="left" class="style3"><textarea name="purpose" cols="15" class="style3"></textarea> </td>	 -->
  	 	 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="shortage5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("shortage5-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;<input type="text" name="breakage5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("breakage5-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="repair5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("repair5-")%>">  </td>
		 <td width="20%" height="20" align="left" class="style3"> <input type="text" name="cost5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("cost5-")%>">  </td>	
		 <td width="20%" height="20" align="left" class="style3"> &nbsp;&nbsp;&nbsp; <input type="text" name="salvage5" class="style3" size="15" value="<%=(String)marineClaimDetailHash.get("salvage5-")%>" >  </td>	
		 </tr>
		 <tr><td>   &nbsp;         </td></tr>
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
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_validate()">Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;"> &nbsp;Reset&nbsp;</td>
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
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "updateClaim">
