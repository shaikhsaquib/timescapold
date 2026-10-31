<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>


<!DOCTYPE html> 
<html lang="en">
  <head>
   <meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	
	 <!--<meta http-equiv="X-UA-Compatible" content="IE=9" /> -->
   
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title> Waste Approval Process </title>	 
	<!--[if lte IE 9]>
	<link href="../css/IE9.css" rel="stylesheet" type="text/css" type="text/css"/>
	<![endif]-->
	<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
</script>
<![endif]-->
	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet"/>
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet"/>
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />

	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
		.fa.fa-sig:after {
  position: absolute;
  content: "/";
  color: GREY;
  font-weight: 700;
  font-size: 1.2em;
  left: 7px;
  top: -1px;
  padding:0;
  margin:0;
}
	</style>	    
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../js/util.js" type="text/javascript"></script>
	<script src="../js/common.js" type="text/javascript"></script>
	<script src="../js/wasteSales.js"></script>	
	<script src="../js/jquery-migrate.min.js"></script>	



	<script>
	
	$(document).ready(function(){	

	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});

	});
	</script>
	</head>


<body onload = "onLoadDetail('0'); showFormDetails('0');">
<form class="form-horizontal"  id="demo_form"   name ="frmCreateWasteSalesProcess" method="post">
<%@ include file="../common/relatedLinks.jsp" %>
<%
		Hashtable locHash1 = new Hashtable();
		locHash1.put("DOCUMENTOID", "DOC1001");
        locHash1.put("EMAILID",emailId);
        locHash1.put("PROFILETEXT","PLANT HEAD");
		ArrayList locationAttributelist = wasteSalesDetailsController.listLocation(locHash1);

		String strLoc="";

		 for (int kk = 0; kk<locationAttributelist.size(); kk++)
		 {
				String locArray1[] = (String[]) locationAttributelist.get(kk);     
				
				 strLoc+="<option value=\""+locArray1[8]+"|"+locArray1[9]+"\" selected>"+locArray1[9]+"</option>";	
				
		   }

%>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-1"></div>
	<div class="col-xs-10 bs-example ">
	<div class="row">
		<div class="col-xs-6 col-xs-offset-2">
			<div class="form-group">
				<label class="control-label col-xs-4"><strong>Select Zone : </strong></label>
				<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-bars"></i>
						</span>
						<select class="form-control" id="asssignLoc" name="asssignLoc" onchange ="javascript:showFormDetails('1');" placeholder="">
							<option value="0">Select Zone</option>
							<%=strLoc%>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="showdata"></div>
	</div>
	<div class="col-xs-1"></div>
</div>
</form>
</body>
</html>
