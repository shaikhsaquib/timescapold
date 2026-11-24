
	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD CODE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;APPLIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;MODIFIED BY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;MODIFIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;STATUS</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;&nbsp;</td>
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
			No request(s) for Business Cards to be cancelled !<br><br>
		</td>
	</tr>
	<%
		} else {
	%>

		<%
//			String modifiedDate = "-";
//			String modifiedBy = "-";

			for(int ii=0; ii< listSize; ii++){

				String cardArr[ ] = (String[ ]) requestsLst.get(ii);

/*				modifiedDate = cardArr[23];

				if(cardArr[24].equals("L") || cardArr[24].equals("H")){
					modifiedBy = "-";
					modifiedDate = "-";
				}

				else if(cardArr[24].equals("HA")){
					modifiedBy = cardArr[14];
				}

				else if(cardArr[24].equals("A")){
					modifiedBy = (cardArr[17].equals("timescape.admin@timesgroup.com")) ? cardArr[14] : cardArr[17];
				}

				else if (cardArr[24].equals("C") || cardArr[24].equals("P")){
					modifiedBy = emailId;
				}
*/
		%>
	<tr height="30">
		<td align="left" class="small">&nbsp;<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="underline"><%=cardArr[0]%></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[12]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[13]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[25]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=cardArr[23]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<%=statusHash.get(cardArr[24])%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="small">&nbsp;<a href="javascript:cancel(<%=cardArr[0]%>)"  class="underline">Cancel</a></td>
		<!-- <td align="left" class="small">&nbsp;<a href="../requestor/cancelRequestSubmit.jsp?id=<%//=cardArr[0]%>"  class="underline">Cancel</a></td> -->
	</tr>

	<%
		}
	}
	%>