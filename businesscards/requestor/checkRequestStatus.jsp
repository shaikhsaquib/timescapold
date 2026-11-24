<%--
 -- Business Card Requestor
 -- @(#) checkRequestStatus.jsp		12-NOV-2008
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
 -- @version 	1.00, 12-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../utils/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/checkRequestStatus.jsp");
	session.setAttribute("topLink", "1");
%>


<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	 </head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	
	<form name="frmRequestStatus" method="post">

	<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>
	<!-- file menu included -->

<%	
	String status = "'L','H','LP','HP','LD','HD','HA','A','P','C','R','D','V'";

	ArrayList requestsLst = new ArrayList( );

	requestsLst = businessCardUserWebController.view(timescapeUserOId,status);

	int listSize = 0;
	listSize = requestsLst.size( );
	

%>
 
		
<!--------------------------------------------------- Details Table Begins ---------------------------------------------------->

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr >
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					STATUS OF FILED REQUESTS
				</td>
			</tr>

			<%@ include file="../requestor/checkRequestStatusContainer.jsp" %>
			
		</table>
<!--------------------------------------------------- Details Table Ends ------------------------------------------------------->

	</form>
	</body>
</html> 