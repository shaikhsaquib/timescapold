<html>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
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

<script> 
    function hideImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'hidden'; 
            document.getElementById('button').style.visibility = 'hidden'; 
        } 
    }
    function showImage() { 
        if (document.getElementById) { 
            document.getElementById('printbutton').style.visibility = 'visible'; 
            document.getElementById('button').style.visibility = 'visible'; 
        } 
    } 
</script>

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
		
		out.println("You have scored 100/100 !!!");
		String toDate = (String)request.getParameter("toDate");
		String startDate = (String)request.getParameter("startDate");
        String score = request.getParameter("score");
        String date = request.getParameter("date");  
        String createdDate = request.getParameter("createdDate");  
		//out.println("createdDate--"+createdDate);
		
		//out.println("toDate=="+toDate);
		//out.println("startDate--"+startDate);
		//out.println("date--"+date);
		
%>
</h3>
<td>
</tr>
</table>
<br><br><br>
<table align="center" valign="middle">
	
	<tr class="style3" align="center">
		<!-- <td><h3>has successfully attempted the Governance Code - Quiz conducted from <%=startDate%> to <%=toDate%> !!!</h3></td> -->
		<!-- <td><h3>This is to certify that <%=displayName%> <BR>has successfully attempted the Governance Code - Quiz conducted on <%=createdDate%> <br> and will be required to retake the code-quiz test after six months on <%//=date%> !!!</h3></td> -->
		<td><h3>This is to certify that <%=displayName%> <BR>has successfully attempted the Governance Code - Quiz conducted on <%=createdDate%> <br> and will be required to retake the code-quiz test from 1st of April in the next financial year <%//=date%> !!!</h3></td>
	</tr>
</table>
<br><br>
<table align="center"  width="100%">
<tr align="center" >
<td width="100%" class="bold2" align="right"><span class="menu2Copy"><input name="printbutton" type="submit" class="style4" id="printbutton" value="Print" onclick="javascript:hideImage();window.print();showImage();"/></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="menu2Copy">
<input name="button" type="submit" class="style4" id="button" value="Close" onclick="javascript:window.close();"/>
</span>
</td>
</tr>
</table>
</table>
</body>
</html>