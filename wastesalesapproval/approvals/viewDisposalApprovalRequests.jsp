<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>

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
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
	</style>	
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>		
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
	
	$('.charLen').each(function () {
        $(this).maxlength({alwaysShow: true});	
	});

	$('.text').wysihtml5({
			"image": false,
			"link": false
		});

	$('.text').data('wysihtml5').editor.composer.disable();
	
	});
	</script>


	</head>

<%@ include file="../common/date.jsp" %>
<%@ include file="../common/disposalHeaderDetailsConfig.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");		

		String requestId = (String)request.getParameter("requestId");
		String changeStatus = (String)request.getParameter("stat");
		String documentOId = (String)request.getParameter("docId");
		String compAttachmentName="";
		String addAttachmentName="";
		//out.println("documentOId----"+documentOId);

		Hashtable statusImg = new Hashtable( );
		statusImg.put("D",  "../images/draft.png");
		statusImg.put("I",  "../images/inProcess.png");
		//statusImg.put("A",  "../images/half_process.png");
		statusImg.put("R",  "../images/review.png");
		statusImg.put("A",  "../images/approved.png");
		statusImg.put("CL",  "../images/approved.png");

		ArrayList headerList = new ArrayList();
		ArrayList approvalList = new ArrayList();
    	ArrayList detailsList = new ArrayList();
		ArrayList locationList			= new ArrayList();
		ArrayList unitsList			= new ArrayList();
		ArrayList proposedEmailidList	= new ArrayList();
		ArrayList emailidList	= new ArrayList();

		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approvalHash = new Hashtable();


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
		String valueOfMaterial 			= "";
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
		String vatNtds			= "";
		//String changeStatus			= "";
		int detailTabSize = 0;
		int len = 0;
		int counter = 1;
		int lenCount = len-1;
		String temp = "";
		String totalVOMValue = "";



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
			disposalProposedBy	= strArr[11];
			disposalApprovedBy	= strArr[12];
			totalValue			= strArr[13];
			comments			= strArr[14];
			detailTabSize		= Integer.parseInt(strArr[17]);
			vatNtds 			= (strArr[18]==null ||strArr[18]=="")?"":strArr[18] ;
			totalVOMValue 			= strArr[19];
			//changeStatus		= strArr[18];

			//totalValue start
			lenCount = len-1;
			counter = 1;
			temp= "";
			if(totalValue.contains(","))
			{
				totalValue =totalValue;

			}else
			{

			if(totalValue.contains("."))
			{
				String[] parts  = totalValue.split("\\.");
				String part1    = parts[0];
				//String part2    = parts[1];
				totalValue = part1;
				len = totalValue.length();

				lenCount = len-1;

				if(len>3)
				{
					while(lenCount>=0)
					{
						if((counter>3) && (counter%2==0))
							{
								temp = temp + ",";
							}
						
						temp = temp + totalValue.charAt(lenCount);
						
						lenCount--;
						counter++;
					}
					temp =  new StringBuffer(temp).reverse().toString();

					totalValue = temp;
				 }
					totalValue +="."+parts[1];

					totalValue = totalValue.substring(0,totalValue.length() - 3);

				}  else
				{
					len = totalValue.length();
						
					lenCount = len-1;

					counter = 1;

					if(len>3)
					{
						while(lenCount>=0)
						{
							if((counter>3) && (counter%2==0))
								{
									temp = temp + ",";
								}
							
							temp = temp + totalValue.charAt(lenCount);
							
							lenCount--;
							counter++;
						}
						temp =  new StringBuffer(temp).reverse().toString();
				   
						totalValue = temp;
						
					}
				}
			    } //totalValue end 

				//totalVOMValue start
			lenCount = len-1;
			counter = 1;
			temp= "";
			if(totalVOMValue.contains(","))
			{
				totalVOMValue =totalVOMValue;

			}else
			{

			if(totalVOMValue.contains("."))
			{
				String[] parts  = totalVOMValue.split("\\.");
				String part1    = parts[0];
				//String part2    = parts[1];
				totalVOMValue = part1;
				len = totalVOMValue.length();

				lenCount = len-1;

				if(len>3)
				{
					while(lenCount>=0)
					{
						if((counter>3) && (counter%2==0))
							{
								temp = temp + ",";
							}
						
						temp = temp + totalVOMValue.charAt(lenCount);
						
						lenCount--;
						counter++;
					}
					temp =  new StringBuffer(temp).reverse().toString();

					totalVOMValue = temp;
				 }
					totalVOMValue +="."+parts[1];

					totalVOMValue = totalVOMValue.substring(0,totalVOMValue.length() - 3);

				}  else
				{
					len = totalVOMValue.length();
						
					lenCount = len-1;

					counter = 1;

					if(len>3)
					{
						while(lenCount>=0)
						{
							if((counter>3) && (counter%2==0))
								{
									temp = temp + ",";
								}
							
							temp = temp + totalVOMValue.charAt(lenCount);
							
							lenCount--;
							counter++;
						}
						temp =  new StringBuffer(temp).reverse().toString();
				   
						totalVOMValue = temp;
						
					}
				}
			} //totalValue end*/

		}

		session.setAttribute("requestId",requestId);
		session.setAttribute("userEmailId",createdby);
		session.setAttribute("changeStatus",changeStatus);
	

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

		String dispPropsed_Approved = "";
	
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

		unitsList				= wasteSalesDetailsController.getUnits();


		String popupLocation = "";
		String popupProposedByEmailId = "";
		String popupDisposalApprovedEmailId = "";
		String popupUnit = "";

				

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
			dispPropsed_Approved="display:none";
		}



