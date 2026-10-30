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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ota.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />

	<title>Reports</title>
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

		.cust{
			
			
			font-size: initial;
			padding: 0.5%;
			
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
	
		$("#download").hide();
		$(".imgHide").hide();
		$(".areaImgHide").hide();
		$("#downloadAreaReport").hide();
		});
		
		$(document).ready(function() {
			
			$('select[id="department"]').change(function(){
				var random = Math.random();
				showArea($(this).val(),random,function(){
					showYear(random);
				});
			});

			
			$('select[id="company"]').change(function(){
				var random = Math.random();
				showDepartment($(this).val(),random,function(){
					showArea("all",random,function(){
						showYear(random);
					});
				});			
			});
			
			
			
		});
		
		function showDepartment(companyCode,random,callback){
			loadFragment2("../common/getDepartmentDropdown.jsp?random="+random+"&companyCode="+companyCode,"department", "");
			$("#departmentDropdownDivId").css('visibility','visible');
			callback();
		}
		
		function showArea(deptCode,random,callback){
			loadFragment2("../common/getAreaDropdown.jsp?random="+random+"&deptCode="+deptCode,"area", "");
			$("#areaDropdownDivId").css('visibility','visible');
			callback();
		}
		
		function showYear(random){
			loadFragment2("../common/getYearDropdown.jsp?random="+random,"year", "");
			$("#yearDropdownDivId").css('visibility','visible');
			$("#goButton").css('visibility','visible');		
		}
		
		
	</script>
</head>

<%
	ArrayList compList = new ArrayList(); 

	String compStr = "";
	
	compList = OtaController.companyDisplay();

	int compListSize = compList.size();

	String[] compData = null;
	
	for(int i=0;i<compListSize;i++){
		compData = (String[]) compList.get(i);
		compStr+="<option value=\""+compData[0]+"\">"+compData[1]+"</option>";
	}


%>

<body >

	<!-- hidden elements -->
	<input type="hidden" id="companyHiddenValue"></input>
	<input type="hidden" id="departmentHiddenValue"></input>
	
	<!-- header -->
	<div  style="background: #3784a5; padding: 0%;height:50px">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px">
			<img src="../images/header.png">
		</div> 
		
		<div  style="float:right; width:200px">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div> 
	 <div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			Dashboard</h5><br>
		</div>
	</div> 
	
	<!-- main block -->
	<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 4%;display: flex;justify-content: center;align-items: center;">
	
	<div style="display:inline-block; width:25%">
		<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">
				Company&nbsp:
			</div>
			<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:70%">
				<select class="form-control input-xs pqr" id="company" name="company" >
					
					<option  value="Select">Select</option>
						<%=compStr%>
						
				</select>
			</div>
	</div>
	
	<div id="departmentDropdownDivId" class="department" style="display:inline-block;visibility:hidden; width:25%">
		<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">
				Department&nbsp:
			</div>
			<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
				<select class="form-control input-xs pqr" id="department" name="department">


	</select>
			</div> 
	</div>
	
	<div id="areaDropdownDivId" class="area" style="display:inline-block;visibility:hidden;; width:25%">
		<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Area&nbsp:
			</div>
			<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
				<select class="form-control input-xs pqr" id="area" name="area" >

						
				</select>
			</div> 
	</div>
	
	<div id="yearDropdownDivId" class="year" style="display:inline-block;visibility:hidden; width:25%">
		<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Year&nbsp:
			</div>
			<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
				<select class="form-control input-xs pqr" id="year" name="year" >

						
				</select>
			</div> 
	</div>
	
 
 </div>

		
		<div id="goButton" align=center class="col-md-5 col-sm-12 col-xs-12" style="width:100%;margin: 1% 0%; visibility:hidden; " >
				<input class="btn btn-info" id="submitForm"  type="button" value="Go" style="/* padding: 0.5% 2%;margin-top: -4%;height: 36px; */" onclick="getHistory();">
		</div>

		
		<div style="width:100%;text-align:center" class="col-md-5 col-sm-12 col-xs-12"  id = "showData"></div>

</body>
</html>