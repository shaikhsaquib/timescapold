<%--
 -- @(#)feedback.jsp	5/12/2004
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 --
 --
 --
 --
 -- @author     Niranjan P Shinde
 -- @version 	1.00,  5/12/2004
 --%>

<%@ page language="java" buffer="1024kb" autoFlush="false"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>

<%@ page import="java.util.Hashtable, java.util.ArrayList,java.io.*" %>
<%@page import="com.bccl.util.SendImapMessage"%>
<%@page import="com.bccl.util.EnvProperties,com.bccl.profile.web.util.Constants, com.bccl.util.Breadcrumbs"%>

<%!
	Hashtable emailAddr = new Hashtable();
%>

<%
    String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","exception.breadcrumb");
%>


<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/feedback.js"></script>
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<form name ="frmFeedback" method = "post">

			<%@ include file="../includes/empHeader.jsp" %>

         <%
               String content =  request.getParameter("content");
               if(content != null) {
					content = content + "\n\n" + "Name : " + title + " " + fullName + "\nPayroll ID  : " + payId + "\n" + "Dept : " +deptName + "\n" + "Location : " + locationName
					                   +"\n\n" + "This is an automated email response powered by Timescape." ;

					Hashtable sendMail = new Hashtable();

					SendImapMessage sendMessage = new SendImapMessage();

					String subject		= "Modify Employee Details For "+ title + " " + fullName;

					sendMail.put("fromAddr",emailId);
					sendMail.put("toAddr","timescape.admin@timesgroup.com");
					sendMail.put("content",content);
					sendMail.put("subject",subject);
					sendMessage.sendMail(sendMail);

					response.sendRedirect("../common/promptPage.jsp?msg=4");
					return;
               }
          %>



						<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
							<tr>
								<td valign = "top">
                                    <%@include file="exceptionContainer.jsp"%>
								</td>
							</tr>
						</table>
		</form>
	</body>
</html>