%>
<body onload = "showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>');" >
<form class="form-horizontal" role="form"  id="fixedasset_form"  name="viewDisposal"   method="post">
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-1"></div>
		<div class="col-xs-10">
<%		if("A".equals(changeStatus) || "CL".equals(changeStatus))
		{
%>
		<div class="row" style="margin-bottom:2px;"><button type="button"  value="Print" name="printButton" id="printButton" class="btn btn-danger  pull-right" onclick = "javascript:window.print();"><i class="fa fa-print"></i> Print</button></div>
<%
		}	
		
%>
			<div class="portlet box blue">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i> View Waste/Fixed Asset Disposal Approval 
			</div>			
			</div>
				<div class="portlet-body">
					<div class="row " >
						<table>									
							<tr>																									 									
								<td  style="text-align:center ">
								<p>
									 LEGEND : <img src="../images/draft.png"> : Draft | <img src="../images/inProcess.png"> : In Process | <img src="../images/half_process.png"> : Pending for approval | <img src="../images/approved.png"> : Approved | <img src="../images/review.png"> : In Review
								</p>  
								</td>																	
							</tr>									
						</table>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
					</div>
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
									</span><input type="text" class="form-control " readonly name="disposalType" id="disposalType" value="<%=disposalType%>" />									
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
									</span><input type="text" class="form-control " readonly name="disposalName" id="disposalName" value="<%=disposalName%>" />
									
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
									</span><input type="text" class="form-control " readonly name="createdByEmailid" id="createdByEmailid" value="<%=createdby%>" />
									
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
									 <input type="text" class="form-control charLen " readonly name="location1" id="location1" maxlength = "100" placeholder="Enter Location" onkeyup="lookupAll(this.value,'myLocSuggestions','myLocSuggestionsList','loc');" value="<%=location%>"/>
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

					<div class="row ">	
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Proposed By : </label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon" >
										<i class="fa fa-pencil-square-o"></i>
									</span>
									<input type="text" class="form-control charLen "  name="dispProposedBy" id="dispProposedBy" maxlength = "100" placeholder="Enter Emailid" readonly onkeyup="lookupAll(this.value,'mySuggestions','myAutoSuggestionsList','email');" value="<%=disposalProposedBy%>"/>			
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
									<input type="text" class="form-control charLen " readonly name="dispApprovedBy" id="dispApprovedBy" maxlength = "100" placeholder="Enter Emailid" onkeyup="lookupAll(this.value,'mySuggestions1','myAutoSuggestionsList1','dept');" value="<%=disposalApprovedBy%>"/>
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
					<div class="table-responsive ">
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="info">
									<th class="text-center" width="5%">
										Sr.<br>No.
									</th>
									<th class="text-center" width="18%">
										Description 
									</th>
									<th class="text-center" width="5%">
										Qty
									</th>
									<th class="text-center" width="5%">
										UOM
									</th>
									<th class="text-center" width="15%">
										Value Of Material<br>(Rs/UOM)
									</th>
									<th class="text-center" width="15%">
										Final Negotiated Amt.<br>(Rs/UOM)
									</th>
									<th class="text-center" width="16%">
										Final Highest Bidder
									</th>
									<th class="text-center" width="18%">
										Comments
									</th>
								</tr>
							</thead>
							<tfoot>
								<tr class="success">
									<td></td>
									<td>TOTAL VALUE</td>
									<td></td>
									<td></td>
									<td><input type="text" class="form-control text-right" name="totalVOMValue" id="totalVOMValue" value="<%=totalVOMValue%>" readonly /></td>
									<td class="text-right"><input type="text" class="form-control text-right" name="totalValue" id="totalValue" value="<%=totalValue%>" readonly /></td>
									<td></td>
									<td width="16%"><input type="text" class="form-control" name="vatNtds" id="vatNtds" value="<%=vatNtds%>" readonly /></td>
								</tr>
							  </tfoot>
							<tbody>	
