<%
	String[] tags1 = {"courier"};

	Object objArr2[] = new Object[2];
	objArr2[0] = "'DD-MON-YYYY'";
	objArr2[1] = myClaimRequestValues[1];

	claimFormDetailCourierHash.put("queryId", "1000");
	claimFormDetailCourierHash.put("arguments", objArr2);

	claimCourierHash.put("queryId", "1001");
	claimCourierHash.put("arguments", objArr);

	courierList.add(claimCourierHash);
	courierList.add(claimFormDetailCourierHash);

//	Hashtable reviewerRemarkDetails = insuranceClaimController.viewReviewerRemark(reviewerList,tags);
	courierRemarkList = insuranceClaimController.viewCourierRemark(courierList,tags1);
	for(int k = 0 ; k<courierRemarkList.size(); k++)
	{
		courierRemarkDetails = (Hashtable)courierRemarkList.get(k);
		courier = (ArrayList)courierRemarkDetails.get("courier");
		if(courier!=null)
		{
			for(int jj=0; jj<courier.size(); jj++)
			{
				Hashtable courierHash = (Hashtable)courier.get(jj);

%>
		<tr>
			<td colspan="100" height="10"></td>
		</tr>
		<tr>
			<td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff">COURIER DETAILS</td>
		</tr>
		<tr>
			<td colspan="100" height="5"></td>
		</tr>
		<tr>
			<td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
		</tr>

			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">POD Number</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)courierHash.get("courierNumber")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Courier Name</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)courierHash.get("courierName")%>
				</td>
			</tr>
			<tr>
				  <td height="1" colspan="4" align="left" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
			</tr>
			<tr>
				<td class = "style5" width = "10%" height = "30" align = "center"></td>
				<td class = "style5" width = "30%" height = "30" align = "left">Courier Date</td>
				<td class = "style5" width = "10%" height = "30" align = "center">:</td>
				<td class = "style3" width = "50%" height = "30" align = "left">
					<%=(String)courierHash.get("date")%>
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
					<%=(String)courierHash.get("courierRemark")%>
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