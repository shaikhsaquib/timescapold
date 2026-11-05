<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="domainObj" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />

<%
	String roleCode = (String)session.getAttribute("roleCode");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Asset Management - User Remarks</title>
		<!-- <link href="../style/global.css" rel="stylesheet" type="text/css" /> -->
		<script src="../jscripts/util.js" type="text/javascript"></script>
		<script src="../jscripts/characterCount.js" type="text/javascript"></script>
		<script src="../jscripts/common.js" type="text/javascript"></script>
		<script src="../jscripts/viewDetails.js" type="text/javascript"></script>
	<style>
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
	}
	.normal {
		FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 8pt; FONT-WEIGHT: normal; TEXT-DECORATION: none
	}
	.nav {
		TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 10px; FONT-WEIGHT: bold; TEXT-DECORATION: none
	}
	.navnormal {
		TEXT-TRANSFORM: none; FONT-VARIANT: normal; FONT-STYLE: normal; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; COLOR: #000000; FONT-SIZE: 10px; FONT-WEIGHT: normal; TEXT-DECORATION: none
	}
	</style>
</head>
<%
String requestId = (String) request.getParameter("requestId");
String divno = (String) request.getParameter("divno");
%>
<body>
<form name="frmCreateRemark" method="post" >
<table width="100%" border="0" cellpadding="1" cellspacing="0">
<input type="hidden" name="requestId" value ="<%=requestId%>" />
<input type="hidden" name="divno" value ="<%=divno%>" />
 <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1"/></td>
  </tr>
  <tr>
	 <td align="left" valign="middle" class="nav" >&nbsp;&nbsp;&nbsp;</td>
     <td height="60" align="left" valign="middle" class="nav" >REMARKS :</td>
     <td height="60" align="left" valign="middle" class="normal">
		<textarea name="userRemarks" cols="30" rows="3" class="normal" onKeyDown="textCounter(document.frmCreateRemark.userRemarks,document.frmCreateRemark.remLen2,500)" onKeyUp="textCounter(document.frmCreateRemark.userRemarks,document.frmCreateRemark.remLen2,500)"></textarea>    <input readonly type="text" style="color:#8F8F8F;font-size:10px;padding-bottom:2px;"name="remLen2" size="3" maxlength="3" value="500">characters left
  </tr>
 <tr>
    <td height="1" colspan="100%" align="right" valign="middle" bgcolor="#F5F5F5" class="nav" ><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
   <tr>
		<td height="60" colspan="100%" align="center" valign="middle" class="normal">
			<input type="button" class="button" onclick="markInterest()" value="S U B M I T"/>&nbsp;&nbsp;
			<input type="button" class="button" onclick="javascript:window.close()" value="C L O S E"/></td>
	</tr>
</table>
</form>
</body>
</html>