<%
								for(int i =0; i<countDet; i++)
								{
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

									len = 0;
									counter = 1;
									lenCount = len-1;
									temp = "";

									if(valueOfMaterialVal.contains(","))
									{
										valueOfMaterialVal =valueOfMaterialVal;

									}else
									{

									if(valueOfMaterialVal.contains("."))
									{
										String[] parts  = valueOfMaterialVal.split("\\.");
										String part1    = parts[0];
										//String part2    = parts[1];
										valueOfMaterialVal = part1;
										len = valueOfMaterialVal.length();

										lenCount = len-1;


										if(len>3)
										{
											while(lenCount>=0)
											{
												if((counter>3) && (counter%2==0))
													{
														temp = temp + ",";
													}
												
												temp = temp + valueOfMaterialVal.charAt(lenCount);
												
												lenCount--;
												counter++;
											}
											temp =  new StringBuffer(temp).reverse().toString();

											valueOfMaterialVal = temp;
										 }
											valueOfMaterialVal +="."+parts[1];
										}  else
										{
											len = valueOfMaterialVal.length();
												
											lenCount = len-1;

											counter = 1;

											if(len>3)
											{
												while(lenCount>=0)
												{
													if((counter>3) && (counter%2==0))
														{
															temp = temp + ",";
														}
													
													temp = temp + valueOfMaterialVal.charAt(lenCount);
													
													lenCount--;
													counter++;
												}
												temp =  new StringBuffer(temp).reverse().toString();
										   
												valueOfMaterialVal = temp;
												
											}
										}
									} //valueOfMaterialVal end


									if(finalNegAmt.contains(";")){
										finalNegAmtArray  = finalNegAmt.split(";");
										finalNegAmtVal = finalNegAmtArray[i];
									}else{
										finalNegAmtVal= finalNegAmt;
									}

									//finalNegAmtVal start
									lenCount = len-1;
									counter = 1;
									temp= "";

									if(finalNegAmtVal.contains(","))
									{
									}else
									{

									if(finalNegAmtVal.contains("."))
									{
										String[] parts  = finalNegAmtVal.split("\\.");
										String part1    = parts[0];
										//String part2    = parts[1];
										finalNegAmtVal = part1;
										len = finalNegAmtVal.length();

										lenCount = len-1;

										if(len>3)
										{
											while(lenCount>=0)
											{
												if((counter>3) && (counter%2==0))
													{
														temp = temp + ",";
													}
												
												temp = temp + finalNegAmtVal.charAt(lenCount);
												
												lenCount--;
												counter++;
											}
											temp =  new StringBuffer(temp).reverse().toString();

											finalNegAmtVal = temp;
										 }
											finalNegAmtVal +="."+parts[1];
										}  else
										{
											len = finalNegAmtVal.length();
												
											lenCount = len-1;

											counter = 1;

											if(len>3)
											{
												while(lenCount>=0)
												{
													if((counter>3) && (counter%2==0))
														{
															temp = temp + ",";
														}
													
													temp = temp + finalNegAmtVal.charAt(lenCount);
													
													lenCount--;
													counter++;
												}
												temp =  new StringBuffer(temp).reverse().toString();
										   
												finalNegAmtVal = temp;
												
											}
										}
									} //finalNegAmtVal end


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
									

									for(int jj=0; jj< unitsList.size(); jj++)
									{
										String tmpArr[] = (String[])unitsList.get(jj);	
										
										if(uomsVal.equals(tmpArr[1]))
										{
											popupUnit += "<option value='"+tmpArr[1]+"' selected>"+tmpArr[1]+"</option>"; 
											
										}/*else
										{
											popupUnit += "<option value='"+tmpArr[1]+"'>"+tmpArr[1]+"</option>";     
										}*/

									}

%>
								<tr class="active">
									<td>
									<%=i+1%>
									</td>
									<td>
										<!-- <div class="form-group  " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control" name="desc<%//=i%>" id="desc<%//=i%>" value="<%//=descVal%>"placeholder="Description" readonly></div> --><%=descVal%>
									</td>
									<td>
										<!-- <div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="quantity<%//=i%>" id="quantity<%//=i%>" value="<%//=quantityVal%>" placeholder="Qty" readonly></div> --><%=quantityVal%>
									</td>
									<td >
										<!-- <select class="form-control " name="uom<%=i%>" id="uom<%=i%>"  style="padding-right:2px;" readonly>
										<option value = "<%=uomsVal%>"><%=uomsVal%></option>
										</select> --><%=uomsVal%>

									</td>
									<td class="text-right">
										<!-- <div class="form-group" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right" name="valueOfMaterials<%//=i%>" id="valueOfMaterials<%//=i%>" value="<%//=valueOfMaterialVal%>" placeholder="" readonly></div> --><%=valueOfMaterialVal%>
									</td>
									<td class="text-right ">
										<!-- <div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalNegotiatedAmt<%//=i%>" id="finalNegotiatedAmt<%//=i%>"  value="<%=finalNegAmtVal%>"  placeholder=" " readonly></div> --><%=finalNegAmtVal%>
									</td>
									<td>
										<!-- <div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control " name="finalHighestBidder<%//=i%>" id="finalHighestBidder<%//=i%>" value="<%//=finalHighBidheaderVal%>"  placeholder="" readonly></div> --><%=finalHighBidheaderVal%>
									</td>
									<td>
										<!-- <textarea class="form-control noresize textarea " rows="2" name="comments<%//=i%>" maxlength="255" id="comments<%//=i%>" rel="tooltip"   placeholder="Remarks" readonly><%//=commentsDetailsVal%></textarea> --><%=commentsDetailsVal%>
									</td>
								</tr>

								<input type="hidden" name="desc<%=i%>" id="desc<%=i%>" value="<%=descVal%>">
								<input type="hidden" name="quantity<%=i%>" id="quantity<%=i%>" value="<%=quantityVal%>">
								<input type="hidden" name="uom<%=i%>" id="uom<%=i%>" value="<%=uomsVal%>">
								<input type="hidden" name="valueOfMaterials<%=i%>" id="valueOfMaterials<%=i%>" value="<%=valueOfMaterialVal%>">
								<input type="hidden" name="finalNegotiatedAmt<%=i%>" id="finalNegotiatedAmt<%=i%>" value="<%=finalNegAmtVal%>">
								<input type="hidden" name="finalHighestBidder<%=i%>" id="finalHighestBidder<%=i%>" value="<%=finalHighBidheaderVal%>">
								<input type="hidden" name="comments<%=i%>" id="comments<%=i%>" value="<%=commentsDetailsVal%>">
											
<%
								}
