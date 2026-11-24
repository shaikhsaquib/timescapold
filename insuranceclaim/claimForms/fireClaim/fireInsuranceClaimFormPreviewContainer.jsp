<%
	String claimNumber = (String)request.getParameter("hiddClaimNumber");
	String flag = (String)request.getParameter("hiddFlag");
	String directorySize = (String)request.getParameter("hiddDirectorySize");
	int directorySize1 = Integer.parseInt(directorySize);
	//System.out.println(directorySize);

	String insuredName = (String)request.getParameter("insuredName");
	String area = (String)request.getParameter("area");
	String lossArea = (String)request.getParameter("lossArea");
	String insuredTelephone = (String)request.getParameter("insuredTelephone");
	String insuredFax = (String)request.getParameter("insuredFax");
	String mortgageName = (String)request.getParameter("mortgageName");
	String fireTime = (String)request.getParameter("fireTime");
	String fireDate = (String)request.getParameter("fireDate");
	String fireCause = (String)request.getParameter("fireCause");
	String fireItem = (String)request.getParameter("fireItem");
	String fireOccupation = (String)request.getParameter("fireOccupation");
	String fireFir = (String)request.getParameter("fireFir");
	String fireEstimatedLoss = (String)request.getParameter("fireEstimatedLoss");
	String fireDetails = (String)request.getParameter("fireDetails");
	String name[] = new String[4];
	String period[] = new String[4];
	String policy[] = new String[4];
	String details[] = new String[4];
	String fileName[] = new String[directorySize1];

	int i;
	int j;
	for(i = 1; i<4; i++)
	{
		name[i] = (String)request.getParameter("name"+i);
		if(name[i].equals(null) || name[i].equals(""))
			name[i] = "-";
		period[i] = (String)request.getParameter("period"+i);
		if(period[i].equals(null) || period[i].equals(""))
			period[i] = "-";
		policy[i] = (String)request.getParameter("policy"+i);
		if(policy[i].equals(null) || policy[i].equals(""))
			policy[i] = "0";
		details[i] = (String)request.getParameter("details"+i);
		if(details[i].equals(null) || details[i].equals(""))
			details[i] = "-";
	}
	for(j = 0; j<directorySize1; j++)
	{
		fileName[j] = (String)request.getParameter("hiddFilesName"+j);
		//System.out.println(fileName[j]);
	}
	String itemPolicy[] = new String[6];
	String claimedArticle[] = new String[6];
	String articleValue[] = new String[6];
	String salvageValue[] = new String[6];
	String claimedAmmount[] = new String[6];

	for(i = 1; i<6; i++)
	{
		itemPolicy[i] = (String)request.getParameter("itemPolicy"+i);
		if(itemPolicy[i].equals(null) || itemPolicy[i].equals(""))
			itemPolicy[i] = "0";

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

<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
		<tr>
          <td align="left" bgcolor="#FFFFFF" height="30"><div align="center"><span class="style4">CLAIM FORM FOR STANDARD FIRE AND ALLIED PERILS</span></div></td>
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
		</tbody></table>
	
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
          <td width="74%" height="20" align="left" class="style3"><%=insuredName%></td>
        </tr>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 2. Address: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=area%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 3. Address of premises at which the loss occurred: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=lossArea%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 4.  Telephone Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=insuredTelephone%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 5. Fax Number: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=insuredFax%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 6. Name of mortgagees having an interest in the property: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=mortgageName%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 7. Time of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireTime%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 8. Date of Fire: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireDate%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 9. Cause of Fire / Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireCause%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 10. Item(s) of Policy affected (give description): &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireItem%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 11. Occupation of the premises at the time of Fire/ Loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireOccupation%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 12. Has the Fire/Loss reported to Fire Brigade/Police: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireFir%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 13. Estimate of loss: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireEstimatedLoss%></td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../../images/spacer.gif" width="1" height="1" /></td>
          </tr> <tr>
          <td height="50" align="right" class="style4"><div align="left"> 14. Details of any other insurance on the affected assets: &nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3"><%=fireDetails%></td>
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
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Amount:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="15%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Period of insurance:</div></td>
			<th bgcolor="#E0E0E0"colspan="3" width="30%"height="30" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detail of the Sum Insured:</div></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=name[1]%></td>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=period[1]%></td>
			<td colspan="4"  height="50" valign="top" class="style3"><div align="left"><br><%=policy[1]%></div></td>
			<td colspan="4" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=details[1]%></div></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=name[2]%></td>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=period[2]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=policy[2]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=details[2]%></div></td>
			<td colspan="4"></td>
		</tr>
		<tr>
			<td colspan="4" width="15%" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=name[3]%></td>
			<td colspan="4" height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=period[3]%></div></td>
			<td colspan="4" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=policy[3]%></div></td>
			<td colspan="4" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=details[3]%></div></td>
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
			<th colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Item no. of the Policy:</div></td>
			<th colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Description of the article claimed:</div></td>
			<!-- <td><input type="text" name="make" class="style3" size="26"></td> -->
			<th colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left">Value at the time of fire:</div></td>
			<th colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deduction for
			value of &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Salvage (Rs.):</div></td>
			<th colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbspNet amount of claim (Rs.):</div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>1. 
			 <%=itemPolicy[1]%></div></td>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=claimedArticle[1]%></div></td>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[1]%></div></td>
			<td colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[1]%></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[1]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>2. 
			 <%=itemPolicy[2]%></div></td>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=claimedArticle[2]%></div></td>
			<td colspan="5" width="20%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[2]%></div></td>
			<td colspan="5" width="20%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[2]%></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[2]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>3. 
			 <%=itemPolicy[3]%></div></td>
			<td colspan="5" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=claimedArticle[3]%></div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[3]%></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[3]%></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[3]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>4. 
			 <%=itemPolicy[4]%></div></td>
			<td colspan="5" width="20%"height="50" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=claimedArticle[4]%></div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[4]%></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[4]%></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[4]%></div></td>
			<!-- <textarea cols="35" name="aadr1" class="style3"></textarea> -->
		</tr>
		<tr>
			<td colspan="5" width="30%"height="50" valign="top"align="left" class="style3"><div align="left"><br>5. 
			 <%=itemPolicy[5]%></div></td>
			<td colspan="5" width="20%"height="60" valign="top"align="left" class="style3"><div align="left"><br> 
			 <%=claimedArticle[5]%></div></td>
			<td colspan="5" width="15%" height="50" valign="top" class="style3"><div align="left"><br><%=articleValue[5]%></div></td>
			<td colspan="5" width="30%"height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=salvageValue[5]%></div></td>
			<td colspan="5" width="30%" height="50" valign="top" class="style3"><div align="left"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=claimedAmmount[5]%></div></td>
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
<input type = "hidden" name = "hiddInsuredName" value = "<%=insuredName%>">
<input type = "hidden" name = "hiddArea" value = "<%=area%>">
<input type = "hidden" name = "hiddLossArea" value = "<%=lossArea%>">
<input type = "hidden" name = "hiddInsuredTelephone" value = "<%=insuredTelephone%>">
<input type = "hidden" name = "hiddInsuredFax" value = "<%=insuredFax%>">
<input type = "hidden" name = "hiddMortgageName" value = "<%=mortgageName%>">
<input type = "hidden" name = "hiddFireTime" value = "<%=fireTime%>">
<input type = "hidden" name = "hiddFireDate" value = "<%=fireDate%>">
<input type = "hidden" name = "hiddFireCause" value = "<%=fireCause%>">
<input type = "hidden" name = "hiddFireItem" value = "<%=fireItem%>">
<input type = "hidden" name = "hiddFireOccupation" value = "<%=fireOccupation%>">
<input type = "hidden" name = "hiddFireFir" value = "<%=fireFir%>">
<input type = "hidden" name = "hiddFireEstimatedLoss" value = "<%=fireEstimatedLoss%>">
<input type = "hidden" name = "hiddFireDetails" value = "<%=fireDetails%>">
<%
for(i = 1;i<4;i++)
{
%>
	<input type = "hidden" name = "hiddName<%=i%>" value = "<%=name[i]%>">
	<input type = "hidden" name = "hiddDetails<%=i%>" value = "<%=details[i]%>">
	<input type = "hidden" name = "hiddPeriod<%=i%>" value = "<%=period[i]%>">
	<input type = "hidden" name = "hiddPolicy<%=i%>" value = "<%=policy[i]%>">
<%
}
for(i = 0;i<directorySize1;i++)
{
%>
	<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName[i]%>">
<%
}
for(i = 1;i<6;i++)
{
%>
	<input type = "hidden" name = "hiddItemPolicy<%=i%>" value = "<%=itemPolicy[i]%>">
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
<input type = "hidden" name = "hiddDirectorySize" value = "<%=directorySize1%>">