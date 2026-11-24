<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %> 
<%@page import="java.net.URLDecoder,java.util.Hashtable,java.net.URL,java.net.URLEncoder,java.net.URLConnection,java.net.HttpURLConnection,javax.net.ssl.HttpsURLConnection,java.security.Security"%>
<%@page import="java.io.OutputStreamWriter, java.io.BufferedReader, java.io.InputStreamReader,java.util.GregorianCalendar,java.util.Calendar, java.util.Hashtable"%>
<%@page import="com.bccl.util.HtmlUtil"%>
<%@page import="java.net.InetAddress"%>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Raksha TPA</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
-->
</style>

<script type="text/JavaScript">
<!--
function timedRefresh()
{

	//document.ipfrm.action="http://www.rakshatpa.com/Insured_PolicySearchByEmp.jsp";///commented on 07.09.2012 by Sachin Mehta
	//document.ipfrm.action="http://www.rakshatpa.com/raksha/Insured_PolicySearchByEmp.jsp";
	document.ipfrm.action="https://www.rakshatpa.com/Insured_PolicySearchByEmp.jsp";
	document.ipfrm.submit();
	
	//window.location = "http://192.168.2.167:8080/RakshaWeb/Insured_PolicySearchByEmp.jsp?emp=10000278&ip="+document.getElementById("ip").value;
}
//   -->
</script>
<%

//String emp=request.getParameter("emp");
//out.println(sapId);

%>
</head>

<body onload="JavaScript:timedRefresh();">

<form  name="ipfrm"   method="post">

<input type="hidden" id="emp" name="emp" value="<%=sapId%>">
<input type="hidden" id="authId" name="authId" value="Bennet">


</form>

</body>

</html>

