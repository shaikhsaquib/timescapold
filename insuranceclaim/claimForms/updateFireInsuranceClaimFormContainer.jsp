<%
	String claimNumber = (String)request.getParameter("claimNumber");
	String requestNo = (String)request.getParameter("requestNo");

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'";
	objArr[1] = claimNumber;

	Hashtable claimFormDetailHash = new Hashtable( );
	claimFormDetailHash.put("queryId", "1000");
	claimFormDetailHash.put("arguments", objArr);

	ArrayList myClaimFormDetails = new ArrayList();
	myClaimFormDetails = insuranceClaimController.viewClaimDetails(claimFormDetailHash);

	for (int j = 0; j < myClaimFormDetails.size(); j++)
	{
		String claimFormDetail[] = (String[]) myClaimFormDetails.get(j);

		Hashtable fireClaimDetailHash = xmlObj.readSubNode(claimFormDetail[1],"fireClaimForm");

%>

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#05B1C7" height="30"><div align="center"><span class="style5Copy">THE ORIENTAL INSURANCE COMPANY LIMITED </span></div></td>
        </tr>
        <tr>
          <td><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        
        <tr>
          <td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
		<tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style7">(Incorporated in India, subsidiary of General Insurance Corporation of India) </span></div></td>
        </tr>
		 <tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style3">Head Office: A-25/27, Asaf Ali Road, New Delhi-110 002 </span></div></td>
        </tr>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">FIRE INSURANCE CLAIM FORM</span></div></td>
        </tr>
		</tbody></table>
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
		<tbody>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="20"><div align="center"><span class="style5">CLAIM UNDER FIRE POLICY</span></div></td>
        </tr>
      </tbody>
    </table>
	
      <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
        <tr>
          <td width="56%" height="30" align="right" class="style4"><div align="left">1. State the day of the week: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3">
			<%@ include file = "../includes/weekDay.jsp" %>
		  </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. State the room or place where the fire originated: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="area" cols="35"  class="style3"><%=(String)fireClaimDetailHash.get("area-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Insert description of premises e.g. Dwelling house, Grocer’s <br>&nbsp;&nbsp;&nbsp;&nbsp;Shop, Cotton Mill etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="areaDesc" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("areaDesc-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4. State by what means the fire is supposed to have been caused: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="fireCause" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("fireCause-")%></textarea>  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. State the nature of any other interest
			eg. Mortgagee, Leassee, Purchaser on Deposit etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><textarea name="otherInterest" cols="35" class="style3"><%=(String)fireClaimDetailHash.get("otherInterest-")%></textarea>  </td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td  height="30" align="right" class="style4"><div align="left">6. Insurances affected on the said property. (If there are other insurance(except ORIENTAL), full copies of all policies must <br>&nbsp;&nbsp;&nbsp;&nbsp;be attached):</div></td>
        </tr>
	</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr><br></tr>
		<tr >
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="15%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Company:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy:</div></td>
			<th width="40%"></th>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <input type="text" name="ammount1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("ammount1-")%>"></div></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><textarea cols="30" name="company1" class="style3"><%=(String)fireClaimDetailHash.get("company1-")%></textarea></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy1" class="style3"><%=(String)fireClaimDetailHash.get("policy1-")%></textarea></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <input type="text" name="ammount2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("ammount2-")%>"></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><textarea cols="30" name="company2" class="style3"><%=(String)fireClaimDetailHash.get("company2-")%></textarea></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy2" class="style3"><%=(String)fireClaimDetailHash.get("policy2-")%></textarea></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <input type="text" name="ammount3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("ammount3-")%>"></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><textarea cols="30" name="company3" class="style3"><%=(String)fireClaimDetailHash.get("company3-")%></textarea></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea cols="30" name="policy3" class="style3"><%=(String)fireClaimDetailHash.get("policy3-")%></textarea></div></td>
			<td colspan="4"></td>
		</tr>
		</tbody></table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
		<tr>
          <td height="1" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr>
        <tr>
          <td  height="40" align="right" class="style4"><div align="left">7. Details of claim for property destroyed or damaged (A Fire Policy being a contract of INDEMNITY only, all claims must be <br>&nbsp;&nbsp;&nbsp;&nbsp;based upon the actual value of the goods at the time of the Fire no trade profit whatever being included in the claim) :</div></td>
        </tr>
	</tbody></table>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
	  <tr><br></tr>
		<tr bgcolor="#E0E0E0">
			<th colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of the article claimed:</div></td>
			<!-- <td><input type="text" name="make" class="style3" size="26"></td> -->
			<th colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left">Value at the time of fire:</div></td>
			<th colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deduction for
			value of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salvage:</div></td>
			<th colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount claimed i.e. actual loss &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;after deduction of salvage value:</div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <textarea cols="30" name="claimedArticle1" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle1-")%></textarea> </div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue1-")%>"></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue1-")%>"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount1" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount1-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <textarea cols="30" name="claimedArticle2" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle2-")%></textarea> </div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue2-")%>"></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue2-")%>"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount2" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount2-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <textarea cols="30" name="claimedArticle3" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle3-")%></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue3-")%>"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue3-")%>"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount3" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount3-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>4. 
			 <textarea cols="30" name="claimedArticle4" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle4-")%></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue4-")%>"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue4-")%>"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount4" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount4-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br>5. 
			 <textarea cols="30" name="claimedArticle5" class="style3"><%=(String)fireClaimDetailHash.get("claimedArticle5-")%></textarea> </div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><input type="text" name="articleValue5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("articleValue5-")%>"></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="salvageValue5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("salvageValue5-")%>"></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="claimedAmmount5" class="style3" size="17" value = "<%=(String)fireClaimDetailHash.get("claimedAmmount5-")%>"></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		</tbody></table>
		 <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
		<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tbody>
		<tr>
		<td height="30" colspan="2" align="right" class="style5"><div align="left">I/we the above named do hereby, to the best of my/our knowledge and belief, warrant the truth of the foregoing statement every respect. I/we also further declare that the insurances affected on the said property mentioned in point 6 are true and complete.</div></td>
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
      <tbody>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
		</table>
	<table width="250" border="0" cellpadding="0" cellspacing="0">
        <tr>
           <td width="125" align="center" class="blueButton" style="height:40px;" onclick= "fire_validate()">Preview
           </td>
		   <td align="center" class="blueButton" style="height:40px;"> &nbsp;Reset&nbsp;</td>
        </tr>
	</table> 
		<table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td height="20" colspan="100" align="center" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
		<tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        </tbody>
	</table>
<%
	}
%>
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "updateClaim">
