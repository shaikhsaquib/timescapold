<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>
<%@ include file="../includes/empHeader.jsp" %>
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
<title>Untitled Document</title>
</head>
<%
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","0");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myProfile.breadcrumb");

%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td valign = "top">
			<%@ include file="../includes/profileTabs.jsp" %>						
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <th scope="row"><div align="center"><img src="../images/ESSreDevelopment.jpg" width="324" height="288" /></div></th>
  </tr>
</table>
</body>
</html>