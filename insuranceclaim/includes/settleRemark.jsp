<%
	String[] tags2 = {"cheque"};

	//System.out.println("on settle page");

	Object objArr2[] = new Object[2];
	objArr2[0] = "'DD-MON-YYYY'";
	objArr2[1] = requestNo;

	claimSettleHash.put("queryId", "1001");
	claimSettleHash.put("arguments", objArr2);

	settleList.add(claimSettleHash);

//	Hashtable reviewerRemarkDetails = insuranceClaimController.viewReviewerRemark(reviewerList,tags);
	settleRemarkList = insuranceClaimController.viewSettleRemark(settleList,tags2);
	System.out.println("settleRemarkList"+settleRemarkList);
	for(int k = 0 ; k<settleRemarkList.size(); k++)
	{
		settleRemarkDetails = (Hashtable)settleRemarkList.get(k);
		System.out.println("settleRemarkDetails"+settleRemarkDetails);
		cheque = (ArrayList)settleRemarkDetails.get("cheque");
		if(cheque!=null)
		{
			for(int jj=0; jj<cheque.size(); jj++)
			{
				Hashtable chequeSettleDetails = (Hashtable)cheque.get(jj);
				System.out.println("chequeSettleDetails"+chequeSettleDetails);
%>
		<tr>
			<td colspan="100" height="10"></td>
		</tr>
		<tr>
			<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">CHEQUE DETAILS</td>
		</tr>
		<tr>
			<td colspan="100" height="5"></td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>

			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Bank Name</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("bankName")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Cheque Name</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("chequeName")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Cheque Number</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("chequeNumber")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Cheque Amount</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("chequeAmount")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Cheque Date</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("chequeDate")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Remark</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)chequeSettleDetails.get("settleRemark")%>
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