%>								<input type="hidden" name="tabSize" id="tabSize" value = "<%=countDet%>">
								<tr id='addr<%=countDet%>'></tr>
								
							</tbody>				
						</table>
							
									
					</div>
					</div>
					
					<div class="row " style="margin-top:8px;">
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td width="10%">
									Comments
									</td>
									<td>
									<div class="col-sm-12 col-lg-12 ">
										<!-- <textarea class="form-control noresize  text" rows="3"  maxlength='4000' id="userTextComments" name="userTextComments" rel="tooltip" disabled ><%//=comments%></textarea> -->
										<%=comments%>
										<input type="hidden" name="userTextComments" id="userTextComments" value="<%=comments%>"   />
										
										<h6 class="pull-right" id="count_message"></h6>
									</div>
									
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
										<!-- <tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentDisposalFile('<%//=compAttachmentName%>','<%//=requestId%>');" > <img src="../images/attachment.png" border="0" /></a> </td>	
										</tr> -->	
										<tr>
											<td colspan="2"  id="attachment"></td>	<!-- <input type="text" name="hiddDirectorySizecompulsary" id="hiddDirectorySizecompulsary" value="0"> -->
											
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
										<!-- <tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentDisposalFile('<%//=addAttachmentName%>','<%//=requestId%>');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr> -->	
										<tr>
											<td colspan="2"  id="attachment1"></td><!-- <input type="text" name="hiddDirectorySizeadditional" id="hiddDirectorySizeadditional" value="0">	 -->
											
										</tr>
									</tbody>			
								</table>
							</div>
						</div>
 					
					<div class="row clearfix">
 					<h5 style="font-weight:bold;">Approvals : </h5><hr style="margin-top:0;margin-bottom:8px;">
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

							if(approvalList.size() > 0)
							{
								a= approvalList.size();
									
								for (int q=0; q<approvalList.size(); q++)
								{
									String strAppArr[] = (String[])approvalList.get(q);
%>
									<tr id='addr2<%=q%>'>
										<td class="text-center">
										<%=q+1%>
										</td>
										<td>
										</select>
										<input type="text" class="form-control charLen "  name="userDeptHead<%=q%>" id="userDeptHead<%=q%>" maxlength = "100" readonly placeholder="Enter Email Id" value= "<%=strAppArr[3]%>" onkeyup="lookupAll2(this.value,'<%=q%>','<%=q%>','userEmail');" onfocus="showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>');"/>	
										<div class="suggestionsBox" id="suggestions<%=q%>" style="display:none;text-align:left;" class="form-control">
										<div class="suggestionList Breakword" id="autoSuggestionsList<%=q%>" style="padding-left:2px;text-align:left;">
										</div>
										</div>	
									</td>
								</tr>					
<%								}
							}
