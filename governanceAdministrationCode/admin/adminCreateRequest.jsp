 <%@ page language="java" %>
 <html>
<head>
    <title>OCA Report</title>
	<%@ include file="../includes/headerMenu.jsp" %>
	 <link href="../style/global.css" rel="stylesheet" type="text/css" />	
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/admin.js"></script>
 </head>
<body>
<table width="85%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td>
		<%@ include file="../includes/menu.jsp" %>
	</td>
<tr>
</table>
<br>
<form name="frmAdminActivity" method = "post" action = "">
<table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="100%" class="style4" style="border-bottom:1px solid #EFEFEF">Select Activity : &nbsp;&nbsp;
		<select id="activity" name="activity" >
		<option value ="editquestion" name ="editquestion">Edit Question Text</option>
		<!-- <option value = "changingmanager" name="changingmanager">Change Manager</option> -->
			</select
		>&nbsp;&nbsp;<img src="../images/orangearrow.gif" onClick="go();" >
		</td>
	</tr> 
</body>
</html>


