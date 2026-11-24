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

		Hashtable fireClaimDetailHash = xmlObj.readSubNode(claimRequestDetail[1],"fireClaimForm");

%>
	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
		<tbody>
        <tr>
          <td align="center" bgcolor="#FFFFFF" height="20"><div align="center"><span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CLAIM FORM FOR STANDARD FIRE AND ALLIED PERILS</span></div></td>
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
      </tbody>
    </table>
	
      <table cellspacing="0" cellpadding="0" width="800" border="0" align="center">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="left" background="../../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
        <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">1. Name of insured: &nbsp;&nbsp;&nbsp;</div></td>
           <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("insuredName-")%></div></td>
		  </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. Address: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("area-")%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Address of premises at which the loss occurred: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("lossArea-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4. Telephone Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("insuredTelephone-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. Fax Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("insuredFax-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 6. Name of mortgagees having an interest in the property: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("mortgageName-")%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 7. Time of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireTime-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 8. Date of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireDate-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left">  9. Cause of Fire / Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireCause-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 10. Item(s) of Policy affected (give description): &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireItem-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 11. Occupation of the premises at the time of Fire/ Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireOccupation-")%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 12. Has the Fire/Loss reported to Fire Brigade/Police: &nbsp;</div></td>
           <td width="74%" height="20" align="left" class="style3"><%=(String)fireClaimDetailHash.get("fireFir-")%> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 13. Estimate of loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)fireClaimDetailHash.get("fireEstimatedLoss-")%>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 14. Details of any other insurance on the affected assets: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)fireClaimDetailHash.get("fireDetails-")%> </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td  height="30" align="right" class="style4"><div align="left">15. Details of insurance:</div></td>
        </tr>
	</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr><br></tr>
		<tr >
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name of insurers:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy No.:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="15%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Period of insurance:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detail of the Sum Insured:</div></td>
			<th width="40%"></th>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			  <%=(String)fireClaimDetailHash.get("name1-")%></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("policy1-")%></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("period1-")%></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("details1-")%></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			<%=(String)fireClaimDetailHash.get("name2-")%></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("policy2-")%></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("period2-")%></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<%=(String)fireClaimDetailHash.get("details2-")%></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <%=(String)fireClaimDetailHash.get("name3-")%></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("policy3-")%></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br> <%=(String)fireClaimDetailHash.get("period3-")%></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("details3-")%></div></td>
			<td colspan="4"></td>
		</tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
		<tr>
          <td height="1" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td  height="40" align="right" class="style4"><div align="left">16. A fire Policy being a contract of indemnity only, all claims must be based upon the actual value of 'Goods' at the time of fire, excluding any profit whatsoever :</div></td>
        </tr>
	</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr><br></tr>
		<tr bgcolor="#E0E0E0">
			<th colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Item no. of the Policy:</div></td>
			<th colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of the article claimed:</div></td>
			<!-- <td><input type="text" name="make" class="style3" size="26"></td> -->
			<th colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left">Value at the time of fire (Rs.):</div></td>
			<th colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deduction for
			value of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salvage:</div></td>
			<th colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Net amount of claim (Rs.):</div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br>1.<%=(String)fireClaimDetailHash.get("itemPolicy1-")%></div></td>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			<%=(String)fireClaimDetailHash.get("claimedArticle1-")%></div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("articleValue1-")%></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("salvageValue1-")%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("claimedAmmount1-")%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br>2.<%=(String)fireClaimDetailHash.get("itemPolicy2-")%></div></td>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("claimedArticle2-")%> </div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("articleValue2-")%></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("salvageValue2-")%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("claimedAmmount2-")%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br>3.<%=(String)fireClaimDetailHash.get("itemPolicy3-")%></div></td>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("claimedArticle3-")%> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("articleValue3-")%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("salvageValue3-")%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("claimedAmmount3-")%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br>4.<%=(String)fireClaimDetailHash.get("itemPolicy4-")%></div></td>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			<%=(String)fireClaimDetailHash.get("claimedArticle4-")%> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("articleValue4-")%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("salvageValue4-")%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("claimedAmmount4-")%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br>5.<%=(String)fireClaimDetailHash.get("itemPolicy5-")%></div></td>
			<td colspan="4" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=(String)fireClaimDetailHash.get("claimedArticle5-")%> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=(String)fireClaimDetailHash.get("articleValue5-")%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("salvageValue5-")%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(String)fireClaimDetailHash.get("claimedAmmount5-")%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		</tbody></table>
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
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we hereby declare that the foregoing particulars and statements made by me/us in the claim form are true and correct to the best of my/our knowledge and belief and I/we have not withheld any material information which has a bearing upon the claim.</div></td>
		</tr>
		</tbody>
		</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  	<tr>
         <td height="30"  align="left" class="style3"> Dated at:&nbsp;&nbsp;&nbsp;
         <input type="text" name="fillDate" size="26" class="style3" value = "<%=(String)fireClaimDetailHash.get("fillDate-")%>"> </td>
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