%>							</tbody>	
						</table>
							

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
						
							if(approvalList.size() > 0)
							{
								b=	approvalList.size();

								for (int r=0; r<approvalList.size(); r++)
								{
									String strAppArr[] = (String[])approvalList.get(r);
%>
									<tr id='addr3<%=r%>'>
										<td class="text-center">
										<%=r+1%>
										</td>
										<td>
										<input type="text" class="form-control charLen "  name="branchHead<%=r%>" id="branchHead<%=r%>" maxlength = "100" placeholder="Enter Email Id" readonly onkeyup="lookupAll3(this.value,'<%=r%>','<%=r%>','branchEmail');"  value="<%=strAppArr[3]%>"/>	
										<div class="suggestionsBox" id="suggestionsBNC<%=r%>" style="display:none;text-align:left;" class="form-control">
										<div class="suggestionList Breakword" id="autoSuggestionsBNCList<%=r%>" style="padding-left:2px;text-align:left;">
										</div>
										</div>	
									</td>
								</tr>		
<%
								}
							}
%>			
							</tbody>				
						</table>
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


							if(approvalList.size() > 0)
							{
								c= approvalList.size();
									
								for (int s=0; s<approvalList.size(); s++)
								{
									String strAppArr[] = (String[])approvalList.get(s);
%>
									<tr id='addr5<%=s%>'>
										<td class="text-center">
										<%=s+1%>
										</td>
										<td>
											<input type="text" class="form-control charLen "  name="supportedHead<%=s%>" id="supportedHead<%=s%>" maxlength = "100" readonly placeholder="Enter Email Id" onkeyup="lookupAll4(this.value,'<%=s%>','<%=s%>','supportEmail');" value="<%=strAppArr[3]%>"/>	
											<div class="suggestionsBox" id="suggestionsSupp<%=s%>" style="display:none;text-align:left;" class="form-control">
											<div class="suggestionList Breakword" id="autoSuggestionsSuppList<%=s%>" style="padding-left:2px;text-align:left;">
											</div>
											</div>	
									</td>
								</tr>		
<%
								}
							}
