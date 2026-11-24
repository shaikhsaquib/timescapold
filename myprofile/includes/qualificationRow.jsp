<table width="100%" border="0" cellspacing="1" cellpadding="0">

<%
    String urlParameters = "selectedOption= ";
	for(int ii=startIndex; ii < endIndex; ii++){
%>

				<tr bgcolor="#FFFFFF" class="normal">
					<td width="19%" valign="middle" height = "20" class="bold">Qualification</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" valign="middle">
							<input type = "text" name = "qualification" class = "small" size = "32" onFocus = "javascript:disable('qualification',<%=ii%>)">
							<input type = "hidden" name = "qualificationOID" value="0">

							<%
								dropDownUrl = "../utils/qualification.jsp?"+urlParameters;
							%>

							<a href = "javascript:showPopUp(<%=ii%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>&nbsp;
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" height = "20" class = "bold" valign="middle">Institute</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" height="25" class = "small" valign="top">

                        <%
                            dropDownUrl = "../utils/institutes.jsp?"+urlParameters;
                        %>

						<input type = "text" name = "institute" class = "small" size = "32" onFocus = "javascript:disable('institute',<%=ii%>)">

						<a href = "javascript:showPopUp(<%=ii%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>
					</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
				</tr>

				<tr>
					<td width="19%" valign="middle" height = "20" class = "bold">Specialization</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" class = "small" valign="middle">
                        <%
                            dropDownUrl = "../utils/specialization.jsp?"+urlParameters;
                        %>
								<input type = "text" name = "specialization"  size = "32" class = "small" onFocus = "javascript:disable('specialization',<%=ii%>)">

						&nbsp;<a href = "javascript:showPopUp(<%=ii%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>&nbsp;
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "bold">Board / University</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" class = "normal">
                        <%
                            dropDownUrl = "../utils/university.jsp?"+urlParameters;
                        %>
								<input type = "text" name = "university"  size = "32" class = "small" onFocus = "javascript:disable('university',<%=ii%>)">

						<a href = "javascript:showPopUp(<%=ii%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>
					</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
				</tr>


				<tr>
					<td width="19%" valign="middle" height = "20" class = "bold">% Marks/CGPA</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" class = "normal" valign = "middle">
						<input class="small" maxLength="5" size="6" name = "percentAcquired">
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "bold">Type</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" height="25" valign = "middle">
                        <%
                            dropDownUrl = "../utils/studyType.jsp?selectedOption=0";
                        %>
                        <jsp:include page="<%=dropDownUrl%>" flush="true" />
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
				</tr>

				<tr>
					<td width="19%" valign="middle" height = "20" class = "bold">Year</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" class = "normal" valign = "middle">
						<select class="small" name="passingYear">
                            <%
			    							out.print(HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),0,"desc"));
                            %>
						</select>
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="29%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<input type="hidden" name="qualificationDetailId" value="0">
				</tr>

				<tr>
					<td colspan = "10" class = "normal" height = "10">
						<hr size="1">
					</td>
				</tr>


<%
	}
%>
</table>