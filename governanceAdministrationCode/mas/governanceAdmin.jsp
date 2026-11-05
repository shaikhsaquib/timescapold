 <%@ page language="java" %>
 <html>
<head>
    <title>OCA Report</title>
	 <link href="../style/global.css" rel="stylesheet" type="text/css" />	
	 <link href="../style/compliance.css" rel="stylesheet" type="text/css" />	
    <script Language="JavaScript" src="../jscripts/mas.js"></script>
 </head>

<body>
<form name="frmActivity" method = "post" action = "">

<%@ include file="../includes/headerMenu.jsp" %>
<%@ include file="../includes/menu.jsp"%>
<BR>
   <table width="100%" border="0" cellpadding="1" cellspacing="1">
	<tr>
		<td colspan="100%" class="style4" style="border-bottom:1px solid #EFEFEF">Select Activity : &nbsp;&nbsp;
		<select id="activity" name="activity" >
		<option value ="apprMatrix" name ="allQuestion">Change Approver Matrix</option>		
		</select>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/orangearrow.gif" onClick="go();" >
		</td>
	</tr> 
</body>
	</html>