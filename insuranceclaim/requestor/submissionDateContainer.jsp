 <%
	String requestNo = (String)request.getParameter("requestNo");
	String claimNumber = (String)request.getParameter("claimNumber");
	//out.println(requestNo);
%>
<table cellspacing="0" cellpadding="0" width="400" border="0">
		 <tr><td>&nbsp;</td></tr> 
        <tr>
				<td width="50%" height="30" align="left" class="style5">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Probable Date of Submission <br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;of Documents: &nbsp;&nbsp;&nbsp;</td>
				<td height="20" align="left" class="style3"><input type="text" size= "26" name="submissionDate" onfocus="showCalendarControl(this);" readonly></td>
        </tr>        
    </table>
<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" >
<input type = "hidden" name = "hiddClaimNo" value = "<%=claimNumber%>" >