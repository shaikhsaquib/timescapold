<%
	if(session.getAttribute("userHash") == null)	{
	 //response.sendRedirect("/timescape/sapep/collaboration/groupware/includes/unauthorized.html");
	 response.sendRedirect("/timescape/includes/sessionExpired.html");
     return;
}
%>