<%
	String tempStr = "";
	String dd = "";
	String mm = "";
	String yy = "";
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td class = "white" bgcolor = "#79A6D7" height = "20" align = "left">Profile</td>
		<td class = "white" bgcolor = "#79A6D7" height = "20" align = "right" colspan = "2"><a href = "#" onClick="javascript:printWindow();" class = "bold">Print <img src = "../images/print.gif" border = "0" valign = "absmiddle"></a>&nbsp;<a href = "#" onClick="javascript:window.close();" class = "bold">Close <img src = "../images/close_sym.gif" border = "0"></a></td>
	</tr>

	<tr>
		<td class = "bold" colspan = "2">&nbsp;</td>
	</tr>

	<tr>
            <td valign="top" align="left" width = "20%">
				<!-- <img src="/timescape/myprofile/common/showImage.jsp?timescapeUserOID=<%//=timescapeUserOID%>&alternateImagePath=/WebSphere5/AppServer/installedApps/jetintra/timescape.ear/timescape.war/myprofile/images/photograph.gif" alt = "Image Not Uploaded" height = "80" width = "80"> -->
			</td>	

			<td valign = "bottom" width = "40%">
				<%
					if(employeeDetails == null || employeeDetails.size() == 0) {
						
					} else {
				%>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td class = "bold" width = "30%" align = "left" height = "25">Name</td>
						<td class = "bold" width = "5%"  align = "center" height = "25">&nbsp;:&nbsp;</td>
						<td class = "normal" width = "70%" align = "left" height = "25"><%=employeeDetails.get("fullName")%></td>
					</tr>

					<%
						tempStr = (String)employeeDetails.get("birthdate");
						tempStr = tempStr.substring(0,10);
						yy = tempStr.substring(0,4);
						mm = tempStr.substring(5,7);
						dd = tempStr.substring(8,10);
						tempStr = dd + "-" + monthArr[Integer.parseInt(mm)] + "-" + yy;
					%>
					<tr>
						<td class = "bold" width = "30%" align = "left" height = "25">Date Of Birth</td>
						<td class = "bold" width = "5%"  align = "center" height = "25">&nbsp;:&nbsp;</td>
						<td class = "normal" width = "70%" align = "left" height = "25"><%=tempStr%></td>
					</tr>

					<tr>
						<td class = "bold" align = "left" height = "25">Company</td>
						<td class = "bold" align = "center" height = "25">&nbsp;:&nbsp;</td>
						<td class = "small" align = "left" height = "25"><%=employeeDetails.get("companyName")%></td>
					</tr>

					<tr>
						<td class = "bold"  align = "left" height = "25">Activity</td>
						<td class = "bold"   align = "center" height = "25">&nbsp;:&nbsp;</td>
						<td class = "small"  align = "left" height = "25"><%=employeeDetails.get("activityName")%></td>
					</tr>

				</table>
			</td>

			<td valign = "bottom" width = "40%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class = "bold"  align = "left" height = "25">Payroll Id</td>
					<td class = "bold"   align = "center" height = "25">&nbsp;:&nbsp;</td>
					<td class = "small" align = "left" height = "25"><%=employeeDetails.get("payId")%></td>
				</tr>
				<tr>
					<td class = "bold"  height = "25" align = "left">Department</td>
					<td class = "bold"  height = "25"  align = "center">&nbsp;:&nbsp;</td>
					<td class = "small"  height = "25" align = "left"><%=employeeDetails.get("deptGroup")%></td>
				</tr>

				<tr>
					<td class = "bold"  height = "25" align = "left">Branch</td>
					<td class = "bold"  height = "25"  align = "center">&nbsp;:&nbsp;</td>
					<td class = "small"  height = "25" align = "left"><%=employeeDetails.get("branchName")%></td>
				</tr>
				<tr>
					<td class = "bold"  height = "25" align = "left">Designation</td>
					<td class = "bold"  height = "25"  align = "center">&nbsp;:&nbsp;</td>
					<td class = "small"  height = "25" align = "left"><%=employeeDetails.get("designation")%></td>
				</tr>
			</table>
			</td>
	</tr>

	<tr>
		<td colspan = "3" class = "small">&nbsp;</td>
	</tr>
</table>

<%
	}
%>