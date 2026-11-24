<%
	String claimNumber = (String)request.getParameter("claimNumber");

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

		Hashtable fireClaimDetailHash = xmlObj.readSubNode(claimFormDetail[1],"fireClaimForm");

		String insuredName = (String)fireClaimDetailHash.get("insuredName-");
		//out.println(insuredName);

%>

	<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" >
		<tbody>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="20"><div align="center"><span class="style5">CLAIM FORM FOR STANDARD FIRE AND ALLIED PERILS</span></div></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Claim Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=myClaimRequestValues[1]%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		<tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Policy Number: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyNumber-")%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		  <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left"> Insurance Company: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"> <%=(String)approverClaimDetails.get("policyInsuCompany-")%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr>
      </tbody>
    </table>
	
      <table cellspacing="0" cellpadding="0" width="700" border="0">
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
           <td width="74%" height="20" align="left" class="style3"><select name = "insuredName" class="style3" id="insuredName" onchange="addressFire()">
<%
		if(insuredName.equals("BCCL"))
		{
%>
				<option value = "BCCL" selected>BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL">TVL</option>
				<option value = "TGBCL">TGBCL</option>
				<option value = "TIML">TIML</option>
<%
		}else if(insuredName.equals("ENIL")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL" selected>ENIL</option>
				<option value = "TVL">TVL</option>
				<option value = "TGBCL">TGBCL</option>
				<option value = "TIML">TIML</option>
<%
		}else if(insuredName.equals("TVL")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL" selected>TVL</option>
				<option value = "TGBCL">TGBCL</option>
				<option value = "TIML">TIML</option>
<%
		}else if(insuredName.equals("TGBCL")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL" >TVL</option>
				<option value = "TGBCL" selected>TGBCL</option>
				<option value = "TIML">TIML</option>
<%
		}else if(insuredName.equals("TIML")){	
%>
				<option value = "BCCL">BCCL</option>
				<option value = "ENIL">ENIL</option>
				<option value = "TVL" >TVL</option>
				<option value = "TGBCL">TGBCL</option>
				<option value = "TIML" selected>TIML</option>
<%
		}
%>				</select> </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. Address: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="area" cols="35"  class="style3" ><%=(String)fireClaimDetailHash.get("area-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Address of premises at which the loss occurred: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="lossArea" cols="35" class="style3" ><%=(String)fireClaimDetailHash.get("lossArea-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4. Telephone Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredTelephone" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("insuredTelephone-")%>"></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. Fax Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="insuredFax" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("insuredFax-")%>">  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 6. Name of mortgagees having an interest in the property: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="mortgageName" cols="35" class="style3" ><%=(String)fireClaimDetailHash.get("mortgageName-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 7. Time of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="fireTime" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("fireTime-")%>">  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 8. Date of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="fireDate" class="style3" size="17" onfocus="showCalendarControl(this);" readonly value="<%=(String)fireClaimDetailHash.get("fireDate-")%>"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left">  9. Cause of Fire / Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireCause" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("fireCause-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 10. Item(s) of Policy affected (give description): &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireItem" cols="35" class="style3" ><%=(String)fireClaimDetailHash.get("fireItem-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 11. Occupation of the premises at the time of Fire/ Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireOccupation" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("fireOccupation-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 12. Has the Fire/Loss reported to Fire Brigade/Police: &nbsp;</div></td>
          <td><input type="text" name="fireFir" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("fireFir-")%>">   </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 13. Estimate of loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><input type="text" name="fireEstimatedLoss" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("fireEstimatedLoss-")%>"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 14. Details of any other insurance on the affected assets: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireDetails" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("fireDetails-")%></textarea>  </td>
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
			 <input type="text" name="name1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("name1-")%>"></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <input type="text" name="policy1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("policy1-")%>"></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="period1" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("period1-")%>"> </div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="details1" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("details1-")%>"></div></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <input type="text" name="name2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("name2-")%>"></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <input type="text" name="policy2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("policy2-")%>"></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="period2" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("period2-")%>"> </div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="details2" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("details2-")%>"></div></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <input type="text" name="name3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("name3-")%>"></div></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <input type="text" name="policy3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("policy3-")%>"></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="period3" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("period3-")%>"> </div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="details3" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("details3-")%>"></div></td>
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
			<th colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Item no. of the Policy:</div></td>
			<th colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of the article claimed:</div></td>
			<!-- <td><input type="text" name="make" class="style3" size="26"></td> -->
			<th colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left">Value at the time of fire (Rs.):</div></td>
			<th colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deduction for
			value of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salvage:</div></td>
			<th colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Net amount of claim (Rs.):</div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br>1.<input type="text" name="itemPolicy1" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("itemPolicy1-")%>"></div></td>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <textarea cols="30" name="claimedArticle1" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle1-")%></textarea> </div></td>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue1-")%>"></div></td>
			<td colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue1-")%>"></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount1-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br>2.<input type="text" name="itemPolicy2" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("itemPolicy2-")%>"></div></td>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <textarea cols="30" name="claimedArticle2" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle2-")%></textarea> </div></td>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue2-")%>"></div></td>
			<td colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue2-")%>"></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount2-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br>3.<input type="text" name="itemPolicy3" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("itemPolicy3-")%>"></div></td>
			<td colspan="5" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <textarea cols="30" name="claimedArticle3" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle3-")%></textarea> </div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue3-")%>"></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue3-")%>"></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount3-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br>4.<input type="text" name="itemPolicy4" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("itemPolicy4-")%>"></div></td>
			<td colspan="5" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <textarea cols="30" name="claimedArticle4" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle4-")%></textarea> </div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue4-")%>"></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue4-")%>"></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount4-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br>5.<input type="text" name="itemPolicy5" class="style3" size="17" value="<%=(String)fireClaimDetailHash.get("itemPolicy5-")%>"></div></td>
			<td colspan="5" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br> 
			 <textarea cols="30" name="claimedArticle5" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle5-")%></textarea> </div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue5-")%>"></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue5-")%>"></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount5-")%>"></div></td>
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
         <input type="text" name="fillDate" size="26" class="style3" value = "<%=(String)fireClaimDetailHash.get("fillDate-")%>" onfocus="onLoadDetail(<%=requestNo%>,'frmFireInsuranceClaim');" readonly> </td>
		 </tr>		 
		</tbody>
		</table>

