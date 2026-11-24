<%
	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String claimNumber = (String)request.getParameter("claimNumber");

	Object objArr1[] = new Object[3];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = claimNumber;

	Hashtable claimDetailsHash = new Hashtable();
	claimDetailsHash.put("queryId", "1000");
	claimDetailsHash.put("arguments", objArr1);

	ArrayList myViewClaimRequest = insuranceClaimController.viewClaimDetails(claimDetailsHash);



	if(myViewClaimRequest.size() >0)
	{
		String[] myViewClaimRequestValues = (String[])myViewClaimRequest.get(0);

		Hashtable claimFormDetails = xmlObj.readSubNode(myViewClaimRequestValues[2], "marineClaimForm");
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
		 <td align="left" class="style3"><%=myClaimRequestValues[1]%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Policy No:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyNumber-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company Name:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyInsuCompany-")%></td> 
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
			<select name = "assuredName" class="style3" id="assuredName" onchange="addressMarine()">
<%
		if(((String)claimFormDetails.get("assuredName-")).equals("BCCL"))
		{
%>
				<option value = "BCCL" selected>BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL">TVL</option>
<%
		}else if(((String)claimFormDetails.get("assuredName-")).equals("ENIL")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL" selected>ENIL</option>
				<option value = "TVL">TVL</option>
<%
		}else if(((String)claimFormDetails.get("assuredName-")).equals("TVL")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL" selected>TVL</option>
<%
		}
%>
			</select> </td></div></td>
			<td colspan="4" width="56%"height="50"  class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="assuredAddr" class="style3" readonly></textarea></div></td>
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
			<input type="text" name="consignorName" class="style3" size="26" value="<%=(String)claimFormDetails.get("consignorName-")%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consignorAddr" class="style3"><%=(String)claimFormDetails.get("consignorAddr-")%></textarea></div></td>
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
			<input type="text" name="consigneeName" class="style3" size="26" value="<%=(String)claimFormDetails.get("consignorName-")%>"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consigneeAddr" class="style3"><%=(String)claimFormDetails.get("consigneeAddr-")%></textarea></div></td>
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
			<input type="text" name="stationConsignment" class="style3" size="26" value="<%=(String)claimFormDetails.get("stationConsignment-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">Destination:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="stationDestination" class="style3" size="26" value="<%=(String)claimFormDetails.get("stationDestination-")%>"></div></td>
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
			<input type="text" name="carrierReceipt" class="style3" size="26" value="<%=(String)claimFormDetails.get("carrierReceipt-")%>"></div></td>

			<td colspan="4" width="36%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)claimFormDetails.get("carrierDate-")%>"></div></td>

			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;Station:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierStation" class="style3" size="26" value="<%=(String)claimFormDetails.get("carrierStation-")%>"></div></td>

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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="goods" class="style3" size="26" value="<%=(String)claimFormDetails.get("goods-")%>">  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="dispatch" class="style3" size="26" value="<%=(String)claimFormDetails.get("dispatch-")%>">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="goodsDescription" cols="35" class="style3"><%=(String)claimFormDetails.get("goodsDescription-")%></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="packingDetails" cols="35" class="style3"><%=(String)claimFormDetails.get("packingDetails-")%></textarea>  </td>

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
		<td width="74%" height="20" align="left" class="style3"><textarea name="damageDescription" cols="35" class="style3"><%=(String)claimFormDetails.get("damageDescription-")%></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="certificate" cols="35" class="style3"><%=(String)claimFormDetails.get("certificate-")%></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="consignmentDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)claimFormDetails.get("consignmentDate-")%>">  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) Date On Which Delivery Was Taken: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="deliveryDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)claimFormDetails.get("deliveryDate-")%>">  </td>
        </tr>
<tr><td>&nbsp</td></tr>
<tr>


          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(c) Date Of Receipt At Consignee's Warehouse: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="warehousesDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)claimFormDetails.get("warehousesDate-")%>">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="lossDescription" cols="35" class="style3"><%=(String)claimFormDetails.get("lossDescription-")%></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part1()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 
 
	<table cellspacing="0" cellpadding="0" width="700" border="0">
        
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
	<input type = "hidden" name = "hiddFlag" value = "partialUpdateClaim">
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

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
	<tbody>
		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Claim No:</span></div></td>
		 <td align="left" class="style3"><%=myClaimRequestValues[1]%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Policy No:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyNumber-")%></td> 
		 <td align="left"  width="26%" bgcolor="#FFFFFF" height="30"><div align="center" width="76%"><span class="style4">&nbsp</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company Name:</span></div></td>
		 <td align="left" class="style3"><%=(String)approverClaimDetails.get("policyInsuCompany-")%></td> 
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
			<select name = "assuredName" class="style3" id="assuredName" onchange="addressMarine()">
				<option value = "BCCL" selected>BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL">TVL</option>
			</select> </td></div></td>
			<td colspan="4" width="56%"height="50"  class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="assuredAddr" class="style3" readonly></textarea></div></td>
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
			<input type="text" name="consignorName" class="style3" size="26"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consignorAddr" class="style3"></textarea></div></td>
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
			<input type="text" name="consigneeName" class="style3" size="26"></div></td>
			<td colspan="4" width="56%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea cols="35" name="consigneeAddr" class="style3"></textarea></div></td>
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
			<input type="text" name="stationConsignment" class="style3" size="26"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">Destination:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="stationDestination" class="style3" size="26"></div></td>
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
			<input type="text" name="carrierReceipt" class="style3" size="26"></div></td>

			<td colspan="4" width="36%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly></div></td>

			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;Station:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="carrierStation" class="style3" size="26"></div></td>

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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="goods" class="style3" size="26">  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="dispatch" class="style3" size="26">  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="goodsDescription" cols="35" class="style3"></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="packingDetails" cols="35" class="style3"></textarea>  </td>

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
		<td width="74%" height="20" align="left" class="style3"><textarea name="damageDescription" cols="35" class="style3"></textarea>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="certificate" cols="35" class="style3"></textarea>  </td>
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
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="consignmentDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly>  </td>
        </tr>
		<tr><td>&nbsp</td></tr>

		<tr>
          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(b) Date On Which Delivery Was Taken: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="deliveryDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly>  </td>
        </tr>
<tr><td>&nbsp</td></tr>
<tr>


          <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;(c) Date Of Receipt At Consignee's Warehouse: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="warehousesDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly>  </td>
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
		<td width="74%" height="20" align="left" class="style3"><textarea name="lossDescription" cols="35" class="style3"></textarea>  </td>
		<tr><td>&nbsp;</td></tr>
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_validate_part1()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Next
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset</td>
        </tr>
	</table> 
 
<table cellspacing="0" cellpadding="0" width="700" border="0">
        
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
<input type = "hidden" name = "hiddFlag" value = "submitClaim">
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddformsHeaderValue" value = "2">
