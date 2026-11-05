<%
String roleId = (String)session.getAttribute("roleId");

%>
<%
  if (roleId.equals("1")){
%>
  <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../user/allCheckStatus.jsp" class="style2">View History</a>  </div>
		</td>
  </tr>
 <%
 }else if(roleId.equals("2")){
 %>
 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../user/allRequestChangeManeger.jsp" class="style2">Create Request</a> | <a href="../approver/approverRequest.jsp" class="style2">Approve Request </a> | <a href="../approver/approverAuthorise.jsp" class="style2">Authorise Request </a> </div>
		</td>
  </tr>
  <%
   }else if(roleId.equals("3")){
  %>
 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../admin/adminCreateRequest.jsp" class="style2">CREATE REQUEST</a> | <a href="../admin/adminRequest.jsp" class="style2">APPROVE REQUEST </a> | <a href="../admin/approverAuthorise.jsp" class="style2">AUTHORISE REQUEST</div>
		</td>
  </tr>
<%
}else{
 %>
	 <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../mas/masRequest.jsp" class="style2">APPROVE REQUEST</a>&nbsp; | &nbsp;<a href="../mas/governanceAdmin.jsp" class="style2">ADMIN</a></div>
		</td>
		

  </tr>
<%
	}
%>