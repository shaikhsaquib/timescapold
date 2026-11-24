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
<jsp:useBean id="governanceController"class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>


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
		<script Language="JavaScript" src="../jscripts/allReports.js"></script>
	</head>
<body onLoad="showDepartments();">
	<form name="frmCntReport" method = "post" action = "">
	
<%		
		
		String roleCode = "3";
        String company2 = "";
		GregorianCalendar thisDay = new GregorianCalendar( );
    	session.setAttribute("currLink","REPORT");
		session.setAttribute("leftLink","0");		
%>
	<%@ include file="../includes/headerMenu.jsp"%>
	<table width="100%" border="0" cellpadding="0" cellspacing="3">
	<tr width="100%" >
		<td class="style2" width = "10">Company</td>
		<td bgcolor="#fbfbfb" width = "20">
		 <%@ include file="../reports/showCompanies.jsp" %></td>
        <td class = "style4" height = "30" width = "10">Department&nbsp;<span class = "rednormal"></span></td>
		 <td class = "normal" height = "30" id = "compDepartment" width = "20"></td>
         <td class = "style4" height = "10" width = "15">ReportType</td>
         <td class = "normal" width = "15"><select name=select1>
             <option value="0">Select Report Type</option>
             <option value="policyWise">Policywise NonCompliance</option>
             <option value="nonCompliance">Userwise NonCompliance</option>
             <option value="overridden">Overridden</option>
             <option value="totalCount">Total Count</option>
             </select>
             </td>
         <td><img src="../image/orangearrow.gif" border="0" onclick="changeDate1(select1)"></td>

    </tr>
 </table>
</form>
</body>
</html>