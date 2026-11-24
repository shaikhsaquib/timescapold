<%
	Hashtable personalDetails = profileSearchController.getPersonalDetails(empl_compcode, empl_employeecode);

	if( personalDetails == null || personalDetails.size() == 0) {
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td height="1" bgcolor = "#000000" colspan = "2"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20" colspan = "2">PERSONAL INFORMATION</td>
	</tr>

	<tr>
		<td class = "bold" height = "20" colspan = "2">&nbsp;</td>
	</tr>

	<tr>
		<td class = "rednormal" colspan = "2" height = "20" align = "center">No Personal Details !!!</td>
	</tr>
</table>

<%
	} else {

%>


<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td class = "bold" colspan = "2" height = "20">&nbsp;</td>
	</tr>

	<tr>
		<td height="1" bgcolor = "#000000" colspan = "2"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20">PERSONAL INFORMATION</td>
		<td>&nbsp;</td>
	</tr>

	<tr>
		<td class = "bold" colspan = "2" height = "20">&nbsp;</td>
	</tr>

	<tr>
		<td valign = "top" width = "50%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<%
					if(personalDetails.get("TITLEDESC") != null) {
						tempStr = (String) personalDetails.get("TITLEDESC");
					} else {
						tempStr = " ";
					}
				%>
				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Title</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("FIRSTNAME") != null) {
						tempStr = (String) personalDetails.get("FIRSTNAME");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">First Name</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("MIDDLENAME") != null) {
						tempStr = (String) personalDetails.get("MIDDLENAME");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Middle name</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("LASTNAME") != null) {
						tempStr = (String) personalDetails.get("LASTNAME");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Last Name</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("GENDER") != null) {
						tempStr = (String) personalDetails.get("GENDER");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Gender</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=gender.containsKey(tempStr) ? gender.get(tempStr) : tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("MARITALSTATUS") != null) {
						tempStr = (String) personalDetails.get("MARITALSTATUS");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Marital Status</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("FAMILYMEMBERS") != null) {
						tempStr = (String) personalDetails.get("FAMILYMEMBERS");
					} else {
						tempStr = "0";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">No of Dependents</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>
			</table>
		</td>

		<td valign = "top" width = "50%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<%
					if(personalDetails.get("LANGUAGEDESC") != null) {
						tempStr = (String) personalDetails.get("LANGUAGEDESC");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Mother Tongue</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("PASSPORTNUMBER") != null) {
						tempStr = (String) personalDetails.get("PASSPORTNUMBER");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Passport Number</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("BLOODGROUPDES") != null) {
						tempStr = (String) personalDetails.get("BLOODGROUPDES");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Blood Group</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("PANNUMBER") != null) {
						tempStr = (String) personalDetails.get("PANNUMBER");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">PAN Number</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("PFACCOUNTNUMBER") != null) {
						tempStr = (String) personalDetails.get("PFACCOUNTNUMBER");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">PF Account Number</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("ALTERNATEEMAILIDD") != null) {
						tempStr = (String) personalDetails.get("ALTERNATEEMAILIDD");
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Alternate Email ID</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>

				<%
					if(personalDetails.get("UPDATEDON") != null) {
						tempStr = (String) personalDetails.get("UPDATEDON");
						tempStr = tempStr.substring(0,10);
						yy = tempStr.substring(0,4);
						mm = tempStr.substring(5,7);
						dd = tempStr.substring(8,10);
						tempStr = dd + "-" + monthArr[Integer.parseInt(mm)] + "-" + yy;
					} else {
						tempStr = " ";
					}
				%>

				<tr>
					<td class = "bold" height = "25" align = "left" height = "20">Updated On</td>
					<td class = "bold" height = "25"  align = "center" height = "20">&nbsp;:&nbsp;</td>
					<td class = "small" height = "25" align = "left" height = "20"><%=tempStr%></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%
	}
%>