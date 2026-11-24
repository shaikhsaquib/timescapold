<%
		for (int aa = startIndex; aa < endIndex; aa++) {
%>

	<tr>
		<%
			dropDownUrl = "../utils/departments.jsp";
		%>

		<input type = "hidden" name = "experienceDetailId" value = "0">


		<td align="left" width="28%" valign="top">
			<jsp:include page="<%=dropDownUrl%>" flush="true" />
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="36%" valign="top">
			<textarea name="jobDesc" cols="35" rows="4" wrap="VIRTUAL" class="small"></textarea>
		</td>
		<td align="left" width="1%" class = "normal"></td>
		<td align="left" width="36%" valign="top">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="right" class="bold" height="25">Joined as</td>
					<td align="center" class="blackcontent" height="25">:</td>
					<td height="25">
					<%
						dropDownUrl = "../utils/designation.jsp?" + urlParameter ;
					%>
					<jsp:include page="<%=dropDownUrl%>" flush="true" />
					</td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">Last Designation Held</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<%
						dropDownUrl = "../utils/promotedDesignation.jsp?" + urlParameter;
					%>
					<td width="53%" height="25"><jsp:include page="<%=dropDownUrl%>" flush="true" /></td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">From</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<td width="53%" height="25">
						<select name="fromMonth" class="small">
							<%=HtmlUtil.getMonthList("0") %>
						</select>

						<select name="fromYear" class="small">
							<%=HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),0,"desc") %>
						</select>
					</td>
				</tr>

				<tr>
					<td width="40%" align="right" class="bold" height="25">To</td>
					<td width="7%" align="center" class="blackcontent" height="25">:</td>
					<td width="53%" height="25">
						<select name="toMonth" class="small">
							<%=HtmlUtil.getMonthList("0") %>
						</select>
						<select name="toYear" class="small">
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
