    <%
        for (int dd = extExperienceStart; dd < expSize; dd++) {
	%>
	<input type = "hidden" name = "experienceDetailIdPrev" value = "<%=tempexperienceDetailId[dd]%>">

	<tr>
		<td align="left" width="26%" valign="top"><input type="text" name="companyName" size="15" class="small" value = "<%=tempdepartments[dd]%>"></td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="33%" valign="top">
			<textarea name="jobDesc1" cols="35" rows="4" wrap="VIRTUAL" class="small"><%=tempjobDescription[dd]%></textarea>
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="40%" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" class="bold" height="25">Joined as</td>
					<td align="center" class="small" height="25">:</td>
					<td height="25"><input type="text" name="joinedAs1" size="20" class="small" maxlength="40" value = "<%=tempjoinedAs[dd]%>"></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">Last Designation Held</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25"> <input type="text" name="designation1" size="20" class="small" maxlength="40" value = "<%=tempdesignation[dd]%>"></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">From</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25">
<%
String fromMonth = "0";
int fromYear = 0;

if(tempinternalFromMonth[dd] != null){
	fromMonth = tempinternalFromMonth[dd];

	// Integer.parseInt is done to remove the leading zeros from a String
	fromMonth = Integer.parseInt(fromMonth) + "";
}

if(tempinternalFromYear[dd] != null){
	fromYear = Integer.parseInt(tempinternalFromYear[dd]);
}
%>

						<select name="fromPrevMonth1" class="small">
							<%=HtmlUtil.getMonthList(fromMonth) %>
						</select>
						<select name="fromPrevYear1" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),fromYear,"desc") %>
						</select>
					</td>
				</tr>

<%
String toMonth = "0";
int toYear = 0;

if(tempprevToMonth[dd] != null){
	toMonth = tempprevToMonth[dd];

	// Integer.parseInt is done to remove the leading zeros from a String
	toMonth = Integer.parseInt(toMonth) + "";
}

if(tempprevToYear[dd] != null){
	toYear = Integer.parseInt(tempprevToYear[dd]+"");
}

%>

				<tr>
					<td width="40%" align="right" class="bold" height="25">To</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25">
						<select name="toPrevMonth1" class="small">
							<%=HtmlUtil.getMonthList(toMonth) %>
						</select>
						<select name="toPrevYear1" class="small">
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