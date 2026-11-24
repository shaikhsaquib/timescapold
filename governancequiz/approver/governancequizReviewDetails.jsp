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
<br>
<%
	
		String timescapeId = (String)request.getParameter("timescapeId");
		
		ArrayList userid =(ArrayList) session.getAttribute("userid");

		String status = request.getParameter("status");

		String dept = request.getParameter("deptname");

		ArrayList usersNames =  new ArrayList();

		//System.out.println("timescapeUserOId......."+timescapeUserOId);
		if(status.equals("0"))
		{
			status = "F";

			usersNames = GovernancequizApproverWebController.viewUserNames(status,dept);
		
		}
		else if(status.equals("1"))
		{
			status = "P";

			usersNames = GovernancequizApproverWebController.viewUserNames(status,dept);		

		}
	
%>
<%@ include file="../includes/governanceQuizMenu.jsp"%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  <td width="100%" colspan="0" align="right" class="style1"><a href="#" onclick="downloadReportForReviewer('<%=status%>','<%=dept%>')" class="normal">Download All</a></td>
  </tr>
 </table>
 <table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
	<tr>
	<td width="20%" height="20" align="center" valign="middle" bgcolor="#74CAD3" class="style1"> Sr. no.</td>
	<td width="45%" height="20" align="left" valign="middle" bgcolor="#74CAD3" class="style1"> USER NAME</td>
    <td width="35%" height="20" align="right" valign="middle" bgcolor="#74CAD3" class="style1">SCORE&nbsp;&nbsp;&nbsp;&nbsp;</td>    
	</tr>
 </table>
	<div style="height:250px; overflow:scroll">
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bordercolor="#FFFFFF">
<%		
		String id = "";
		for(int i=0;i<usersNames.size();i++)
		{	
			String[] tmpArr = (String[])usersNames.get(i);

			id = tmpArr[2];
				
%>
	<tr>
	<td align="center" width="20%" height="20" bgcolor="#f8f8f8" class="style3" valign="middle"><%=i+1%></td>
	<td align="left" width="45%" valign="center" bgcolor="#f8f8f8" class="style3" height="20"><a href="javascript:viewQuestionPerUser(<%=id%>,'<%=tmpArr[0]%>')"><%=tmpArr[0]%></a></td>
	<td align="right" width="34%" height="20" bgcolor="#f8f8f8" class="style3" valign="middle"><%=tmpArr[1]%></td>
	</td>
	</tr>

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
