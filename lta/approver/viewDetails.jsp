<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 

<%
	String applicationId    = (String) request.getParameter("applicationId");
	
    ArrayList viewDetails   = new ArrayList();

    viewDetails             = ltaController.viewDetails(applicationId);
    
    String tmpArr[]         = (String []) viewDetails.get(0);

%> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LTA Application</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	text-align: center;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 13px;
	color: #333;
}
.bold {
	font-weight: bold;
}
</style>
<link href="../style/lta.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top"><img src="../images/header.jpg" width="543" height="97" /></td>
  </tr>
</table>
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  <tr>
    <td width="19%" height="22" bgcolor="#E1EDED" class="style4">&nbsp;</td>
    <td width="16%" bgcolor="#E1EDED" class="style4">&nbsp;</td>
    <td colspan="2" align="center" bgcolor="#E1EDED" class="style4">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF" class="style3Underline">&nbsp;</td>
    <td bgcolor="#FFFFFF" class="style4" width>Name</td>
    <td width="42%" bgcolor="#FFFFFF" class="style3"><%=tmpArr[3]%></td>
    <td width="42%" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
    <td bgcolor="#F8F8F8">&nbsp;</td>
    <td bgcolor="#F8F8F8" class="style4"><span class="style3">Company</span></td>
    <td bgcolor="#F8F8F8" class="style3"><%=tmpArr[4]%></td>
    <td bgcolor="#F8F8F8">&nbsp;</td>
  </tr>
   <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
     <td bgcolor="#FFFFFF" class="style3Underline">&nbsp;</td>
     <td bgcolor="#FFFFFF" class="style4">Branch</td>
     <td bgcolor="#FFFFFF" class="style3"><%=tmpArr[8]%></td>
     <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
   <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
     <td bgcolor="#F8F8F8" class="style3Underline">&nbsp;</td>
     <td bgcolor="#F8F8F8" class="style4">SAP ID</td>
     <td bgcolor="#F8F8F8" class="style3"><%=tmpArr[5]%></td>
     <td bgcolor="#F8F8F8">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
     <td bgcolor="#FFFFFF" class="style3Underline">&nbsp;</td>
     <td bgcolor="#FFFFFF" class="style4">Designation</td>
     <td bgcolor="#FFFFFF" class="style3"><%=tmpArr[7]%></td>
     <td bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
   <tr>
    <td colspan="4" bgcolor="#FFFFFF"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  <tr>
     <td bgcolor="#F8F8F8" class="style3Underline">&nbsp;</td>
     <td bgcolor="#F8F8F8" class="style4">Department</td>
     <td bgcolor="#F8F8F8" class="style3"><%=tmpArr[6]%></td>
     <td bgcolor="#F8F8F8">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" bgcolor="#CCCCCC"><img src="images/spacer.gif" width="1" height="1" /></td>
  </tr>
  
  <tr>
     <td height="44" align="center" valign="middle" colspan = "100%"><input name="button" type="submit" class="style4" id="button" value="Close Window" onClick="javascript:window.close();" /></td>
  </tr>

 
</table>
</body>
</html>
