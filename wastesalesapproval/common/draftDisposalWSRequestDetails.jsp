<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<!DOCTYPE html> 
<html lang="en">
  <head>
   <meta charset="utf-8">
 	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    
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
		@media print 
		{
			body {width:1200px;}
			div[class|=col-]{float:left;}
			.col-sm-6{width:50%}
		@page {
			size: 330mm 427mm;
			margin: 14mm;
		  }
		  .container {
			width: 1170px;
		  }
		   .prt
		  {
			 display:none;
		  }
		}
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

	
	<script>
	
	$(document).ready(function(){
		
		var tabValSize = $('#tabSize').val();
		if(tabValSize == 8)
		{
			$("#add_row").hide();
			
		}else
		{
			$("#add_row").show();

		}

	//	alert("tabValSize----"+tabValSize);


	});
	</script>

	<script>	
	$(document).ready(function(){	

	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});

	});
	</script>

	<script>
	
	$(document).ready(function(){	
	$(".js-example-basic-single").select2({ width: '100%'  });
	$('body').on('focus',".textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	$('.text').wysihtml5({
			"image": false,
			"link": false
		});
	
	$('.charLen').each(function () {
        $(this).maxlength({alwaysShow: true});	
	});

	$('body').on('focus',".datepicker", function(){
	$(this).datepicker({ dateFormat: 'dd-mm-yy',minDate:0   });		
	});	
	
	$("#fixedasset_form").validate({
	onkeyup: function (element, event) {
		if (event.which === 9 && this.elementValue(element) === "") {
			return;
		} else {
			this.element(element);
		}
	},
	highlight: function(element) {
		var id_attr = "#" + $( element ).attr("id") + "1";
		$(element).closest('.grp').removeClass('has-success').addClass('has-error');
		$(id_attr).removeClass('fa-check').addClass('fa-warning');         
	},
	unhighlight: function(element) {
		var id_attr = "#" + $( element ).attr("id") + "1";
		$(element).closest('.grp').removeClass('has-error').addClass('has-success');
		$(id_attr).removeClass('fa-warning').addClass('fa-check'); 
		
	},
	errorElement: 'span',
		errorClass: 'help-block',
		errorPlacement: function(error, element) {
			if(element.length) {
				error.insertAfter(element);
			} else {
			error.insertAfter(element);
			}
		} 
	});
	$("[name^=quantity]").each(function () {
        $(this).rules("add", {
            required: true,
			pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});

	/*$("[name^=valueOfMaterials]").each(function () {
        $(this).rules("add", {
            required: true,
			pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});*/

	$("[name^=finalNegotiatedAmt]").each(function () {
        $(this).rules("add", {
            required: true,
			pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});

	//$( function() {
		$('.two-digits').keyup(function(){
			if($(this).val().indexOf('.')!=-1){         
				if($(this).val().split(".")[1].length > 2){                
					if( isNaN( parseFloat( this.value ) ) ) return;
					this.value = parseFloat(this.value).toFixed(2);
				}  
			 }            
			 return this; //for chaining
		});
	//});

	$('.three-digits').keyup(function(){
			if($(this).val().indexOf('.')!=-1){         
				if($(this).val().split(".")[1].length > 3){                
					if( isNaN( parseFloat( this.value ) ) ) return;
					this.value = parseFloat(this.value).toFixed(3);
				}  
			 }            
			 return this; //for chaining
		});

	$('.only-num').keypress(function(event) {

		var val1  = this.value.split('.').length;

		var unicode = event.charCode ? event.charCode : event.keyCode;

		if((unicode == 46) && val1 > 1)
		{
			 return false;
		}

        // here i will get textbox contents and loop through it
        if ((unicode == 8) || (unicode == 9) || (unicode == 45) || (unicode == 46) || (unicode > 47 && unicode < 58) ) {
            return true;
        }
        else {
            return false;
        }

		/*if (((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57) || ((event.which == 46) && val1 > 1))) 
		{
			event.preventDefault();
		}*/
	});

	
	});
	</script>


	</head>

<%@ include file="../common/date.jsp" %>
<%@ include file="../common/disposalHeaderDetailsConfig.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");		

		String requestId = (String)request.getParameter("requestId");
		String documentOId = (String)request.getParameter("docId");

		String iboHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "IBO_HEAD");
		String fdHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "FUNCT_DIR");
		String exepHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "EXE_PRES");
		String masdHead = (String)EnvironmentProperties.getValue("wastesalesapprovals", "MAS_DIR");

	//	out.println("documentOId---"+documentOId);

		Hashtable statusImg = new Hashtable( );
		statusImg.put("D",  "../images/draft.png");
		statusImg.put("I",  "../images/inProcess.png");
		//statusImg.put("A",  "../images/half_process.png");
		statusImg.put("R",  "../images/review.png");
		statusImg.put("A",  "../images/approved.png");

		ArrayList headerList = new ArrayList();
		ArrayList approvalList = new ArrayList();
    	ArrayList detailsList = new ArrayList();
		ArrayList locationList			= new ArrayList();
		ArrayList proposedEmailidList	= new ArrayList();
		ArrayList emailidList	= new ArrayList();

		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approvalHash = new Hashtable();
	//	Hashtable locationHash				= new Hashtable();
		Hashtable emailHash				= new Hashtable();
		Hashtable emailHash1				= new Hashtable();

		headerHash.put("REQUESTOID", requestId);
		//headerHash.put("DOCUMENTOID", "DOC1002','DOC1003','DOC1004");
		headerHash.put("DOCUMENTOID", documentOId);
		headerHash.put("HEADERSECTION1", headerSection1);
		detailsHash.put("REQUESTOID", requestId);
		detailsHash.put("DETAILSECTION1", detailSection2);

		headerList = wasteSalesHeaderController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",headerHash);
		detailsList = wasteSalesDetailsController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		String formName 			= "frmDratfView";

		int countDet = 0;
		String countDetails 			= "";
		String desc 					= "";
		String quantity 				= "";
		String uoms 					= "";
		String valueOfMaterial 			= "NA";
		String finalNegAmt 				= "";
		String finalHighBidheader 		= "";
		String commentsDetails 			= "";

		for (int kk=0; kk<detailsList.size(); kk++)
		{
			String strDetailsArr[] = (String[])detailsList.get(kk);
			countDet = Integer.parseInt(strDetailsArr[2]);
			desc = strDetailsArr[3];
			quantity = strDetailsArr[4];
			uoms = strDetailsArr[5];
			valueOfMaterial = strDetailsArr[6];
			finalNegAmt = strDetailsArr[7];
			finalHighBidheader = strDetailsArr[8];
			commentsDetails = strDetailsArr[9];
		}




		String ApplicationName		= "";
		String statusType			= "";
		String documentstate		= "";
		String disposalType			= "";
		String disposalName			= "";
		String location				= "";
		String createdDate			= "";
		String disposalProposedBy	= "";
		String disposalApprovedBy	= "";
		String totalValue			= "";
		String comments				= "";
		String createdby			= "";
		String requestNo			= requestId;
		String actionText			= "";
		int detailTabSize = 0;
		String vatNtds				= "";
		String totalVOMValue				= "";


		for (int ii=0; ii<headerList.size(); ii++)
		{
			String strArr[] = (String[])headerList.get(ii);

			ApplicationName		= strArr[3];
			statusType			= strArr[4];
			createdby			= strArr[5];
			documentstate		= strArr[6];
			disposalType		= strArr[7];
			disposalName		= strArr[8];
			location			= strArr[9];
			createdDate			= strArr[10];
			disposalProposedBy	= "0".equals(strArr[11])?"":strArr[11];
			disposalApprovedBy	= "0".equals(strArr[12])?"":strArr[12];
			totalValue			= strArr[13];
			comments			= strArr[14];
			detailTabSize		= Integer.parseInt(strArr[17]);
			vatNtds 			= (strArr[18]==null ||strArr[18]=="")?"":strArr[18] ;
			totalVOMValue 		= strArr[19];;
		}
		
		if(totalValue.contains(","))
		{
			
			totalValue =totalValue.replaceAll(",", "");

		}

		if(totalVOMValue.contains(","))
		{
			
			totalVOMValue =totalVOMValue.replaceAll(",", "");

		}

		


		String srnoHeader = "srnoHeader";
		String desc1Header = "desc1Header";
		String quantityHeader = "quantityHeader";
		String UOMHeader = "UOMHeader";
		String valOfMatHeader = "valOfMatHeader";
		String finalNegAmtHeader = "finalNegAmtHeader";
		String finalHighBidHeader = "finalHighBidHeader";
		String commentsHeader = "commentsHeader";
		String userTimescapeuserOid="";
		String userSapnumber="";
		String userEmailid="";
	
		for(int t = 0; t <detailTabSize; t++)
		{
				desc1Header			= desc1Header+t;
				quantityHeader		= quantityHeader+t;
				UOMHeader			= UOMHeader+t;
				valOfMatHeader		= valOfMatHeader+t;
				finalNegAmtHeader	= finalNegAmtHeader+t;
				finalHighBidHeader	= finalHighBidHeader+t;
				commentsHeader		= commentsHeader+t;
		}

		approvalHash.put("WORKITEMOID", requestId);
		approvalHash.put("APPLICATIONNAME", "wastesalesapprovals");
		//approvalHash.put("DOCUMENTOID", "DOC1002");
		approvalHash.put("DOCUMENTOID", documentOId);

	//	locationHash.put("COMPANYCODE", companyCode);
	//	locationList				= wasteSalesHeaderController.listLocationsOnly(locationHash);

		emailHash.put("COMPANYCODE", companyCode);
		//emailHash.put("DEPTCODE", "1002");
	//	proposedEmailidList		= wasteSalesHeaderController.getEmailId(emailHash);

		emailHash1.put("COMPANYCODE", companyCode);
		emailHash1.put("DEPTCODE", "1002");
		emailidList		= wasteSalesHeaderController.getEmailId(emailHash1);

		String popupLocation = "";
		String popupProposedByEmailId = "";
		String popupDisposalApprovedEmailId = "";
		String popupUnit = "";

		

		String popupEmailId = "";
		
		for (int ii=0; ii<emailidList.size(); ii++) 
		{

			String emailidArr[] = (String[])emailidList.get(ii);

			popupEmailId += "<option value='"+emailidArr[0]+"|"+emailidArr[4]+"|"+emailidArr[6]+"'>"+emailidArr[6]+"</option>";             
        }

		String compAttachmentName="";
		String addAttachmentName="";
		String declenght ="two-digits";
		String dispPropsed_Approved = "";


		if("Fixed Asset Disposal".equals(disposalType))
		{
			compAttachmentName = "fixedassetcompulsory";
			addAttachmentName = "fixedassetadditional";

		}else if("One-off Miscellaneous".equals(disposalType))
		{
			compAttachmentName = "oneoffcompulsory";
			addAttachmentName = "oneoffadditional";

		}else if("Damaged Newsprint Disposal".equals(disposalType))
		{

			compAttachmentName = "damagedcompulsory";
			addAttachmentName = "damagedadditional";
			declenght ="three-digits ";
			dispPropsed_Approved="display:none";
		}

		session.setAttribute("userEmailId",createdby);
		session.setAttribute("status",statusType);
		session.setAttribute("requestId",requestId);


