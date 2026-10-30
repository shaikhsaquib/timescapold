<%@page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%> 
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList,java.io.*,java.util.Date" %>
<jsp:useBean id="expressController" class="com.bccl.expressyourself.web.controllerbeans.ExpressYourselfWebController"/>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%

	ArrayList countList = new ArrayList();
	Hashtable dataHash = new Hashtable();
	dataHash.put("STATUS", " 'A','AR' ");
	countList = expressController.getTopicCount(dataHash);
	String tmpArrC[] = (String[])countList.get(0);
%>
<%@ include file="../includes/userProfile.jsp"%>
<br>
<table width="100%" border="0" cellspacing="4" cellpadding="0" bgcolor="#FFFFFF">
	<tr>
		<td bgcolor="#04A2C4"><img src="../images/spacer.gif" width="1" height="2" /></td>
	</tr>
	<tr>
		<td class="normalBig"><strong><img src="../images/revenue.jpg" width="21" height="21" />&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="showExpressions('4');" class="normalBig">REVENUE <span class="bluenormal">(<%=tmpArrC[0]%> topics)</span></a></strong></td>
	</tr>
	<tr>
		<td bgcolor="#04A2C4"><img src="../images/spacer.gif" width="1" height="2" /></td>
	</tr>
	<tr>
		<td class="normalBig"><strong><img src="../images/cost.jpg" width="21" height="21" />&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="showExpressions('5');" class="normalBig">COST <span class="bluenormal">(<%=tmpArrC[1]%> topics)</span></a></strong></td>
	</tr>
	<tr>
		<td bgcolor="#04A2C4"><img src="../images/spacer.gif" width="1" height="2" /></td>
	</tr>
	<tr>
		<td class="normalBig"><strong><img src="../images/product.jpg" width="21" height="21" />&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="showExpressions('6');" class="normalBig">PRODUCT<span class="bluenormal"> (<%=tmpArrC[2]%> topics)</span></a></strong></td>
	</tr>
	<tr>
		<td bgcolor="#04A2C4"><img src="../images/spacer.gif" width="1" height="2" /></td>
	</tr>
	<tr>
		<td class="normalBig"><strong><img src="../images/home1.jpg" width="21" height="21" />&nbsp;&nbsp;&nbsp;<a href="javascript:void(0);" onclick="showExpressions('home');" class="normalBig">HOME<span class="bluenormal"> (<%=tmpArrC[3]%> topics)</span></a></strong></td>
	</tr>
	<tr>
		<td bgcolor="#04A2C4"><img src="../images/spacer.gif" width="1" height="2" /></td>
	</tr>
</table>