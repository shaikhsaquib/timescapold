 <%
	String submissionDate = (String)request.getParameter("submissionDate");
	String requestNo = (String)request.getParameter("hiddRequestNo");
	String claimNumber = (String)request.getParameter("hiddClaimNo");
%>

    <table cellspacing="0" cellpadding="0" width="400" border="0">
	<tr>
	<td>&nbsp;</td>	
	</tr>
	<tr>
		<td width="50%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Probable Date of Submission <br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;of Documents: &nbsp;&nbsp;&nbsp;</td>
		<td  height = "50" align = "center" class = "style5">:&nbsp;</td>
		<td class = "style3"  height = "30" align = "left">
			<%=submissionDate%> 
		</td>
	</tr>
</table>
<input type = "hidden" name = "hiddSubmissionDate" value = "<%=submissionDate%>">
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" >
<input type = "hidden" name = "hiddClaimNo" value = "<%=claimNumber%>" >