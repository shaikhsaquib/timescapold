<%
	if(session.getAttribute("profile") == null)	{
	 response.sendRedirect("/timescape/includes/sessionExpired.html");
     return;
}
%>