%>
<body onload = "showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>')" >
<form class="form-horizontal" role="form"  id="fixedasset_form" name = "frmDratfView"  method="post">
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-1"></div>
		<div class="col-xs-12">
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i> View Waste/Fixed Asset Disposal Approval 
			</div>			
			</div>
				<div class="portlet-body">
					<div class="row ">
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Request Id : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-th"></i>   
									</span><input type="text" class="form-control "  name="requestId" id="requestId"  value="<%=requestNo%>" readonly />
									
								</div>
							</div>
						</div>
						</div>
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Type of Disposal : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-bars"></i>
									</span><input type="text" class="form-control "  name="disposalType" id="disposalType" value="<%=disposalType%>"  readonly/>
									
								</div>
							</div>
						</div>
						</div>
						
					</div>
					
					<div class="row ">
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Approval Sought For Disposal Of : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-bars"></i>
									</span><input type="text" class="form-control charLen"  name="disposalName" id="disposalName" value="<%=disposalName%>" maxlength = "100"/>
									
								</div>
							</div>
						</div>
						</div>
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Created By : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-bars"></i>
									</span><input type="text" class="form-control "  name="createdByEmailid" id="createdByEmailid" value="<%=createdby%>" readonly/>
									
								</div>
							</div>
						</div>
						</div>
												
					</div>

			
					<div class="row ">
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Location : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-map-marker" style="width:11px;"></i>
									</span>									  							
									<input type="text" class="form-control charLen "  name="location1" id="location1" maxlength = "100" value= "<%=location%>" placeholder="Enter Location" onkeyup="lookupAll(this.value,'myLocSuggestions','myLocSuggestionsList','loc','location1');" />
								</div>
								<div class="suggestionsBox" id="myLocSuggestions" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="myLocSuggestionsList" style="padding-left:2px;text-align:left;">
									</div>
								</div>
							</div>
						</div>
						</div>

						<div class="col-xs-6 " >
						<div class="form-group">
							<label class="control-label col-xs-4">Date : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
									<input type="text" class="form-control datepicker "  name="createdDate" id="createdDate" value="<%=createdDate%>" disabled placeholder="Date" />
								</div>
							</div>
						</div>
						</div>
					</div>	

					<div class="row " id="dispProposedShow" style="<%=dispPropsed_Approved%>">	
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Proposed By : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon" >
										<i class="fa fa-pencil-square-o"></i>
									</span>									
									<input type="text" class="form-control charLen "  name="dispProposedBy" id="dispProposedBy" maxlength = "100" placeholder="Enter Email Id" value= "<%=disposalProposedBy%>" onkeyup="lookupAll(this.value,'mySuggestions','myAutoSuggestionsList','email','dispProposedBy');" />
								</div>
								<div class="suggestionsBox" id="mySuggestions" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="myAutoSuggestionsList" style="padding-left:2px;text-align:left;">
									</div>
								</div>
							</div>
						</div>
						</div>
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Approved By : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
									</span>									
									<input type="text" class="form-control charLen "  name="dispApprovedBy" id="dispApprovedBy" maxlength = "100" placeholder="Enter Emailid" value="<%=disposalApprovedBy%>" onkeyup="lookupAll(this.value,'mySuggestions1','myAutoSuggestionsList1','email','dispApprovedBy');" />						
								</div>
								<div class="suggestionsBox" id="mySuggestions1" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="myAutoSuggestionsList1" style="padding-left:2px;text-align:left;">
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
					<div class="row ">
					<h5 class="pull-right" style="font-weight:bold;">Rs. / kg. </h5>
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="info">
									<th class="text-center">
										Sr.<br>No.
									</th>
									<th class="text-center" width="18%">
										Description 
									</th>
									<th class="text-center" width="12%">
										Qty
									</th>
									<th class="text-center" width="8%">
										UOM
									</th>
									<th class="text-center" width="12%">
										Value Of Material<br>(Rs/UOM)
									</th>
									<th class="text-center" width="13%">
										Final Negotiated Amt.<br>(Rs/UOM)
									</th>
									<th class="text-center" width="15%">
										Final Highest Bidder
									</th>
									<th class="text-center" width="30%">
										Comments
									</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="success">
									<td></td>
									<td></td>
									<td></td>									
									<td>TOTAL VALUE</td>
									<td class="text-right"><input type="text" class="form-control text-right" name="totalVOMValue" id="totalVOMValue" value="<%=totalVOMValue%>" readonly /></td>
									<td class="text-right"><input type="text" class="form-control text-right" name="totalValue" id="totalValue" value="<%=totalValue%>" readonly /></td>
									<td></td>
									<td width="16%"><input type="text" class="form-control" name="vatNtds" id="vatNtds" value="<%=vatNtds%>"  /></td>
								</tr>
							  </tfoot>
							<tbody>	

							
