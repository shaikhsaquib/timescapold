<%--
 -- @(#)checkRequestDetails.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of chairman's award
 -- @author  -  Nilam Shete
 -- @version -  1.0
 -- This page is used to check the details and status of a nomination request
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<%--  
	Make all your global declarations over here 
--%>

<%
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/checkRequestDetails.js"></script>

</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmCheckRequestDetails"method = "post">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" width="825" width="62"/></div>
				</td>
			</tr>
 			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->
				<td>
			</tr>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../common/checkRequestDetailsContainer.jsp"%>
				<td>
			</tr>

			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>

		</table>
		<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr bgcolor="#D60202">
				 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
		</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html> 
