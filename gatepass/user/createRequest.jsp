<!--<%--
 -- Comments....
 -- @author		Ashutosh Joshi, Kavita Yadav
 -- @version 	1.00, May 2012.
 --%> -->

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<jsp:useBean id="listDomainObjectsController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Create Gatepass Request</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
<script src="../jscripts/common.js"language="javascript"></script>
<script src="../jscripts/util.js"language="javascript"></script>
<script src="../jscripts/jquery.js"language="javascript"></script>
<script src="../jscripts/addRows.js"language="javascript"></script>
<script src="../jscripts/createRequest.js"language="javascript"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url('../images/header_BG.jpg');
	background-repeat: repeat-x;
}
</style>
</head>


<body onload = "getDataOnClick(0,'N');">
<form name="frmCreateRequest" method="post">
<%@ include file="../includes/relatedLinks.jsp" %>
<table width="100%" border="0" cellpadding="0" cellspacing="0">


    <tr>
      <td colspan="100%" height="20px" bgcolor="#E7EAEF" class="budgetMenuBG">&nbsp;&nbsp;OUTWARD GATEPASS</td>
    </tr>
    <tr>
      <td align="center" colspan="100%" height="10px" valign="middle">&nbsp;</td>
	</tr>   
</table>

<table border="0" cellspacing="2" cellpadding="0" width="100%" align="center">
          <tr>
           <td colspan="100%" height="40px" align="center" valign="middle" class="greyBG"><input type="radio" name="gatePassType" id="gatePassType" value="R" onclick="showMyCols();"/>&nbsp;RETURNABLE OUTWARD GATE PASS&nbsp; | &nbsp; <input type="radio" name="gatePassType" id="gatePassType" value="N" onclick="showMyCols();" checked />NON- RETURNABLE OUTWARD GATE PASS
             </td>
          </tr>

		   <tr class="normal">
            <td width="32%" align="right" valign="middle">GatePassId</td>
            <td width="3%" align="center" valign="middle"> : </td>
            <td width="57%" align="left" valign="middle"><input maxlength="60" size="30" name="outReferenceNum" class="normal" value = "0"/><a href="#" onClick="getData();"><img src="../images/go_button.png" border="0" ><a/>
            </td>
          </tr>
			

		  <tr> 
			<td colspan="100%"><div id="showRequests"></div></td>
		  </tr>		  
</table>
</form>
 </body>
</html>