<%
								for(int i =0; i<countDet; i++)
								{
									
									ArrayList unitsList			= new ArrayList();

									String[] descArray = null;
									String[] quantityArray = null;
									String[] uomsArray = null;
									String[] valueOfMaterialArray = null;
									String[] finalNegAmtArray = null;
									String[] finalHighBidheaderArray = null;
									String[] commentsDetailsArray = null;

									String descVal="";
									String quantityVal="";
									String uomsVal="";
									String valueOfMaterialVal="";
									String finalNegAmtVal="";
									String finalHighBidheaderVal="";
									String commentsDetailsVal="";
									popupUnit = "";

									if(desc.contains(";")){
										descArray  = desc.split(";");
										descVal = descArray[i];
									}else{
										descVal= desc;
									}

									if(quantity.contains(";")){
										quantityArray  = quantity.split(";");
										quantityVal = quantityArray[i];
									}else{
										quantityVal= quantity;
									}

									if(uoms.contains(";")){
										uomsArray  = uoms.split(";");
										uomsVal = uomsArray[i];
									}else{
										uomsVal= uoms;
									}

									if(valueOfMaterial.contains(";")){
										valueOfMaterialArray  = valueOfMaterial.split(";");
										valueOfMaterialVal = valueOfMaterialArray[i];
									}else{
										valueOfMaterialVal= valueOfMaterial;
									}

									if(valueOfMaterialVal.contains(","))
									{
										
										valueOfMaterialVal =valueOfMaterialVal.replaceAll(",", "");

									}


									if(finalNegAmt.contains(";")){
										finalNegAmtArray  = finalNegAmt.split(";");
										finalNegAmtVal = finalNegAmtArray[i];
									}else{
										finalNegAmtVal= finalNegAmt;
									}

									if(finalNegAmtVal.contains(","))
									{
										
										finalNegAmtVal =finalNegAmtVal.replaceAll(",", "");

									}

									if(finalHighBidheader.contains(";")){
										finalHighBidheaderArray  = finalHighBidheader.split(";");
										finalHighBidheaderVal = finalHighBidheaderArray[i];
									}else{
										finalHighBidheaderVal= finalHighBidheader;
									}

									if(commentsDetails.contains(";")){
										commentsDetailsArray  = commentsDetails.split(";");
										commentsDetailsVal = commentsDetailsArray[i];
									}else{
										commentsDetailsVal= commentsDetails;
									}

									unitsList				= wasteSalesDetailsController.getUnits();
									for(int jj=0; jj< unitsList.size(); jj++)
									{
										String tmpArr[] = (String[])unitsList.get(jj);	
										
										if(uomsVal.equals(tmpArr[1]))
										{
											popupUnit += "<option value='"+tmpArr[1]+"' selected>"+tmpArr[1]+"</option>"; 
											
										}else
										{
											popupUnit += "<option value='"+tmpArr[1]+"'>"+tmpArr[1]+"</option>";     
										}

									}


%>
								<tr id='addr<%=i%>'>
									<td>
									<%=i+1%>
									</td>
									<td class="text-center ">
										<div class="form-group  " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control charLen" name="desc<%=i%>" id="desc<%=i%>"  maxlength = "100" value="<%=descVal%>"placeholder="Description"></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right <%=declenght%> only-num charLen" name="quantity<%=i%>" id="quantity<%=i%>"  value="<%=quantityVal%>" maxlength = "10" placeholder="Qty" ></div>
									</td>
									<td class="text-center ">
										
										<select class="form-control " name="uom<%=i%>" id="uom<%=i%>"  style="padding-right:2px;" >
										<option value='0'>Select UOM</option><%=popupUnit%>
										</select>

									</td>
									<td class="text-center grp has-feedback">
										<div class="form-group" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right two-digits only-num charLen" name="valueOfMaterials<%=i%>" id="valueOfMaterials<%=i%>" value="<%=valueOfMaterialVal%>" onblur="javascript:indexCal(<%=i%>);" maxlength = "10" placeholder=""></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right two-digits only-num charLen" name="finalNegotiatedAmt<%=i%>" id="finalNegotiatedAmt<%=i%>"  value="<%=finalNegAmtVal%>" onblur="javascript:indexCal(<%=i%>);" maxlength = "10" placeholder=" "></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;"><!-- <input type="text" class="form-control charLen" name="finalHighestBidder<%=i%>" id="finalHighestBidder<%=i%>" value="<%=finalHighBidheaderVal%>" maxlength = "100" placeholder=""> --><textarea class="form-control noresize textarea " rows="2" name="finalHighestBidder<%=i%>" maxlength="100" id="finalHighestBidder<%=i%>" rel="tooltip"  placeholder="final Highest Bidder" ><%=finalHighBidheaderVal%></textarea></div>
									</td>
									<td>
										<textarea class="form-control noresize textarea " rows="2" name="comments<%=i%>" maxlength="255" id="comments<%=i%>" rel="tooltip"   placeholder="Remarks" ><%=commentsDetailsVal%></textarea>
									</td>
								</tr>											
<%
								}
