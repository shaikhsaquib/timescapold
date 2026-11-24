<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	//String requestNo = (String)request.getParameter("hiddRequestNo");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);

	String invoiceNo = (String)request.getParameter("invoiceNo");
	String invoiceDate = (String)request.getParameter("invoiceDate");
	String blNo = (String)request.getParameter("blNo");
	String blDate = (String)request.getParameter("blDate");
	String billNo = (String)request.getParameter("billNo");
	String billDate = (String)request.getParameter("billDate");
	String item = (String)request.getParameter("item");
	String containerNo = (String)request.getParameter("containerNo");
	String repair = (String)request.getParameter("repair");	
	String total = (String)request.getParameter("total");
	String netAmt = (String)request.getParameter("netAmt");
	String fillDate = (String)request.getParameter("fillDate");
	int j;
	String fileName[] = new String[directorySize1];

	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}
	
	if(containerNo.equals(null) || containerNo.equals(""))
			containerNo = "0";
	if(item.equals(null) || item.equals(""))
			item = "0";
	if(repair.equals(null) || repair.equals(""))
			repair = "0";
	if(total.equals(null) || total.equals(""))
			total = "0";
	if(netAmt.equals(null) || netAmt.equals(""))
			netAmt = "0";

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
			<%=invoiceNo%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=invoiceDate%></div></td>
		</tr>
		
		</tbody></table>

	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  
		<tr>
          <td height="1" colspan="4"  align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr></tbody></table>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		<tr>        
          <td height="30" align="right" class="style4"><div align="left">2. B / L No. & Date: &nbsp;</div></td></tr>

		<tr>
			<td colspan="4" width="36%" height="50" align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=blNo%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=blDate%></div></td>
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
			<%=billNo%></div></td>
			<td colspan="4" width="56%"height="50" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%=billDate%></div></td>
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
          <td width="56%" height="20" align="right" class="style4"><div align="left">5. Container No. : &nbsp;&nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=containerNo%></td>
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
          <td width="74%" height="20" align="left" class="style3"><%=repair%></td>
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
          <td width="74%" height="20" align="left" class="style3"><%=total%></td>
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
          <td width="74%" height="20" align="left" class="style3"><%=netAmt%></td>
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
		<table cellspacing="0" cellpadding="0" width="700" border="0">
        <tr>
          <td height="20" colspan="100" align="center" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
</table>

		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <%=fillDate%></td>
		 </tr>		 
		</tbody>
		</table>
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
<input type = "hidden" name = "hiddBlNo" value = "<%=blNo%>">
<input type = "hidden" name = "hiddBlDate" value = "<%=blDate%>">
<input type = "hidden" name = "hiddBillNo" value = "<%=billNo%>">
<input type = "hidden" name = "hiddBillDate" value = "<%=billDate%>">
<input type = "hidden" name = "hiddItem" value = "<%=item%>">
<input type = "hidden" name = "hiddContainerNo" value = "<%=containerNo%>">
<input type = "hidden" name = "hiddRepair" value = "<%=repair%>">
<input type = "hidden" name = "hiddTotal" value = "<%=total%>">
<input type = "hidden" name = "hiddNetAmt" value = "<%=netAmt%>">
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