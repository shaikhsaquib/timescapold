<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String flag = (String)request.getParameter("hiddFlag");

	String weekDay = (String)request.getParameter("weekDay");
	String area = (String)request.getParameter("area");
	String areaDesc = (String)request.getParameter("areaDesc");
	String fireCause = (String)request.getParameter("fireCause");
	String otherInterest = (String)request.getParameter("otherInterest");
	String ammount[] = new String[4];
	String company[] = new String[4];
	String policy[] = new String[4];

	int i;
	for(i = 1; i<4; i++)
	{
		ammount[i] = (String)request.getParameter("ammount"+i);
		if(ammount[i].equals(null) || ammount[i].equals(""))
			ammount[i] = "0";
		company[i] = (String)request.getParameter("company"+i);
		if(company[i].equals(null) || company[i].equals(""))
			company[i] = "-";
		policy[i] = (String)request.getParameter("policy"+i);
		if(policy[i].equals(null) || policy[i].equals(""))
			policy[i] = "-";
	}
	String claimedArticle[] = new String[6];
	String articleValue[] = new String[6];
	String salvageValue[] = new String[6];
	String claimedAmmount[] = new String[6];

	for(i = 1; i<6; i++)
	{
		claimedArticle[i] = (String)request.getParameter("claimedArticle"+i);
		if(claimedArticle[i].equals(null) || claimedArticle[i].equals(""))
			claimedArticle[i] = "-";

		articleValue[i] = (String)request.getParameter("articleValue"+i);
		if(articleValue[i].equals(null) || articleValue[i].equals(""))
			articleValue[i] = "0";

		salvageValue[i] = (String)request.getParameter("salvageValue"+i);
		if(salvageValue[i].equals(null) || salvageValue[i].equals(""))
			salvageValue[i] = "0";

		claimedAmmount[i] = (String)request.getParameter("claimedAmmount"+i);
		if(claimedAmmount[i].equals(null) || claimedAmmount[i].equals(""))
			claimedAmmount[i] = "0";

	}

	String fillDate = (String)request.getParameter("fillDate");
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
          <td width="74%" height="20" align="left" class="style3"><%=weekDay%></td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. State the room or place where the fire originated: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=area%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Insert description of premises e.g. Dwelling house, Grocer’s <br>&nbsp;&nbsp;&nbsp;&nbsp;Shop, Cotton Mill etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=areaDesc%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4. State by what means the fire is supposed to have been caused: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireCause%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. State the nature of any other interest
			eg. Mortgagee, Leassee, Purchaser on Deposit etc: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=otherInterest%></td>
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
			 <%=ammount[1]%></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><%=company[1]%></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policy[1]%></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <%=ammount[2]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=company[2]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policy[2]%></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <%=ammount[3]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=company[3]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=policy[3]%></div></td>
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
			 <%=claimedArticle[1]%></div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[1]%></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[1]%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[1]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <%=claimedArticle[2]%></div></td>
			<td colspan="4" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[2]%></div></td>
			<td colspan="4" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[2]%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[2]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <%=claimedArticle[3]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[3]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[3]%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[3]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br>4. 
			 <%=claimedArticle[4]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[4]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[4]%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[4]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="4" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br>5. 
			 <%=claimedArticle[5]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[5]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[5]%></div></td>
			<td colspan="4" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[5]%></div></td>
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
         <%=fillDate%></td>
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
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="../images/shadowfooter.jpg" width="817" height="11" /></td>
  </tr>
</table>
<input type = "hidden" name = "hiddWeekDay" value = "<%=weekDay%>">
<input type = "hidden" name = "hiddArea" value = "<%=area%>">
<input type = "hidden" name = "hiddAreaDesc" value = "<%=areaDesc%>">
<input type = "hidden" name = "hiddFireCause" value = "<%=fireCause%>">
<input type = "hidden" name = "hiddOtherInterest" value = "<%=otherInterest%>">
<%
for(i = 1;i<4;i++)
{
%>
	<input type = "hidden" name = "hiddAmmount<%=i%>" value = "<%=ammount[i]%>">
	<input type = "hidden" name = "hiddCompany<%=i%>" value = "<%=company[i]%>">
	<input type = "hidden" name = "hiddPolicy<%=i%>" value = "<%=policy[i]%>">
<%
}
for(i = 1;i<6;i++)
{
%>
	<input type = "hidden" name = "hiddClaimedArticle<%=i%>" value = "<%=claimedArticle[i]%>">
	<input type = "hidden" name = "hiddArticleValue<%=i%>" value = "<%=articleValue[i]%>">
	<input type = "hidden" name = "hiddSalvageValue<%=i%>" value = "<%=salvageValue[i]%>">
	<input type = "hidden" name = "hiddClaimedAmmount<%=i%>" value = "<%=claimedAmmount[i]%>">
<%
}
%>
<input type = "hidden" name = "hiddFillDate" value = "<%=fillDate%>">
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>">
<input type = "hidden" name = "formsHeaderValue" value = "1">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>">
<input type = "hidden" name = "hiddFlag" value = "<%=flag%>">
