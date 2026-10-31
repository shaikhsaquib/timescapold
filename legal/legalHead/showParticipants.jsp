<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Search User </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal2.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-tagsinput.css" rel="stylesheet">
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.jscroll.min.js"></script>
	<script src="../js/bootstrap-tagsinput.js"></script>
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	
	<script>
	$(document).ready(function() {
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});
$("input").val()	
	$(".multi").select2({ width: '100%'  });
   
	$('body').on('focus',".datepicker1", function(){
			$(this).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,
      changeYear: true });	
	});	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	$('.scroll').jscroll();
});
	</script>	
</head>

<body>

<form name="frmParticipants" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="4" bordercolor="#cccccc">
				<tr bgcolor="#04A2C4">
					<td colspan="100%" align="left" height ="20px" class="white">SEARCH USER </td>
				</tr>
				 <tr>
					<td colspan="100%" height="5px"><img src="../images/spacer.jpg" height="5px"></td>
				</tr> 
			<!-- <tr>
              <td width="20%" align="left">
				<select name="rolesCriteria" class="normal" id="rolesCriteria">
					<option value="name">Name</option>
					<option value="emailId">Email ID</option>						
				</select></td>
			 <td width="3%" align="left">:</td>
			 <td width="50%" align="center">
			 <input type="text" name="rolesText" id="rolesText"  class="normal" size="40"/>&nbsp;</td>
			 <td align="left">
			 <img src="../images/yellow_arrow.gif" width="20" valign="bottom" height="15" onclick="searchUsers();"/></td>
           </tr> -->
		  <tr>
		  <td align="center" colspan="100%" height="10px" valign="middle" class="normalBig">
			<select name="rolesCriteria" class="normal" id="rolesCriteria">
					<option value="name">Name</option>
					<option value="emailId">Email ID</option>						
				</select>&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text" name="rolesText" id="rolesText"  class="normal" size="40"/>&nbsp;&nbsp;
			<button type="button" name="addZone" id ="addZone" onclick="searchUsers()"  class="greyBGmenu">Search</button>&nbsp;&nbsp;
			<button type="button"  onclick="document.frmroles.reset();" class="greyBGmenu">Reset</button>
		</td>

        </table>   
	  </tr>
	</table>
	<div id="showEmailid"></div>
</form>
</body>
</html>
