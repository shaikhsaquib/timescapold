<%--
 -- @(#)viewAllNominations.jsp - 18-MAY-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Chairmans award
 -- @author  -  Chetan Gothe
 -- @version -  1.0
 -- This page is used to view all Nomination requests to Jury
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer" %>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<%--
	Make all your global declarations over here 
--%> 

<%
	String currLink = "../approver/viewInsuranceClaimHistory.jsp";
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/viewInsuranceClaimHistory.js"></script>
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmViewInsuranceClaimHistory" method = "post">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td  background = "../images/logo2.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/tshome_logo.gif" /></div>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/insuranceClaimMenu.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/status.jsp"%>
				<td>
			</tr>
            <tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../approver/viewInsuranceClaimHistoryContainer.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr bgcolor="#D60202">
			 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
		</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
