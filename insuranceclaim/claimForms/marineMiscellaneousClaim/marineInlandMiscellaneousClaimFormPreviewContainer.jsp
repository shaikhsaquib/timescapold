<%
	String policyNumber = "";
    String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String invoiceNo = (String)request.getParameter("invoiceNo");
	String invoiceDate = (String)request.getParameter("invoiceDate");
	String lrNo = (String)request.getParameter("lrNo");
	String lrDate = (String)request.getParameter("lrDate");
	String item = (String)request.getParameter("item");
	String repairCos = (String)request.getParameter("repairCos");
	String charges = (String)request.getParameter("charges");
	String cost = (String)request.getParameter("cost");
	String claimAmt = (String)request.getParameter("claimAmt");
	String lessExcess = (String)request.getParameter("lessExcess");
	String netClaimAmt = (String)request.getParameter("netClaimAmt");
	String fillDate = (String)request.getParameter("fillDate");
	String fileName[] = new String[directorySize1];
	int j;
	
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
    policyNumber = (String)approverClaimDetails.get("policyNumber-");
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">MARINE INLAND MISCELLANEOUS CLAIM FORM</span></div></td>
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
			<%=invoiceNo%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=invoiceDate%></div></td>
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
          <td height="30" align="right" class="style4"><div align="left">2. LR No. & Date: &nbsp;</div></td>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=lrNo%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=lrDate%></div></td>
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
          <td width="74%" height="20" align="left" class="style3"><%=item%></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">4. Repair cos / Value of the damaged Item : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=repairCos%></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">5. Add 10.00 % for Misc Charges ( Rs. ) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=charges%></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">6. Less Salvage Cost ( Rs. ) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=cost%></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">7. Amount of Claim ( Damaged Value-Salavage Value) Rs : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=claimAmt%></td>
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
	  
<%
            if (companyName.equals("Bennett, Coleman & Co. Ltd.")){
				
%>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">8. Deductable ( Rs 20000/-): &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lessExcess%></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>
<%
		} else {
				
%>

<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
		<tr>
          <td width="56%" height="20" align="right" class="style4"><div align="left">8. Less Excess ( Rs 5000/- as per Policy ) : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lessExcess%></td>
        </tr>
		<tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
	</tbody></table>
<%
		} 
				
%>

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
          <td width="74%" height="20" align="left" class="style3"><%=netClaimAmt%></td>
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
	  	 
		</tbody>
		</table>
		 <table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../../images/spacer.gif" width="1" /></td>
        </tr>
		<!-- <tr>
			<td height="30" colspan="2" align="right" class="style5" id="viewAttachment"></td>
		 </tr>	 -->	 
	</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <%=fillDate%></td>
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
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
</td></tr>
</tbody></table>
<input type = "hidden" name = "hiddInvoiceNo" value = "<%=invoiceNo%>">
<input type = "hidden" name = "hiddInvoiceDate" value = "<%=invoiceDate%>">
<input type = "hidden" name = "hiddLrNo" value = "<%=lrNo%>">
<input type = "hidden" name = "hiddLrDate" value = "<%=lrDate%>">
<input type = "hidden" name = "hiddItem" value = "<%=item%>">
<input type = "hidden" name = "hiddRepairCos" value = "<%=repairCos%>">
<input type = "hidden" name = "hiddCharges" value = "<%=charges%>">
<input type = "hidden" name = "hiddCost" value = "<%=cost%>">
<input type = "hidden" name = "hiddClaimAmt" value = "<%=claimAmt%>">
<input type = "hidden" name = "hiddLessExcess" value = "<%=lessExcess%>">
<input type = "hidden" name = "hiddNetClaimAmt" value = "<%=netClaimAmt%>">

<%
for(int i = 0;i<directorySize1;i++)
{
%>
	<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName[i]%>">
<%
}
%>
<input type = "hidden" name = "hiddFillDate" value = "<%=fillDate%>">
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "formsHeaderValue" value = "2">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "<%=flag%>">
<input type = "hidden" name = "hiddDirectorySize" value = "<%=directorySize1%>">