%>							</tbody>				
						</table>
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

							if(approvalList.size() > 0)
							{
								d =  approvalList.size();
								
								for (int t=0; t<approvalList.size(); t++)
								{
									String strAppArr[] = (String[])approvalList.get(t);
%>
									<tr id='addr7<%=t%>'>
										<td class="text-center">
										<%=t+1%>
										</td>
										<td>
										<input type="text" class="form-control charLen " readonly  name="approvedBy<%=t%>" id="approvedBy<%=t%>" maxlength = "100" placeholder="Enter Email Id" onkeyup="lookupAll5(this.value,'<%=t%>','<%=t%>','approveEmail');" value="<%=strAppArr[3]%>"/>	
										<div class="suggestionsBox" id="suggestionsAppr<%=t%>" style="display:none;text-align:left;" class="form-control">
										<div class="suggestionList Breakword" id="autoSuggestionsApprList<%=t%>" style="padding-left:2px;text-align:left;">
										</div>
										</div>
									</td>
								</tr>		
<%
								}
							}									
%>						</tbody>				
						</table>
							
						<input type="hidden" name="approvedBySize" id="approvedBySize" value="<%=d%>"  />
					</div>
					</div> 
<%					if("A".equals(changeStatus) || "CL".equals(changeStatus))
					{
%>
<%
					}else
					{
%>

					<div class="row clearfix">
					<h5 style="font-weight:bold;">Remarks : </h5><hr style="margin-top:0;margin-bottom:8px;">
 					<div class="col-xs-6  ">
						<table class="table table-bordered table-hover" >										
							<tbody>
								<tr >
									
									<td>
									<textarea  class="noresize form-control textarea" name ="remarks"  id ="remarks" rows="3" maxlength="50"></textarea>
									</td>
																	
								</tr>					
							</tbody>				
						</table>
							

					</div>
					</div>

<%
					}
				Hashtable logHash = new Hashtable();
				ArrayList logList = new ArrayList();

			
				logHash.put("REQUESTNO", requestId);
				//logHash.put("DOCUMENTOID", "DOC1002");
				logHash.put("DOCUMENTOID", documentOId);
				//logHash.put("STATUS", "R");
				logList = wasteSalesHeaderController.searchLog("ttw","fasdfar",logHash);
				int logSize = logList.size();

%>

					<div class="row clearfix">
					<h5 style="font-weight:bold;">Approval History : </h5><hr style="margin-top:0;margin-bottom:8px;">

					<div class="row"> 
					<div class="col-xs-12" >
						<table class="table table-bordered table-hover" id="">			
							<thead>
								<tr class="warning">
									<th class="text-center"  width="10%">
										Sr.No.
									</th>
									<th class="text-center" width="20%">
										Reference
									</th>
									<th class="text-center" width="15%">
										Approved By
									</th>
									<th class="text-center" width="15%">
										Approved On
									</th>
									<th class="text-center" width="20%">
										Remarks
									</th>
									<th class="text-center" width="10%">
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
								<td class="text-center" colspan="6" >No action details to be displayed.</td>																	
							</tr>															
						
