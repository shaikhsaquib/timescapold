<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Audit Recommendations</title>
  
   <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7; IE=5; chrome=1">   

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
  <link rel="stylesheet" href="../css/ervm.css"/>
   <script Language="JavaScript" src="../js/ervm.js"></script>
   <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>

  
  
  <!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script Language="JavaScript" src="../js/ervm.js"></script> 
  <link rel="stylesheet" href="../css/ervm.css"/> -->

  <style>
	body{
		font-family: Calibri;
		font-size: 16px;
		color: #000;
	}
	
	table th, td{
		text-align: center;
	}

	/*.col-md-12, .col-sm-12, .col-xs-12{
		
		padding: 0;
		
	}

	.col-md-6, .col-sm-6, .col-xs-6{
		margin: 1% 0%;
		background: #FBFBFB;
	}

	.form-control{
		color: #000;
	}

	input[type="file" i] {
    -webkit-appearance: initial;
    background-color: initial;
    padding: initial;
    border: initial;
}

	
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
  float: left;
}
.col-xs-12 {
  width: 100%;
}
.col-xs-11 {
  width: 91.66666667%;
}
.col-xs-10 {
  width: 83.33333333%;
}
.col-xs-9 {
  width: 75%;
}
.col-xs-8 {
  width: 66.66666667%;
}
.col-xs-7 {
  width: 58.33333333%;
}
.col-xs-6 {
  width: 50%;
}
.col-xs-5 {
  width: 41.66666667%;
}
.col-xs-4 {
  width: 33.33333333%;
}
.col-xs-3 {
  width: 25%;
}
.col-xs-2 {
  width: 16.66666667%;
}
.col-xs-1 {
  width: 8.33333333%;
}

@media (min-width: 992px) {
  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
    float: left;
  }
  .col-md-12 {
    width: 100%;
  }
  .col-md-11 {
    width: 91.66666667%;
  }
  .col-md-10 {
    width: 83.33333333%;
  }
  .col-md-9 {
    width: 75%;
  }
  .col-md-8 {
    width: 66.66666667%;
  }
  .col-md-7 {
    width: 58.33333333%;
  }
  .col-md-6 {
    width: 50%;
  }
  .col-md-5 {
    width: 41.66666667%;
  }
  .col-md-4 {
    width: 33.33333333%;
  }
  .col-md-3 {
    width: 25%;
  }
  .col-md-2 {
    width: 16.66666667%;
  }
  .col-md-1 {
    width: 8.33333333%;
  }}*/

	
  </style>
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
<body>
 <%
 String str			= (String)request.getParameter("str");
 int myInt = 10;
	String myString = String.valueOf(myInt);
 %>
	
	
	<!-- <div  style="background: #3784a5; padding: 0%;height:50px">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px">
			<img src="../images/header.png">
		</div> 
		
		<div  style="float:right; width:200px">
			
		</div>
	</div> 
	
	<div class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;">
		<div class="col-md-4 pad0">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%;">
			Bulk Upload</h5><br>
		</div>
	</div> -->

	
	 <div  style="background: #3784a5; padding: 0%;height:50px">
		<div class="col-lg-10 col-md-10 col-sm-10" style="padding: 0;float:left;height:50px">
			<img src="../images/header.png" style="float:left">
		</div> 
		
		<div  style="float:right; width:200px;">
			<%@ include file="../includes/relatedLinks.jsp" %>
		</div>
	</div> 
	
	<div  style="background: #E6E6E6;">
		<div class=" pad0" style="text-align:center;width:100%">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%">
			Bulk Upload</h5><br>
		</div>
	</div>
	<!-- <div  class="col-md-12 col-sm-12 col-xs-12" style="background: #E6E6E6;">
		<div class="col-md-4 pad0" style="text-align:center;width:100%">
			<h5 style="color: #2F6C87; font-weight: bold; font-size: 18px; padding-top: 2%">
			Bulk Upload</h5><br>
		</div>
	</div> -->
	
	<!-- <form method="post" action= "#" >
	<table style="text-align: right;width:50%">	
		<tr>
			<td style="font-weight: bold; text-align: right;">Attachment</td>
			<td><input type="file" id="uploadFile" name ="uploadFile" ></td>
		</tr>
		
		<tr>
		<td colspan="2">
		<input class="btn-danger" type="submit" style="font-size: 16px; margin: 6% 0%; padding: 0.5% 1.5%; border-radius: 6px;"  onclick="validateFields();">
		</td>
		</tr>
	</table>
	</form> -->
	
	<br><br>
	<form method="post" action= "#" >
	<div style="width:100%">
			<center>
			<div  style="text-align:center; width:50%;">
				<div   style="font-weight: bold; text-align: right;float:left;width:50%">
					Attachment&nbsp:
				</div>
				<div style="text-align:center; float:left; width:50%">
					<input type="file" id="uploadFile" name ="uploadFile" >
				</div>
			</div>
			</center>
			
			<br><br>
			<center>
			<div style="width:10%; text-align:center;">
				<!-- <input class="btn-danger" type="submit" style="font-size: 16px; border-radius: 6px;"  onclick = "validateFields();"> -->
					<input id="submit_button" class="btn-danger" type="submit" style="font-size: 16px; border-radius: 6px;">																						
			</div> 
			
			<div id="uploadGIF" style="width:10%; text-align:center;">
				
			</div> 
			</center>
		
	</div>
	</form>
	<br><br><br>

	<!-- <div class="col-md-12 col-sm-12 col-xs-12" style="width:100%">
		<div class="col-md-3 col-sm-3"></div> 
		<div class="col-md-6 col-sm-6 col-xs-12" style="margin: 2% 0%;width:100%;text-align:center">
		<form method="post" action= "#" >
		
		 <table style="text-align: right;width:100%">	
		<tr>
			<td style="font-weight: bold; text-align: right;">Attachment</td>
			<td><input type="file" id="uploadFile" name ="uploadFile" ></td>
		</tr>
		
		<tr>
		<td colspan="2">
		<input class="btn-danger" type="submit" style="font-size: 16px; margin: 6% 0%; padding: 0.5% 1.5%; border-radius: 6px;"  onclick="validateFields();">
		</td>
		</tr>
	</table>
			
			<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;width:50%">
				<div class="col-md-6 col-sm-6 col-xs-6"  style="font-weight: bold; text-align: right;float:left;">
					Attachment&nbsp:
				</div>
				<div class="col-md-6 col-sm-6 col-xs-6">
					<input type="file" id="uploadFile" name ="uploadFile" >
				</div>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12">
				<center><input class="btn-danger" type="submit" style="font-size: 16px; margin: 6% 0%; padding: 0.5% 1.5%; border-radius: 6px;"  onclick = "validateFields();"></center>
			</div> 
			<br><br>
			 
			<div  style="text-align:center; width:50%; background-color:red">
				<div   style="font-weight: bold; text-align: right;float:left;width:50%">
					Attachment&nbsp:
				</div>
				<div style="text-align:center;float:left;width:50%">
					<input type="file" id="uploadFile" name ="uploadFile" >
				</div>
			</div>
			
			<br>
		
			<div style="width:100%;text-align:left; background-color:#E6E6FA">
				<input class="btn-danger" type="submit" style="font-size: 16px; border-radius: 6px;"  onclick = "validateFields();">
			</div> 
			
			
		
		</form>
		</div>
	</div> -->
		<!-- Hidden Fields -->
		<input type="hidden" name="hiddIndex" value="<%=myString%>"/>
		<!-- <input type="submit"> -->
		<script>
			document.getElementById("submit_button").onclick = function() {
			    //disable
																									
	   
  
	  
				  
			    validateFields();
			    this.disabled = true;
	
			    //do some validation stuff
			}
		</script>
	</body>
</html>
