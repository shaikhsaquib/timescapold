<%
	String[] tags = {"reviewer"};

	Object objArr1[] = new Object[2];
	objArr1[0] = "'DD-MON-YYYY'";
	objArr1[1] = myClaimRequestValues[1];

	claimFormDetailHash.put("queryId", "1000");
	claimFormDetailHash.put("arguments", objArr1);

	claimHash.put("queryId", "1001");
	claimHash.put("arguments", objArr);

	reviewerList.add(claimHash);
	reviewerList.add(claimFormDetailHash);

//	Hashtable reviewerRemarkDetails = insuranceClaimController.viewReviewerRemark(reviewerList,tags);
	reviewerRemarkList = insuranceClaimController.viewReviewerRemark(reviewerList,tags);
	for(int k = 0 ; k<reviewerRemarkList.size(); k++)
	{
		reviewerRemarkDetails = (Hashtable)reviewerRemarkList.get(k);
		reviewer = (ArrayList)reviewerRemarkDetails.get("reviewer");
		if(reviewer!=null)
		{
			for(int jj=0; jj<reviewer.size(); jj++)
			{
				Hashtable reviewerHash = (Hashtable)reviewer.get(jj);

%>
		<tr>
			<td colspan="100" height="10"></td>
		</tr>
		<tr>
			<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">APPROVER DETAILS</td>
		</tr>
		<tr>
			<td colspan="100" height="5"></td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>

			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Approver</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)reviewerHash.get("user")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Date</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)reviewerHash.get("date")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Approver Remark</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)reviewerHash.get("remark")%>
				</td> 
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
<%
			}
		}
	}
%>