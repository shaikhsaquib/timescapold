<!DOCTYPE html>
<html lang="en">
<head>
  <title>Audit Recommendations</title>
  <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ervm.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ervm.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.min.js"></script>
   <script Language="JavaScript" src="../js/ervm.js"></script>
   <script src="../js/jquery1.min.js"></script>
	<!-- <link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" /> -->
	<script src="../js/jquery-ui.min.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  <style>
	body{
		font-family: Calibri;
		font-size: 16px;
		color: #000;
	}

	table{
		text-align: center;	
		 margin-left: auto;
    	margin-right: auto;	
	} 

	.col-md-12, .col-sm-12, .col-xs-12{
		border-bottom: 1px solid #DFDFDF;
		padding: 0;
		
	}

	.col-md-6, .col-sm-6, .col-xs-6{
		margin: 1% 0%;
	}

	.form-control{
		color: #000;
	}
	.text{
	width:50%;
	text-align:left;
	padding:20px;
	
	}
	.field{
	
	padding:5px;
	text-align:left;
	width:50%;
	
	}
	.row{
	height:5%;
	border: 1px solid #BBBBBB;
	}
	
  </style>
  <script>

  
	$(document).ready(function() {
	var random = Math.random();
	loadFragment2("../common/getDepartmentDropdownForSingleUpload.jsp?random="+random,"dept", "");
		
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});

	$("#userResp").keyup(function(){
			   var flag = validateEmail();
			   return flag;
		    });	 
	$("#superResp").keyup(function(){
		   var flag = validateEmail1();
		   return flag;
		});	 
	});

	jQuery(function() {
		$('.test').datepicker();
    });
</script>

</head>
<body>

<%

%>
	<div  style="background: #3784a5; padding: 0%;height:50px">
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
			Single Upload</h5><br>
		</div>
	</div> 

    <br><br> <br><br> 
    
    <form name = "frmSingle" method = "post" style="margin: auto; text-align: center;">
	<table  style="border: 1px solid #BBBBBB; width:50%">
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Area</td>
	<td class="field"><input class="form-control"  maxlength="500" name="area" id="area" style="resize: none;" ></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Risk</td>
	<td class="field"><textarea class="form-control" maxlength="500" rows="5" name="recommendation" id ="recommendation" style="resize: none;" ></textarea></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Actions required</td>
	<td class="field"><textarea class="form-control" rows="5" maxlength="500" name = "mangComments" id ="mangComments" style="resize: none;" ></textarea></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Mitigation Plan</td>
	<td class="field"><textarea class="form-control" rows="5" maxlength="500" name = "mitigationPlan" id ="mitigationPlan" style="resize: none;" ></textarea></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Risk Classification</td>
	<td class="field">
		<select class="form-control" name = "severety" id = "severety" style="" >
				<option value="Select">Select</option>
				<option value="Strategic">Strategic</option>
				<option value="Financial">Financial</option>
				<option value="Operational">Operational</option>
				<option value="Compliance">Compliance</option>
		</select>
	</td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Subordinate's Email Id</td>
	<td class="field"><input class="form-control" rows="5" maxlength="500" name="userResp" id="userResp" style="resize: none;" onClick="addUser(this.id)"></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Supervisor's Email Id</td>
	<td class="field"><input class="form-control" rows="5" maxlength="500" name="superResp" id="superResp" style="resize: none;" onClick="addUser1(this.id)"></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Target date</td>
	<!-- <td class="field"><input type="text" class="test custom_formcontrol" name="targetDate" id="targetDate"  ></td> -->
	<td class="field"><input type="text" class="test custom_formcontrol" name="targetDate" id="targetDate" autocomplete="off"></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Year</td>
	<td class="field"><input type="text" class="formcontrol" placeholder="eg: 2017-18" name="year" id="year"  ></td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td class="text" style="font-weight: bold; color: #2F6C87;">Department : </td>
	<td class="field">
	
		<select class="formcontrol" id="dept" name="dept" >				
		</select>
	
	<!-- <input type="text" class="formcontrol" name="dept" id="dept"> -->
	</td>
	</tr>
	
	<tr class="row" style="padding:15px;">
	<td colspan="2"><input class="btn-danger" name="Submit" value= "Submit" type="button" style="font-size: 16px; margin: 1% 0%; padding: 0.5% 1.5%; border-radius: 6px; width:15%"  onclick="singleUpload();"></td>
	</tr>
	</table>
	</form>

	</body>
</html>
