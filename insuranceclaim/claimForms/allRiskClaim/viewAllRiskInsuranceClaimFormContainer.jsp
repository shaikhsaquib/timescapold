<%
	String claimNumber = (String)request.getParameter("claimNumber");

	Object objArr1[] = new Object[3];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr1);

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable approverClaimDetails = xmlObj.readSubNode(myClaimRequestValues[13], "approverClaimDetails");

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'" ;
	objArr[1] = claimNumber ;

	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId","1000");
	searchHash.put("arguments",objArr);

	ArrayList fireClaimDetails = insuranceClaimController.viewClaimDetails(searchHash);

	for (int i = 0; i < fireClaimDetails.size(); i++)
	{
		String claimRequestDetail[] = (String[]) fireClaimDetails.get(i);

		Hashtable allRiskClaimDetailHash = xmlObj.readSubNode(claimRequestDetail[3],"allriskClaimForm");

%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../../images/bg.png">
  
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
          <td width="100%" colspan="4" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td colspan="100%"align="right" class="redbold">
				Print
				<a href="javascript:void window.print()"><img src="../../images/print.gif" border="0"></a>
			</td>
		</tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style3">Notification of Physical Loss or Damage</span></div></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">(The issue of this form is not to be taken as an Admission of Liability) </span></div></td>
        </tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
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
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("period-")%> </div></td>
        </tr> 
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Period of Insurance: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)allRiskClaimDetailHash.get("period-")%> </div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
      </tbody>
    </table>
	
     <table cellspacing="0" cellpadding="0" width="700" border="0">
		 <tbody>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">1. Details of Insured: </div></td>
          <td width="74%" height="20" align="left" class="style3">&nbsp;</td>
        </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(i) Name: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("insuredName-")%></td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Occupation: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("insuredOccupation-")%> </td>
        </tr>

		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iii) Address for correspondence: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("insuredAddr-")%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(iv) Contact Number: </div></td>
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("insuredNo-")%></td>
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
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("lossNature-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">3. Place & address where the loss took place.: </div></td>
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("lossAddr-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">4. When and where was the missing property last seen?: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("missing-")%></td>
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
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("lossDate-")%>  </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Time: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("lossTime-")%></td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		 <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td colspan="100" height="5"></td></tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">6. State the circumstances of the loss or damage: </div></td>
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("circumstances-")%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">7. Estimated value of the item(s) lost or damaged: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("itemValue-")%>  </td>
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
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("reportingDate-")%>  </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Time: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("reportingTime-")%>  </td>
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
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("stationName-")%> </td>
        </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(ii) Address: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("stationAddr-")%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		   <tr>
          <td colspan="100" height="5"></td></tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">10. Are you the sole owner of the property?: </div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("owner-")%> </td>
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
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("particulars-")%></td>
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
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("other-")%></td>
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
         <td width="74%" height="20" align="left" class="style3"> <%=(String)allRiskClaimDetailHash.get("additional-")%></td>
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
        <td width="56%" height="30" align="right" class="style3"><div align="left">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp) The statements/information given/stated by me/us in this Claim Form; is true, correct and complete. 
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
         <input type="text" name="fillDate" size="26" class="style3" value = "<%=(String)allRiskClaimDetailHash.get("fillDate-")%>"> </td>
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
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
<%
	}
%>			
<input type = "hidden" name = "hiddRequestNumber" value = "<%=requestNo%>" />
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
