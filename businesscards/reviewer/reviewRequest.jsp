 <%--
 -- Business Card
 -- @(#)reviewRequest.jsp	15-NOV-2008
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
 -- @version 	1.00, 15-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../reviewer/reviewRequest.jsp");
	session.setAttribute("topLink", "3");

%>

<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/reviewRequest.js"></script>
	 </head>
 

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="frmApproveRequest" method="post">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%
		ArrayList requestList = new ArrayList();

		String businessCardRole = (String)session.getAttribute("businessCardRole");

		requestList = businessCardUserWebController.viewReviewer(timescapeUserOId,businessCardRole,"'HA','HD','LD'");

		int listSize = 0;
		listSize = requestList.size( );
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="center">
					REVIEW REQUESTS
				</td>
			</tr>

				<%@ include file="../reviewer/reviewRequestContainer.jsp" %>
			
		</table>

		<input type="hidden" name="reviewerRemark" value=""/>
		<input type="hidden" name="reviewerStatus" value=""/>
		<input type="hidden" name="reviewerId" value=""/>

		</form>
	</body>
</html>