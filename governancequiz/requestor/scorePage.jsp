<% session.setAttribute("score","1");%>
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
    String date = request.getParameter("date");
	String toDate = (String)request.getParameter("toDate");
	String startDate = (String)request.getParameter("startDate");        
	String createdDate = request.getParameter("createdDate");
    //session.setAttribute("date",date);
    //session.setAttribute("score",score);

%>
<br><br><br><br><br><br>
	<table align="center" valign="middle">
	<tr>
	<td height="17" colspan="6" align="center" valign="middle" class="style3">
	<h3>
<%
		out.println("Thank you for answering the Governance Code - Quiz!");
		out.println("<br> Your score is : "+score +" / 100");
		out.println("<br> You will shortly receive a system generated email stating your score,");
        out.println("<br> and the details of answers to the questions incorrectly answered by you, if any.");
		if(score.equals("100")){
			out.println("<br> You can re-appear for the Quiz from 1st of April in the next financial year <br>");
		}else{
			out.println("<br> You can re-appear for the Quiz on or after <br>"+date);
		}

%>
</h3>
<td>
</tr>
<%
if(score.equals("100")){
%>
<table align="center"  width="100%">
<tr align="center" >
	<td>
		<a href="javascript:void window.open('../requestor/certificatePage.jsp?toDate=<%=toDate%>&startDate=<%=startDate%>&date=<%=date%>&score=<%=score%>&createdDate=<%=createdDate%>')" title="Print Certificate Page">Print Certificate Page</img></a>
	</td>
</tr>
</table>

<%
}
%>

</table>
</body>
</html>