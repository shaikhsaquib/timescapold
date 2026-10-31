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

<!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Fixed Asset Disposal Approval View</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	<script src="../jscript/wasteSalesDisposal.js"></script>	

	<script>
	$(document).ready(function(){
		
	// $(document).ready(function(){:
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

	$('body').on('focus',".datepicker", function(){
	$(this).datepicker({ dateFormat: 'dd-mm-yy',minDate:0   });		
	});	
	
	
	});
	</script>
	<style>
	
	@media print 
	{
		body {width:1200px;color:#000;}
		div[class|=col-]{float:left;}
		.col-sm-6{width:50%}
	@page {
		size: 330mm 427mm;
		margin: 14mm;
	  }
	  .container {
		width: 1170px;
	  }
		.table {
    border-collapse: collapse !important;
  }
	.table td,
	.table th {
	background-color: #fff !important;
	}
	.table-bordered th,
	.table-bordered td {
	border: 1px solid #000 !important;
	}
	.form-control{
		border: 1px solid #000 !important;
	}
	.input-group-addon {border: 1px solid #000 !important;}
	.portlet {
		background-color: #006699 !important;
	}
	  .prt
	  {
		  display:none;
	  }
	}
</style>

</head>

<%@ include file="../common/date.jsp" %>
<%@ include file="../common/disposalHeaderDetailsConfig.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");		

		String requestId = (String)request.getParameter("requestId");
		String documentOId = (String)request.getParameter("docId");

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
		int detailTabSize = 0;
		String vatNtds				= "";

		int len = 0;
		int counter = 1;
		int lenCount = len-1;
		String temp = "";
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
			disposalProposedBy	= strArr[11];
			disposalApprovedBy	= strArr[12];
			totalValue			= strArr[13];
			comments			= strArr[14];
			detailTabSize		= Integer.parseInt(strArr[17]);
			vatNtds 			= strArr[18];
			totalVOMValue 			= strArr[19];

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
		
		String srnoHeader = "srnoHeader";
		String desc1Header = "desc1Header";
		String quantityHeader = "quantityHeader";
		String UOMHeader = "UOMHeader";
		String valOfMatHeader = "valOfMatHeader";
		String finalNegAmtHeader = "finalNegAmtHeader";
		String finalHighBidHeader = "finalHighBidHeader";
		String commentsHeader = "commentsHeader";
	
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
		approvalList = docChangeLogController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",approvalHash);

		String compAttachmentName="";
		String addAttachmentName="";
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
			dispPropsed_Approved="display:none";
		}

		session.setAttribute("userEmailId",createdby);
		session.setAttribute("status",statusType);
		session.setAttribute("requestId",requestId);


//out.println("statusType-----"+statusType);

%>
<body onload = "showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>')" >
<form class="form-horizontal" role="form"   method="post">
<%@ include file="../common/relatedLinks.jsp" %>
	<div class="container well">
	<div class="row ">
	<div class="col-xs-1"></div>
		<div class="col-xs-10">
		<div class="row" style="margin-bottom:2px;"><button type="button"  value="Print" name="printButton" id="printButton" class="btn btn-danger  pull-right prt" onclick = "javascript:window.print();"><i class="fa fa-print"></i> Print</button></div>
			<div class="portlet box blue ">
			<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-th"></i> <!-- View Waste/Fixed Asset Disposal Approval  --><%=disposalType%> Request Details
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
									</span><input type="text" class="form-control "  readonly name="requestId" id="requestId"  value="<%=requestNo%>"  />
									
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
									</span><input type="text" class="form-control "  name="disposalName" id="disposalName" value="<%=disposalType%>" readonly/>
									
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
									</span><input type="text" class="form-control "  name="disposalType" id="disposalType" value="<%=disposalName%>" readonly/>
									
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
										<i class="fa fa-user"></i>
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
									<!-- <select class="form-control" id="location1" name="location1">
										<option value="0">Select Location</option>
										<option value="Pune">Pune</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahemdabad">Ahemdabad</option>
										<option value="Kolhapur">Kolhapur</option>
									</select> -->
									<input type="text" class="form-control "  name="location1" id="location1" value="<%=location%>" readonly/>

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
									<input type="text" class="form-control "  name="dispProposedBy" id="dispProposedBy" value="<%=disposalProposedBy%>" readonly/>

									
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
									<input type="text" class="form-control "  name="dispApprovedBy" id="dispApprovedBy" value="<%=disposalApprovedBy%>" readonly/>
									
									<!-- <input type="text" class="form-control" name="approved" id="approved" placeholder=""> -->
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
									<th class="text-center" width="5%" >
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
									<td width="16%"><input type="text" class="form-control " name="vatNtds" id="vatNtds" value="<%=vatNtds%>" readonly /></td>
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

									if(valueOfMaterial.contains(","))
									{
										valueOfMaterialVal = valueOfMaterialVal;

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
									}//valueOfMaterialVal end

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
										//finalNegAmtVal = valueOfMaterialVal;

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

