<%--
 -- @(#)search.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Vikrant Desai
 -- @version 	1.00, 24/8/2004
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />


<%
session.setAttribute("currLink","search");
session.setAttribute("leftLink","1");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","profileSearch.breadcrumb");
%>



<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>

        <script Language="JavaScript" src="../jscripts/search.js">
        </script>

	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmSearch" method = "post">
			<%@ include file="../includes/empHeader.jsp" %>

			<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
				<tr>
					<td valign = "top"  width = "80%">
						<%@ include file="../includes/profileTabs.jsp" %>
					</td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0">

			  <tr>
				 <td height="5" colspan="3" align = "left" class="header">Search</td>
			  </tr>

			 <tr>
				<td colspan="3" class="small" height="5">
					<img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1">
				</td>
			  </tr>

			  <tr>
				<td colspan="3" class="normal" height = "20" align = "left">
					<span class = "bold">Note&nbsp;:&nbsp;</span><span class = "bluenormal">Please use Internet Explorer version 5.0 or above while browsing Timescape to ensure best functional / visual experience.</span>
				</td>
			  </tr>


			  <tr>
				 <td height="5" colspan="3"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
			  </tr>


			  <tr>
				 <td colspan="3">

					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td class = "bold" height = "30" colspan = "3" align = "left">Search By Company Code & Pay Id Combination</td>
						</tr>


						<tr>
							<td class = "small" height = "30" width = "30%" align = "right">Select Company</td>
							<td class = "bold" height = "30" width = "5%" align = "center">:</td>
							<td class = "small" height = "30" width = "65%" align = "left"><%@ include file="../utils/companies.jsp" %></td>
						</tr>

						<tr>
							<td class = "small" height = "30" width = "30%" align = "right">Enter Pay Id</td>
							<td class = "bold" height = "30" width = "5%" align = "center">:</td>
							<td class = "small" height = "30" width = "65%" align = "left"><input type = "text" name = "payId" class = "small" maxlength = "8"></td>
						</tr>

						<tr>
							<td class = "small" height = "30" width = "30%" align = "center">&nbsp;</td>
							<td class = "bold" height = "30" width = "70%" align = "left" colspan = "2">OR</td>
						</tr>

						<tr>
							<td class = "bold" height = "30" colspan = "3" align = "left">Search By Employee Name</td>
						</tr>

						<tr>
							<td class = "small" height = "20" width = "30%" align = "right">Enter Employee Name</td>
							<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
							<td class = "small" height = "20" width = "65%" align = "left"><input type = "text" name = "employeeName" class = "small" value = ""></td>
						</tr>


						<td colspan="3" align="center" height="10"><block type="spacer" height="10"></td>

						<tr>
							<td colspan = "3" align = "center" valign = "absbottom">
								<a href="javascript:validate( )"><img src="../images/but_submit.gif" width="56" height="15" alt="submit" border="0"><a/>&nbsp;&nbsp;<a href="javascript:clear( )"><img src="../images/but_reset.gif" width="56" height="15" alt="reset" border="0"></a>
							</td>
						</tr>

					</table>

				 </td>
			  </tr>
			</table>
		</form>
	</body>
</html>