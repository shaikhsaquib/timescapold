<%@ include file="../includes/empHeader.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta content="width=device-width, initial-scale=1" name="viewport">
		<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   
	
		<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
		<link rel="stylesheet" href="../css/ota.css"/>
		<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
		<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
		
		
		<script src="../js/ota.js"></script> 
		<script src="../js/util.js"></script> 
	    <script src="../js/common.js"></script> 
	    <script src="../js/jquery.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
	    <script src="../js/jquery1.min.js"></script>
	    <script src="../js/jquery-ui.min.js"></script>
		
		<title>Audit Recommendations</title>
		
		<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar" %>
		<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
		<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
		
		<style>
			label{ color: #2F6C87; font-size: 12px; }
			body{ font-size: 12px !important; }
			a{ text-decoration: none; color: #2F6C87; cursor: pointer; }
			td{ width:25%; }
			@media only screen and (max-width: 600px){ .mob_pad{ padding: 0 !important; } }
			@media only screen and (min-width: 601px){ .mob_pad{ padding-left: 0 !important; } }
			.customborder{ border: 1px solid #c6c6c6; font-size: 1.1	em; font-weight: bold;  text-align: center; background-color: rgba(0, 135, 167, 0.11); }
			.customborder1{ border: 1px solid #c6c6c6; font-size: 1em; padding: 0.5%; text-align: center; }
			.scrollit { height:40em; overflow-y:scroll; }
			.text{ width:20%; text-align:center; padding:20px; }
			.field{ padding:5px; text-align:left; width:80%; }
			.row{ height:20%; }
		</style>
	
		<script>
			$(document).ready(function() {
				$('.RelatedLinks ul li.RelLinks').hover(function() {
						$(this).find('.dropdownmenu').show();
					}, function(){
						$(this).find('.dropdownmenu').hide();
				});
				
				$('select[id="department"]').change(function(){
					var random = Math.random();
					loadFragment2("../common/getAreaDropdown.jsp?random="+random+"&deptCode="+$(this).val(),"area", "");
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
				$("#departmentDropdownTdId").css('visibility','visible');
				callback();
			}
	
			function showArea(deptCode,random,callback){
				loadFragment2("../common/getAreaDropdown.jsp?random="+random+"&deptCode="+deptCode,"area", "");
				$("#areaDropdownTdId").css('visibility','visible');
				callback();
			}
	
			function showYear(random){
				loadFragment2("../common/getYearDropdown.jsp?random="+random,"year", "");
				$("#yearDropdownTdId").css('visibility','visible');
				$("#goButton").css('visibility','visible');		
			}
		</script>
	</head>
	<body>
		<div style="background: #3784a5; padding: 0%;height:50px">
			<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px">
				<img src="../images/header.png">
			</div> 
			<div  style="float:right; width:200px;">
				<%@ include file="../includes/relatedLinks.jsp" %>
			</div>
		</div>
		<div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;">
			<div class="col-md-4 pad0">
				<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
				ATR</h5><br>
			</div>
		</div> 
		<%
			ArrayList compList 	= new ArrayList(); 
			String compStr 		= "";
			compList 			= OtaController.companyDisplay();
			int compListSize 	= compList.size();
			String[] compData 	= null;
			
			for(int i=0;i<compListSize;i++){
				compData 	= (String[]) compList.get(i);
				compStr		+=	"<option value=\""+compData[0]+"\">"+compData[1]+"</option>";
			}
		%>
		<br><br><br><br><br>
		<table style="width:100%;border:1">
			<tr style="width:100%">
				<!--<td>
					<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Company&nbsp:</div>
					<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:70%">
						<select class="form-control input-xs pqr" id="company" name="company" >
							<option  value="Select">Select</option>
							<%=compStr%>
						</select>
					</div>
				</td>--->
				<td id="departmentDropdownTdId" style="visibility:hidden">
					<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Department&nbsp:</div>
					<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
						<select class="form-control input-xs pqr" id="department" name="department"></select>
					</div> 
				</td>
				<td id="areaDropdownTdId" style="visibility:hidden">
					<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Area&nbsp:</div>
					<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
						<select class="form-control input-xs pqr" id="area" name="area" ></select>
					</div> 
				</td>
				<td id="yearDropdownTdId" style="visibility:hidden">
					<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Year&nbsp:</div>
					<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
						<select class="form-control input-xs pqr" id="year" name="year" ></select>
					</div> 
				</td>
			</tr>
		</table>
		<div id="goButton" align=center class="col-md-5 col-sm-12 col-xs-12" style="width:100%;margin: 1% 0%; visibility:hidden; " >
			<input class="btn btn-info" id="submitForm"  type="button" value="Go" onclick="getUploadedHistoryData();">
		</div>
		
		<div style="text-align:center" id = "viewData"></div>
	</body>
</html>