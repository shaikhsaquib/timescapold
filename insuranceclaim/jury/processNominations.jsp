<%--
 -- @(#)processNominations.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Mata Talent award
 -- @author  -  Chetan Gothe
 -- @version -  1.0
 -- This page is used to process nominations by unit head, functional head and HR
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList,java.util.GregorianCalendar,java.util.Calendar" %>

<jsp:useBean id="mtAwardController" class="com.bccl.mtawards.web.controllerbeans.MTAwardController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>



<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../jury/processNominations.jsp";
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Mata Talent Award</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/processNominations.js"></script>
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmProcessNominations"method = "post">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td  background = "../images/MTheaderbg.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" /></div>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/awardProgramMenu.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->
				<td>
			</tr>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../jury/processNominationsContainer.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr  bgcolor="#EDE9E8">
				<td colspan = "100%" align="left" >
					<div align="center">
						<input name="Submit2" type="button" class="redButton" value="Reset" onclick= "this.form.reset();" />
					</div>
				</td>
			</tr>
			<tr bgcolor="#D60202">
			 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
		</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
