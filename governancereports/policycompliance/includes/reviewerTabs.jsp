<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="826px" height="64" /></td>
  </tr>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/daily.jsp" class="style2">MY COMPLIANCE</a> | REVIEW COMPLIANCE |  </div>
		</td>
  </tr>
  <tr>
	<td colspan="100%" height="1px" bgcolor="#666666"><block type="spacer" height="1px"></td>
  </tr>
<%
	session.setAttribute("currLink","CONTROLS");
	session.setAttribute("leftLink","0");
%>
	<%@ include file="../includes/dashBoardTabs.jsp" %>
</table>

<%
	session.setAttribute("currLink","DAILY");
	session.setAttribute("leftLink","0");
%>
	<%@ include file="../includes/dashBoardFrequencyTabs.jsp" %>