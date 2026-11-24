
	<tr>
		<td bgcolor="#CCCCCC" class="boldsmall" width="12%" align="left">&nbsp;REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="6%" align="left">&nbsp;CARD TEMPLATE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="8%" align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;APPLIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="29%" align="left">&nbsp;MODIFIED BY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;MODIFIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;STATUS</td>
	</tr>

	<%
		if(listSize == 0){
	%>
	<tr>
		<td colspan="13" class="small" align="center" height="30">
			&nbsp;
		</td>
	</tr>

	<tr>
		<td colspan="13" class="small" align="center" height="60">
			No request(s) for Business Cards to be displayed !<br><br>
		</td>
	</tr>
<%
	}else{
		for(int ii=0; ii< listSize; ii++){

			String cardArr[ ] = (String[ ]) requestsLst.get(ii);
%>
	<tr height="30">

		<td align="left" class="small">&nbsp;
			<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="underline">
				<%=cardArr[0]%>
			</a>
		</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;
			<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');">
				<img src="../images/icon_vcard.gif" border="0">
			</a>
		</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[12]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[13]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=(cardArr[24].equals("D")||cardArr[24].equals("C"))?emailId:cardArr[25]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[23]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left"class="small">&nbsp;<%=statusHash.get(cardArr[24])%></td>
	</tr>

<%
		}
	}
%>