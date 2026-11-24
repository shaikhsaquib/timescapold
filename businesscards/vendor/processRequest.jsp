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
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="com.bccl.util.Utility"%>

<% 
	String compCode = companyCode;
	if(companyCode.equals("BCCL")){
		companyCode = "1000";
	} else if(companyCode.equals("TCLL")){
		companyCode = "1028";
	}else if(companyCode.equals("TCL")){
		companyCode = "1029";
	}
	else if(companyCode.equals("TIL")){
		companyCode = "1003";
	}
%>

<%@ include file="../includes/processCardTemplateCode.jsp" %>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/processRequest.js"></script>
		<script src="../jscripts/calendarControl.js"language="javascript"></script>
		<link href="../style/calendarControl.css"rel="stylesheet">
	 </head>
<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../vendor/processRequest.jsp");
	session.setAttribute("topLink", "5");

%>
<%
		ArrayList requestList = new ArrayList();

		if(compCode.equals("1003") || compCode.equals("1024") ||compCode.equals("1025") ||compCode.equals("1026") ||compCode.equals("1027") )
			{	
				requestList = businessCardUserWebController.viewTILVendor(timescapeUserOId,"5","P",emailId);

			}
			else{
				requestList = businessCardUserWebController.viewVendor(timescapeUserOId,"5","P",emailId);
			}

		int listSize = 0;
		listSize = requestList.size( );

%>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		<form name="frmProcessRequest" method="post">
			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					PROCESS REQUESTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../includes/downloadReportsVendor.jsp?role=5&sts=P" class="whitesmall"><u>Download</u></a>
				</td>
			</tr>
			<tr>
				<td colspan="100%" height="20" align="center">
                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
            	    <%@ include file="../vendor/processRequestContainer.jsp" %>
                </table>
                </td>
			</tr>
		<input type="hidden" name="listSize" value="<%=listSize%>"/>
		</form>
    </table>
	</body>
</html>

