<%--
 -- @(#)viewQualifications.jsp	8/6/2002
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
<%@ page import="java.util.Hashtable, java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList, java.util.StringTokenizer" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="paging" class="com.bccl.util.Paging" />
<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />


<%
session.setAttribute("currLink","search");
session.setAttribute("leftLink","3");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","searchResults.breadcrumb");
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
					<span class = "bold">Note&nbsp;:&nbsp;</span><span class = "rednormal">Please use Internet Explorer version 5.0 or above while browsing Timescape to ensure best functional / visual experience.</span>
				</td>
			  </tr>


			  <tr>
				 <td height="5" colspan="3"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
			  </tr>

			<%
						ArrayList searchResults = (ArrayList) session.getAttribute("searchResults");
						int arrSize = 0;
						arrSize = searchResults.size();
						String tmpStr[] = null;
			%>
			  <tr>
				 <td height="5" colspan="3"><%@ include file="pagenation.jsp" %></td>
			  </tr>

			  <tr>
				 <td colspan="3">

				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td bgColor = "#000000" class = "white" height = "20">Name</td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td bgColor = "#000000" class = "white" height = "20">Company Name</td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td bgColor = "#000000" class = "white" height = "20">Department</td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td bgColor = "#000000" class = "white" height = "20">Location</td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td bgColor = "#000000" class = "white" height = "20"></td>
					</tr>
					<%
						for(long i = startIndex; i < endIndex; i++){
							tmpStr = (String[])searchResults.get((int)i);
					%>

					<tr>
						<td class = "normal" height = "20" bgcolor = "<%=(i%2==0)?"#FFFFFF":"#EFEFEF"%>"><%=tmpStr[0]%>&nbsp;<%=tmpStr[1]%></td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td class = "normal" height = "20" bgcolor = "<%=(i%2==0)?"#FFFFFF":"#EFEFEF"%>"><%=tmpStr[5]%></td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td class = "normal" height = "20" bgcolor = "<%=(i%2==0)?"#FFFFFF":"#EFEFEF"%>"><%=tmpStr[10]%></td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td class = "normal" height = "20" bgcolor = "<%=(i%2==0)?"#FFFFFF":"#EFEFEF"%>"><%=tmpStr[7]%></td>
						<td height="5"><img src="<%=Constants.IMAGE_PATH%>spacer.gif" width="1" height="1"></td>
						<td class = "normal" height = "20" bgcolor = "<%=(i%2==0)?"#FFFFFF":"#EFEFEF"%>" align = "center"><a href = "javascript:showProfile('<%=tmpStr[3]%>','<%=tmpStr[4]%>','<%=tmpStr[12]%>')" class = "normal">view details</a></td>
					</tr>

			<%
					}
			%>
					<tr>
						<td align = "center" colspan = "9"><a href = "javascript:history.back()" class = "normal"><img src="<%=Constants.IMAGE_PATH%>but_back.gif" border = "0"></a></td>
					</tr>

				</table>
				 </td>
			  </tr>
			</table>
		</form>
	</body>
</html>