%>								<input type="hidden" name="tabSize" id="tabSize" value = "<%=countDet%>">
								<tr id='addr<%=countDet%>'></tr>
								
							</tbody>				
						</table>
							<a id='delete_row' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>	
									
					</div>
					
					<div class="row " style="margin-top:8px;">
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td width="10%">
									Comments
									</td>
									<td>								
										<textarea class="form-control noresize  text" rows="3" placeholder='Comments' maxlength='4000' id="userTextComments" name="userTextComments" rel="tooltip" ><%=comments%></textarea>										
										<h6 class="pull-right" id="count_message"></h6>
		
									</td>
								</tr>
							</tbody>
						</table>
					</div>

	
					<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Attachments</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " >
							<div class=" col-xs-6 " >
								<table class="table table-bordered table-hover" id="tab_logic7" >			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Compulsory Attachments
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentDisposalFile('<%=compAttachmentName%>','<%=requestId%>');" > <img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment"></td>											
										</tr>
									</tbody>				
								</table>
							</div>	
							<div class="col-xs-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Additional Attachments
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentDisposalFile('<%=addAttachmentName%>','<%=requestId%>');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td>
											
										</tr>
									</tbody>			
								</table>
							</div>
						</div>
					
					<input type="hidden"   name="iboHead" id="iboHead" value="<%=iboHead%>"  />	
					<input type="hidden"   name="fdHead" id="fdHead" value="<%=fdHead%>"  />	
					<input type="hidden"   name="exepHead" id="exepHead" value="<%=exepHead%>"  />	
					<input type="hidden"   name="masdHead" id="masdHead" value="<%=masdHead%>"  />	

 					
					<div class="row clearfix">
 					<h5 style="font-weight:bold;">Approvals:</h5><hr style="margin-top:0;margin-bottom:8px;">
					<div class="col-xs-6  ">
						<table class="table table-bordered table-hover" id="tab_logic2">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No..
									</th>
									<th class="text-center">
										User Department
									</th>						
								</tr>
							</thead>
							<tbody>
<%
							actionText = "UserDepartmentHead";
							approvalHash.put("ACTIONTEXT", actionText);
							approvalList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approvalHash);
							int a = 0;		

							if(approvalList.size() > 0){
								a = approvalList.size();									
								for (int q=0; q < a; q++){
									String strAppArr[] = (String[])approvalList.get(q);									
%>
									<tr id='addr2<%=q%>'>
										<td class="text-center">
										<%=q+1%>
										</td>
										<td>										
									<input type="text" class="form-control charLen "  name="userDeptHead<%=q%>" id="userDeptHead<%=q%>" maxlength = "100" placeholder="Enter Email Id" value= "<%=strAppArr[3]%>" onkeyup="lookupAll2(this.value,'<%=q%>','<%=q%>','userEmail');" onfocus="showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>');"/>	
									<div class="suggestionsBox" id="suggestions<%=q%>" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsList<%=q%>" style="padding-left:2px;text-align:left;">
									</div>
									</div>									
									</td>																	
								</tr>		
<%
								}
							}else{
								a= 1;
%>									
								<tr id='addr20'>
									<td class="text-center">
									1
									</td>
									<td>									
									<input type="text" class="form-control charLen "  name="userDeptHead0" id="userDeptHead0" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll2(this.value,'0','0','userEmail');" onfocus="showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>');"/>	
									<div class="suggestionsBox" id="suggestions0" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsList0" style="padding-left:2px;text-align:left;">
									</div>
									</div>										
									</td>																
								</tr>										
<%
								}
%>
							<tr id='addr2<%=a%>'></tr>									
							</tbody>	
						</table>
							<a id='delete_row2' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:8px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>

					<input type="hidden" name="userDeptHeadSize" id="userDeptHeadSize" value="<%=a%>"   />
					</div>
					
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic3">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										B&C
									</th>									
								</tr>
							</thead>
							<tbody>
