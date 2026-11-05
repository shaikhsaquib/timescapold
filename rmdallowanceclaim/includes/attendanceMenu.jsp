<%
String role = (String) session.getAttribute("roleId");
//System.out.println("role " +role);
String menu[ ] = new String[4];
String menuOpt[ ] =  new String[4];
String links[ ]   = new String[4];
String litecolor = "#D0E0F0";
String darkcolor = "#9CACBC";

String currLink = (String) session.getAttribute("currLink");
//String currLink = "applyForLeave.jsp";
//System.out.println("Current Link "+currLink);

int roleId = Integer.parseInt(role);

switch(roleId){

	case 1:
		menu[0] 			= "VIEW ATTENDANCE";
		menuOpt[0]		= "viewAttendance.jsp";
		links[0]   			= "../attendance/viewAttendance.jsp";

		menu[1] 			= "CHECK ATTENDANCE";
		menuOpt[1]		= "checkAttendance.jsp";
		links[1]    			= "../attendance/checkAttendance.jsp";

		menu[2] 			= "";
		menuOpt[2]		= "";
		links[2]   			= "";

		menu[3] 			= "";
		menuOpt[3]		= "";
		links[3]   			= "";
		break;

	case 2:
		menu[0] 			= "VIEW ATTENDANCE";
		menuOpt[0]		= "viewAttendance.jsp";
		links[0]   			= "../attendance/viewAttendance.jsp";

		menu[1] 			= "CHECK ATTENDANCE";
		menuOpt[1]		= "checkAttendance.jsp";
		links[1]    			= "../attendance/checkAttendance.jsp";

		menu[2] 			= "";
		menuOpt[2]		= "";
		links[2]   			= "";

		menu[3] 			= "";
		menuOpt[3]		= "";
		links[3]   			= "";
		break;


	case 3:
		menu[0] 			= "VIEW ATTENDANCE";
		menuOpt[0]		= "viewAttendance.jsp";
		links[0]   			= "../attendance/viewAttendance.jsp";

		menu[1] 			= "CHECK ATTENDANCE";
		menuOpt[1]		= "checkAttendance.jsp";
		links[1]    			= "../attendance/checkAttendance.jsp";

		menu[2] 			= "";
		menuOpt[2]		= "";
		links[2]   			= "";

		menu[3] 			= "";
		menuOpt[3]		= "";
		links[3]   			= "";
		break;

	 case 4:
		menu[0] 			= "VIEW ATTENDANCE";
		menuOpt[0]		= "viewAttendance.jsp";
		links[0]   			= "../attendance/viewAttendance.jsp";

		menu[1] 			= "";
		menuOpt[1]		= "";
		links[1]    			= "";

		menu[2] 			= "";
		menuOpt[2]		= "";
		links[2]   			= "";

		menu[3] 			= "";
		menuOpt[3]		= "";
		links[3]   			= "";
		break;
}

%>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
<%
for(int ii=0; ii < menuOpt.length; ii++){
	if(menuOpt[ii].equalsIgnoreCase(currLink)){
%>
				<td bgcolor="<%=litecolor%>" class="normal" align="center" width="20%" height="20">
					<a href="<%=links[ii]%>" class="underline"><strong><%=menu[ii]%></strong></a>
				</td>
<%
	}else{
%>
				<td bgcolor="<%=darkcolor%>" class="normal" align="center" width="20%" height="20">
					<a href="<%=links[ii]%>" class="underline"><%=menu[ii]%></a>
				</td>
<%
	}
}
%>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="#D0E0F0">
		<td height="25" class="normal">&nbsp;</td>
	</tr>
</table>

