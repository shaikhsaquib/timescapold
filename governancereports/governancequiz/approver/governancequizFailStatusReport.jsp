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

<table width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>

    
	<td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>


</table>
<%
		
		ArrayList userstatusResult = new ArrayList();

		userstatusResult = GovernancequizApproverWebController.userStatus(timescapeUserOId);

		ArrayList statusResult = new ArrayList();
		
%>
<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
 <%
		String name="";

		String status = "";

		if (userstatusResult.size() > 0 )
		{
%> 
  
</table>

	<br>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">

<tr>

	<td width="50%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"><a href="javascript:viewPassedUsers()">Passed User</a></td>
	
	<td width="50%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1">Failed User</td>		
	</tr>

</table>


<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">	
	<tr>

	<td width="25%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"> Sr No.</td>

	<td width="75%" height="26" align="center" valign="middle" bgcolor="#74CAD3" class="style1"> USER NAME</td> 
		
	</tr>
<%
				
		for(int i = 0; i< userstatusResult.size(); i++)
			{
				 
				 String[] tmpArr = (String [] )userstatusResult.get(i);
				
				 status = tmpArr[0];

				 statusResult = GovernancequizApproverWebController.viewPassFailStatus(status);

				 String[] tmpArr1 = (String [] )statusResult.get(i);

				 String name1= tmpArr1[0];
				 
				 if(status.equals("F"))
				   {
					
%>
	
			<tr>

			<td align="center" height="37" bgcolor="#f8f8f8" class="style3" valign="middle"><%=i%></td>

	       <td align="center" valign="middle" bgcolor="#f8f8f8" class="style3" height="45"><%=name1%> </td>    
    
   	
<%				}

			}
	}

%>


  
</table>

<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>

    
	<td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4"><div align="center">&nbsp;
    </td>

  </tr>

</table>


<p>&nbsp;</p>
</body>
</html>
