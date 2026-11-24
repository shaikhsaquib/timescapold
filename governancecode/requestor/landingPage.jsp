<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.SQLUtility"%>
<%@ page import="com.bccl.governancequiz.domain.GovernancequizUser"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Calendar, java.text.SimpleDateFormat,java.util.Calendar" %>




<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceWebController"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/savechklist.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-repeat: no-repeat;
}
-->
</style>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.style11 {font-size: 80%}
</style>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
		<td bgcolor="#74cad3" width = "100"><img src="../image/governanceCode.jpg" width="521" height="38" /></td>
	</tr>
<tr><td  align="center" style="font-size: 25px; font-weight: bold;" width="25%"><a href="/player/codevideo.html" >WATCH THIS VIDEO ON<BR>GOVERNANCE CODE - DECLARATION</a></td></tr>

</table>
<%
    if (companyCode.equals("1001")){
%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr><td colspan="3" align="center">Following are the links to the documents which need to be read before attempting this Governance Code<td/></tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://3b18e35e59699ef892b7753c33ec8245" target="_blank">Gift Policy</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://6a57cd0794ff050f8d4c5eb1b4d7f932" target="_blank">Whistle Blower Policy</a></strong></td>
  </tr>
  
  <!-- <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://7a8acc09b38280467ecc68727722f7e0" target="_blank">Buying Code of Ethics</a></strong></td>
  </tr> -->
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<!-- <a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://98b721fff20a4ccc07d2cb1f2425003e" target="_blank">Prevention of Insider Trading</a></strong></td> -->
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://98b721fff20a4ccc07d2cb1f2425003e" target="_blank">ENIL Code for Prohibition of Insider Trading</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://b6ecf0edcafefb2a9c2bad5ad840ec12" target="_blank">Code of Ethics & Business Principles</a></strong></td>
  </tr>
  <!-- <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/go/km/docs/timesgroupcontent/company/enil/webcontent/documents/HR Policies/Prevention of Sexual harassment policy.pdf" target="_blank">Sexual Harrasment Policy</a></strong></td>
  </tr> -->
<%
    } else if (companyCode.equals("1005")){
%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://tlweb.timesgroup.com/timescape/pdf/COC.pdf" target="_blank">Code of Conduct &amp; Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="small">
      <strong><a class="style3Underline" href="https://timeslink.timesgroup.com/irj/portal?NavigationTarget=navurl://87674c7342a7e5deeca381d534f1d7a8" target="_blank">Buying Code of Ethics</a></strong>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center" class="style3Underline">
      <strong><a class="style3Underline" href="https://tlweb.timesgroup.com/timescape/pdf/GIFTS POLICY.pdf" target="_blank">Gift Policy</a></strong>
    </td>
  </tr>
<%
    }else {
%>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr><td colspan="3" align="center">Following are the links to the documents which need to be read before attempting this Governance Code<td/></tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://4ad4d41d73b8ca64bbe31f7792e9d4f1" target="_blank">Code of Conduct  &amp; Ethics</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://87674c7342a7e5deeca381d534f1d7a8" target="_blank">Buying Code of Ethics</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<a class="style3Underline" href="https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://3b18e35e59699ef892b7753c33ec8245" target="_blank">Gift Policy</a></strong></td>
  </tr>
<%
}
%>

  <tr>
  <td colspan="3" align="center" valign="middle"><p>
    I would like to continue with the Governance Code.</p></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#587DAB"><img src="../image/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
    <td colspan="3" align="center" bgcolor="#CBECEF">
	  <input name="Submit3" type="button" class="name" value="Continue" onclick="callValidate()" />
      &nbsp;</td>
  </tr>
  
 
</table>
<p>&nbsp;</p>
</body>
</html>
