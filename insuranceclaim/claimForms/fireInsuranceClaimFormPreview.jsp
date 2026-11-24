<%--
 -- @(#)nomination.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Insurance Claim
 -- @author  -  Megha Maheshwari & Afroz Sayed
 -- @version -  1.0
 -- This page is used to preview nomination for Insurance Claim
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer " %>

<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../approver/approveInsuranceClaim.jsp";
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/insuranceClaimForms.js"></script>
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmFireInsuranceClaimPreview" method = "post">
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  background = "../images/MTheaderbg.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/tshome_logo.gif" /></div>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->
				<td>
			</tr>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../claimForms/fireInsuranceClaimFormPreviewContainer.jsp"%>
				<td>
			</tr>

			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr  bgcolor = "#EDE9E8">
				<td colspan = "100%" align="right" >
					<div align="center">
						<input name="Submit" type="button" class="redButton" value="Submit" onclick = "fire_preview_validate()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="Submit2" type="button" class="redButton" value="Back" onclick = "history.back()" />
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
