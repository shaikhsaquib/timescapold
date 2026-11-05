<%
	if(session.getAttribute("userHash") == null)	{

		response.sendRedirect("/timescape/includes/sessionExpired.html");
		return;

	}
%>