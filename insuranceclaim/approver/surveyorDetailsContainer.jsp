   <table cellspacing="0" cellpadding="0" width="700" border="0">
      <tbody>
		  <tr>
          <td height="20" colspan="100" align="left" background="../images/menubg.jpg" bgcolor="#000000" class="style5" color="#ffffff"> </td>
        </tr>
        <tr>
          <td colspan="100" height="5"></td>
        </tr>
<%
		String requestNo  = (String) request.getParameter("requestNo");
%>
		 <tr>
          <td height="30" align="left"  class="style5" color="#ffffff">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Do you want to appoint the Surveyor for this Claim Request?</td>
			<td height="20" align="left" class="style3">
				<input type = "radio" name = "surveyorApp" value = "0" onClick = "surveyorAppDetail();"> Yes
				<input type = "radio" name = "surveyorApp" value = "1" onClick = "surveyorAppDetail();"> No
			</td>
		</tr>
</table>
<table cellspacing="0" cellpadding="0" width="700" border="0">
	 <tr>
		<td height="30" align="left"  class="style5" color="#ffffff" id="surveyorAppDetail">
		</td>
	</tr>  
	<tr  bgcolor="#EDE9E8">
		<td  align="center"  colspan = "100%">
			<input name="Submit" type="button" class="redButton" value="Submit" onclick = "approveSurveyor()" />
<!-- 			<input name="Reset" type="button" class="redButton" value="Reset" onclick = "rejectClaim()" />
 -->			<input name="Back" type="button" class="redButton" value="Back" onclick = "history.back()" />
		</td>
	</tr>

</table>

<input type = "hidden" name = "hiddRequestNo1" value = "<%=requestNo%>" >
