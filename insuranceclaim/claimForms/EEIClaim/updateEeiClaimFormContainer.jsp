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
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INSURANCE IMPORT TRANSIT CLAIM FORM</span></div></td>
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
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;The Oriental Insurance Company Ltd.<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;16/20, WEA, P.S.Road, Karol Bagh<br>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;New Delhi - 110005<br></span></div></td>
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
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        
		</tbody>
		</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
          <td height="30" align="right" class="style4"><div align="left">2. Bill of Lading No. & Date: &nbsp;</div></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="ladingNo" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("ladingNo-")%>"></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="text" name="ladingDate" class="style3" size="26" onfocus="showCalendarControl(this);" readonly value="<%=(String)marineClaimDetailHash.get("ladingDate-")%>"></div></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">3. Item: &nbsp;&nbsp;&nbsp;</div></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">4. Gross Weight ( in Kg. ) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="grossWt" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("grossWt-")%>" onblur="field1()"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">5. Damaged Quantity (In Kg.) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="damaged" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("damaged-")%>" onblur="field2();"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">6. Rate per Kg. : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="rate" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("rate-")%>" onblur="field3();"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">7. Invoice value of the material : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="material" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("material-")%>" readonly  STYLE="background:#F8F8FF;"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">8. Damage value : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="damageValue" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("damageValue-")%>" readonly  STYLE="background:#F8F8FF;"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">9. Salvage Rate (Per Kg.) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="salvageRate" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("salvageRate-")%>" onblur="field7();"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">10. Salvage value of the material : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="salvageMaterial" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("salvageMaterial-")%>" readonly STYLE="background:#F8F8FF;"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">11. Amount for claim (Damaged value - Salvage value) (Rs.) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="claimAmt" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("claimAmt-")%>" readonly STYLE="background:#F8F8FF;"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">12. Rewinding Charges : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="rewind" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("rewind-")%>" onblur="field9();"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">13. ADD 10% of CFR Vaule : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="cfr" class="style3" size="26" value="<%=(String)marineClaimDetailHash.get("cfr-")%>" readonly STYLE="background:#F8F8FF;"></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">14. Total : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">15. less Excess 5000 : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">16. Net claim amount  (Rs.) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
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
		  <td align="left"   bgcolor="#FFFFFF" height="20"><div align="left" ><span class="style4">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp&nbsp&nbsp&nbsp;For <%=companyName%> </span></div></td>		 
		  <td align="left">&nbsp;</td>
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
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value = "<%=(String)marineClaimDetailHash.get("fillDate-")%>" onfocus="onLoadDetail(<%=requestNo%>,'frmMarineInsuranceClaim');" readonly> </td>
		 </tr>		 
		</tbody>
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
				<input type="checkbox" name="lading">Landing Certificate with remarks for short delivery / damage<br>
				<input type="checkbox" name="custom">Custom clearance certificate<br>
				<input type="checkbox" name="joint">Joint Survey with shipping company / Port Trust Authority<br>  
				<input type="checkbox" name="gr">GR / RR<br>
				<input type="checkbox" name="delivery">Delivery Receipt with remarks for short delivery / damage<br> 
				<input type="checkbox" name="survey">Survey Report & Duly paid Survey fee bill<br> 
				<input type="checkbox" name="sale">Sale Contract<br>
				<input type="checkbox" name="photos">Photographs of Damaged Property showing extent of damage & / or video film of loss<br>
				<input type="checkbox" name="policy">Original Policy / Certificate / Covernote duly discharged by Assussed / Consignor<br>
				<input type="checkbox" name="copy">Copy of Regd. A.D. letter lodging claim on Shipping Co. / Air Carrier with monitary claim & reply of shipping co.<br>
				<input type="checkbox" name="letter">Letter of subrogation cum undertaking<br>
				<input type="checkbox" name="bill">Bill of entry<br>
				<input type="checkbox" name="origin">Certificate of Origin<br>
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "marine_inland_validate()">Preview
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
