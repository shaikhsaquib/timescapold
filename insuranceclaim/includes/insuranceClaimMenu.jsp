<%
	String role = (String) session.getAttribute("claimUserRole");

	String[] subMenu = {"Apply Claim","View Claim","Approve Claim","Pending Claims","Claim Status"};
	String[] subMenuLink = {"../requestor/insuranceClaimApply.jsp","../requestor/viewInsuranceClaim.jsp","../approver/approveInsuranceClaim.jsp","../approver/pendingInsuranceClaim.jsp","../approver/claimStatus.jsp"};
	//System.out.println(currLink);
	//int roleId = 2;
	int roleId = Integer.parseInt(role);
	//int index = 0;

	int startIndex = 0;
	int endIndex = 0 ;

%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<%

	switch(roleId){

	case 1:
%>
		<tr>
			<td width="384" height="25" background="../images/menubg.jpg" bgcolor="#E1DAD9">
			  <span class="style4">&nbsp;&nbsp;REQUESTOR</span>
			</td>
		</tr>
		<tr>
			<td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
		</tr>
		<tr>
			<td height="25" background="../images/menubg.jpg">&nbsp;
<%
			startIndex = 0;
			endIndex = 1;
			break;

		case 2:
%>
		<tr>
			<td width="384" height="25" background="../images/menubg.jpg" bgcolor="#E1DAD9">
			  <span class="style4">&nbsp;&nbsp; APPROVER</span>
			</td>
		</tr>
		<tr>
			<td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
		</tr>
		<tr>
			<td height="25" background="../images/menubg.jpg">&nbsp;
<%
			startIndex = 2;
			endIndex = 4;

			break;
	
	case 3:
%>
		<tr>
			<td width="384" height="25" background="../images/menubg.jpg" bgcolor="#E1DAD9">
			  <span class="style4">&nbsp;&nbsp; ADMIN</span>
			</td>
		</tr>
		<tr>
			<td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
		</tr>
		<tr>
			<td height="25" background="../images/menubg.jpg">&nbsp;
<%
			startIndex = 0;
			endIndex = 4;

			break;
	}


	/*if(currLink.equals("#")){
		out.println("<a href=\"#\" ><span class=\"menu2\"> Landing Page |</span></a>");
	}else{
		out.println("<a href=\"#\" ><span class=\"menu2Copy\"> Landing Page |</span></a>");
	}*/
	for(int i = startIndex; i <= endIndex; i++)
			{

				if(i!= startIndex){
					
					out.println("<span class=\"menu2\">|</span>");
				}
				if(subMenuLink[i].equals(currLink)){
					
					out.println("<a href=\"" + subMenuLink[i] + "\"><span class=\"menu2\">" + subMenu[i] + "</span></a>");
				}else{

					out.println("<a href=\"" + subMenuLink[i] + "\"><span class=\"menu2Copy\">" + subMenu[i] + "</span></a>");
				}
			}
%>
			</td>
		</tr>
		<tr>
			<td align="left" bgcolor="#cccccc" height="1"><img height="1" src="../images/space.gif" width="1" /></td>
		</tr>
	</table>