<%
}else{
							for (int ll=0; ll<logList.size(); ll++)	{
							  String logArr[] = (String[])logList.get(ll);
%>
							<tr>
								<td class="text-center"><%=(ll+1)%></td>																	
								<td class="text-center"><%=logArr[2]%></td>																	
								<td class="text-center"><%=logArr[5]%></td>																	
								<td class="text-center"><%=logArr[6]%></td>																	
								<td class="text-center"><%=logArr[4]%></td>																	
								<!-- <td class="text-center"><%//="-".equals(logArr[4])?"No comments": logArr[4]%></td>	 -->										
								<td class="text-center"><img src="<%=statusImg.get(logArr[7])%>" border="0"></td>				
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

					
					<input type="hidden" name="frmStatus" id="frmStatus" value="" />
					<input type="hidden" name="createdby" id="createdby" value="<%=createdby%>" />	

					
					<div class="row ">
						<div class="col-xs-10">
							<div class="form-actions" style="margin-top:30px;">

<%							if("A".equals(changeStatus) || "CL".equals(changeStatus))
							{
%>
							<div class="col-xs-offset-7 col-xs-5">
								<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
								
								<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
								
							</div>
<%
							}else
							{
%>
								<div class="col-xs-offset-6 col-xs-6">
								<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
								<input type="button" class="btn btn-info" style="width:70px;" value="Submit" id = "actApprove" align="center" onclick="actApproval('A',this.id);">
								<input type="button" class="btn btn-danger" style="width:70px;" value="Review"  id = "actReview" align="center" onclick="actApproval('R',this.id);">
								<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
								
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
		for (var i = tabValSize; i < 8; i ++) {

	
			$('#addr'+i).html("<td>"+(parseInt(i)+1)+"</td> <td class='text-center'><div class='form-group ' style='margin-left:5px;margin-right:5px;'><input name='desc"+i+"' id='desc"+i+"' type='text' placeholder='Description' class='form-control '  /></div> </td><td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='quantity"+i+"' id='quantity"+i+"' type='text' placeholder='Qty' class='form-control text-right'  /></div> </td><td class='text-center'><div class='form-group' style='margin-left:5px;margin-right:5px;'><select name='uom"+i+"' id='uom"+i+"' placeholder='UOM' class='form-control' style='padding-right:2px;'><%=popupUnit%></select></div></td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='valueOfMaterials"+i+"' id='valueOfMaterials"+i+"' type='text' placeholder='' class='form-control text-right'  /> </div> </td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='finalNegotiatedAmt"+i+"' id='finalNegotiatedAmt"+i+"' type='text' placeholder='' class='form-control text-right' onblur='javascript:indexCal("+i+");'  /> </div></td> <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='finalHighestBidder"+i+"' id='finalHighestBidder"+i+"' type='text' placeholder='' class='form-control '  /></div> </td> <td><div class='form-group  ' style='margin-left:5px;margin-right:5px;'><textarea name='comments"+i+"' id='comments"+i+"' placeholder='Remarks' class='form-control noresize textarea' rows='2' maxlength='255' id='textarea' rel='tooltip' title=''/></textarea> </div></td> ");		
			$('#tab_logic').append('<tr id="addr'+(parseInt(i)+1)+'"></tr>');
			$("#add_row").hide();
			t = parseInt(i)+1;
			};
		//	alert("outside3 loop===="+i)
			$('#tabSize').val(t);
			
			$("[name^=quantity]").each(function () {
				$(this).rules("add", {
					required: true,
					pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
					messages: {
					pattern:  "Valid Format is : 0"
					}
				
				});	
			});

			$("[name^=valueOfMaterials]").each(function () {
			$(this).rules("add", {
				required: true,
				pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
				messages: {
				pattern:  "Valid Format is : 0"
					}
				
				});	
			});

			$("[name^=finalNegotiatedAmt]").each(function () {
			$(this).rules("add", {
				required: true,
				pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
				messages: {
				pattern:  "Valid Format is : 0.00"
					}
				});	
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
</html>
	