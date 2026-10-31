<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.util.AESencrp"%>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Request Details</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>		
	
	<link href="css/bootstrap-table.min.css" rel="stylesheet"/> 	
	<style>
		
		.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
} 
.fixed-table-body {
  overflow-x: auto;
  overflow-y: auto;
  height: auto;}

	</style>
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../jscript/legal.js"></script>	

	<script>
	$(document).ready(function() {
	
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',".textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});
	$('[data-toggle="tooltip"]').tooltip({placement:'top'});
		
		$('.RelatedLinks ul li.RelLinks').hover(function() {
				$(this).find('.dropdownmenu').show();
			}, function(){
				$(this).find('.dropdownmenu').hide();
		});
});

	</script>	
</head>
<%@ include file="../common/leagalHeaderDetailsConfig.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("legalContractManagement", "uploadPath");	
		
		AESencrp testEncrpt = new AESencrp();	

		String decryptRequestId = (String)request.getParameter("requestId");

		decryptRequestId = decryptRequestId.replaceAll("\\s", "+");

		String requestId = testEncrpt.decrypt(decryptRequestId);
	
		//String documentOId = (String)request.getParameter("docId");
		//String whom = (String)request.getParameter("whom");

		String documentOId = (String)session.getAttribute("docId");
		String whom = (String)session.getAttribute("whom");

		String decryptStatus0 = (String)request.getParameter("status");

		String decryptStatus2 = (String)request.getParameter("encryStatus");

		decryptStatus2 = decryptStatus2.replaceAll("\\s", "+");

		String decryptStatus3 = testEncrpt.decrypt(decryptStatus2);

		int c = 0;
		
		if((decryptStatus0 == decryptStatus3) || decryptStatus0.equals(decryptStatus3))
		{
			c=c+1;
		}

		if(c>0)
		{

		
		Hashtable statusImg = new Hashtable( );
		statusImg.put("D",  "../images/draft.png");
		statusImg.put("I",  "../images/inProcess.png");
		//statusImg.put("A",  "../images/half_process.png");
		statusImg.put("R",  "../images/review.png");
		statusImg.put("A",  "../images/approved.png");
		statusImg.put("CL",  "../images/approved.png");


		ArrayList headerList = new ArrayList();
		ArrayList approvalList = new ArrayList();
		ArrayList keyDetailsList = new ArrayList();
    	ArrayList detailsList = new ArrayList();
		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approvalHash = new Hashtable();
		Hashtable keyDetailHash = new Hashtable();

		String formName		= "frmViewRequest";

		headerHash.put("REQUESTOID", requestId);
		//headerHash.put("DOCUMENTOID", "DOC1002','DOC1003','DOC1004");
		headerHash.put("DOCUMENTOID", documentOId);
		headerHash.put("HEADERSECTION1", headerSection1);
		detailsHash.put("REQUESTOID", requestId);
		detailsHash.put("DETAILSECTION1", detailSection2);

		keyDetailHash.put("DOCUMENTOID", "DOC1006");
		keyDetailHash.put("WORKITEMOID", requestId); 
		keyDetailHash.put("APPLICATION", "legalContractManagement");	
		
		keyDetailsList = docKeyWordController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",keyDetailHash);

		


		headerList = docHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",headerHash);
		detailsList = docDetailsController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

	//	out.println("-----"+keyDetailsList.size());
	//	out.println("detailsList-----"+detailsList.size());

		String ApplicationName				= "";
		String statusType					= "";
		String createdby					= "";
		String documentstate				= "";

		String typeOfAgreement				= "";
		String partyName					= "";
		String reasonForSingAgreement		= "";
		String dateOfAgreement				= "";
		String valueOfAgreement				= "";
		String agreement					= "";
		String natureOfParties				= "";
		String address						= "";
		String jurisdiction					= "";
		String terminationFromDate			= "";
		String terminationToDate			= "";
		String userDeptEmailid				= "";
		String legalHeadEmailid				= "";
		String mainComments					= "";
		String createdOn					= "";

		for (int ii=0; ii<headerList.size(); ii++)
		{
			String strArr[] = (String[])headerList.get(ii);

			ApplicationName				= strArr[3];
			statusType					= strArr[4];
			createdby					= strArr[5];
			documentstate				= strArr[6];
			typeOfAgreement				= strArr[7];
			partyName					= strArr[8];
			reasonForSingAgreement		= strArr[9];
			dateOfAgreement				= strArr[10];
			valueOfAgreement			= strArr[11];
			agreement					= strArr[12];
			natureOfParties				= strArr[13];
			address						= strArr[14];
			jurisdiction				= strArr[15];
			terminationFromDate			= strArr[16];
			terminationToDate			= strArr[17];
			userDeptEmailid				= strArr[18];
			legalHeadEmailid			= strArr[19];
			mainComments				= strArr[20];
			createdOn					= strArr[22];

			//out.println("userDeptEmailid---"+strArr[22]);
		//	out.println("legalHeadEmailid---"+legalHeadEmailid);
			
		}

		String termOfAgreement					= "";
		String considerationOfAgreement			= "";
		String deliverablesNatureOfParty		= "";

		for(int t = 0; t <detailsList.size(); t++)
		{
			String strDetailsArr[] = (String[])detailsList.get(t);

			termOfAgreement						= strDetailsArr[2];
			considerationOfAgreement			= strDetailsArr[3];
			deliverablesNatureOfParty			= strDetailsArr[4];
		}


		String remarks					= "";
		String keyCommentBy				= "";
		String keyCommentOn				= "";
		String keyStatus				= "";

		//out.println("--"+keyDetailsList.size());

		if(keyDetailsList.size() >0)
		{
			for(int q = 0; q <keyDetailsList.size(); q++)
			{
				String strKeyDetailsArr[] = (String[])keyDetailsList.get(q);

				remarks					= strKeyDetailsArr[4];
				keyCommentBy			= strKeyDetailsArr[5];
				keyCommentOn			= strKeyDetailsArr[6];
				keyStatus				= strKeyDetailsArr[7];
			}
		}

		

%>
<body >
<%@ include file="../common/date.jsp" %>
<form name = "frmViewRequest" class="form-horizontal" id="form"> 
<%@ include file="../includes/relatedLinks.jsp" %>

<hr style="margin-bottom:10px;">
	<div class="container-fluid">
	<div class="row">
	
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-pencil-square-o"></i>Request Details
			</div>			
		</div>
		<div class="portlet-body">
		<!-- <form name = "frmViewRequest" class="form-horizontal" id="form">  -->
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Request ID : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-th"></i>   
						</span>						
							<input type="text" class="form-control" placeholder="" name="requestId" id="requestId" value="<%=requestId%>" style="background-color: #F0EDEB"  readonly>						
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Created By : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-user"></i>
						</span>
						<input type="text" class="form-control" placeholder="" name="createdBy" id="createdBy" value="<%=createdby%>" style="background-color: #F0EDEB"  readonly>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Type Of Agreement : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-file-word-o"></i>
						</span>						
							<input type="text" class="form-control" placeholder="" name="typeOfAgreement" id="typeOfAgreement" value="<%=typeOfAgreement%>" style="background-color: #F0EDEB"  readonly>						
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Name Of Parties : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-bars"></i>
						</span>
						<input type="text" class="form-control" placeholder="" name="partyName" id="partyName" value="<%=partyName%>" style="background-color: #F0EDEB"  readonly>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Nature Of Parties : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-user"></i>
						</span>
						
							<input type="text" class="form-control" placeholder="" name="natureOfParties" id="natureOfParties" value="<%=natureOfParties%>" style="background-color: #F0EDEB"  readonly>
			
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Agreement : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-info"></i>
						</span>
						
							<input type="text" class="form-control" placeholder="" name="agreement" id="agreement" value="<%=agreement%>" style="background-color: #F0EDEB"  readonly>
					</div>
						</div>
				</div>
			</div>
			
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Value Of Agreement : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-inr"></i>
						</span>
						   <input type="text" name="valueOfAgreement" id="valueOfAgreement" class="form-control" value="<%=valueOfAgreement%>" style="background-color: #F0EDEB"  readonly />
					<!-- 	<input type="submit" id="submit" style="display:none;" /> -->
						
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Date Of Agreement : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="dateOfAgreement" id="dateOfAgreement" style="background-color: #F0EDEB"  value="<%=dateOfAgreement%>"  style="background-color: #F0EDEB" disabled/>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Reason For Signing Agreement : </label>
					<div class="col-xs-8">					
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td style="background-color: #F0EDEB" >
										<%=reasonForSingAgreement%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Address : </label>
					<div class="col-xs-8">
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td style="background-color: #F0EDEB" >
										<%=address%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
			
		</div>

		

		<!-- <div class="row">			
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Consideration of Agreement : </label>
					<div class="col-xs-8">
						
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td style="background-color: #F0EDEB" >
										<%//=considerationOfAgreement%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Deliverables of the nature of Parties : </label>
					<div class="col-xs-8">
						<table class="table table-bordered table-hover" id="">			
							<tbody>
								<tr >
									<td style="background-color: #F0EDEB" >
										<%//=deliverablesNatureOfParty%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
				</div>
			</div>
		</div> -->

		<div class="row">			
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Termination Period : </label>

					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationFromDate" id="terminationFromDate" value="<%=terminationFromDate%>"  style="background-color: #F0EDEB"  disabled/>
					</div>
					</div>
					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationToDate" id="terminationToDate" value="<%=terminationToDate%>"  style="background-color: #F0EDEB"  disabled/>
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Jurisdiction : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-info"></i>
						</span>
						
							 <input type="text" name="jurisdiction" id="jurisdiction" class="form-control" value="<%=jurisdiction%>" style="background-color: #F0EDEB"  readonly/>
						
					</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">			
			

			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Created On : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</span>						
							<input type="text" class="form-control" placeholder="" name="createdOn" id="createdOn" value="<%=createdOn%>" style="background-color: #F0EDEB"  readonly>						
					</div>
					</div>
				</div>
			</div>
			
		</div>
		

		<div class="row " style="margin-top:8px;">

		<div class="col-xs-12">
		<h5 style="font-weight:bold;">Comments : </h5>
			<hr style="margin-top:0;margin-bottom:8px;">
			<table class="table table-bordered table-hover" id="">			
				<tbody>
					<tr >
						
						<td style="background-color: #F0EDEB" >
							<%=mainComments%>

						</td>
					</tr>
				</tbody>
			</table>
		</div>
		</div>


		<div class="row clearfix">
			<div class="col-xs-12  ">
			<h5 style="font-weight:bold;">Approvals:</h5>
			<hr style="margin-top:0;margin-bottom:8px;">
			<div class="col-xs-6  ">
				<table class="table table-bordered table-hover" id="tab_logic2">			
					<thead>
						<tr >
							<th class="text-center" >
								Sr.No..
							</th>
							<th class="text-center">
								Department Approver
							</th>
							
						</tr>
					</thead>
					<tbody>
						<tr id='addr20'>
							<td class="text-center">
							1
							</td>
							<td style="background-color: #F0EDEB" >
							<%=userDeptEmailid%>
							</td>
															
						</tr>					
						<tr id='addr21'></tr>									
					</tbody>				
				</table>
			</div>
			
			<div class="col-xs-6 ">
				<table class="table table-bordered table-hover" id="tab_logic3">			
					<thead>
						<tr >
							<th class="text-center" >
								Sr.No.
							</th>
							<th class="text-center">
								Legal Representative
							</th>
							
						</tr>
					</thead>
					<tbody>
						<tr id='addr30'>
							<td class="text-center">
							1
							</td>
							<td style="background-color: #F0EDEB" >
							<%=legalHeadEmailid%>
							<!-- <input type="text" class="form-control " placeholder="Branch B&C" name="branchHead" id="branchHead" value="">	 -->					
							</td>
															
						</tr>					
						<tr id='addr31'></tr>									
					</tbody>										
				</table>						
			</div>	
		</div>	
		</div>

<%
			if(keyDetailsList.size() >0)
			{
				if("AR".equals(keyStatus))
				{
%>
				<div class="row " style="margin-top:8px;">

				<div class="col-xs-12">
				<h5 style="font-weight:bold;">Legal Reprentative Remarks : </h5>
					<hr style="margin-top:0;margin-bottom:8px;">
					<table class="table table-bordered" id="">			
						<tbody>
							<tr >
								
								<td style="background-color: #F0EDEB">
									<%=remarks%>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>
<%
				}
			}
%>

		
		<!-- <div class="row">
		<div class="col-md-6 col-md-offset-5 ">
			<button type="button" class="btn btn-primary" onclick="document.location='viewrequestuser.html'">Submit</button>
			<button type="reset" class="btn btn-warning">Reset</button>
		</div>
		</div> -->
		<input type="hidden" name="reqStatus" id="reqStatus" value="" />
		<input type="hidden" name="createdby" id="createdby" value="<%=createdby%>" />	
		<input type="hidden" name="pos" id="pos" value="0" />
		<input type="hidden" name="reqId0" id="reqId0" value="<%=requestId%>">

		
<%
				if("Approver".equals(whom))
				{
%>
				<div class="row " style="margin-top:8px;">

				<div class="col-xs-12">
				<h5 style="font-weight:bold;">Remarks : </h5>
					<hr style="margin-top:0;margin-bottom:8px;">
					<table class="table table-bordered" id="">			
						<tbody>
							<tr >
								
								<td >
									<input type="text" class="form-control textarea" placeholder="Remarks" name="remarks0" id="remarks0" value="" maxlength="50">

								</td>
							</tr>
						</tbody>
					</table>
				</div>
				</div>

				<div class="row ">
				<div class="col-xs-10">
					<div class="form-actions" style="margin-top:30px;">
					
					<div class="col-xs-offset-6 col-xs-5">
						
						<input type="button" class="btn btn-info" value="Acknowledge" name="submitButton" height="20" onclick = "javascript:actionOnRequest1('<%=requestId%>','<%=documentOId%>','ACK','0');"/>
						<input type="button"  class="btn btn-danger"  value="Reject" name="submitButton" id="saveDraft" height="20" onclick = "javascript:actionOnRequest1('<%=requestId%>','<%=documentOId%>','AR','0');"/>
						<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
						
					</div>
					</div>
				</div>
			   </div>	
<%

				}else
				{
%>
			<div class="row ">
				<div class="col-xs-10">
				<div class="form-actions" style="margin-top:30px;">
				<div class="col-xs-offset-7 col-xs-5">
					<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
				</div>
				</div>
				</div>
			</div>	

<%
				}	
%>

				
		</div>
	</div>			
	</div>
	
	</div>
	</div>
</form>

<%
		}else
		{

			String message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";
%>
	<body>
<%@ include file="../includes/relatedLinks.jsp" %>
<div class="container well">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
					<i class="fa fa-th"></i>  <strong></strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="frmCreateWasteSalesProcess" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
									</tr>
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="col-xs-2"></div>
	</div>
</div>
					

<%}%>
<footer class="footer text-center">
	<div class="container">
		<p style="margin-bottom:2px;" class="ex">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>

</html>