
	<tr height="20">
		<td bgcolor="#CCCCCC" class="boldsmall" width="5%"  align="left">&nbsp;&nbsp;</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">REQUEST ID</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;REQUESTOR NAME</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD TMPL</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%" align="left">&nbsp;CARD BRAND</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="10%"  align="left">&nbsp;QUANTITY</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="20%" align="left">&nbsp;CARD TYPE</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
		<td bgcolor="#CCCCCC" class="boldsmall" width="15%" align="left">&nbsp;REMARK</td>
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
			No pending request(s) for Business Cards to be processed !
		</td>
	</tr>
	<%
		} else {
	%>

		<%
		for(int ii=0; ii< listSize; ii++){
		
			String cardArr[ ] = (String[ ]) requestList.get(ii);
			
			String cardBrand	=	"";
			String backDesignVal = "NA";
		
			String userArea = cardArr[29];

		%>
	<tr height = "30">
<%
		String select = "select"+ii;
		String cardBrandVal = "cardBrandVal"+ii;
		//out.println(cardBrandVal);
%>
		<td align="left" class="small">&nbsp;<input type="checkbox" id="select" name="<%=select%>" value="selected"/></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<td align="left" class="small">&nbsp;<a href="javascript:void window.open('../utils/requestDetails.jsp?id=<%=cardArr[0]%>','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" class="underline">
				<%=cardArr[0]%></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<td align="left" class="small">&nbsp;<%=cardArr[24]%>&nbsp;<%=cardArr[25]%></td>
<%
		String reqName = "name"+ii;
		String reqId = "reqId"+ii;
		//out.println(cardArr[0]);
%>
		<input type="hidden" name="<%=reqName%>" value="<%=cardArr[24]%>|<%=cardArr[25]%>">
		<input type="hidden" name="<%=reqId%>" value="<%=cardArr[0]%>">

		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>

		<td align="left" class="small">&nbsp;<a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=cardArr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
		String reqTemp		= "reqTemp"+ii;
%>
		<input type="hidden" name="<%=reqTemp%>" value="<%=cardArr[10]%>">
<%		
		 if(compCode.equals("1000")){
			
			cardBrand =(String) deptCode.get(cardArr[10]);
					
		} else 	if(compCode.equals("1003") || compCode.equals("1024") ||compCode.equals("1025") ||compCode.equals("1026") ||compCode.equals("1027") || compCode.equals("1030"))
		{	
			cardBrand	=	cardArr[10];
			if( !(cardArr[10].equals("IDIVA") || cardArr[10].equals("IND")))
				{
					boolean retval = true;
					retval = cardBrand.contains("-");
					if(retval)
					{
						String  card = cardBrand.substring(0, cardBrand.indexOf('-'));
						backDesignVal = cardBrand.substring( cardBrand.indexOf('-') +1);
						//out.println(card);
						//out.println(backDesignVal);
						cardBrand=card;

					}

				}
		}
		
%>
		<td align="left" class="small" ><%=cardBrand%></td>
		
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
		String quantity = "reqQty"+ii;
		String qty = cardArr[11];
%>
		<td align="left" class="small">&nbsp;			
			<select name  = "<%=quantity%>" class="small">
                <option value = "100" <%= qty.equals("100") ? "SELECTED" : ""%>>100</option>
                <option value = "200" <%= qty.equals("200") ? "SELECTED" : ""%>>200</option>
                <option value = "500" <%= qty.equals("500") ? "SELECTED" : ""%>>500</option>
            </select>
		</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
		String cardType = "type"+ii;
%>
		<td align="left" class="small">&nbsp;
			<select name = "<%=cardType%>" class="small">
                <option value = "Normal" SELECTED>Normal</option>
                <option value = "Nontearable">Nontearable</option>
                <option value = "German Kentt">German Kentt</option>
            </select>
		</td>
		<td class="boldsmall" align="left"><img src ="../images/spacer.gif"></td>
<%
		String processorRemarks = "remarks" + ii;
%>
		<td align="left" class="small">
			<textarea name="<%=processorRemarks%>" style="height:40px;width:130px;" class="small"></textarea>
		</td>
	</tr>
<%
			String changedName	= "changedName"+ii;
			String reqDsgn		= "reqDsgn"+ii;
			String reqWorkArea	= "reqWorkArea"+ii;
			String compName		= "compName"+ii;
			String addLine1		= "addLine1"+ii;
			String addLine2		= "addLine2"+ii;
			String reqDirectNo	= "reqDirectNo"+ii;
			String reqFaxNo		= "reqFaxNo"+ii;
			String reqMobileNo	= "reqMobileNo"+ii;
			String reqEmailId	= "reqEmailId"+ii;
//			String reqTemp		= "reqTemp"+ii;
			String reqWebsite	= "reqWebsite"+ii;
%>
		<input type="hidden" name="<%=changedName%>" value="<%=cardArr[1]%>"/>
		<input type="hidden" name="<%=reqDsgn%>" value="<%=cardArr[2]%>"/>
		<input type="hidden" name="<%=reqWorkArea%>" value="<%=cardArr[29]%>"/>
		<input type="hidden" name="<%=compName%>" value="<%=cardArr[30]%>"/>
		<input type="hidden" name="<%=addLine1%>" value="<%=cardArr[26]%>"/>
		<input type="hidden" name="<%=addLine2%>" value="<%=cardArr[27]%>"/>
		<input type="hidden" name="<%=reqDirectNo%>" value="<%=cardArr[5]%>"/>
		<input type="hidden" name="<%=reqFaxNo%>" value="<%=cardArr[6]%>"/>
		<input type="hidden" name="<%=reqMobileNo%>" value="<%=cardArr[7]%>"/>
		<input type="hidden" name="<%=reqEmailId%>" value="<%=cardArr[28]%>"/>
		<input type="hidden" name="<%=reqTemp%>" value="<%= cardBrand %>"/> 
		<input type="hidden" name="<%=reqWebsite%>" value="<%=cardArr[9]%>"/>
	
	<%
		}
	%>

	<tr>
		<td class="boldsmall" align="left" height="20" colspan="100%"><img src ="../images/spacer.gif"></td>
	</tr>

	<tr>
		<td colspan = "100%" align = "center">
			<a href = "javascript:validate(<%=listSize%>)" class = "small"><img src = "../images/but_submit.gif" border = "0"></a>&nbsp;&nbsp;
			<a href = "javascript:clear()" class = "small"><img src = "../images/but_reset.gif" border = "0"></a>
		</td>
	</tr>

<%
		}
%>