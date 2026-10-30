<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable,java.util.HashMap,java.util.Iterator,java.util.Map,java.util.Set,java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>

<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>

<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport">
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   
	<link rel="stylesheet" href="../css/ota.css"/>
	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 

	<script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>


	<title>Dashboard</title>
	<style>
	       label{
	       color: #2F6C87;
	       font-size: 12px;
	   }
	   
	   body{
	       font-size: 12px !important;
	   }

	   a{
	       text-decoration: none;
	       color: #2F6C87;
	       cursor: pointer;
	   }
	   
	   @media only screen and (max-width: 600px){
	       .mob_pad{
	           padding: 0 !important;
	       }
	   }   
	   @media only screen and (min-width: 601px){
	       .mob_pad{
	           padding-left: 0 !important;
	       }
	   }   

		.customborder{
			border: 1px solid #c6c6c6;
			font-size: 1.1	em;
			font-weight: bold;
			padding: 0.5%;
			text-align: center;
			background-color: rgba(0, 135, 167, 0.11);
		}

		.customborder1{
			border: 1px solid #c6c6c6;
			font-size: 1em;
			padding: 0.5%;
			text-align: center;
		}

	</style>
	<script>
	$(document).ready(function() {
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
		
	$("#myDiv").hide();


	});

	
	</script>

</head>

<%

%>
<body>
	
	<div  style="background: #3784a5; padding: 0%;height:50px">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px">
			<img src="../images/header.png">
		</div> 
		
		<div  style="float:right; width:200px">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div>  	
	 <div class="col-md-12 col-sm-12 col-xs-12">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			Dashboard</h5><br>
		</div>
	</div> 
		
			
		
		
		<div class="col-md-12 col-sm-12 col-xs-12 text-center">
			<div style="margin: 1% 0%;">
				<input class="btn btn-info" id="submitForm"  type="button" value="Generate Reports " style="padding: 0.5% 2%;" onclick="getMainHistory();">
			</div>
			<hr>
		</div>
		
		<!-- table-->
		<table class="table-top_view">
			<tr>
				<td><img src="../images/legend.jpg" style="width: 100%;"></td>
				<td><a href="../common/downloadSupervisorList.jsp">
					<img src="../images/excel.png" border="0" align="left" style="width: 8%;">
				</a><span >&nbsp;&nbsp;Download Report</span></td>
			</tr>
		</table>	
		<!--<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="col-md-5 col-sm-5 col-xs-6">
				
			</div>
			<div class="col-md-3 col-sm-3 col-xs-6 " id="myDiv">
				
			</div>
		</div>-->
	<div id = "showReportData"></div>
		
			
		
</body>
</html>



						