<%
							String actionText1 = "BnCBranchHead";
							String emailStr1 = "";
							approvalHash.put("ACTIONTEXT", actionText1);
							approvalList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approvalHash);
							int b = 0;						
							if(approvalList.size() > 0){
								b =	approvalList.size();
								for (int r=0; r < b; r++){
									String strAppArr[] = (String[])approvalList.get(r);									
%>
									<tr id='addr3<%=r%>'>
										<td class="text-center">
										<%=r+1%>
										</td>
										<td>										
									<input type="text" class="form-control charLen "  name="branchHead<%=r%>" id="branchHead<%=r%>" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll3(this.value,'<%=r%>','<%=r%>','branchEmail');"  value="<%=strAppArr[3]%>"/>	
									<div class="suggestionsBox" id="suggestionsBNC<%=r%>" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsBNCList<%=r%>" style="padding-left:2px;text-align:left;">
									</div>
									</div>	
									</td>
								</tr>		
<%
								}
							}else{	
								b= 1;
%>
								<tr id='addr30'>
										<td class="text-center">
										<%=b%>
										</td>
										<td>										
										<input type="text" class="form-control charLen "  name="branchHead0" id="branchHead0" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll3(this.value,'0','0','branchEmail');"  />	
										<div class="suggestionsBox" id="suggestionsBNC0" style="display:none;text-align:left;" class="form-control">
										<div class="suggestionList Breakword" id="autoSuggestionsBNCList0" style="padding-left:2px;text-align:left;">
										</div>
										</div>
										</td>																	
								</tr>
<%								
							}
%>											
								<tr id='addr3<%=b%>'></tr>									
							</tbody>				
						</table>
							<a id='delete_row3' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row3" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>						
						<input type="hidden" name="branchHeadSize" id="branchHeadSize" value="<%=b%>" />
					</div>

					</div>
					<div class="row clearfix">
					<div class="col-xs-6  ">
						<table class="table table-bordered table-hover" id="tab_logic5">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										MAS / Finance
									</th>									
								</tr>
							</thead>
							<tbody>
<%
							String actionText2 = "Support";
							approvalHash.put("ACTIONTEXT", actionText2);
							approvalList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approvalHash);
							int c = 0;
							if(approvalList.size() > 0){
								c = approvalList.size();									
								for (int s=0; s < c; s++){
									String strAppArr[] = (String[])approvalList.get(s);									
%>
									<tr id='addr5<%=s%>'>
										<td class="text-center">
										<%=s+1%>
										</td>
										<td>										
									<input type="text" class="form-control charLen "  name="supportedHead<%=s%>" id="supportedHead<%=s%>" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll4(this.value,'<%=s%>','<%=s%>','supportEmail');" value="<%=strAppArr[3]%>"/>	
									<div class="suggestionsBox" id="suggestionsSupp<%=s%>" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsSuppList<%=s%>" style="padding-left:2px;text-align:left;">
									</div>
									</div>									
									</td>
								</tr>		
<%
								}}else{
								c=1;
%>
								<tr id='addr50'>
									<td class="text-center">
									<%=c%>
									</td>
									<td>									
									<input type="text" class="form-control charLen "  name="supportedHead0" id="supportedHead0" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll4(this.value,'0','0','supportEmail');" />	
									<div class="suggestionsBox" id="suggestionsSupp0" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsSuppList0" style="padding-left:2px;text-align:left;">
									</div>
									</div>									
									</td>																	
								</tr>	
<%
							}
%>							<tr id='addr5<%=c%>'></tr>									
							</tbody>				
						</table>
							<a id='delete_row5' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row5" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>

						<input type="hidden" name="supportedHeadSize" id="supportedHeadSize" value="<%=c%>" />
					</div>					
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic7">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Approved by
									</th>									
								</tr>
							</thead>
							<tbody>
<%
							String actionText3 = "Approval";
							approvalHash.put("ACTIONTEXT", actionText3);
							approvalList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approvalHash);							
							int d = 0;
							if(approvalList.size() > 0){
								d =  approvalList.size();								
								for (int t=0;  t < d; t++)
								{
									String strAppArr[] = (String[])approvalList.get(t);									
%>
									<tr id='addr7<%=t%>'>
										<td class="text-center">
										<%=t+1%>
										</td>
										<td>
										
									<input type="text" class="form-control charLen "  name="approvedBy<%=t%>" id="approvedBy<%=t%>" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll5(this.value,'<%=t%>','<%=t%>','approveEmail');" value="<%=strAppArr[3]%>"/>	
									<div class="suggestionsBox" id="suggestionsAppr<%=t%>" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsApprList<%=t%>" style="padding-left:2px;text-align:left;">
									</div>
									</div>
									</td>
								</tr>		
<%
								}
							}else
							{
								d=1;
%>
								<tr id='addr70'>
									<td class="text-center">
									<%=d%>
									</td>
									<td>									
									<input type="text" class="form-control charLen "  name="approvedBy0" id="approvedBy0" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll5(this.value,'0','0','approveEmail');" />	
									<div class="suggestionsBox" id="suggestionsAppr0" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsApprList0" style="padding-left:2px;text-align:left;">
									</div>
									</div>
									</td>																	
								</tr>
<%
							}									
%>											
								<tr id='addr7<%=d%>'></tr>									
							</tbody>				
						</table>
							<a id='delete_row7' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row7" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						<input type="hidden" name="approvedBySize" id="approvedBySize" value="<%=d%>"  />
					</div>
					</div> 

<%
				Hashtable logHash = new Hashtable();
				ArrayList logList = new ArrayList();

			
				logHash.put("REQUESTNO", requestId);
				//logHash.put("DOCUMENTOID", "DOC1002");
				logHash.put("DOCUMENTOID", documentOId);
				//logHash.put("STATUS", "R");
				logList = wasteSalesHeaderController.searchLog("ttw","fasdfar",logHash);
				int logSize = logList.size();



					if("R".equals(statusType))
					{
%>
					<div class="row clearfix">
					<h5 style="font-weight:bold;">Approval History : </h5><hr style="margin-top:0;margin-bottom:8px;">

					<div class="row"> 
					<div class="col-xs-12" >
						<table class="table table-bordered table-hover" id="">			
							<thead>
								<tr class="warning">
									<th class="text-left"  width="10%">
										Sr.No.
									</th>
									<th class="text-left" width="20%">
										Reference
									</th>
									<th class="text-left" width="15%">
										Approved By
									</th>
									<th class="text-left" width="15%">
										Approved On
									</th>
									<th class="text-left" width="20%">
										Remarks
									</th>
									<th class="text-left" width="10%">
										Status
									</th>
								</tr>
							</thead>
							<tbody>
<%
						if(logSize == 0)	
						{
%>
							
							<tr>
								<td class="text-center" colspan="6" >No action details to be display.</td>																	
							</tr>															
						
<%
						}else{
							for (int ll=0; ll<logList.size(); ll++)	{
							  String logArr[] = (String[])logList.get(ll);
%>
							<tr>
								<td class="text-left"><%=(ll+1)%></td>																	
								<td class="text-left"><%=disposalName%></td>	<!-- logArr[2] -->																
								<td class="text-left"><%=logArr[5]%></td>																	
								<td class="text-left"><%=logArr[6]%></td>																	
								<td class="text-left"><%=logArr[4]%></td>																	
								<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->																
								<td class="text-left"><img src="<%=statusImg.get(logArr[7])%>" border="0"></td>																	
							</tr>	
<%
									}
							}
%>	
							</tbody>				
						</table>						
					</div>					
					</div>
					</div>

<%
					}			
		
