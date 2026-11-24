<%--
 -- @(#)displayProfile.jsp	6/30/2005
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Glenn Mendonca
 -- @version 	1.00, 6/30/2005
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs, com.bccl.util.HtmlUtil"%>


<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />
<jsp:useBean id="profileSearchController" class="com.bccl.profile.web.controllerbeans.ProfileSearchController" scope="page"/>
<jsp:useBean id="signOnController" scope="page" class="com.bccl.domain.web.controllerbeans.SignOnController" />

<%
	GregorianCalendar today = new GregorianCalendar();
%>

<%!
String monthArr[] = {"00", "JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
Hashtable gender = new Hashtable();
%>

<%
gender.put("M","Male");
gender.put("F","Female");
gender.put("O","Organization");

session.setAttribute("currLink","search");
session.setAttribute("leftLink","4");

String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","profileDetails.breadcrumb");

String empl_employeecode = request.getParameter("payId");
String empl_compcode = request.getParameter("companyCode");
String timescapeUserOID = request.getParameter("timescapeUserOID");

Hashtable employeeDetails = signOnController.getEmpDetails(empl_compcode, empl_employeecode);
%>



<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>util.js">
        </script>

        <script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>search.js">
        </script>

	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmSearch" method = "post">
			<%@ include file="../includes/sessionCheck.jsp" %>
			<%@ include file="../includes/utilMenu.jsp" %>
			<%@ include file="../includes/breadcrumbs.jsp" %>
			<%@ include file="../includes/empHeader.jsp" %>
			<%@ include file="../includes/timescapeHeader.jsp" %>

		<!-- Outer most table -->
              <table width = "99%" border = "0"  align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<!-- Table to draw the black line starts -->
						<table width="100%%" border="0" cellspacing="0" cellpadding="0" align="right">
							<tr>
								<td background="<%=Constants.IMAGE_PATH%>rt_midimg.gif" valign="bottom" width="1%"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="2"></td>
								<td width="20%" bgcolor="#000000"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="2"></td>
								<td width="78%" bgcolor="#000000"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
								<td background="<%=Constants.IMAGE_PATH%>lt_midimg.gif" valign="bottom" width="1%" bgcolor="#000000"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
							</tr>
						</table>

						<table width="99%" border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td align = "center" colspan = "4" class="headerblack" align="center">
									<!-- keep the page heading here -->
								</td>
							</tr>
						</table>

						<!-- Table to draw the black line ends -->
					</td>
				</tr>

				<tr>
					<td>
						<!--
							table to draw the middle portion
							middle portion includes left,middle,and right content
						-->
						<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
							<tr>
								<!-- the left black border of the page -->
								<td rowspan = "3" valign="bottom" width="1%" background="<%=Constants.IMAGE_PATH%>rt_midimg.gif"><img src="<%=Constants.IMAGE_PATH%>left_bott_curve.gif" width="14" height="14"></td>
								<!-- left border ends -->
								<!-- color = #8FB0D0 -->
								<td valign = "top"  width = "80%">
									<%@ include file="../includes/profileTabs.jsp" %>
									<%@ include file="../search/displayProfileContainer.jsp" %>
								</td>
								<!-- right black border begins -->
								<td align="right" rowspan="3" valign="bottom" width="1%" background="<%=Constants.IMAGE_PATH%>lt_midimg.gif"><img src="<%=Constants.IMAGE_PATH%>rt_bot_curve.gif" width="14" height="14"></td>
								<!-- right black border ends -->
							</tr>
							<tr>
								<td>
									<img src="../images/spacer.gif" width="1" height="10">
								</td>
							</tr>
							<tr>
								<td bgcolor="#000000" width="98%"><img src="../images/spacer.gif" width="1" height="3"></td>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<%@ include file="../includes/footer.jsp" %>
					</td>
				</tr>
			</table>
		<!-- Outer most table ends here -->
		</form>
	</body>
</html>