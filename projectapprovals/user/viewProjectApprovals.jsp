<%--
 -- @(#)viewProjectApprovals.jsp - 20/09/2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- @author  -  Sachin Mehta 21/09/2011
 -- @version -  1.0
 --%>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@ include file="../includes/status.jsp"%>

<%--
	Make all your global declarations over here  
--%>

<html>
<head>
	<title>Project Approvals Status</title>
	<link rel="stylesheet" href="../style/CA.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/viewProjectApprovals.js"></script>
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmViewProjectApprovals" method = "post" >
<%
	ArrayList requestList = new ArrayList();
	requestList = projectApprovalsController.viewRequestList(timescapeUserOId);
	//out.println(requestList.size());

%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">						
		<%@ include file="../includes/menu.jsp"%>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../user/viewProjectApprovalsContainer.jsp"%>				
				<td>
			</tr>
		</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