%>					
					<input type="hidden" name="frmStatus" id="frmStatus" value="" />
					
					<div class="row ">
						<div class="col-xs-10">
							<div class="form-actions" style="margin-top:30px;">
<%
							if("R".equals(statusType))
							{
%>
							<div class="col-xs-offset-6 col-xs-6">
								<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
								<input type="button" class="btn btn-info" value="Submit" name="submitButton" height="20" onclick = "javascript:assetValidate('inProcess','<%=formName%>');"/>
								<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
								
							</div>


<%							}else
							{

%>
							<div class="col-xs-offset-6 col-xs-5">
								<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
								<input type="button" class="btn btn-info" value="Submit" name="submitButton" height="20" onclick = "javascript:assetValidate('inProcess','<%=formName%>');"/>
								<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
								<input type="button"  class="btn btn-warning"  value="Save As Draft" name="submitButton" id="saveDraft" height="20" onclick = "javascript:assetValidate('draft','<%=formName%>');"/>
							</div>

<%
							}	
%>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	<div class="col-xs-1"></div>
	</div>
	</div>
	</form>
</body>

<script>
	$(document).ready(function(){
 		$("#add_row").click(function(){
		var t=0;
		var tabValSize = $('#tabSize').val();
		var disposalName1 = $('#disposalType').val();
		var declenght;

		if(disposalName1 == "Damaged Newsprint Disposal")
		{
			declenght ="three-digits ";
		}else
			{
			declenght ="two-digits ";
		}

		for (var i = tabValSize; i < 8; i ++) {

	
			$('#addr'+i).html("<td>"+(parseInt(i)+1)+"</td> <td class='text-center'><div class='form-group ' style='margin-left:5px;margin-right:5px;'><input name='desc"+i+"' id='desc"+i+"' type='text' placeholder='Description' class='form-control charLen '  maxlength='100'  /></div> </td><td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='quantity"+i+"' id='quantity"+i+"' type='text' placeholder='Qty' class='form-control text-right "+declenght+" only-num charLen'   maxlength='10'/></div> </td><td class='text-center'><div class='form-group' style='margin-left:5px;margin-right:5px;'><select name='uom"+i+"' id='uom"+i+"' placeholder='UOM' class='form-control' style='padding-right:2px;'><%=popupUnit%></select></div></td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='valueOfMaterials"+i+"' id='valueOfMaterials"+i+"' type='text' placeholder='NA' class='form-control text-right two-digits only-num charLen' maxlength='10'   onblur='javascript:indexCal("+i+")' /> </div> </td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='finalNegotiatedAmt"+i+"' id='finalNegotiatedAmt"+i+"' type='text' placeholder='' class='form-control text-right two-digits only-num charLen' onblur='javascript:indexCal("+i+");'  maxlength='10' placeholder='NA' /> </div></td> <td class='text-center'><div class='form-group grp has-feedback charLen ' style='margin-left:5px;margin-right:5px;'><textarea name='finalHighestBidder"+i+"' id='finalHighestBidder"+i+"' placeholder='finalHighestBidder' class='form-control noresize textarea' rows='2' maxlength='100'  rel='tooltip' title=''/></textarea></div> </td> <td><div class='form-group  ' style='margin-left:5px;margin-right:5px;'><textarea name='comments"+i+"' id='comments"+i+"' placeholder='Remarks' class='form-control noresize textarea' rows='2' maxlength='255' rel='tooltip' title=''/></textarea> </div></td> ");		
			$('#tab_logic').append('<tr id="addr'+(parseInt(i)+1)+'"></tr>');
			$("#add_row").hide();
			t = parseInt(i)+1;
			};
		//	alert("outside3 loop===="+i)
			$('#tabSize').val(t);

			$('.charLen').each(function () {
				$(this).maxlength({alwaysShow: true});	
			});
			
			$("[name^=quantity]").each(function () {
				$(this).rules("add", {
					required: true,
					pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
					messages: {
					pattern:  "Valid Format is : 0.00"
					}
				
				});	
			});

			/*$("[name^=valueOfMaterials]").each(function () {
			$(this).rules("add", {
				required: true,
				pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
				messages: {
				pattern:  "Valid Format is : 0.00"
					}
				
				});	
			});*/

			$("[name^=finalNegotiatedAmt]").each(function () {
			$(this).rules("add", {
				required: true,
				pattern: /^(?:[1-9]\d*|0)?(?:\.\d+)?$/,
				messages: {
				pattern:  "Valid Format is : 0.00"
					}
				});	
			});

			//$( function() {
				$('.two-digits').keyup(function(){
					if($(this).val().indexOf('.')!=-1){         
						if($(this).val().split(".")[1].length > 2){                
							if( isNaN( parseFloat( this.value ) ) ) return;
							this.value = parseFloat(this.value).toFixed(2);
						}  
					 }            
					 return this; //for chaining
				});
			//});

			//$( function() {
				$('.three-digits').keyup(function(){
					if($(this).val().indexOf('.')!=-1){  
						alert("---"+$(this).val().split(".")[1].length);
						if($(this).val().split(".")[1].length > 3){                
							if( isNaN( parseFloat( this.value ) ) ) return;
							this.value = parseFloat(this.value).toFixed(3);
						}  
					 }            
					 return this; //for chaining
				});
			//});

			$('.only-num').keypress(function(event) {

				var val1  = this.value.split('.').length;
				var unicode = event.charCode ? event.charCode : event.keyCode;
				if((unicode == 46) && val1 > 1)
				{
					 return false;
				}
				// here i will get textbox contents and loop through it
				if ((unicode == 8) || (unicode == 9) || (unicode == 45) || (unicode == 46) || (unicode > 47 && unicode < 58) ) {
					return true;
				}
				else {
					return false;
				}

				/*if (((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57) || ((event.which == 46) && val1 > 1))) 
				{
					event.preventDefault();
				}*/
			});

	

		});

		$("#delete_row").click(function(){
			var val1 = $('#tabSize').val();
			var x = parseInt(val1);
						
			if(x>5){	
				//alert("inside delete loop===="+i)

				$("#addr"+(x-1)).html('');
				x--;

				$('#tabSize').val(x);

				
			}
			$("#add_row").show();
			
		});
});
</script>

