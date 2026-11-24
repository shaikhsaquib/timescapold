<%--
 -- Governance Code
 -- @(#)deptPolicy.jsp	11/05/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 11-MAY-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceReviewerController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />

<%
	ArrayList reviewerResult = new ArrayList();
	
	String questionId = request.getParameter("questionId");
	//out.println(questionId);
	
	String criteria = "nonCompliance";
	reviewerResult = governanceReviewerController.viewReports(questionId);
	//out.println("reviewerResult :" + reviewerResult.size());

	
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Departmentwise Report</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
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
<script Language="JavaScript" src="../jscripts/savechklist.js"></script>

</head>

<%
	 String roleIds = "";
	 String isAttach="";
	 String flag ="";
%> 

<body>
<form name="frmSaveChklist" method = "post" action = "">

<input type="hidden" name="size" value="<%=reviewerResult.size()%>">

<%@ include file="../includes/headerMenu.jsp"%>
<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">



  <tr>
    <td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
    <td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
  </tr>
</table>

<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
<%

	if (reviewerResult.size() > 0){
%>


<tr>   
	
	
	<td width="10%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER FEEDBACK</td>
	<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">FROM</td>
	<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">TO</td>
	
    <!-- <td width="14%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USERCOMPLIANCE STATUS</td> -->
	 </tr>

	
<%  
        String userName = "";
        String question = "";
		String emailid = "";
		String chklist = "";
		String fromDate ="";
		String toDate ="";
		//String userComplianceStatus ="";
		for(int i=0;i<reviewerResult.size();i++) 
		{
			String[] tmpArr = (String [] )reviewerResult.get(i);
		
			if(!question.equals(tmpArr[1])) {
				question = tmpArr[1];
%>
			<tr>
			<td bgcolor="#DAFIF3" width="15%" align="left" valign="middle" class="name" colspan = "100%"> <b><%=tmpArr[1]%></b></td>
			</tr>
<%  }
			if(!userName.equals(tmpArr[12])) {
				userName = tmpArr[12];
%>
	<tr>
			<td bgcolor="#C0C0C0" width="15%" align="left" valign="middle" height = "30" class="style2" colspan = "100%"> <b><%=tmpArr[12]%>&nbsp;&nbsp;/&nbsp;&nbsp;<%=tmpArr[17]%></b></td>
			</tr>
<%  }
			emailid = (String)tmpArr[15];
			chklist = (String)tmpArr[1];
			fromDate = (String)tmpArr[5];
			toDate = (String)tmpArr[6];
			//userComplianceStatus = (String)tmpArr[15];

%>
	<tr>			
		<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[2]%></td>
		<td bgcolor="#f8f8f8" width="12%" align="left" valign="middle" class="style3"><%=tmpArr[5]%> </td>
		<td bgcolor="#f8f8f8" width="12%" align="left" valign="middle" class="style3"><%=tmpArr[6]%> </td>
		
		
	</tr>
<%
	
		}
}
%>
    
</table>
<p>&nbsp;</p>
<table width="100%" height="40" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td width="100%" height="17" colspan="4" align="center" valign="middle" bgcolor="#CBECEF" class="style4">
      <div align="center">
		<input type="button" value="close"  onclick="window.close();">
</div></td>
  </tr>

</table>
</body>
</html>
