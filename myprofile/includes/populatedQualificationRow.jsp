<table width="100%" border="0" cellspacing="1" cellpadding="0">

    <%

    String tempQualificationCodeStr = "";

    String tempUniversityStr = "";
    String tempInstituteStr = "";
    String tempSpecializationStr = "";

	for(int aa=0; aa < qualSize; aa++) {



                tempInstituteStr = tempInstitute[aa];
                if (tempInstitute[aa] != null && !"".equals(tempInstitute[aa].trim())) {

                    tempInstituteStr = Utility.replaceQuoteJS(tempInstitute[aa]);
                    if (tempInstituteStr.indexOf("&") > -1) {
                        tempInstituteStr = Utility.replaceAmparsandURL(tempInstituteStr);
                    }
                } 

                tempSpecializationStr = tempSpecialization[aa];
                if (tempSpecialization[aa] != null && !"".equals(tempSpecialization[aa].trim())) {

                    tempSpecializationStr = Utility.replaceQuoteJS(tempSpecialization[aa]);
                    if (tempSpecializationStr.indexOf("&") > -1) {
                        tempSpecializationStr = Utility.replaceAmparsandURL(tempSpecializationStr);
                    }
                } 

                tempUniversityStr = tempUniversity[aa];
                if (tempUniversity[aa] != null && !"".equals(tempUniversity[aa].trim())) {

                    tempUniversityStr = Utility.replaceQuoteJS(tempUniversity[aa]);
                    if (tempUniversityStr.indexOf("&") > -1) {
                        tempUniversityStr = Utility.replaceAmparsandURL(tempUniversityStr);
                    }
                }
                

    %>

				<tr bgcolor="#FFFFFF" class="normal">
					<td width="19%" valign="middle" height = "20" class="bold">Qualification</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" valign="middle">
							<input type = "hidden" name = "qualificationOID" value="<%=tempQualificationOID[aa]%>">
							<input type = "text" name = "qualification" value = "<%=tempQualificationCode[aa]%>" class = "small" size = "32" onFocus = "javascript:disable('qualification',<%=aa%>)">


							<%
								dropDownUrl = "../utils/qualification.jsp?selectedOption="+tempQualificationCode[aa];
							%>

							<a href = "javascript:showPopUp(<%=aa%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>&nbsp;
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" height = "20" class = "bold" valign="middle">Institute</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" height="25" class = "small" valign="top">

                        <%
                            dropDownUrl = "../utils/institutes.jsp?selectedOption="+tempInstituteStr;
                        %>

						<input type = "text" name = "institute" value = "<%=tempInstitute[aa]%>" class = "small" size = "32" onFocus = "javascript:disable('institute',<%=aa%>)">

						<a href = "javascript:showPopUp(<%=aa%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>
					</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
				</tr>

				<tr>
					<td width="19%" valign="middle" height = "20" class = "bold">Specialization</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" class = "small" valign="middle">
                        <%
                            System.out.println("satyajit : "+tempSpecializationStr);
                            dropDownUrl = "../utils/specialization.jsp?selectedOption="+tempSpecializationStr;
                        %>
								<input type = "text" name = "specialization"  value = "<%=tempSpecialization[aa]%>" size = "32" class = "small" onFocus = "javascript:disable('specialization',<%=aa%>)">

						&nbsp;<a href = "javascript:showPopUp(<%=aa%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>&nbsp;
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "bold">Board / University</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" class = "normal">
                        <%
                            dropDownUrl = "../utils/university.jsp?selectedOption="+tempUniversityStr;
                        %>
								<input type = "text" name = "university"  value = "<%=tempUniversity[aa]%>" size = "32" class = "small" onFocus = "javascript:disable('university',<%=aa%>)">

						<a href = "javascript:showPopUp(<%=aa%>,'<%=dropDownUrl%>')" class = "boldunderline"><img src="../images/but_review.jpg" border="0"></a>
					</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
				</tr>


				<tr>
					<td width="19%" valign="middle" height = "20" class = "bold">% Marks/CGPA</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="30%" height="25" class = "normal" valign = "middle">
						<input class="small" maxLength="5" size="6" name = "percentAcquired" value="<%=tempPercentAcquired[aa]%>">
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "bold">Type</td>
					<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
					<td width="29%" height="25" valign = "middle">
                        <%
                            dropDownUrl = "../utils/studyType.jsp?selectedOption="+tempStudyType[aa];
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
                                if ( (tempPassingYear[aa] == null) || ("".equals(tempPassingYear[aa].trim()) ) ) {

                                    tempPassingYear[aa] = "0";
                                }
                                out.print(HtmlUtil.getYearList(1920,today.get(Calendar.YEAR),Integer.parseInt(tempPassingYear[aa]),"desc"));
                            %>
						</select>
					</td>

					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="19%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="29%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<td width="1%" valign="middle" height = "20" class = "normal">&nbsp;</td>
					<input type="hidden" name="qualificationDetailId" value="<%=tempQualificationDetailId[aa]%>">
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