<script>
	$(document).ready(function(){
      var j=1;
    $("#add_row2").click(function(){

		var userTabSize = $('#userDeptHeadSize').val();
		j = parseInt(userTabSize);

		$(".js-example-basic-single").select2({ width: '100%'  });		  

		$('#addr2'+j).html("<td class='text-center'>"+ (j+1) +"</td> <td><input type='text' class='form-control charLen'  name='userDeptHead"+j+"' id='userDeptHead"+j+"' maxlength = '100' placeholder='Enter Email Id' onkeyup=\"lookupAll2(this.value,'"+j+"','"+j+"','userEmail');\" /><div class='suggestionsBox' id='suggestions"+j+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsList"+j+"' style='padding-left:2px;text-align:left;'></div></div></td>");	
			
		$('#tab_logic2').append('<tr id="addr2'+(j+1)+'"></tr>');
		j++; 

		$('#userDeptHeadSize').val(j);
		$(".js-example-basic-single").select2({ width: '100%'  });
		
	});

	

    $("#delete_row2").click(function(){
		var userTabSize = $('#userDeptHeadSize').val();
		j = parseInt(userTabSize);
    	if(j>1){
			$("#addr2"+(j-1)).html('');
			j--;

			$('#userDeptHeadSize').val(j);
		}
	});
	});
	</script>

<script>
 
	/*$(document).ready(function(){		
		  var k=1;
		$("#add_row3").click(function(){
			var branchTabSize = $('#branchHeadSize').val();
			k = parseInt(branchTabSize);

			$('#addr3'+(k)).html("<td  class='text-center'>"+ (k+1) +"</td> <td><input type='text' class='form-control charLen'  name='branchHead"+k+"' id='branchHead"+k+"' maxlength = '100' placeholder='Enter Emailid' onkeyup=\"lookupAll3(this.value,'"+k+"','"+k+"','branchEmail');\" /><div class='suggestionsBox' id='suggestionsBNC"+k+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsBNCList"+k+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
			$('#tab_logic3').append('<tr id="addr3'+(k+1)+'"></tr>');
			k++; 
			$('#branchHeadSize').val(k);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row3").click(function(){
			var branchTabSize = $('#branchHeadSize').val();
			k = parseInt(branchTabSize);
			if(k>1){
				$("#addr3"+(k-1)).html('');
				k--;
				
				$('#branchHeadSize').val(k);
			}
		});
	});*/

	$(document).ready(function(){		
		  var k=1; 
		  var g=1;
		$("#add_row3").click(function(){
			var IBOHeadBranchEmailid = $('#iboHead').val();
			var FDHeadEmailid = $('#fdHead').val();
			//var totalValue = $('#totalValue').val();
			var totalValue;
			var actBranchHeadSize = $('#branchHeadSize').val();
			var disposalTypeFrm = $('#disposalType').val();

			if(disposalTypeFrm == "Fixed Asset Disposal" || disposalTypeFrm =="One-off Miscellaneous")
			{
				if(disposalTypeFrm == "Fixed Asset Disposal")
				{
					totalValue = $('#totalVOMValue').val();
				}else
				{
					totalValue = $('#totalValue').val();
				}
			
				if(totalValue > 0.00 && totalValue < 100000.00)
				{
					k = parseInt(actBranchHeadSize);
					//g=5;
					$('#addr3'+k).html("<td  class='text-center'>"+ (k+1) +"</td> <td><input type='text' class='form-control charLen'  name='branchHead"+k+"' id='branchHead"+k+"' maxlength = '100' placeholder='Enter Emailid' onkeyup=\"lookupAll3(this.value,'"+k+"','"+k+"','branchEmail');\" /><div class='suggestionsBox' id='suggestionsBNC"+k+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsBNCList"+k+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
					$('#tab_logic3').append('<tr id="addr3'+(k+1)+'"></tr>');
					k++; 
					$('#branchHeadSize').val(k);				
					$(".js-example-basic-single").select2({ width: '100%'  });

				}else
				{
				
					if(totalValue >= 100000.00 && totalValue < 2000000.00)
					{
						g ="3";
						$("#add_row3").hide();

					}else if(totalValue >= 2000000.00 && totalValue < 10000000.00)
					{
						$("#add_row3").hide();
						//g="4";
						g="3";
					}else if(totalValue >= 10000000.00)
					{
						$("#add_row3").hide();
						//g="4";
						g="3";

					}else
					{
						alert("Invalid");
					}

					if(actBranchHeadSize >1 && g>1)
					{
						for(m=g; m<actBranchHeadSize; m++)
						{
							$("#addr3"+(m)).html('');
							//$('#branchHeadSize').val(m+1);
						}
					}

					for(k=1;k<g;k++)
					{

						if(k==2)
						{
							emailidVal = IBOHeadBranchEmailid;
							readonlyVal = "readonly";

						}/*else if(k==3)
						{
							emailidVal = FDHeadEmailid;
							readonlyVal = "readonly";
						}*/
						else
						{
							emailidVal = "";
							readonlyVal = "";
						}
					
						$('#addr3'+k).html("<td  class='text-center'>"+ (k+1) +"</td> <td><input type='text' class='form-control charLen'  name='branchHead"+k+"' id='branchHead"+k+"' maxlength = '100' placeholder='Enter Emailid'  value = '"+emailidVal+"'  onkeyup=\"lookupAll3(this.value,'"+k+"','"+k+"','branchEmail');\" "+readonlyVal+"/><div class='suggestionsBox' id='suggestionsBNC"+k+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsBNCList"+k+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
						$('#tab_logic3').append('<tr id="addr3'+(k+1)+'"></tr>');
						//k++; 
						$('#branchHeadSize').val(k+1);					
						
					}
					$(".js-example-basic-single").select2({ width: '100%'  });
					
				}
			}else
			{
				
				$('#addr3'+k).html("<td  class='text-center'>"+ (k+1) +"</td> <td><input type='text' class='form-control charLen'  name='branchHead"+k+"' id='branchHead"+k+"' maxlength = '100' placeholder='Enter Emailid' onkeyup=\"lookupAll3(this.value,'"+k+"','"+k+"','branchEmail');\" /><div class='suggestionsBox' id='suggestionsBNC"+k+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsBNCList"+k+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
				$('#tab_logic3').append('<tr id="addr3'+(k+1)+'"></tr>');
				k++; 
				$('#branchHeadSize').val(k);
				$(".js-example-basic-single").select2({ width: '100%'  });

			}

		});
		$("#delete_row3").click(function(){
			if(k>1){
				$("#addr3"+(k-1)).html('');
				k--;
				
				$('#branchHeadSize').val(k);
				$("#add_row3").show();
			}
		});
	});
	</script>

	<script>
/*	$(document).ready(function(){		
		  var q=1;
		$("#add_row5").click(function(){

			var supportTabSize = $('#supportedHeadSize').val();
			q = parseInt(supportTabSize);

			$('#addr5'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td><input type='text' class='form-control charLen '  name='supportedHead"+q+"' id='supportedHead"+q+"' maxlength = '100' placeholder='Enter Email Id' onkeyup=\"lookupAll4(this.value,'"+q+"','"+q+"','supportEmail');\" /><div class='suggestionsBox' id='suggestionsSupp"+q+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsSuppList"+q+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
			$('#tab_logic5').append('<tr id="addr5'+(q+1)+'"></tr>');
			q++; 

			$('#supportedHeadSize').val(q);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row5").click(function(){
			var supportTabSize = $('#supportedHeadSize').val();
			q = parseInt(supportTabSize);

			if(q>1){
				$("#addr5"+(q-1)).html('');
				q--;

				$('#supportedHeadSize').val(q);
			}
		});
	});*/

	$(document).ready(function(){		
		  var q=1;
		$("#add_row5").click(function(){

			var masHeadBranchEmailid = $('#masdHead').val();
			var disposalTypeFrm = $('#disposalType').val();
			//var totalValue = $('#totalValue').val();
			var totalValue;
			var actSupportedHeadSize = $('#supportedHeadSize').val();

			
			if(disposalTypeFrm == "Fixed Asset Disposal")
			{
				totalValue = $('#totalVOMValue').val();
			}else
			{
				totalValue = $('#totalValue').val();
			}

			if(totalValue >= 10000000.00 && (disposalTypeFrm == "Fixed Asset Disposal" || disposalTypeFrm =="One-off Miscellaneous"))
			{
				h="3";

				$("#add_row5").hide();

				if(actSupportedHeadSize >1 && h>1)
				{
					for(n=h; n<actSupportedHeadSize; n++)
					{
						$("#addr5"+(n)).html('');
						//$('#branchHeadSize').val(m+1);
					}
				}

				for(q=1;q<h;q++)
				{

				    if(q==2)
					{
						masEmailidVal = masHeadBranchEmailid;

						readonlyVal = "readonly";

					}
					else
					{
						masEmailidVal = "";
						readonlyVal = "";
					}

					$('#addr5'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td><input type='text' class='form-control charLen '  name='supportedHead"+q+"' id='supportedHead"+q+"' value = '"+masEmailidVal+"' maxlength = '100' placeholder='Enter Email Id' onkeyup=\"lookupAll4(this.value,'"+q+"','"+q+"','supportEmail');\" "+readonlyVal+" /><div class='suggestionsBox' id='suggestionsSupp"+q+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsSuppList"+q+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
					$('#tab_logic5').append('<tr id="addr5'+(q+1)+'"></tr>');

					$('#supportedHeadSize').val(q+1);

				}

				$(".js-example-basic-single").select2({ width: '100%'  });

			}else
			{
				masEmailidVal = "";
				readonlyVal = "";
				//alert("actSupportedHeadSize---"+actSupportedHeadSize);
				q = parseInt(actSupportedHeadSize);	

				$('#addr5'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td><input type='text' class='form-control charLen '  name='supportedHead"+q+"' id='supportedHead"+q+"' maxlength = '100' value = '"+masEmailidVal+"' placeholder='Enter Email Id' onkeyup=\"lookupAll4(this.value,'"+q+"','"+q+"','supportEmail');\" /><div class='suggestionsBox' id='suggestionsSupp"+q+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsSuppList"+q+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
				$('#tab_logic5').append('<tr id="addr5'+(q+1)+'"></tr>');
				q++; 

				$('#supportedHeadSize').val(q);
				$(".js-example-basic-single").select2({ width: '100%'  });
			}

		});
		$("#delete_row5").click(function(){
			if(q>1){
				$("#addr5"+(q-1)).html('');
				q--;

				$('#supportedHeadSize').val(q);
				$("#add_row5").show();
			}
		});
	});
	</script>


	<script>
	$(document).ready(function(){		
		  var s=1;
		$("#add_row7").click(function(){

			var approvalTabSize = $('#approvedBySize').val();
			s = parseInt(approvalTabSize);

			$('#addr7'+s).html("<td  class='text-center'>"+ (s+1) +"</td> <td><input type='text' class='form-control charLen'  name='approvedBy"+s+"' id='approvedBy"+s+"' maxlength = '100' placeholder='Enter Email Id' onkeyup=\"lookupAll5(this.value,'"+s+"','"+s+"','approveEmail');\" /><div class='suggestionsBox' id='suggestionsAppr"+s+"' style='display:none;text-align:left;' class='form-control'><div class='suggestionList Breakword' id='autoSuggestionsApprList"+s+"' style='padding-left:2px;text-align:left;'></div></div></td>");		
			$('#tab_logic7').append('<tr id="addr7'+(s+1)+'"></tr>');
			s++;
			$('#approvedBySize').val(s);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row7").click(function(){

			var approvalTabSize = $('#approvedBySize').val();
			s = parseInt(approvalTabSize);
			if(s>1){
				$("#addr7"+(s-1)).html('');
				s--;
				$('#approvedBySize').val(s);
			}
		});
	});
	</script>



</html>
	