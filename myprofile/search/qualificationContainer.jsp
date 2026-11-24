<%
	ArrayList qualificationDetails = profileSearchController.getQualificationDetails(empl_compcode, empl_employeecode);
	int arrSize = qualificationDetails.size();
%>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td height="1" bgcolor = "#000000" colspan = "2"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
	</tr>

	<%
		if(arrSize == 0) {
	%>

	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20" colspan = "2">QUALIFICATION INFORMATION</td>
	</tr>

	<tr>
		<td colspan = "2" width = "1" bgcolor = "#CCCCCC"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="2" height="1"></td>
	</tr>

	<tr>
		<td class = "rednormal" align = "center" colspan = "2">No Qualification Information Filed</td>
	</tr>

	<%
		} else {
	%>
	<tr>
		<td class = "whitesmall" bgcolor = "#79A6D7" height = "20">QUALIFICATION INFORMATION</td>
	</tr>

	<%
			String strArr[] = null;
			for(int i = 0; i < arrSize; i++) {
				strArr = (String[])qualificationDetails.get(i);
	%>



	<tr>
		<td width = "50%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<tr>
						<td class = "bold" height = "25" align = "left" width = "30%">Qualification</td>
						<td class = "bold" height = "25"  align = "center" width = "5%">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left" width = "65%"><%=strArr[1]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">Specialization</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left"><%=strArr[2]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">% Marks/CGPA</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left"><%=strArr[6]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">Year</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left"><%=strArr[7]%></td>
					</tr>
				</table>
			</td>

		<td width = "50%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<tr>
						<td class = "bold" height = "25" align = "left" width = "45%">Institute</td>
						<td class = "bold" height = "25"  align = "center" width = "5%">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left" width = "50%"><%=strArr[3]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">Board / University</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left"><%=strArr[4]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">Type</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;:&nbsp;</td>
						<td class = "small" height = "25" align = "left"><%=strArr[5]%></td>
					</tr>

					<tr>
						<td class = "bold" height = "25" align = "left">&nbsp;</td>
						<td class = "bold" height = "25"  align = "center">&nbsp;</td>
						<td class = "bold" height = "25" align = "left">&nbsp;</td>
					</tr>

			</table>
		</td>		
	</tr>

	<tr>
		<td colspan = "2" width = "1" bgcolor = "#CCCCCC"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="2" height="1"></td>
	</tr>
	<%
			}
		}
	%>
</table>


