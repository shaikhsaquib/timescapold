<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="5">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr class="bold">
					<td colspan = "3" class = "header">Employment History - Within Organization<a href = "../common/internalExperienceHelp.jsp" target = "_blank"><img src = "../images/qmark.gif" border = "0"></a></td>
				</tr>
				<tr>
					<td colspan="3" class="small" height="5">
						<img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1">
					</td>
				</tr>

				<tr>
					<td colspan="3" class="normal" height = "20" align = "left">
						<span class = "bold">Note&nbsp;:&nbsp;</span><span class = "bluenormal">Please use Internet Explorer version 5.0 or above while browsing Timescape to ensure best functional / visual experience.</span>
					</td>
				</tr>
				<tr>
					<td colspan="3" class="normal" align="left" height="20"><span class = "bold">Note&nbsp;:&nbsp;</span>All the fields in a single row are mandatory&nbsp;&nbsp;</td>
				</tr>

			</table>
		</td>
	</tr>


	<tr align="center" class="small" height="10">
		<td colspan="5" bgcolor="#FFFFFF"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>


	<tr class="white">
		<td align = "left" width="28%" height="20" bgcolor = "#000000">&nbsp;Department Name</td>
		<td align = "left" width="1%"  height="20" bgcolor = "#FFFFFF">&nbsp;</td>
		<td align = "left" width="36%" height="20" bgcolor = "#000000">&nbsp;Job Description (150 characters)</td>
		<td align = "left" width="1%"  height="20" bgcolor = "#FFFFFF">&nbsp;</td>
		<td align = "left" width="36%" height="20" bgcolor = "#000000">&nbsp;Designation / Duration</td>
	</tr>

	<tr align="left">
		<td height="5" colspan="5"><img src="<%=Constants.IMAGE_PATH%>/spacer.gif" width="1" height="1"></td>
	</tr>

    <%
		String[] tempexperienceDetailId		= null;
		String[] tempexperienceFlag			= null;
		String[] tempdepartments			= null;
		String[] tempjobDescription			= null;
		String[] tempjoinedAs				= null;
		String[] tempdesignation			= null;
		String[] tempinternalFromMonth		= null;
		String[] tempinternalFromYear		= null;
		String[] tempprevToMonth			= null;
		String[] tempprevToYear				= null;

		String month = "";
		String year = "";

		boolean flag  = false;

		if (request.getParameterValues("experienceFlag") != null) {

			tempexperienceDetailId		= request.getParameterValues("experienceDetailId");
			tempexperienceFlag			= request.getParameterValues("experienceFlag");
			tempdepartments				= request.getParameterValues("deptCompany");
			tempjobDescription			= request.getParameterValues("jobDesc");
			tempjoinedAs				= request.getParameterValues("joinedAs");
			tempdesignation				= request.getParameterValues("promotedDesignation");
			tempinternalFromMonth		= request.getParameterValues("fromMonth");
			tempinternalFromYear		= request.getParameterValues("fromYear");
			tempprevToMonth				= request.getParameterValues("toMonth");
			tempprevToYear				= request.getParameterValues("toYear");

			expSize = tempexperienceDetailId.length;
		}
%>

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
			<%@ include file="../includes/internalExperienceRow.jsp" %>
<%
		}else{
			startIndex = expSize;
			endIndex = startIndex +2;

		// Start paintingthe rows with already existing data
%>
				<%@ include file="../includes/populatedIntExperienceRow.jsp" %>
				<%@ include file="../includes/internalExperienceRow.jsp" %>
<%
		}
%>
</table>