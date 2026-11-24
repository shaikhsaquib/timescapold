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
<jsp:useBean id="governancequizWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizWebController" /> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/governanceQuiz.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(image/BGimage.jpg);
	background-repeat: no-repeat;
}
-->
</style>
<link href="style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.style11 {font-size: 80%}
</style>
</head>

<body style="background-image:url(../images/BGimage.jpg)">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#74cad3"><img src="../images/governanceCodeQuiz.jpg" width="615" height="64" /></td>
  </tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="4" class="style3">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr><td colspan="3" align="center">Following are the links to the documents which need to be read before attempting this Quiz<td/></tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://0409c37a4048efaacac7448194bd041a" target="_blank">Code of Conduct  &amp; Ethics</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="small"><strong class="style3Underline">
	<a class="style3Underline" href="http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://7a8acc09b38280467ecc68727722f7e0" target="_blank">Buying Code of Ethics</a></strong></td>
  </tr>
  <tr>
    <td height="28" colspan="3" align="center" valign="middle" class="style3Underline"><strong>
	<a class="style3Underline" href="http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://64614fac534738b6a458a528df43d83e" target="_blank">Gift Policy</a></strong></td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle"><p>
    I would like to continue with the Governance Code Quiz.</p></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#587DAB"><img src="../images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <%
		ArrayList statusList = new ArrayList();
		statusList = governancequizWebController.checkStatus(timescapeUserOId);
		
		String[] statusArr = (String[])statusList.get(0);

		if((!statusArr[2].equals("N")))
		{
  %>
  <tr>
    <td colspan="3" align="center" bgcolor="#CBECEF"><strong class="style3Underline">You have already given the quiz...</strong></td>
  </tr>	
  <%
		session.setAttribute("quiz","2");		
  }	else
		{
		session.setAttribute("quiz","1");
		if(((String)session.getAttribute("flag"))!="1")
		{
  %>
<tr>
    <td colspan="3" align="center" bgcolor="#CBECEF">
	  <input name="Submit3" type="button" class="name" value="Continue" onclick="callValidate()" />
      &nbsp;</td>
  </tr>
  <%
	   }else
			{
			     %>
<tr>
    <td colspan="3" align="center" bgcolor="#CBECEF"><strong class="style3Underline">You have already given the quiz...</strong></td>
  </tr>
  <% 
			}
  }
		
  %>
  
</table>
<p>&nbsp;</p>
</body>
</html>
