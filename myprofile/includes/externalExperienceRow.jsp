    <%
        for (int cc = startIndex; cc < endIndex; cc++) {
	%>
	<input type = "hidden" name = "experienceDetailIdPrev" value = "0">

	<tr>
		<td align="left" width="26%" valign="top"><input type="text" name="companyName" size="15" class="small" value = ""></td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="33%" valign="top">
			<textarea name="jobDesc1" cols="35" rows="4" wrap="VIRTUAL" class="small"></textarea>
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="40%" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" class="bold" height="25">Joined as</td>
					<td align="center" class="small" height="25">:</td>
					<td height="25"><input type="text" name="joinedAs1" size="20" class="small" maxlength="40" value = ""></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">Last Designation Held</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25"> <input type="text" name="designation1" size="20" class="small" maxlength="40" value = ""></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">From</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25">
						<select name="fromPrevMonth1" class="small">
							<%=HtmlUtil.getMonthList("0") %>
						</select>
						<select name="fromPrevYear1" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),0,"desc") %>
						</select>
					</td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">To</td>
					<td width="7%" align="center" class="small" height="25">:</td>
					<td width="53%" height="25">
						<select name="toPrevMonth1" class="small">
							<%=HtmlUtil.getMonthList("0") %>
						</select>
						<select name="toPrevYear1" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),0,"desc") %>
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