<%
	String claimNumber = (String)request.getParameter("claimNumber");
	//String requestNo = (String)request.getParameter("requestNo");

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
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE CONTAINER TRANSIT CLAIM FORM</span></div></td>
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

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
		<tbody>		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;To,<br><br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;IFFCO Tokio General Insurance Co. Ltd.<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;IFFCO House., 2nd & 3rd Floor, 34 Nehru Place<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;New Delhi – 110019<br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Sub : Submission of claim documents under the Marine Import Policy</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Insurance Company We are enclosing all relevant documents in relation to the above subject claim along with the claim bill &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;given below :</span></div></td>		 
		  <td align="left">&nbsp;</td>
		  </tr>
		</tbody>
		</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
		<tr>
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
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
		<tr>
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
         
          </tr></tbody></table>


<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="4"  align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr></tbody></table>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
<tr>        
          <td height="30" align="right" class="style4"><div align="left">1. Invoice No. & Date: &nbsp;</div></td></tr>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="invoiceNo" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("invoiceNo-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="invoiceDate" class="style3" size="26" onfocus="showCalendarControl(this);" value="<%=(String)marineClaimDetailHash.get("invoiceDate-")%>" readonly></div></td>
		</tr>
		
		</tbody></table>


	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>        
          <td height="30" align="right" class="style4"><div align="left">2. B / L No. & Date: &nbsp;</div></td></tr>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="blNo" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("blNo-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="blDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("blDate-")%>"></div></td>
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
          <td height="30" align="right" class="style4"><div align="left">3. Bill No. & Date: &nbsp;</div></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="billNo" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("billNo-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="billDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("billDate-")%>"></div></td>
			<tr><td height="20"></td></tr>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">4. Item: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="item" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("item-")%>"></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		</tbody></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">5. Container No. : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="containerNo" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("containerNo-")%>"></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">6. Repair Cost  : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="repair" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("repair-")%>" onblur="field();"></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">7. Total : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="total" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("total-")%>" readonly STYLE="background:#F8F8FF;"></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">8. less Excess 5000 : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3">5000</td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
       </tbody></table>
	  

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">9. Net claim amount  (Rs.) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="netAmt" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("netAmt-")%>" readonly STYLE="background:#F8F8FF;"></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
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

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="15">
		<tbody>		
		<tr>
		 <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Kindly process the claim.<br></span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;Your's Sincerely</span></div></td>
		  <td align="left">&nbsp;</td>
		  </tr>
		  <tr>
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;For <%=companyName%></span></div></td>		 
		  <td align="left">&nbsp;</td>
		  </tr>
		</tbody>
		</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value="<%=(String)marineClaimDetailHash.get("fillDate-")%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readOnly> </td>
		 </tr>		 
</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>Marine Loss of cargo / machinery during Import</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="intimation">Copy of Claim intimation given to Company together with xerox of policy & premium receipt<br>				
				<input type="checkbox" name="invoice">Invoice & Packing list<br>
				<input type="checkbox" name="report">Bill of lading / Airways Bill<br>
				<input type="checkbox" name="survey">Survey Report & Duly paid Survey fee bill<br>
				<input type="checkbox" name="photos">Photographs of Damaged Property showing extent of damage & / or video film of loss<br>
				<input type="checkbox" name="sale">Sale Contract<br>
				<input type="checkbox" name="policy">Original Policy / Certificate / Covernote duly discharged by Assussed / Consignor<br>
				<input type="checkbox" name="copy">Copy of Regd. A.D. letter lodging claim on Shipping Co. / Air Carrier with monitary claim & reply of shipping co.<br>
				<input type="checkbox" name="letter">Letter of subrogation cum undertaking<br>				
				<input type="checkbox" name="bank">Bank's letter certifying non-receipt of report proceeds<br>
				<input type="checkbox" name="joint">Joint Survey Report from the carrier's agent<br>  				
				<input type="checkbox" name="origin">Certificate of Origin<br>
				<input type="checkbox" name="duly">Duly Certified copy of Invoice by Bank<br>
			</td>
		 </tr>			
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_container_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset&nbsp;</td>
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
