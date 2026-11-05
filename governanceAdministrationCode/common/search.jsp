<%@ page language="java" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="groupwareWebController" class="com.bccl.groupware.web.controller.GroupwareWebController" /> 
<html>
<head>
<title>OCA Report</title>
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/util.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
<!-- <script Language="JavaScript" src="../jscripts/report.js"></script> -->
<link href="../style/common.css" rel="stylesheet" type="text/css"/>
</head>
<%

	String what  = (String)request.getParameter("what");
	String index = (String)request.getParameter("index");
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name ="searchUser" method = "post">

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		
		<tr>
			<td colspan="100%" class="greyBG" align="left" height="30">SEARCH FOR USERS :</td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
		<tr>
			<td class = "nav" height = "30" width = "35%" align = "right">Enter Name / Email-Id</td>
			<td class = "nav" height = "30"   width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width="20%" align="left"><input type = "text" name = "email" id="email" class = "normal" size="30"></td>
			<td align = "left">
				<a href="javascript:validateUser('<%=what%>','<%=index%>')"><img src="../images/but_go.gif" alt="go" border="0" valign = "absbottom"><a/>&nbsp;&nbsp; 
				<a href="javascript:clear()"><img src="../images/but_return.gif" alt="reset" border="0" valign = "absbottom"></a>
			</td>
		</tr>
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
		<tr>
			<td colspan="100%" class="normal" align="left" height = "15px">List of Members</td>
		</tr>		
		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
        <tr>
			<td class = "normal" colspan="100%" align = "right">
               <div id="members" style="padding:1px;padding-top:1px;text-align:left;"></div>
            </td>
		</tr>
    </table>
</form>
</body>
</html>