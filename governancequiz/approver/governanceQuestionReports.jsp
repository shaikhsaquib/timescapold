<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="GovernancequizApproverWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizApproverWebController" />

<%
		
		ArrayList userQuestionResult = new ArrayList(); 
		
		userQuestionResult = GovernancequizApproverWebController.userQuestionDetails(timescapeUserOId);		
	
%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script Language="JavaScript" src="../jscripts/governanceQuiz.js"></script>
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
<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../approver/governanceReports.jsp");
	session.setAttribute("topLink", "2");
	
%>
<body>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

	<tr>

    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>

	</tr>

</table>
 <br><br>
<%@ include file="../includes/governanceQuizMenu.jsp"%>
<form name="governanceQuiz" method="post">

<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
 <%
		
		String name="";
		
		String dept="";

		String question="";
	
		if (userQuestionResult.size() > 0)
		{
%> 
  
</table>

<table width="100%">
	<tr>

	<td width="50%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"><a href="javascript:viewoverAllDetail()"> Overall Report</a></td>
	
	<td width="50%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"> Questionwise Report</td>
	
	</tr>

</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">	
	<tr>
	
    
	<td width="100%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"> Question Wise Failure Report </td>
	</tr>

</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

	<tr>

	<td width="70%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Question</td>

	<td width="20%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">User Name</td>

	<td width="00%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Dept. Name</td>
	</tr>
<%																								
		
		//System.out.println("userQuestionResult :" + userQuestionResult.size());
		for(int i = 0; i< userQuestionResult.size(); i++)
			{
				 
				String[] tmpArr = (String [] )userQuestionResult.get(i);

				name = tmpArr[0];
				
				dept = tmpArr[2];

				if (!question.equals(tmpArr[5])) 
				{                               
					
					question = tmpArr[5];
				
%>	 
	<tr>

	<td align="left" height="37" bgcolor="#f8f8f8" class="style3"><b><%=tmpArr[5]%></b>	

	<td align="center" height="37" bgcolor="#f8f8f8" class="style3"><b><%=name%></b></td> 

	<td align="center" bgcolor="#f8f8f8" class="style3"><%=tmpArr[2]%> </td> </tr>

<%
				}

			}
		}

%>  
</table>

<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
	<tr>

    
	<td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4"><div align="center">&nbsp;
    <a href="governanceReports.jsp"><img src="../images/but_back.gif" border="0" /></a>

    &nbsp;</div></td>

	</tr>

</table>

</form>
<p>&nbsp;</p>
</body>
</html>
