<html>
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
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>
</table>


<%
	
	String score = request.getParameter("score");

%>
<br><br><br><br><br><br>
	<table align="center" valign="middle">
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>
<%
		out.println("Your score is : "+score);

%>
</h3>
<td>
</tr>
</table>
</body>
</html>