<%--
 -- @(#)viewNomination.jsp - 1-JUN-2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Mata Talent award
 -- @author  -  Megha Maheshwari & Afroz Sayed
 -- @version -  1.0
 --%>
<%
			String claimNumber = (String)request.getParameter("claimNumber");
			String requestNo = (String)request.getParameter("requestNo");
//			out.println(claimNumber);
			String[] tags2 = {"courier"};

			Object objArr[] = new Object[2];
			objArr[0] = "'DD-MON-YYYY'";
			objArr[1] = claimNumber;

			Object objArr1[] = new Object[2];
			objArr1[0] = "'DD-MON-YYYY'";
			objArr1[1] = requestNo;

			Hashtable viewCourierDetail = new Hashtable();
			viewCourierDetail.put("queryId", "1000");
			viewCourierDetail.put("arguments", objArr);

			Hashtable viewRequestDetail = new Hashtable();
			viewRequestDetail.put("queryId", "1001");
			viewRequestDetail.put("arguments", objArr1);

			ArrayList courierList = new ArrayList();
			courierList.add(viewRequestDetail);
			courierList.add(viewCourierDetail);
		
			ArrayList courierDetailList = new ArrayList();
			courierDetailList = insuranceClaimController.viewCourierRemark(courierList,tags2);
			//out.println(courierDetailList.size());

			for (int i = 0; i < courierDetailList.size(); i++)
			{
				Hashtable courierRemarkDetails = (Hashtable) courierDetailList.get(i);
				ArrayList courier = (ArrayList)courierRemarkDetails.get("courier");
				//out.println(courier.size());
				int j = courier.size() - 1;
				if(courier!=null)
				{
					for(int jj=0; jj<courier.size(); jj++)
					{
						Hashtable courierHash = (Hashtable)courier.get(jj);
						if(jj == j)
						{
%>
	
			<tr>
				<td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;Courier Number</div></td>
				<td width="74%" height="20" align="left" class="style3"><%=(String)courierHash.get("courierNumber")%></td>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;Courier Name</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<%=(String)courierHash.get("courierName")%>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;Courier Date</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<%=(String)courierHash.get("date")%>  </td>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50"  align="right" class="style4"><div align="left">&nbsp;&nbsp;&nbsp;Remark</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<%=(String)courierHash.get("courierRemark")%>  </td>
			</tr>
<%
				}
			}
		}
	}
%>			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr bgcolor="#D60202">
				 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
			<tr  bgcolor = "#EDE9E8">
				<td colspan = "100%" align="right" >
					<div align="center">
						<input name="Submit" type="button" class="redButton" value="Next" onclick = "next()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
				</td>
			</tr>

		</table>
			<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
			<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" />
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
