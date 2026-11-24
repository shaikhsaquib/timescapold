    <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
<%
		String requestNo  = (String) request.getParameter("hiddRequestNo");
		String insuranceCompany  = (String) request.getParameter("insuranceCompany");
		String claimNumber  = (String) request.getParameter("hiddClaimNo");
		String policyType  = (String) request.getParameter("policyType");
		String lossDescription  = (String) request.getParameter("lossDescription");
		String updatedDamageAmount  = (String) request.getParameter("updatedDamageAmount");
		String capturedEmailId  = (String) request.getParameter("capturedEmailId");
		String department  = (String) request.getParameter("department");
		ArrayList company = insuranceClaimController.searchCompanyDetails();
%>
        <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insurance Company</td>
		  <td height="20" align="left" class="style3">
			<input type = "text" value = "<%=insuranceCompany%>" class="style3" disabled>
			</td>
		</tr>
		   <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Claim Number</td>
		  <td height="20" align="left" class="style3">
			<input type = "text" value = "<%=claimNumber%>" class="style3" disabled>
			</td>
		</tr>
		   <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy Type</td>
		  <td height="20" align="left" class="style3">
			<input type = "text"  value = "<%=policyType%>" class="style3" disabled>
			</td>
		</tr>
		   <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loss Amount</td>
		  <td height="20" align="left" class="style3">
			<!-- <input type = "text"  value = "<%=lossDescription%>" class="style3" disabled> -->
			<input type = "text"  value = "<%=updatedDamageAmount%>" class="style3" disabled>
			</td>
		</tr>
		   <tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email Id</td>
		  <td height="20" align="left" class="style3">
			<input type = "text"  value = "<%=capturedEmailId%>" class="style3" disabled>
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Department</td>
		  <td height="20" align="left" class="style3">
			<input type = "text"  value = "<%=department%>" class="style3" disabled>
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bank Name</td>
		  <td height="20" align="left" class="style3">
			<input type = "text" name = "bankName" class="style3">
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cheque Name</td>
			<td height="20" align="left" class="style3">
			<select name = "chequeName" class="style3" >
				<option class="style3" value = "0">Select the Company</option>
<%
		for(int i = 0; i < company.size() ; i++)
		{
			String companyDetails[] = (String[]) company.get(i);
%>
				<option class="style3" value = "<%=companyDetails[0]%>"><%=companyDetails[0]%></option>
<%
		}
%> 
				<!-- <option class="style3" value = "2000">Others</option> -->
			</select><img src="../images/tick.png" border="0" />
		  </td>
        </tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cheque Number</td>
		  <td height="20" align="left" class="style3">
			<input type = "text" name = "chequeNumber" class="style3">
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cheque Amount</td>
			<td height="20" align="left" class="style3">
				<input type = "text" name = "chequeAmount" class="style3">
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cheque Date</td>
			<td height="20" align="left" class="style3">
				<input type = "text" name = "chequeDate" class="style3" onfocus="showCalendarControl(this);" readonly>
			</td>
		</tr>
		<tr>
          <td height="1" colspan="2" align="right" bgcolor="#E2DDDA" class="style5"><img src="images/spacer.gif" width="1" height="1" /></td>
         </tr>
		<tr>
		  <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Remark</td>
		  <td height="20" align="left" class="style3">			
				<textarea name="settleRemark" rows = "4" class="style3"></textarea>
		</tr>
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
	<tr>
		<td height="30" align="left"  class="style5" color="#ffffff">
		</td>
	</tr>
	<tr  bgcolor="#EDE9E8">
		<td  align="center"  colspan = "100%">
			<input name="Submit" type="button" class="redButton" value="Submit" onclick = "settleClaim1()" />
<!-- 			<input name="Reset" type="button" class="redButton" value="Reset" onclick = "rejectClaim()" />
 -->			<input name="Back" type="button" class="redButton" value="Back" onclick = "history.back()" />
		</td>
	</tr>

</table>

<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" >
