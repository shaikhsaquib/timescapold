 	<tr>
		<td colspan = "100%" class = "bold" height="30">
				&nbsp;Note-&nbsp;In case the requestor has done any change in default values of (a) Name (b) Designation and, (c) Address, <br> the text will appear in RED. You are requested to open the request and check the same before approving."
		</td>
	</tr>

	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUESTOR NAME</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="12%" align="left">&nbsp;LOCATION</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="13%" align="left">&nbsp;DEPARTMENT</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;CARD TEMPLATE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%" align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;APPLIED ON</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;REMARK</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;&nbsp;</td>

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
		String approverRemarks = "remarks" + ii;

		String className = "small";
		String classUnderline = "underline";
		String changedStatus = "";

		if (cardArr[23].equalsIgnoreCase("L")){
			changedStatus = "A";
		}else if (cardArr[23].equalsIgnoreCase("LP")){
			changedStatus = "LD";
		}/*else if (cardArr[23].equalsIgnoreCase("H")){  // changes by kavita yadav 01/07/2014
			changedStatus = "HA";
			className = "rednormal";
			classUnderline = "redunderline";
		}*/
		else if (cardArr[23].equalsIgnoreCase("H")){


			if(companyCode.equals("1003") || companyCode.equals("1024") || companyCode.equals("1025") || companyCode.equals("1026") || companyCode.equals("1027") || companyCode.equals("1030") || companyCode.equals("1031") || companyCode.equals("1032")|| companyCode.equals("1040") || companyCode.equals("1041"))
			{
				changedStatus = "A";
				className = "rednormal";
				classUnderline = "redunderline";
				//out.println("changedStatus1"+changedStatus);

			}else
			{
				changedStatus = "HA";
				className = "rednormal";
				classUnderline = "redunderline";
				//out.println("changedStatus2"+changedStatus);
			}
		}
		
		else if (cardArr[23].equalsIgnoreCase("HP")){
			changedStatus = "HD";
			className = "rednormal";
			classUnderline = "redunderline";
			//out.println("changedStatus3"+changedStatus);
		}
%>
	<tr height="30">
		<td align="left">&nbsp;<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="<%=classUnderline%>"><%=cardArr[0]%></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<%=cardArr[26]%>&nbsp;<%=cardArr[27]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<%=cardArr[25]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<%=cardArr[24]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left">&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="<%=classUnderline%>"><img src="../images/icon_vcard.gif" border="0"></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<%=cardArr[11]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<%=cardArr[12]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="left" class="<%=className%>">&nbsp;<textarea name="<%=approverRemarks%>" style="height:40px;width:130px;" class="small"></textarea></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td align="center">&nbsp;<a href="javascript:approveRequest(<%=ii%>,'<%=cardArr[0]%>','<%=changedStatus%>')" class="<%=classUnderline%>">Accept</a>&nbsp;&nbsp;<a href="javascript:approveRequest(<%=ii%>,'<%=cardArr[0]%>','R')" class="<%=classUnderline%>">Reject</a></td>
	</tr>

<%
		}
	}
%>