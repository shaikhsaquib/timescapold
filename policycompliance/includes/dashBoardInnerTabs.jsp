  <%
    
    if(roleId.equals("4")) {

  %>
   <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/reportHeader.jsp?roleId=1&mainRoleId=4" class="style2">MY COMPLIANCE</a> |<a href="../requestor/reportHeader.jsp?roleId=2&mainRoleId=4" class="style2"> ENSURE COMPLIANCE</a> | REPORT |  </div>
		</td>
  </tr>

  <%
    } else{
%>
    <tr>
		<td height="25" colspan="6" align="center" valign="middle" class="style4"><div align="left"><a href="../requestor/reportHeader.jsp?roleId=1&mainRoleId=3" class="style2">MY COMPLIANCE</a>| REPORT |  </div>
		</td>
  </tr>

  <%
  }
  %>