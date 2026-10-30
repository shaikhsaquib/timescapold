<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.ArrayList" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Requests</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css" rel="stylesheet" type="text/css" />
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/viewRequests.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/jquery.js"language="javascript"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url('../images/header_BG.jpg');
	background-repeat: repeat-x;
</style>
</head>
<% 
	//String userRole=(String)session.getAttribute("userRole");
	String pageName = "report";
	String gatepassId = "";
	
	String arg = "";
%>

<body onload="showData('0','<%=pageName%>');">
<form name="frmViewRequests" method="post">
<%@ include file="../includes/relatedLinks.jsp"%>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="100%" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;VIEW REQUESTS</td>
    </tr>
    <tr>
      <td width="20%" align="center" valign="middle">      
      <td align="left" valign="middle" class="normal">Returnable :      
		<img src="../images/arrow_returnable1.png" width="20" height="19" /> | Non Returnable :      
        <img src="../images/arrow_nonreturnable.png" width="20" height="19" />  | Goods Returned :      
        <img src="../images/arrow_returnable.png" width="20" height="19" />   |  Goods Partially Returned :      
        <img src="../images/arrow_partiallyReturned.png" width="20" height="19" />   | Not Returned:      
        <img src="../images/arrow_notReturned.png" width="20" height="19" /> | Users Report:
		<a href="#" onclick="downloadReport('1')"><img src="../images/excel.png" border="0"  class="normal"></a>
	  </td> 
	
  </tr>
</table>
<table width="99%" border="0" bordercolor="#9999999" align="center" cellpadding="0" cellspacing="0">
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
	<tr>
		<td colspan="100%" height="15px" class="boldsmall"><U>SEARCH REQUESTS BY</U> :</td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
	<tr class="normal" align="left">
		<td width="3%" height="20px">&nbsp;</td>
		<td width="10%" align="left" valign="middle" class="normal">Gatepass ID :  </td>
		<td width="20%" align="left" valign="middle" class="normal"><input maxlength="60" size="15" name="gatepassId" class="normal"> </td>

		<td width="10%" align="left" valign="middle">From Date: </td>
		<td width="20%" align="left" valign="middle" class="normal"><input id="fromDate" class="normal" size="15" name="fromDate" onfocus="showCalendarControl(this);" readonly/></td>

		<td width="10%" align="left" valign="middle">To Date: </td><td width="20%" align="left" valign="middle" class="normal"><input id="toDate" size="15" name="toDate" class="normal" onfocus="showCalendarControl(this);" readonly/>
		</td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px">&nbsp;</td>
    </tr>
	<tr class="normal" align="left">
		<td height="20px">&nbsp;</td>
		<td align="left" valign="middle" class="normal">Type :  </td>
		<td align="left" valign="middle">
			<select name="type" class="normal">
			<option value="0">Select Gatepass Type</option>
			<option value="R">Returnable Requests</option>
			<option value="N">Non-Returnable Requests</option>
			</select>
	</td>  
		<td align="left" valign="middle" class="normal">Status :  </td>
		<td align="left" valign="middle" class="normal">
			<select name="reqStatus" class="normal">
			<option value="0">Select Status</option>
			<option value="'UC','RA'">Pending for Approval</option>
			<option value="'UC'">Pending for Authorisation</option>
			<option value="'AA'">Pending for Security</option>
			<option value="'AA','RA','PA','CL'">Processed</option>
			<option value="'UR','AR','RR','PR'">Rejected</option>
			<option value="'PA'">Not Returned Requests</option>
			</select>
		</td>

		<td align="left" valign="middle" class="normal">Department :  </td>
		<td align="left" valign="middle" class="normal">
			<select name="department" class="normal">
			<option value="0">Select Department</option>
			<option value="all">All</option>
			<option value="<%=deptGroup%>"><%=deptName%></option>
		</td>
		<td width="5%" height="20px"><input type="button" name="go" value="Submit" onclick="showData('1','<%=pageName%>');"></td>
	</tr>
    <tr>
		  <td colspan="100%" height="1px"><hr></td>
    </tr>
</table>
<span id="showRequests"></span>



</form>
</body>
</html>