<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);
	//System.out.println(directorySize);

	String period = (String)request.getParameter("period");
	String insuredName = (String)request.getParameter("insuredName");
	String insuredAddr = (String)request.getParameter("insuredAddr");
	String insuredOccupation = (String)request.getParameter("insuredOccupation");
	String insuredNo = (String)request.getParameter("insuredNo");
	String lossNature = (String)request.getParameter("lossNature");
	String lossAddr = (String)request.getParameter("lossAddr");
	String missing = (String)request.getParameter("missing");
	String lossDate = (String)request.getParameter("lossDate");
	String lossTime = (String)request.getParameter("lossTime");
	String circumstances = (String)request.getParameter("circumstances");
	String itemValue = (String)request.getParameter("itemValue");
	String reportingDate = (String)request.getParameter("reportingDate");
	String reportingTime = (String)request.getParameter("reportingTime");
	String stationName = (String)request.getParameter("stationName");
	String stationAddr = (String)request.getParameter("stationAddr");
	String owner = (String)request.getParameter("owner");
	String particulars = (String)request.getParameter("particulars");
	String other = (String)request.getParameter("other");
	String additional = (String)request.getParameter("additional");
	String fileName[] = new String[directorySize1];

	int j;
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}

	String fillDate = (String)request.getParameter("fillDate");

	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");
%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
          <td>&nbsp;</td>
        </tr>		
		
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4"> ALL RISK INSURANCE CLAIM FORM</span></div></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style3">Notification of Physical Loss or Damage</span></div></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">(The issue of this form is not to be taken as an Admission of Liability) </span></div></td>
        </tr>
		</tbody></table>


		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1"  align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></div></td>
        </tr>
		 <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Period of Insurance: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=period%> </div></td>
        </tr>
        </tbody></table>



      
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 
		<tr>
          <td height="1" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td></tr></tbody></table>
        
<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">1. Details of Insured: </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(i) Name: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=insuredName%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Occupation: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=insuredOccupation%> </td>
        </tr>

		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iii) Address for correspondence: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=insuredAddr%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iv) Contact Number: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=insuredNo%></td>
        </tr>
         <tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">2. Nature of loss / damage: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lossNature%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">3. Place & address where the loss took place.: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=lossAddr%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">4. When and where was the missing property last seen?: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=missing%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">5. Date and time when the loss was first discovered: </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(i) Date: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lossDate%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Time: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lossTime%>  </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td colspan="100" height="5"></td></tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">6. State the circumstances of the loss or damage: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=circumstances%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">7. Estimated value of the item(s) lost or damaged: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=itemValue%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">8. Date and time of reporting the loss to Police Station. (Please<br>&nbsp;&nbsp;&nbsp; attach copy of FIR): </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(i) Date: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=reportingDate%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Time: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=reportingTime%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">9. Name and address of the Police Station: </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(i) Name: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=stationName%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Address: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=stationAddr%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">10. Are you the sole owner of the property?: </div></td>
          <td width="74%" height="20" align="left" class="style3"><%=owner%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
          <tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">11. Have you ever before sustained loss of the similar nature? If<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; so, give particulars: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=particulars%></td>
        </tr>
		<tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
          <tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">12. Is there any other insurance on the Property lost or damaged? If<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; so, give full particulars: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=other%></td>
        </tr>
		<tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
          <tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">13. Any additional information relevant to processing of claim: </div></td>
         <td width="74%" height="20" align="left" class="style3"><%=additional%></td>
        </tr>
		 <tr>
		<td>  &nbsp;          </td>
		<td>   &nbsp;         </td>
		
		<tr>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1"  align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        </tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		<tr>
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/We hereby agree, affirm and declare that:</div></td>
		</tr>
		<tr>
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspa) The statements/information given/stated by me/us in this Claim Form; is true, correct and complete. 
		</div></td>
		</tr>
		<tr>
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspb) The details of all persons having an interest in the property in respect of which the claim is being made are provided as per the proposal form or by way of an endorsement in the policy. Furthermore, save and except as provided or disclosed in this claim form, no claim made hereunder (or the same/similar claim) has been made or lodged with any other insurance company.
		</div></td>
		</tr>
		<tr>
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspc) No material information which is relevant to the processing of the claim or which in any manner has a bearing on the claim has been withheld or concealed.
		</div></td>
		</tr>
		<tr>
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspd) If i/we have given/made any false or fraudulent statement/information or suppressed or concealed or in any manner failed to disclose material information, the policy shall be void and that I/We shall not be entitled to all/any rights to recover thereunder in respect of any or all claims, past, present or future.
		</div></td>
		</tr>
		<tr>
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspe) The receipt of this Claim Form/other supporting/related documents does not constitute or be deemed to constitute an agreement by the Company of the claim and the Company reserves the right to process or reject or require further/additional information in respect of the claim.
		</div></td>
		</tr>
		</tbody></table>
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
		<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
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
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr><td>&nbsp;</td></tr>
		 <tr>
          <td width="74%" height="20" align="left" class="style4">

		</td></tr></table>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
<input type = "hidden" name = "hiddInsuredOccupation" value = "<%=insuredOccupation%>">
<input type = "hidden" name = "hiddPeriod" value = "<%=period%>">
<input type = "hidden" name = "hiddInsuredName" value = "<%=insuredName%>">
<input type = "hidden" name = "hiddInsuredAddr" value = "<%=insuredAddr%>">
<input type = "hidden" name = "hiddInsuredNo" value = "<%=insuredNo%>">
<input type = "hidden" name = "hiddLossNature" value = "<%=lossNature%>">
<input type = "hidden" name = "hiddLossAddr" value = "<%=lossAddr%>">
<input type = "hidden" name = "hiddMissing" value = "<%=missing%>">
<input type = "hidden" name = "hiddLossDate" value = "<%=lossDate%>">
<input type = "hidden" name = "hiddLossTime" value = "<%=lossTime%>">
<input type = "hidden" name = "hiddCircumstances" value = "<%=circumstances%>">
<input type = "hidden" name = "hiddItemValue" value = "<%=itemValue%>">
<input type = "hidden" name = "hiddReportingDate" value = "<%=reportingDate%>">
<input type = "hidden" name = "hiddReportingTime" value = "<%=reportingTime%>">
<input type = "hidden" name = "hiddStationName" value = "<%=stationName%>">
<input type = "hidden" name = "hiddStationAddr" value = "<%=stationAddr%>">
<input type = "hidden" name = "hiddOwner" value = "<%=owner%>">
<input type = "hidden" name = "hiddParticulars" value = "<%=particulars%>">
<input type = "hidden" name = "hiddOther" value = "<%=other%>">
<input type = "hidden" name = "hiddAdditional" value = "<%=additional%>">
<%
for(j = 0;j<directorySize1;j++)
{
%>
	<input type = "hidden" name = "hiddFilesName<%=j%>" value = "<%=fileName[j]%>">
<%
}
%>
<input type = "hidden" name = "hiddFillDate" value = "<%=fillDate%>">
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "formsHeaderValue" value = "3">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "<%=flag%>">
<input type = "hidden" name = "hiddDirectorySize" value = "<%=directorySize1%>">