 <%
	String claimNumber = (String)request.getParameter("claimNumber");
	String requestNo = (String)request.getParameter("requestNo");

	Object objArr[] = new Object[2];
	objArr[0] = "'DD-MON-YYYY'" ;
	objArr[1] = claimNumber ;

	Hashtable searchHash = new Hashtable();
	searchHash.put("queryId","1000");
	searchHash.put("arguments",objArr);

	ArrayList courierDetails = insuranceClaimController.viewClaimDetails(searchHash);

	for (int i = 0; i < courierDetails.size(); i++)
	{
		String claimRequestDetail[] = (String[]) courierDetails.get(i);

		Hashtable claimRequestDetailHash = xmlObj.readSubNode(claimRequestDetail[17],"courier");

%>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg.png">
  
  <tr>
    <td align="center" valign="top" bgcolor="#FFFFFF"><table cellspacing="0" cellpadding="0" width="700" align="center" bgcolor="#ffffff" border="0">
      <tbody>
        <tr>
          <td width="100%" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Number</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<input type = "text" name = "courierNumber" class="style3">
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Name</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<input type = "text" name = "courierName" class="style3">
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Remark</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<textarea name="courierRemark" cols="35" class="style3"></textarea>  </td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
</table>
<%
	}
%>			
<input type = "hidden" name = "hiddRequestNumber" value = "<%=requestNo%>" />
<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
