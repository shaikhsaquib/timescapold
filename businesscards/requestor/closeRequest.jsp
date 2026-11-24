<%--
 -- Admin Services Requestor
 -- @(#)createRequest.jsp	14/7/2008
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
 -- @version 	1.00, 14/7/2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../utils/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/closeRequest.jsp");
	session.setAttribute("topLink", "1");

%>

<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
		<script Language="JavaScript" src="../jscripts/cancelRequest.js"></script>
	 </head>
 

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name="frmRequestCards" method="post">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%
	ArrayList requestDetailsLst = new ArrayList();

	requestDetailsLst = businessCardUserWebController.view(timescapeUserOId,"'V'");

	int listSize = requestDetailsLst.size( );
%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					CLOSE REQUEST
				</td>
			</tr>

				<%@ include file="../requestor/closeRequestContainer.jsp" %>

			</tr>
			
		</table>

		</form>
	</body>
</html>