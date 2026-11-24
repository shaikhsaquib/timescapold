<%--
 -- @(#)checkMedicalClaimRequest.jsp	15/3/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Anagha More
 -- @version 	1.00, 20/07/2016
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>

<jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 
<html>
	<head>
		<title>
		</title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		 <!-- <script Language="JavaScript" src="../jscripts/util.js"></script>
		 <script Language="JavaScript" src="../jscripts/common.js"></script>
 -->		 <script Language="JavaScript" src="../jscripts/test.js"></script>
		
		<link href="../style/calendarControl.css"rel="stylesheet">
		<script src="../jscripts/calendarControl.js"language="javascript"></script>
	 </head>

<%@ include file="../includes/genericClaimHeader.html" %>
 <%@ include file="../includes/genericClaimMenu.jsp" %> 
 <table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name="frmSelectClaim" method="post">

<tr>
<td align="center" class="normal">
Select Claim <select id="entitlementCode" name="entitlementCode" class="normal">
<option value = "">Select</option>
<option value = "BKP">Books & Periodicals</option>
<option value = "ENT">Entertainment</option>
<option value = "INT">Internet</option>
<option value = "DRR">Driver reimbursement</option>
<option value = "FRR">Fuel reimbursement </option>
<option value = "VRR">Vehicle Repair reimbursement</option>
</select>
 <a href="javascript:go()"><img src="../images/greyarrow.gif" border="0" align="absmiddle"></a> 
<td><input type = "hidden" name = "entitlementCode" id = "entitlementCode" value = "">
<td><!-- <input type = "button" name  = "go" id = "go" value = "Go" onclick = "javascript:go();"> -->
<!-- <input name="go1" onclick="go();" class="bold" value = "Go" type="button"></td> -->
</tr>
</table>
</form>
</html>


