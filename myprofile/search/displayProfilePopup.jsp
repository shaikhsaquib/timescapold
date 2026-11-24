<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
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
        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/search.js"></script>
	</head>
    
    <body onLoad = "window.focus()" topmargin="0" marginwidth="0" marginheight="0" leftmargin="0">
		<table width = "100%" align="center" cellspacing="0" cellpadding="0" border="1" bordercolor="#6699CC">
            <tr>
				<td colspan="2" height="100">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">

						<tr>
							<td><%@ include file="employeeDetailsContainer.jsp" %></td>
						</tr>

						<tr>
							<td><%@ include file="qualificationContainer.jsp" %></td>
						</tr>

						<tr>
							<td><%@ include file="experienceContainer.jsp" %></td>
						</tr>
					</table>
				</td>
			</tr>
        </table>
    </body>
</html>