%>
								<tr class="active">
									<td>
									&nbsp;<%=i+1%>
									</td>
									<td>
										<!-- <div class="form-group  " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control" name="desc<%//=i%>" id="desc<%//=i%>" value="<%//=descVal%>" readonly placeholder="Description"></div> --><%=descVal%>
									</td>
									<td>
										<!-- <div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="quantity<%//=i%>" id="quantity<%//=i%>" value="<%//=quantityVal%>" readonly placeholder="Qty" ></div> --><%=quantityVal%>
									</td>
									<td >
										
										<!-- <select class="form-control " name="uom<%//=i%>" id="uom<%//=i%>"  style="padding-right:2px;" readonly>
										<option><%//=uomsVal%></option>
										</select> --><%=uomsVal%>

									</td>
									<td class="text-right">
										<!-- <div class="form-group" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right" name="valueOfMaterials<%//=i%>" id="valueOfMaterials<%//=i%>" value="<%//=valueOfMaterialVal%>" readonly placeholder=""></div> --><%=valueOfMaterialVal%>
									</td>
									<td class="text-right ">
										<!-- <div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalNegotiatedAmt<%//=i%>" id="finalNegotiatedAmt<%//=i%>"  value="<%//=finalNegAmtVal%>" readonly placeholder=" "></div> --><%=finalNegAmtVal%>
									</td>
									<td >
										<!-- <div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control " name="finalHighestBidder<%//=i%>" id="finalHighestBidder<%//=i%>" value="<%//=finalHighBidheaderVal%>" readonly  placeholder=""></div> --><%=finalHighBidheaderVal%>
									</td>
									<td>
										<!-- <textarea class="form-control noresize textarea " rows="2" name="comments<%//=i%>" maxlength="255" id="comments<%//=i%>" rel="tooltip" readonly  placeholder="Remarks" ><%//=commentsDetailsVal%></textarea> --><%=commentsDetailsVal%>
									</td>
								</tr>
											
<%
								}
%>								
								<tr id='addr1'></tr>									
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
									<td> <%=comments%>
									
									<!-- 	<textarea class="form-control noresize  text"  id="userTextComments" name="userTextComments"  rows="3" maxlength='4000' rel="tooltip"  placeholder='Comments' readonly><%//=comments%></textarea> -->
										
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
							int a = 0;
							for (int jj=0; jj<approvalList.size(); jj++)
							{
								String strAppArr[] = (String[])approvalList.get(jj);
								
									if(strAppArr[2].contains("UserDepartmentHead"))
									{
%>
									<tr id='addr20'>
										<td class="text-center">
										<%=(a+1)%>
										</td>
										<td>										
										<input type="text" class="form-control "  readonly name="userDeptHead0" id="userDeptHead0"  value="<%=strAppArr[3]%>" onfocus="showFixedAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>','<%=compAttachmentName%>','<%=addAttachmentName%>');"  />	
										</td>																		
									</tr>	
<%
									a++;
								}
							}
%>
								<tr id='addr21'></tr>									
							</tbody>				
						</table>
					<input type="hidden" name="userDeptHeadSize" id="userDeptHeadSize" value="1" />
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
							int b=0;
							for (int q=0; q<approvalList.size(); q++)
							{
								String strAppArr[] = (String[])approvalList.get(q);
								
								if(strAppArr[2].contains("BnCBranchHead"))
									{										
%>
									<tr id='addr30'>
									<td class="text-center">
									<%=(b+1)%>
									</td>
									<td>									
									<input type="text" class="form-control "  readonly name="branchHead0" id="branchHead0"  value="<%=strAppArr[3]%>"  />					
<%
										b++;
									}
							}
%>								</td></tr>	
	
								<tr id='addr31'></tr>									
							</tbody>				
						</table>
							
						
						<input type="hidden" name="branchHeadSize" id="branchHeadSize" value="1" />
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
							int c = 0;
							for (int jj=0; jj<approvalList.size(); jj++)
							{
								String strAppArr[] = (String[])approvalList.get(jj);
								
									if(strAppArr[2].contains("Support"))
									{
%>
										<tr id='addr50'>
											<td class="text-center">
											<%=(c+1)%>
											</td>
											<td>											
											<input type="text" class="form-control "  readonly name="supportedHead0" id="supportedHead0"  value="<%=strAppArr[3]%>"  />
											</td>
																			
										</tr>
<%
									c++;
								}
							}
%>
								<tr id='addr51'></tr>									
							</tbody>				
						</table>
							

						<input type="hidden" name="supportedHeadSize" id="supportedHeadSize" value="1" />
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
							int d = 0;
							for (int jj=0; jj<approvalList.size(); jj++)
							{
								String strAppArr[] = (String[])approvalList.get(jj);
								
									if(strAppArr[2].contains("Approval"))
									{
%>
								<tr id='addr70'>
									<td class="text-center">
									<%=(d+1)%>
									</td>
									<td>									
									<input type="text" class="form-control "  readonly name="approvedBy0" id="approvedBy0"  value="<%=strAppArr[3]%>"  />
									</td>
																	
								</tr>
<%
									d++;
								}
							}
%>
								<tr id='addr71'></tr>									
							</tbody>				
						</table>
							
						<input type="hidden" name="approvedBySize" id="approvedBySize" value="1"  />
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

%>

					<div class="row clearfix">
					<h5 style="font-weight:bold;">Approval History : </h5><hr style="margin-top:0;margin-bottom:8px;">

					<div class="row"> 
					<div class="col-xs-12" >
						<table class="table table-bordered table-hover" id="">			
							<thead>
								<tr class="warning">
									<th class="text-left"  width="5%">
										Sr.No.
									</th>
									<th class="text-left" width="25%">
										Approval Sought For Disposal Of
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
								<td class="text-center" colspan="6" >No action details to be displayed.</td>																	
							</tr>															
						
<%
}else{
							for (int ll=0; ll<logList.size(); ll++)	{
							  String logArr[] = (String[])logList.get(ll);
%>
							<tr>
								<td class="text-left"><%=(ll+1)%></td>																	
								<td class="text-left"><%=disposalName%></td>																	
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

					<div class="row ">
						<div class="col-xs-10">
							<div class="form-actions" style="margin-top:30px;">
								<div class="col-xs-offset-7 col-xs-5">
									<button type="button" class="btn btn-primary prt" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
								</div>
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
</html>