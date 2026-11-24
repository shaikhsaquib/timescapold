<%
		extExperienceStart = expSize;
		for (int bb = 0; bb < expSize; bb++) {

			if(tempexperienceFlag[bb].equals("EX")){
				extExperienceStart = bb;
				break;
			}

%>

	<tr>
		<%
			dropDownUrl = "../utils/departments.jsp?selectedOption="+tempdepartments[bb];
		%>

		<input type = "hidden" name = "experienceDetailId" value = "<%=tempexperienceDetailId[bb]%>">

		<td align="left" width="28%" valign="top">
			<jsp:include page="<%=dropDownUrl%>" flush="true" />
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="36%" valign="top">
			<textarea name="jobDesc" cols="35" rows="4" wrap="VIRTUAL" class="small"><%=tempjobDescription[bb]%></textarea>
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="36%" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" class="bold" height="25">Joined as</td>
					<td align="center" class="blackcontent" height="25">:</td>
					<td height="25">
					<%
						dropDownUrl = "../utils/designation.jsp?selectedOption="+tempjoinedAs[bb];
					%>
					<jsp:include page="<%=dropDownUrl%>" flush="true" />
					</td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">Last Designation Held</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<%
						dropDownUrl = "../utils/promotedDesignation.jsp?selectedOption="+tempdesignation[bb];
					%>
					<td width="53%" height="25"><jsp:include page="<%=dropDownUrl%>" flush="true" /></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">From</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<td width="53%" height="25">
<%
String fromMonth = "0";
int fromYear = 0;

if(tempinternalFromMonth[bb] != null){
	fromMonth = tempinternalFromMonth[bb];

	// Integer.parseInt is done to remove the leading zeros from a String
	fromMonth = Integer.parseInt(fromMonth) + "";
}

if(tempinternalFromYear[bb] != null){
	fromYear = Integer.parseInt(tempinternalFromYear[bb]);
}

%>
						<select name="fromMonth" class="small">
							<%=HtmlUtil.getMonthList(fromMonth)%>
						</select>

						<select name="fromYear" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),fromYear,"desc") %>
						</select>
					</td>
				</tr>
<%
String toMonth = "0";
int toYear = 0;

if(tempprevToMonth[bb] != null){
	toMonth = tempprevToMonth[bb];

	// Integer.parseInt is done to remove the leading zeros from a String
	toMonth = Integer.parseInt(toMonth) + "";
}

if(tempprevToYear[bb] != null){
	toYear = Integer.parseInt(tempprevToYear[bb]+"");
}

%>
				<tr>
					<td width="40%" align="right" class="bold" height="25">To</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<td width="53%" height="25">
						<select name="toMonth" class="small">
							<%=HtmlUtil.getMonthList(toMonth) %>
						</select>
						<select name="toYear" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),toYear,"desc") %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td align="center" colspan="5" valign="top" height="5"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>

	<tr bgcolor="#ECEFF2">
		<td align="center" colspan="5" valign="top" height="1"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td align="center" colspan="5" valign="top" height="5"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>

<%
	}
%>
