	<tr>
		<td colspan = "100%" class = "bold" height="30">
				&nbsp;Note-&nbsp;All fields marked with <img src="../images/tickmark.gif" width="13" height="13"/> are mandatory but editable.
		</td>
	</tr>

	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="25%" align="left">&nbsp;REQUESTOR NAME</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD BRAND</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD TYPE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="25%" align="left">&nbsp;REMARK</td>
	</tr>

<%

//Retrieve the data from service.jsp
 
		String listSize = (String)request.getParameter("listSize");

		for (int ii=0;ii<Integer.parseInt(listSize);ii++){

			String select = "select"+ii;
			String reqSelect = (String)request.getParameter(select);
%>
		<input type="hidden" name="<%=select%>" value="<%=reqSelect%>">
<%
			if(reqSelect!=null && !reqSelect.equals("null") && !reqSelect.trim().equals("")){
			//out.println(ii);

			String reqId = "reqId"+ii;

			String requestId = (String)request.getParameter(reqId);
			String name = "name"+ii;
			String requestorName = (String)request.getParameter(name);
%>
	<tr>
		<td class = "small" align = "left" height = "30">&nbsp;<%=requestId%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<td class = "small" align = "left" height ="30">&nbsp;<%=requestorName.substring(0,requestorName.indexOf("|"))%>&nbsp;<%=requestorName.substring(requestorName.indexOf("|")+1)%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<input type="hidden" name="<%=name%>" value="<%=requestorName%>">
		<input type="hidden" name="<%=reqId%>" value="<%=requestId%>">
<%
			String reqTemp	= "reqTemp"+ii;
			String cardTemplate	= (String)request.getParameter(reqTemp);
			//out.println(cardTemplate);
%>
		<input type="hidden" name="<%=reqTemp%>" value="<%=cardTemplate%>">
<%
	if(compCode.equals("1003") || compCode.equals("1024") ||compCode.equals("1025") ||compCode.equals("1026") ||compCode.equals("1027") || compCode.equals("1030"))
		{	
			//cardTemplate	=	cardArr[10];
			if( !(cardTemplate.equals("IDIVA") || cardTemplate.equals("IND")))
				{
					boolean retval = true;
					retval = cardTemplate.contains("-");
					if(retval)
					{
					String  card = cardTemplate.substring(0, cardTemplate.indexOf('-'));
					//backDesignVal = cardTemplate.substring( cardTemplate.indexOf('-') +1);
					//System.out.println(card);
					cardTemplate=card;
					
					}
				}
		}
%>
		<td class = "small" align = "left" height = "30">&nbsp;<%=deptCode.get(cardTemplate)%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
			String reqQty = "reqQty"+ii;
			String quantity = (String)request.getParameter(reqQty);
%>

		<td class = "small" align = "left" height = "30">&nbsp;<%=quantity%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<input type="hidden" name="<%=reqQty%>" value="<%=quantity%>">
<%
			String type = "type"+ii;
			String cardType = (String)request.getParameter(type);
%>
		<td class = "small" align = "left" height = "30">&nbsp;<%=cardType%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<input type="hidden" name="<%=type%>" value="<%=cardType%>">
<%
			String remarks = "remarks" + ii;
			String processorRemarks = (String)request.getParameter(remarks);
			if (processorRemarks == null || processorRemarks.equals("null") || processorRemarks.equals("")){
				processorRemarks = "-";
			}
%>
		<td class = "small" align = "left" height = "30">&nbsp;<%=processorRemarks%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<input type="hidden" name="<%=remarks%>" value="<%=processorRemarks%>">
	</tr>

<%
			String changedName				= "changedName"+ii;
			String reqName					= (String)request.getParameter(changedName);
			String reqDsgn					= "reqDsgn"+ii;
			String requestorDesignation		= (String)request.getParameter(reqDsgn);
			String reqWorkArea				= "reqWorkArea"+ii;
			String requestorWorkarea		= (String)request.getParameter(reqWorkArea);
			String compName					= "compName"+ii;
			String companyName2				= (String)request.getParameter(compName);
			String addLine1					= "addLine1"+ii;
			String addressLine1				= (String)request.getParameter(addLine1);
			String addLine2					= "addLine2"+ii;
			String addressLine2				= (String)request.getParameter(addLine2);
			String reqDirectNo				= "reqDirectNo"+ii;
			String requestorDirectNumber	= (String)request.getParameter(reqDirectNo);
			String reqFaxNo					= "reqFaxNo"+ii;
			String requestorFaxNumber		= (String)request.getParameter(reqFaxNo);
			String reqMobileNo				= "reqMobileNo"+ii;
			String requestorMobileNumber	= (String)request.getParameter(reqMobileNo);
			String reqEmailId				= "reqEmailId"+ii;
			String requestorEmailId			= (String)request.getParameter(reqEmailId);
//			String reqTemp					= "reqTemp"+ii;
//			String cardTemplate				= (String)request.getParameter(reqTemp);
			String reqWebsite				= "reqWebsite"+ii;
			String website					= (String)request.getParameter(reqWebsite);
%>

			<input type="hidden" name="<%=changedName%>" value="<%=reqName%>"/>
			<input type="hidden" name="<%=reqDsgn%>" value="<%=requestorDesignation%>"/>
			<input type="hidden" name="<%=reqWorkArea%>" value="<%=requestorWorkarea%>"/>
			<input type="hidden" name="<%=compName%>" value="<%=companyName2%>"/>
			<input type="hidden" name="<%=addLine1%>" value="<%=addressLine1%>"/>
			<input type="hidden" name="<%=addLine2%>" value="<%=addressLine2%>"/>
			<input type="hidden" name="<%=reqDirectNo%>" value="<%=requestorDirectNumber%>"/>
			<input type="hidden" name="<%=reqFaxNo%>" value="<%=requestorFaxNumber%>"/>
			<input type="hidden" name="<%=reqMobileNo%>" value="<%=requestorMobileNumber%>"/>
			<input type="hidden" name="<%=reqEmailId%>" value="<%=requestorEmailId%>"/>
			<!-- <input type="hidden" name="<%//=reqTemp%>" value="<%//=cardTemplate%>"/> -->
			<input type="hidden" name="<%=reqWebsite%>" value="<%=website%>"/>
<%
			}
	}
%>
	<tr>
		<td class="boldsmall" align="left" height="30" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr>
	<tr>
		<td class = "bold" align = "left" colspan="100%">&nbsp;&nbsp;Vendor Email Id :
			&nbsp;&nbsp;&nbsp;<%@ include file="../includes/vendorList.jsp" %>&nbsp;<img src="../images/tickmark.gif" width="13" height="13"/>
		</td>
	</tr> 

	<tr>
		<td colspan = "100%" align = "center">&nbsp;</td>
	</tr>

	<tr>
		<td colspan = "100%" class = "normal" align = "center" height = "20">
			<a href = "javascript:confirmRequest()" class = "normal"><img src = "../images/but_submit.gif" border = "0"></a>&nbsp;&nbsp;
			<a href = "javascript:history.back()" class = "normal"><img src = "../images/but_back.gif" border = "0"></a>&nbsp;&nbsp;
		</td>
	</tr>