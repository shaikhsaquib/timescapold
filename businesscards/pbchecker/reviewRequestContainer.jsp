
	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUESTOR NAME</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;CARD TEMPLATE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%"  align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;APPLIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">&nbsp;APPROVERED BY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%"  align="left">&nbsp;APPROVED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%"  align="left">&nbsp;REMARK</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">&nbsp;&nbsp;</td>

	</tr>

	<%
		if(listSize == 0){
	%>
	<tr>
		<td colspan="15" class="small" align="center" height="30">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td colspan="15" class="small" align="center" height="60">
			No pending request(s) for Business Cards to be approved !<br><br>
		</td>
	</tr>
	<%
		} else {
	%>

		<%
		for(int ii=0; ii< listSize; ii++){
		String cardArr[ ] = (String[ ]) requestList.get(ii);
		String reviewerRemark = "remarks" + ii;

		%>
	<tr height = "30">
		<td align="left" class="small">&nbsp;<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="underline"><%=cardArr[0]%></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[24]%>&nbsp;<%=cardArr[25]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[11]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[12]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[13]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[14]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<textarea name="<%=reviewerRemark%>" cols="10" class="normal"style="height:40px;width:120px;"></textarea></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<% if(cardArr[23].equals("LD")){

%>
		<td align="center" class="small">&nbsp;<a href="javascript:reviewRequest(<%=businessCardRole%>,<%=ii%>,'<%=cardArr[0]%>','A')" class="underline">Accept</a>&nbsp;&nbsp;<a href="javascript:reviewRequest(<%=businessCardRole%>,<%=ii%>,'<%=cardArr[0]%>','R')" class="underline">Reject</a></td>
<% }else{

%>
		<td align="center" class="small">&nbsp;<a href="javascript:reviewRequest(<%=businessCardRole%>,<%=ii%>,'<%=cardArr[0]%>','HA')" class="underline">Accept</a>&nbsp;&nbsp;<a href="javascript:reviewRequest(<%=businessCardRole%>,<%=ii%>,'<%=cardArr[0]%>','R')" class="underline">Reject</a></td>
<% 
	}

%>
	</tr>

	<%
		}
	}
	%>