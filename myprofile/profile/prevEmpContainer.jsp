<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="5">&nbsp;</td>
	</tr>
	<tr class="bold">
		<td colspan = "5" class = "header">Employment History - Previous Organizations<a href = "../common/externalExperienceHelp.jsp" target = "_blank"><img src = "../images/qmark.gif" border = "0"></a></td>
	</tr>
	<tr>
		<td colspan="5" class="normal" align="right" height="20"><sup class="rednormal">*</sup> All the fields in a single row are mandatory&nbsp;&nbsp;</td>
	</tr>
	<tr align="center" class="small" height="10">
		<td colspan="5" bgcolor="#FFFFFF"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>


	<tr class="white">
		<td align = "left" width="26%" height="20" bgcolor = "#000000">&nbsp;Company Name</td>
		<td align = "left" width="1%"  height="20" bgcolor = "#FFFFFF"></td>
		<td align = "left" width="33%" height="20" bgcolor = "#000000">&nbsp;Job Description (150 characters)</td>
		<td align = "left" width="1%"  height="20" bgcolor = "#FFFFFF"></td>
		<td align = "left" width="40%" height="20" bgcolor = "#000000">&nbsp;Designation / Duration</td>
	</tr>

	<tr align="left">
		<td height="7" colspan="5"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>


<%

/**
 		Steps to paint the Page
		~~~~~~~~~~~~~~~~~~~
		1. Get the resultset (ArrayList) from the datasource
		2. Check for the size of the ArrayList
		3. If the size of the ArrayList == 0 then include a jsp which contains 3 blank empty
		    rows of the required controls
		4. Else fetch the data up to the size of the ArrayList
		5. Paint empty controls for the remaining rows
*/

		if(expSize == 0){

			// No data found hence paint 3 empty  rows
			startIndex = 0;
			endIndex = 3;

%>
			<%@ include file="../includes/externalExperienceRow.jsp" %>
<%
		}else{
			startIndex = expSize;
			endIndex = startIndex +2;

		// Start paintingthe rows with already existing data
%>
				<%@ include file="../includes/populatedExtExperienceRow.jsp" %>
				<%@ include file="../includes/externalExperienceRow.jsp" %>
<%
		}
%>


	<tr>
		<td align="center" colspan="5" valign="top" height = "8">&nbsp;</td>
	</tr>
    <input type="hidden" name="option" value="">
	<tr>
		<td colspan = "5" align = "right">
			<a href = "javascript:addMore( )" class = "boldunderline">add more</a>
		</td>
	</tr>

	<tr>
		<td colspan = "100%" align = "center"><a href = "javascript:submitForm( )"><img src="../images/but_submit.gif" width="56" height="15" border = "0"></a> <a href = "javascript:history.go(-1)"><img src="../images/but_back.gif" width="56" height="15" border = "0"></a></td>
	</tr>
</table>