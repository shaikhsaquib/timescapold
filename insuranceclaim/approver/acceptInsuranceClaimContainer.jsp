   <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
<%
		String requestNo  = (String) request.getParameter("hiddRequestNo");
		ArrayList company = insuranceClaimController.searchCompanyDetails();
%>
        <tr>
          <td width="35%" height="30" align="right" class="style5"><div align="left">Entity: &nbsp;&nbsp;&nbsp;</div></td>
          <td width="74%" height="20" align="left" class="style3">
			<select name = "entity" class="style3" onchange = "showPolicyDetail()">
				<option class="style3" value = "0">Select the Entity</option>
<%
		for(int i = 0; i < company.size() ; i++)
		{
			String companyDetails[] = (String[]) company.get(i);
%>
				<option class="style3" value = "<%=companyDetails[1]%>"><%=companyDetails[0]%></option>
<%
		}
%> 
				<!-- <option class="style3" value = "2000">Others</option> -->
			</select><img src="../images/tick.png" border="0" />
		  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">Type of Policy</td>
			<td height="20" align="left" class="style3" id="id:policyName">			
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">Policy No</td>
			<td height="20" align="left" class="style3" id="id:policyNo">			
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">Insurance Company</td>
			<td height="20" align="left" class="style3" id="id:insuranceCompany">			
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
<%
		String claimNumber = insuranceClaimController.generateClaimNumber();
%>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">Claim Number</td>
			<td height="20" align="left" class="style3">
				<input type = "text" name = "claimNumber" class="style3" value = <%=claimNumber%> readonly>
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
		  <td height="30" align="left"  class="style5" color="#ffffff">Claim Form Name</td>
		  <td height="20" align="left" class="style3">			
				<input type = "text" name = "claimFormValue" class="style3">
		  <a href="javascript:void window.open('../common/claimForms.jsp','','resizable=yes,toolbars=no,scrollbars=yes,width=750,height=375,top=100,left=50')" 			
		  class="style3Underline">Click here to select the Claim Form</a></td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
		  <td height="30" align="left"  class="style5" color="#ffffff">Remark</td>
		  <td height="20" align="left" class="style3">			
				<textarea name="remark" rows = "4" class="style3"></textarea>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="../images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<!-- <tr>
          <td height="30" align="left"  class="style5" color="#ffffff">Do you want to appoint the Surveyor for this Claim Request</td>
			<td height="20" align="left" class="style3">
				<input type = "radio" name = "surveyorApp" value = "0" onclick = "surveyorAppDetail();"> Yes
				<input type = "radio" name = "surveyorApp" value = "1" onclick = "surveyorAppDetail();"> No
			</td>
		</tr> -->
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
	<!-- <tr>
		<td height="30" align="left"  class="style5" color="#ffffff" id="id:surveyorAppDetail">
		</td>
	</tr> -->
	<tr  bgcolor="#EDE9E8">
		<td  align="center"  colspan = "100%">
			<input name="Accept" type="button" class="redButton" value="Submit" onclick = "approveClaim()" />
<!-- 			<input name="Reset" type="button" class="redButton" value="Reset" onclick = "rejectClaim()" />
 -->			<input name="Back" type="button" class="redButton" value="Back" onclick = "history.back()" />
		</td>
	</tr>

</table>

<input type = "hidden" name = "hiddRequestNo1" value = "<%=requestNo%>" >
