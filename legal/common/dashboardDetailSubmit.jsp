<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Utility" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Request </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-table.min.css" rel="stylesheet"/> 	
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 32px;		
			border-radius: 0;
			  border: 1px solid #CCC;
		}
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
}
	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/form-validation.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	

	<script>
	$(document).ready(function() {
	
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});

	});
	</script>	
	
</head>
<%

	String requestoid					= (String)request.getParameter("requestoid");
	String msg							= (String)request.getParameter("msg");

	//out.println("requestoid----"+requestoid);
	//out.println("msg----"+msg);


%>