<%--
 -- Business Card
 -- @(#)processRequest.jsp	15-NOV-2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 
 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 1-DEC-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/processRequest.jsp");
	session.setAttribute("topLink", "4");

	String compCode = companyCode;
	
%>

<%@ include file="../includes/processCardTemplateCode.jsp" %>
<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/processRequest.js"></script>
	 </head>
 

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="frmProcessRequest" method="post">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%
		ArrayList requestList = new ArrayList();

		requestList = businessCardUserWebController.viewReviewer(timescapeUserOId,"4","'A','HA','HD','LD'");

		int listSize = 0;
		listSize = requestList.size( );
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					PROCESS REQUESTS
				</td>
			</tr>

				<%@ include file="../processor/processRequestContainer.jsp" %>
			
		</table>

		<input type="hidden" name="listSize" value="<%=listSize%>"/>

		</form>
	</body>
</html>