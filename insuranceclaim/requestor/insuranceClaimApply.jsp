 <%--
 -- @(#)insuranceClaimApply.jsp - 17-FEB-2011
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
 -- This page is used to apply for Insurance Claim
 --%>
<%@ page import = "java.util.Hashtable, java.text.ParseException, java.text.SimpleDateFormat, java.util.ArrayList ,java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>

<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../requestor/insuranceClaimApply.jsp";
	String breadcrumbs = "";

	GregorianCalendar today = new GregorianCalendar();
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/insuranceClaimApply.js"></script>
	<script Language="JavaScript" src="../jscripts/calendarControl.js"></script>
	<script Language="JavaScript" src="../jscripts/calendarControl1.js"></script>
	<link href="../style/calendarControl.css"rel="stylesheet">
	<script src="../jscripts/calendarControl.js"language="javascript"></script>
	<!-- <script language="javascript" type="text/javascript">
	function addtext(name) {
		document.getElementById('nominee').value+=name;
		//document.getElementById('emailIds').value+=emailId+",";
	}
</script> -->


</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmInsuranceClaimApply" method = "post" >
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" width="825" height ="62"/></div>
				</td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<%@ include file="../includes/insuranceClaimMenu.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->
				<td>
			</tr>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../requestor/insuranceClaimApplyContainer.jsp"%>
				<td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr  bgcolor = "#EDE9E8">
				<td colspan="100%" align="right">
					<div align="center">
						<input name="Submit" type="button" class="redButton" value="Preview" onclick = "validate()"/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="Submit2" type="button" class="redButton" value="Reset" onclick= "this.form.reset();"  />
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
