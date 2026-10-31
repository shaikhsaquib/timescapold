<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Waste Aprroval Process </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
	</style>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../js/util.js"></script>	
	<script src="../js/common.js"></script>	
	<script src="../jscript/wsCommon.js"></script>	
	<script src="../jscript/wasteSalesDisposal.js"></script>	

	
	<!-- <script type="text/javascript">
	onload=function(){
		var e=document.getElementById("refreshed");
		if(e.value=="no"){
			e.value="yes";
		}

		else{
			e.value="no";
			location.reload();
		}
	}
    </script> -->


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

<body onload = "showData('0'); onLoadFixedDetail('0');">
<form class="form-horizontal" role="form" id="fixedasset_form" name="frmCreateFixedAsset" method="post" enctype="multipart/form-data">
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-1"></div>
	<div class="col-xs-10 bs-example ">
	<div class="row">
		<div class="col-xs-8 col-xs-offset-2">
			<div class="form-group">
				<label class="control-label col-xs-4"><strong>Waste Sales Approvals Form:</strong></label>
				<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-bars"></i>
						</span>
						<select class="form-control" id="approvalsForm" name="approvalsForm" onchange ="javascript:showData('1');" placeholder="">
							<option value="0">Select Form</option>
							<option value="Process Waste Sales">Form1</option>
							<option value="Fixed Asset Disposals">Fixed Asset Disposals</option>
							<option value="One-off Miscellaneous">One-off Miscellaneous</option>
							<option value="Damaged Newsprint Disposals">Damaged Newsprint Disposals</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="showRequests"></div>	
	</div>
	<div class="col-xs-1"></div>
</div>
</form>
</body>
</html>
