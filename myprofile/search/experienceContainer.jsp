<%
	ArrayList experienceDetails = profileSearchController.getExperienceDetails(empl_compcode, empl_employeecode);
	arrSize = experienceDetails.size();
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<%
		if(experienceDetails.size() == 0) {
	%>
	<tr>
		<td height="1" bgcolor = "#000000" colspan = "5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20" width = "50%">EMPLOYMENT HISTORY - Within the Organisation</td>
	</tr>

	<tr>
		<td class = "bold" height = "20">&nbsp;</td>
	</tr>

	<tr>
		<td class = "rednormal" colspan = "5" height = "20" align = "center">No Experience Information Filed</td>
	</tr>

	<%
		} else {
	%>

	<tr>
		<td height="1" bgcolor = "#000000" colspan = "5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20" colspan = "3">EMPLOYMENT HISTORY - Within the Organisation</td>
		<td colspan = "2">&nbsp;</td>
	</tr>

	<tr>
		<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr> 
		<td class="bold" align = "left" width="25%" height="20" bgcolor = "#CCCCCC">&nbsp;Department Name</td>
		<td class="bold" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "small">&nbsp;</td>
		<td class="bold" align = "left" width="30%" height="20" bgcolor = "#CCCCCC">&nbsp;Job Description (150 characters)</td>
		<td class="bold" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "small">&nbsp;</td>
		<td class="bold" align = "left" width="43%" height="20" bgcolor = "#CCCCCC">&nbsp;Designation / Duration</td>
	</tr>

	<%
			String strArr[] = null;
			boolean flag = true;
			for(int i = 0; i < arrSize; i++) {
				strArr = (String[])experienceDetails.get(i);
	%>
	

	<%
		if(i == 0 && strArr[1].equals("EX")) {
	%>

	<tr class="bold"> 
		<td colspan="5"><div align="center" class="rednormal">No Internal Experience</div></td>
	</tr>

	<%
		}
	%>	

	<%
		if(strArr[1].equals("EX") && flag) {
	%>
	<tr>
		<td height="1" bgcolor = "#000000" colspan = "5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20" colspan = "3">EMPLOYMENT HISTORY - Previous Organisation</td>
		<td colspan = "2">&nbsp;</td>
	</tr>

	<tr>
		<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<tr> 
		<td class="bold" align = "left" width="25%" height="20" bgcolor = "#CCCCCC">&nbsp;Company Name</td>
		<td class="bold" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "small">&nbsp;</td>
		<td class="bold" align = "left" width="30%" height="20" bgcolor = "#CCCCCC">&nbsp;Job Description</td>
		<td class="bold" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "small">&nbsp;</td>
		<td class="bold" align = "left" width="43%" height="20" bgcolor = "#CCCCCC">&nbsp;Designation / Duration</td>
	</tr>
	<%
			flag = false;
		}
	%>
	<tr> 
		<td class="small" align = "left" width="25%" height="20"><%=strArr[0]%></td>
		<td class="small" align = "left" width="1%"  height="20" class = "small">&nbsp;</td>
		<td class="small" align = "left" width="30%" height="20"><%=strArr[2]%></td>
		<td class="small" align = "left" width="1%"  height="20"class = "small">&nbsp;</td>
		<td class="small" align = "left" width="43%" height="20">
			<table border = "0">
				<tr>
					<td class = "bold" height = "20" width = "20%">Joined As</td>
					<td class = "bold" height = "20" width = "3%">:</td>
					<td class = "small" height = "20" width = "25%"><%=strArr[3]%></td>
					<td class = "bold" height = "20" width = "2%">&nbsp;</td>
					<td class = "bold" height = "20" width = "20%">From</td>
					<td class = "bold" height = "20" width = "3%">:</td>
					<td class = "small" height = "20" width = "25%"><%=strArr[5]%></td>
				</tr>

				<tr>
					<td class = "bold" height = "20" width = "20%">Last Designation</td>
					<td class = "bold" height = "20" width = "3%">:</td>
					<td class = "small" height = "20" width = "25%"><%=strArr[4]%></td>
					<td class = "bold" height = "20" width = "2%">&nbsp;</td>
					<td class = "bold" height = "20" width = "20%">To</td>
					<td class = "bold" height = "20" width = "3%">:</td>
					<td class = "small" height = "20" width = "25%"><%=strArr[6]%></td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td class = "bold" colspan = "5" height = "20">&nbsp;</td>
	</tr>

	<%
			}//for
		}//check null if
	%>

</table>