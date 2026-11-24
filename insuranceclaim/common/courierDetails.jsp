<%--
 -- @(#)viewNomination.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Mata Talent award
 -- @author  -  Megha Maheshwari & Afroz Sayed
 -- @version -  1.0
 -- This page is used to view history of nominations from users point of view
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>



<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../common/courierDetails.jsp";
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/courierDetails.js"></script>
	<script Language="JavaScript" src="../jscripts/calendarControl.js"></script>
	<link href="../style/calendarControl.css"rel="stylesheet">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" >
	<form name  = "frmCourierDetails" method = "post"  >
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
<%
			String claimNumber = (String)request.getParameter("claimNumber");
			String requestNo = (String)request.getParameter("requestNo");
%>

			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" width="825" width="62"/></div>
				</td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">POD Number</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<input type = "text" name = "courierNumber" class="style3"></td>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Name</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<input type = "text" name = "courierName" class="style3"></td>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Date</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<input type = "text" name = "courierDate" class="style3" onfocus="showCalendarControl(this);" readonly></td>
			</tr>
			<tr>
				<td width="100%" colspan="2" height="1" align="left" bgcolor="#cccccc"><img height="1" src="../images/spacer.gif" width="1" /></td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Remark</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<textarea name="courierRemark" cols="35" class="style3"></textarea>  </td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr bgcolor="#D60202">
				 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
			<tr  bgcolor = "#EDE9E8">
				<td colspan = "100%" align="right" >
					<div align="center">
						<input name="Submit" type="button" class="redButton" value="Submit" onclick = "checkCourierDetail()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="Submit1" type="button" class="redButton" value="Back" onclick = "history.back()" />
					</div>
				</td>
			</tr>

		</table>
			<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
			<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" />

		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
