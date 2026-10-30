<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.HashMap,java.util.Hashtable" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ota.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/ota.js"></script> 
	<script src="../js/util.js"></script> 
    <script src="../js/common.js"></script> 
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
		
		loadFragment2("../common/getAreaDropdown.jsp?random="+Math.random()+"&deptCode="+<%=deptGroup%>,"area", "");
		loadFragment2("../common/getYearDropdown.jsp?random="+Math.random(),"year", "");
	
		$("#download").hide();
		$(".imgHide").hide();
		$(".areaImgHide").hide();
		$("#downloadAreaReport").hide();
		});
	</script>
</head>

<% 
	HashMap<String,String> deptMap = new HashMap<String,String>();
	deptMap.put(deptGroup,deptName);
	session.setAttribute("deptMap",deptMap);
	session.setAttribute("deptCondition",""); // This is needed because some linked pages need deptCondition session variable
%>

<body>

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
	
	<div style="width:100%;align-items:left;">
	
		<table style="width:100%;"> 
			<tbody style="width:50%;">
				<tr style="width:50%;text-align:left;align-items: left;">
					<td id="areaDropdownDivId" class="area" style="width:50%;text-align:left;align-items: left;">
						<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Area&nbsp:
						</div>
						<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
							<select class="form-control input-xs pqr" id="area" name="area" >
			
									
							</select>
						</div>
					</td>
					<td id="yearDropdownDivId" class="year" style="width:50%;text-align:left;align-items: left;">
						<div class="col-md-4 col-sm-5 col-xs-5 text-right cust " style="display:inline-block; width:20%;font-size: 14px">Year&nbsp:
						</div>
						<div class="col-md-3 col-sm-4 col-xs-7" style="display:inline-block; width:80%">
							<select class="form-control input-xs pqr" id="year" name="year" >
			
									
							</select>
						</div> 
					</td>
			    </tr>
		    </tbody>
		</table>
		
		<div id="goButton" align=center class="col-md-5 col-sm-12 col-xs-12" style="width:100%;margin: 1% 0%;" >
				<input class="btn btn-info" id="submitForm"  type="button" value="Go" onclick="getHistory();">
		</div>
	
	</div>
		<input id="company" type="hidden" value="<%=companyCode%>">
		<input id="department" type="hidden" value="<%=deptGroup%>">
		<div style="width:100%" class="col-md-5 col-sm-12 col-xs-12"  id = "showData"></div>

</body>
</html>