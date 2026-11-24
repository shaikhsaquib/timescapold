<html>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<head><title>Score Page</title></head>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 10px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(../images/Q.png);
	background-repeat: no-repeat;
}
-->
</style>


<body>
<br><br><br>
<table width="100%" border="2" cellspacing="0" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <!-- <tr>
    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr> -->
  <tr align="center">
	<td><img src="../images/congrats_image.jpg" ></img></td>
	</tr>
</table>
<br><br>
<table align="center" valign="middle" width="100%">	
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>
<%
		
		out.println("You have scored 100");
		String toDate = (String)request.getParameter("toDate");
		String startDate = (String)request.getParameter("startDate");
		
		String fName = (String)request.getParameter("firstName");
		String sName = (String)request.getParameter("surName");
		//out.println(toDate);
		//out.println(startDate);
		//out.println(fName);
		//out.println(sName);
%>
</h3>
<td>
</tr>
</table>
<br><br><br>
<table align="center" valign="middle">
	<tr class="style3" align="center">
		<td><h3>This is to certify that Mr/Ms. <%=firstName%> <%=surName%> </h3></td>
	</tr>
	<tr class="style3" align="center">
		<td><h3>has attended the Quiz  successfully conducted from <%=startDate%> to <%=toDate%> </h3></td>
	</tr>
</table>
<br><br>
<table align="center"  width="100%">
<tr align="center" >
	<td>
	<!-- <a href="javascript:window.print()" title="Print this Page"><img src="../images/print.gif"></img></a> -->
	<a href="javascript:window.print()" title="Print this Page">Print this Page</img></a>
	</td>
</tr>
</table>
</table>
</body>
</html>