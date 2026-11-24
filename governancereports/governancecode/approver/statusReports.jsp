<%--
 -- Governance Code
 -- @(#)approverReports.jsp	11/02/2011
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
 -- @version 	1.00, 11-FEB-2011
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

	GregorianCalendar thisDay = new GregorianCalendar( );

	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";

	String criteria = "Not Rated";
	reviewerResult = governanceReviewerController.viewReports(criteria,prevYear, currYear);
	//out.println("reviewerResult :" + reviewerResult.size());
	//out.println(reviewerResult);
	session.setAttribute("currLink", "../approver/statusReports.jsp");
	session.setAttribute("topLink", "2");
    session.setAttribute("leftLink", "2");
	String roleCode = "2";

%>
 
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Untitled Document</title>
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
	<table width="100%" border="0" cellspacing="0" cellpadding="0">	
		<tr>
		<td colspan = "20">
		<%@ include file="../includes/governanceCodeMenu.jsp"%>
		</td>
		</tr>
		
	<%
		
		session.setAttribute("currLink","REPORT");
		session.setAttribute("leftLink","1");
	%>
			
		<tr>
			<td height="17" colspan="1" align="center" valign="middle" class="style1"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></td>
			<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right">
<!-- 			<%@ include file="../includes/reportTabs.jsp"%></div></td>
 -->				
		</tr>
	</table>

	<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
<%

	if (reviewerResult.size() > 0){
%>


		<tr>   


			<td width="45%" height = "26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
			<td width="12%" height = "26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">FROM</td>
			<td width="12%" height = "26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">TO</td>
			<td width="10%" height = "26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER FEEDBACK</td>

			<!-- <td width="14%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USERCOMPLIANCE STATUS</td> -->
		</tr>
<%  
	String userName = "";
	String emailid = "";
	String chklist = "";
	String fromDate ="";
	String toDate ="";
	String userFeedback ="";

	//String userComplianceStatus ="";
	for(int i=0;i<reviewerResult.size();i++) 
{
	String[] tmpArr = (String [] )reviewerResult.get(i);



	emailid = (String)tmpArr[17];
	chklist = (String)tmpArr[1];
	fromDate = (String)tmpArr[5];
	toDate = (String)tmpArr[6];
	userFeedback = (String)tmpArr[2];

	//userComplianceStatus = (String)tmpArr[15];

	if(!(tmpArr[2].equals(tmpArr[15]))){

	if(!userName.equals(tmpArr[12])) {
		userName = tmpArr[12];

%>
		<tr>
			<td bgcolor="#C0C0C0" width="15%" height = "30" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=tmpArr[12]%>&nbsp;&nbsp;/&nbsp;&nbsp;<%=tmpArr[17]%></b></td>
		</tr>
<%		

	}

%>	
		<tr>	


			<td bgcolor="#f8f8f8" width="45%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
			<td bgcolor="#f8f8f8" width="12%" align="left" valign="middle" class="style3"><%=tmpArr[5]%> </td>
			<td bgcolor="#f8f8f8" width="12%" align="left" valign="middle" class="style3"><%=tmpArr[6]%> </td>
			<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[2]%></td>

		</tr>
<%
		}
	}
}else{
%>
			<tr>
					<td bgcolor="#C0C0C0" width="15%" height = "30" align="middle" valign="middle" class="style3" colspan = "100%"> <b>No records found!!!</b></td>
				</tr>
<%
			}

%>

			</table>
		<p>&nbsp;</p>
	</body>
</html>
