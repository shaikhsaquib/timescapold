<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="GovernancequizApproverWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizApproverWebController" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Review Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/governanceQuiz.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
</head>

<body>
<form name="governanceQuiz" method="post">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>
</table>
<%
		String userId = (String)request.getParameter("userId");
		String userName = (String)request.getParameter("userName");
        String question = "";
        String questionId = "";
		ArrayList userReport = new ArrayList(); 

		userReport = GovernancequizApproverWebController.viewFailQuestions(userId);
%>
<br>
<%@ include file="../includes/governanceQuizMenu.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td width="100%" colspan="0" align="right" class="style1"><a href="#" onclick="downloadReportPerUser(<%=userId%>)" class="normal">Download All</a></td>
  </tr>
 </table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td class="style2">
        Report For : <%=userName%>
    </td>
</tr>
</table>
<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

	<tr>
	<td width="5%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Sr.No</td>
	<td width="55%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Questions</td>
	<td width="20%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Selected Option</td>
	<td width="20%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Correct Option</td>

	</tr>
    </table>
	<div style="height:275px; overflow:scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
<%
		int j = 0;
        //out.println("----"+userReport.size());
        if (userReport.size() > 0) {
        for(int i = 0; i< userReport.size(); i++)
			{
                 //qusstion = "";
				 String[] tmpArr = (String [])userReport.get(i);
        //out.println("<br>"+qusstion+tmpArr[5]);

        if (!(question.equals(tmpArr[5]))) {
        j = j + 1;
%>
        <tr>
		<td align="right" width="5%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=j%>)</td>
        <td align="left" width="56%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=tmpArr[5]%></td>
        <td align="left" width="21%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=tmpArr[7]%></td>
        <td align="left" width="20%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=tmpArr[6]%></td>
		</tr>
<%
        } else {
          
%>   
        <td bgcolor="#f8f8f8" class="style3" cellspacing = "0" cellpadding = "0"></td> 
        <td bgcolor="#f8f8f8" class="style3" cellspacing = "0" cellpadding = "0"></td>
        <td align="left" width="21%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=tmpArr[7]%></td>
        <td align="left" width="20%" height="37" bgcolor="#f8f8f8" class="style3" valign="left"><%=tmpArr[6]%></td>
<%
                }
		question = tmpArr[5];
        }
       } else {
       
%>
        <table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
          <tr>
          <td bgcolor="#f8f8f8" align = "center" class="style3" cellspacing = "0" cellpadding = "0">User's session has expired before selecting any option</td>
          </tr>
        </table>

<%

       }

%>
  
</table>
</div>
<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>
  <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4"><div align="center">&nbsp;
  <input type="button" name="Back" value="Back" onclick = "javascript:history.back()">
  &nbsp;</div></td>
  </tr>
</table>


<p>&nbsp;</p>
</body>
</html>
