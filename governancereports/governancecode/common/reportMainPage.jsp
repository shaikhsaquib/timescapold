<%--
 -- Governance Code
 -- @(#)countReport.jsp	11/05/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 04-DEC-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Collections" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Count Report</title>
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
		<script Language="JavaScript" src="../jscripts/report.js"></script>
	</head>
<body>
	<form name="frmCntReport" method = "post" action = "">
	
<%		
		
		String roleCode = "3";
		GregorianCalendar thisDay = new GregorianCalendar( );
    	session.setAttribute("currLink","REPORT");
		session.setAttribute("leftLink","0");		
%>
	<%@ include file="../includes/headerMenu.jsp"%>
	<table width="100%" border="0" cellpadding="4" cellspacing="1" align="center">
		<tr>
			<td align="center" class="style2">Please click on any of the links below to view the respective reports.</td>
		</tr>
		<tr>
			<td><%@ include file="../includes/governanceCodeMenu.jsp"%></td>
		</tr>
	</table>  	
	
</form>
</body>
</html>