<table cellspacing="0" cellpadding="0" width="700" border="0">
	  	<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>Claim due to Fire and/or Explosion</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="intimation" id="intimation">Copy of Claim intimation given to Company together with xerox of policy & premium receipt<br>				
				<input type="checkbox" name="panchnama" id="panchnama">Police Panchnama / First Information Report / Final Police Report (Forensic Dept.)<br>
				<input type="checkbox" name="report" id="report">Fire Brigade Report<br>
				<input type="checkbox" name="photo" id="photo">Photographs of Damaged Property showing extent of damage & / or video film of loss<br>
				<input type="checkbox" name="quantum" id="quantum">To substantiate quantum of loss, value of damaged insured property just prior to loss & value of salvage. please make available to &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;surveyors / investigators fixed Asset Register, original Bills / Invoice, Repairs / Replacement Bills / Invoices and stock Register. 
			</td>
		 </tr>	
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>Claim due to Flood, Storm, Cyclone, Earthquake, Subsidence / Landslide</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="receipt" id="receipt">Copy of Claim intimation given to Company together with xerox of policy & premium receipt<br>				
				<input type="checkbox" name="pics" id="pics">Photographs of Damaged Property showing extent of damage & / or video film of loss<br>
				<input type="checkbox" name="value" id="value">To substantiate quantum of loss, value of damaged insured property just prior to loss & value of salvage. please make available to &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;surveyors / investigators fixed Asset Register, original Bills / Invoice, Repairs / Replacement Bills / Invoices and stock Register <br>
				<input type="checkbox" name="newspaper" id="newspaper">Newspaper cutting wherein the incidence of occurance of flood / storm / cyclone / earthquake / landslide has been reported.
				<input type="checkbox" name="meteor" id="meteor">Meteorological Report
			</td>
		 </tr>
		 <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
			<td height="30" colspan="2" align="center" class="style5">
				<u>Claim due to Riot, Strike, Malicious Damage and Terrorism (RSMDT)</u>
			</td>
		 </tr>
		<tr>
			<td height="30" colspan="2" align="left" class="style3">
				<input type="checkbox" name="policyRp" id="policyRp">Copy of Claim intimation given to Company together with xerox of policy & premium receipt<br>				
				<input type="checkbox" name="info" id="info">Police Panchnama / First Information Report / Final Investigation Report<br>
				<input type="checkbox" name="brigade" id="brigade">Fire Brigade Report<br>
				<input type="checkbox" name="insured" id="insured">To substantiate quantum of loss, value of damaged insured property just prior to loss & value of salvage. please make available to &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;surveyors / investigators fixed Asset Register, original Bills / Invoice, Repairs / Replacement Bills / Invoices and stock Register<br>
				<input type="checkbox" name="cutting" id="cutting">Newspaper cutting wherein the incidence of riots has been reported<br>
				<input type="checkbox" name="photos" id="photos">Photographs of Damaged Property showing extent of damage & / or video film of loss.
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
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "fire_validate()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;" onclick= "this.form.reset();" > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reset&nbsp;</td>
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