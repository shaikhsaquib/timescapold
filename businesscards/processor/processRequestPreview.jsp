<%--
 -- Business Card Processor
 -- @(#) processRequestPreview.jsp	11-DEC-2008
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
 -- @version 	1.00, 11-DEC-2008
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>
<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

 
<%
	String compCode = companyCode;
%>

<%@ include file="../includes/processCardTemplateCode.jsp" %>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css" />
		<link rel="stylesheet" href="../style/common.css" />
		<script Language="JavaScript" src="../jscripts/processRequestPreview.js"></script>
		<script Language="JavaScript" src="../jscripts/util.js"></script>
	</head>


	<body>
		
		<form name="frmprocessRequestPreview" method="post">

			<%@ include file="../includes/header.jsp" %>
			<%@ include file="../includes/businessCardMenu.jsp" %>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					PROCESS REQUEST PREVIEW
				</td>
			</tr>

			<%@ include file="../processor/processRequestPreviewContainer.jsp" %>


		</table>

		<input type="hidden" name="listSize" value="<%=listSize%>">

		</form>	
	</body>
</html>