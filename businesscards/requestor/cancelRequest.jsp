<%--
 -- Business Card Requestor
 -- @(#) checkRequestStatus.jsp		12-NOV-2008
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
 -- @version 	1.00, 12-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../utils/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/cancelRequest.jsp");
	session.setAttribute("topLink", "1");

%>

<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/cancelRequest.js"></script>
	 </head>
 

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="frmRequestCards" method="post">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%
	String status = "'L','H','LP','HP','LD','HD','A','HA'";
	ArrayList requestsLst = new ArrayList();

	requestsLst = businessCardUserWebController.view(timescapeUserOId,status);

	int listSize = requestsLst.size( );
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					CANCEL REQUEST
				</td>
			</tr>

				<%@ include file="../requestor/cancelRequestContainer.jsp" %>
			
		</table>

		</form>
	</body>
</html>