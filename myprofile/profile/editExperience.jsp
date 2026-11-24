<%--
 -- @(#)editExperience.jsp	8/6/2002
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
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Iterator,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>

<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />

<%
	GregorianCalendar today = new GregorianCalendar();
	int startIndex = 0;
	int endIndex = 0;
	int expSize = 0;
	int extExperienceStart = 0;
	String dropDownUrl = "";
	String urlParameter = "selectedOption= ";
%>

<%
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","2");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","editEmpHist.breadcrumb");
%>

<script>
function uploadPicture(emailId)
{

	    var frmObj = document.frmProfile;

			var url = "../profile/uploadPicture.jsp?emailId="+emailId;
			win = window.open(url,"Picture","width=375,height=150, resizable=no, status=no,toolbar=no,location=no,menubar=no,scrollbars=no");

}
</script>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
		<script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>util.js"></script>
		<script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>empHistory.js"></script>
		<script Language="JavaScript" src="<%=Constants.JSCRIPTS_PATH%>help.js"></script>
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">
			<input type="hidden" name="redirection" value="">
			<%@ include file="../includes/empHeader.jsp" %>


			<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
				<tr>
					<td valign = "top"  width = "80%">
						<%@ include file="../includes/profileTabs.jsp" %>
						<%@ include file="../profile/internalEmpContainer.jsp" %>
						<%@ include file="../profile/prevEmpContainer.jsp" %>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>