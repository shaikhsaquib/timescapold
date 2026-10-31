
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser,com.bccl.util.AESencrp" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
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
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
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
	<script src="../js/form-validation.js"></script>
	<script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	

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
	$(".js-example-basic-single").select2({ width: '100%'  });
	$(".multi").select2({ width: '100%', formatResult: format  });	
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


		String decryptStatus0 = (String)request.getParameter("status");

		String decryptStatus2 = (String)request.getParameter("encryStatus");

		decryptStatus2 = decryptStatus2.replaceAll("\\s", "+");

		String decryptStatus3 = testEncrpt.decrypt(decryptStatus2);

		String documentOId = (String)session.getAttribute("docId");
		String whom = (String)session.getAttribute("whom");	

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
    	ArrayList detailsList = new ArrayList();
		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approvalHash = new Hashtable();

		headerHash.put("REQUESTOID", requestId);
		//headerHash.put("DOCUMENTOID", "DOC1002','DOC1003','DOC1004");
		headerHash.put("DOCUMENTOID", documentOId);
		//headerHash.put("CREATEDBY", emailId);
		headerHash.put("HEADERSECTION1", headerSection1);
		detailsHash.put("REQUESTOID", requestId);
		detailsHash.put("DETAILSECTION1", detailSection2);

		headerList = docHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", headerHash);
		detailsList = docDetailsController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", detailsHash);

		String ApplicationName				= "";
		String formName						= "frmDraftRequestDetails";
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

			//out.println("userDeptEmailid---"+userDeptEmailid);
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

		String AgreemenTypeSrtArr[] = {"Agency Agreement","Non-disclosure Agreement","Publicist Agreement","Artist Agreement","Barter Agreement","Business Center Agreement","In-house Photographer","Commissioned Photographer","Sourced Photographer","Dealership Agreement","Memorandum of Understanding","Indemnity Bond","Knowledge Partner","Leave and License","Logistics Agreement","Master Event Agreement","Master Services Agreement","Miss Diva Agreement","Printing Agreement","Procurement Agreement","TM Assignment Agreement"};


		String NatureOfPartiesStrArr[] = {"Company","Partnership","Sole Proprietorship","Government Agency","NGO"};

		String agreementStrArr[] = {"New","Renewal"};

		String jurisdictionStrArr[] = {"Mumbai","Delhi"};

		String popupJurisdiction="";

		for(int j=0; j < jurisdictionStrArr.length; j++) 
		{	
			if (jurisdictionStrArr[j].equals(jurisdiction)) 
			{
				 popupJurisdiction += "<option value='"+jurisdictionStrArr[j]+"' selected>"+jurisdictionStrArr[j]+"</option>";	
				
			}else
			{
				 popupJurisdiction += "<option value='"+jurisdictionStrArr[j]+"' >"+jurisdictionStrArr[j]+"</option>";	
			}

		}


		String popupagreement="";

		for(int j=0; j < agreementStrArr.length; j++) 
		{	
			if (agreementStrArr[j].equals(agreement)) 
			{
				 popupagreement += "<option value='"+agreementStrArr[j]+"' selected>"+agreementStrArr[j]+"</option>";	
				
			}else
			{
				 popupagreement += "<option value='"+agreementStrArr[j]+"' >"+agreementStrArr[j]+"</option>";	
			}

		}


		String popupAgreemenType="";

		for(int j=0; j < AgreemenTypeSrtArr.length; j++) 
		{	
			if (AgreemenTypeSrtArr[j].equals(typeOfAgreement)) 
			{
				 popupAgreemenType += "<option value='"+AgreemenTypeSrtArr[j]+"' selected>"+AgreemenTypeSrtArr[j]+"</option>";	
				
			}else
			{
				 popupAgreemenType += "<option value='"+AgreemenTypeSrtArr[j]+"' >"+AgreemenTypeSrtArr[j]+"</option>";	
			}

		}

		String popupNatureOfParties ="";

		for(int j=0; j < NatureOfPartiesStrArr.length; j++) 
		{	
			if (NatureOfPartiesStrArr[j].equals(natureOfParties)) 
			{
				 popupNatureOfParties += "<option value='"+NatureOfPartiesStrArr[j]+"' selected>"+NatureOfPartiesStrArr[j]+"</option>";	
				
			}else
			{
				 popupNatureOfParties += "<option value='"+NatureOfPartiesStrArr[j]+"' >"+NatureOfPartiesStrArr[j]+"</option>";	
			}
		}
	ArrayList emailidlegalList = new ArrayList();
	String popupEmailIdlegal1 = "";
	Hashtable legalHash1 = new Hashtable();
	legalHash1.put("STATUS", "A");
	legalHash1.put("DOCUMENTOID", "DOC1006");
	legalHash1.put("APROFILEOID", "PRO6002");
	legalHash1.put("BPROFILEOID", "PRO6003");
	legalHash1.put("ATTRIBUTEVALUE", locationCode);
	emailidlegalList	= docHeaderController.getlegalcordinates(legalHash1);
    int headerSize = emailidlegalList.size();

	//out.println(headerSize);

	if( headerSize > 0){
		for (int e = 0; e < headerSize; e++) {

			String headerData [] = (String[]) emailidlegalList.get(e);
			String array[] = headerData[2].split(",");
			for (int ii=0; ii< array.length; ii++) 
			{
				String emailidArr = array[ii];
				if(emailidArr.equals(legalHeadEmailid)){
						popupEmailIdlegal1 += "<option value='"+emailidArr+"' selected>"+emailidArr+"</option>";             
				}else{
					popupEmailIdlegal1 += "<option value='"+emailidArr+"'>"+emailidArr+"</option>";             
				}
				
			}
		}
	}
		ArrayList emailidList	= new ArrayList();

	Hashtable emailHash1	= new Hashtable();

	emailHash1.put("COMPANYCODE", companyCode);
	emailHash1.put("DEPTCODE", deptGroup);
	emailHash1.put("EMAILID", emailId);
	
	if("1005".equals(deptGroup)){
		
		String[] strArray0 = {"","","","","","","amit.rai@timesgroup.com"};
		String[] strArray1 = {"","","","","","","mritunjay.kataria@timesgroup.com"};
		String[] strArray2 = {"","","","","","","rajan.vaid@timesgroup.com"};
		
		String[] strArray3 = {"","","","","","","tasneem.lightwala@timesgroup.com"};
		String[] strArray4 = {"","","","","","","aarjay.prakashan@timesgroup.com"};
		String[] strArray5 = {"","","","","","","kumar.laxmikant@timesgroup.com"};
		
		String[] strArray6 = {"","","","","","","kunal.endait@timesgroup.com"};
		String[] strArray7 = {"","","","","","","hemlata.bhasin@timesgroup.com"};
		String[] strArray8 = {"","","","","","","saikat.chaudhuri@timesgroup.com"};

		emailidList.add(strArray0);
		emailidList.add(strArray1);
		emailidList.add(strArray2);

		emailidList.add(strArray3);
		emailidList.add(strArray4);
		emailidList.add(strArray5);
		
		emailidList.add(strArray6);
		emailidList.add(strArray7);
		emailidList.add(strArray8);	
		

	}else {
		emailidList	= docHeaderController.getEmailId(emailHash1);	
		}

	
	
%>
<body >
<%@ include file="../common/date.jsp" %>
<form name = "frmDraftRequestDetails" class="form-horizontal" id="form" method="post"> 
<%@ include file="../includes/relatedLinks.jsp" %>

<hr style="margin-bottom:10px;">
	<div class="container-fluid">
	<div class="row">
	
	<div class="col-xs-12 bs-example">
	<div class="portlet box blue">
		<div class="portlet-title">
			<div class="caption">
				<i class="fa fa-pencil-square-o"></i> Create Request
			</div>			
		</div>
		
		<div class="portlet-body">
			<div class="row">
				<h4  >All fields are mandatory.</h4>
			</div>
			<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Request ID : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-th"></i>   
						</span>						
							<input type="text" class="form-control" placeholder="" name="requestId" id="requestId" value="<%=requestId%>" readonly>	
								
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
						<input type="text" class="form-control" placeholder="" name="createdBy" id="createdBy" value="<%=createdby%>" readonly>
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
						<!-- <select class="form-control multi" name="typeOfAgreement" id="typeOfAgreement"> -->
						<select class="form-control " name="typeOfAgreement" id="typeOfAgreement"> 
						<option value="0">Select Type Of Agreement</option>
							<%=popupAgreemenType%>
						</select> 
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please choose a type basis the nature of relation we intend to undertake through this Agreement." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						<input type="text" class="form-control textarea" placeholder="" name="partyName" id="partyName" value="<%=partyName%>" maxlength="100">
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please enter the full name of the entity/ individual with which are entering the agreement." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						<select class="form-control " name="natureOfParties" id="natureOfParties">
							<%=popupNatureOfParties%>
						</select>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please specify whether the other party is a Company, Partnership firm, Sole Proprietorship, HUF, an individual, etc." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						<select class="form-control" name="agreement" id="agreement">
							<%=popupagreement%>
						</select>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please indicate if this is a new Agreement or renewal of existing agreement." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						   <input type="text" name="valueOfAgreement" id="valueOfAgreement" class="form-control" value="<%=valueOfAgreement%>"  placeholder=""  required="required" />
						  <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="The consideration that will be exchanged under the Agreement." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						<input type="text" class="form-control datepicker " name="dateOfAgreement" id="dateOfAgreement" value="<%=dateOfAgreement%>"  placeholder="From"/>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="The date from which Agreement is expected to commence." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-6">
				<div class="form-group">
					<label class="control-label col-xs-4">Reason For Signing Agreement : </label>
					<div class="col-xs-8" >
					<div class="input-group">
						<textarea class="form-control noresize textarea" rows="2" maxlength="1000" name="reasonForSingAgreement" id="reasonForSingAgreement" placeholder="Reason"><%=reasonForSingAgreement%></textarea><span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Reason for engaging the Party." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Address : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<textarea class="form-control noresize textarea" name = "address" id ="address" rows="2" maxlength="1000" placeholder="Address" ><%=address%></textarea>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Complete address of the Party." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
					</div>
					</div>
					
				</div>
			</div>
			
		</div>

		<div class="row">			
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Termination Period : </label>

					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationFromDate" id="terminationFromDate" value="<%=terminationFromDate%>"  placeholder="From"/>
						
					</div>
					</div>
					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationToDate" id="terminationToDate" value="<%=terminationToDate%>"  placeholder="To"/>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Duration of Agreement." style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
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
						<select class="form-control" name="jurisdiction" id="jurisdiction">
							<%=popupJurisdiction%>
						</select>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Select one" style="color:#00b33c;font-size: 18px;">
							<i class="fa fa-question-circle" aria-hidden="true"></i></span>
					</div>
					</div>
				</div>
			</div>

		<div class="row " >
			<div class="col-xs-12">
				<h5 style="font-weight: 600;margin-top:8px;">	
				 Comments : <span class="tip-top" data-toggle="tooltip" data-original-title="Any specific request " style="color:#00b33c;font-size: 18px;cursor:pointer;">
					<i class="fa fa-question-circle" aria-hidden="true"></i>
				</span></h5>
					<textarea class=" form-control textarea" placeholder="Enter text here.." style=" height: 120px;margin-top:10px;margin-bottom:8px;" name="mainComments" id="mainComments" maxlength="500"><%=mainComments%></textarea>
			</div>
		</div>


		<div class="row clearfix">
			<div class="col-xs-12  ">
			<h5 style="font-weight: 600;margin-top:8px;"> Approvals:<span class="tip-top" data-toggle="tooltip" data-original-title="Department Head: Email of the Department head <br/> Legal: Email of the legal approver." style="color:#00b33c;font-size: 18px;">
				<i class="fa fa-question-circle" aria-hidden="true"></i>
			</span></h5>
			<hr style="margin-top:0;margin-bottom:8px;">
			<div class="col-xs-6  ">
				<table class="table table-bordered table-hover" id="tab_logic2">			
					<thead>
						<tr >
							<th class="text-center" >
								Sr. No.
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
							<!--<td>
								<input type="text" placeholder="Search Email ID" class="form-control width:4px;" name="userDeptHead" id="userDeptHead" value="<//%=userDeptEmailid%>"  onkeyup="lookupDeptApproval(this.value,'userDeptHead');" style="font-size:15px;" >
								<div class="suggestionsBox" id="suggestions" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsList" style="padding-left:2px;text-align:left;">
									</div>
								</div>	 
							</td>
						</tr>-->
							<td>
							 <div class="col-sm-15 col-lg-20">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-user"></i>
										</span>
										<select class="form-control js-example-basic-single" name="userDeptHead" id="userDeptHead">
											<option value = "0" >Select Email ID</option>											
<%
												  for (int ii=0; ii<emailidList.size(); ii++){
													 String emailidArr[] = (String[])emailidList.get(ii);
													 if(emailidArr[6].equals(userDeptEmailid)){
%>
														<option value="<%=emailidArr[6]%>" selected><%=emailidArr[6]%></option>					
<%													 }else {
%>
														<option value="<%=emailidArr[6]%>"><%=emailidArr[6]%></option>					
<%													 }
												}  
%>
										</select>
									</div>
								</div>							
							</td>						
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
							<td>

							<div class="col-sm-15 col-lg-20">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-user"></i>
										</span>
										<select class="form-control js-example-basic-single" name="legalHead" id="legalHead" onfocus="onLoadDetail('1');" >
											<option value = "0" >Select Email ID</option>
											<%= popupEmailIdlegal1%>
										</select>
									</div>
								</div>						
							</td> 
							<!--<td>
							<input type="text" placeholder="Search Email ID" class="form-control width:4px;" name="legalHead" id="legalHead"  value="<//%=legalHeadEmailid%>" onkeyup="lookupRepresentative(this.value,'legalHead');" style="font-size:15px;" >
							<div class="suggestionsBox" id="suggestions1" style="display:none;text-align:left;" class="form-control">
								<div class="suggestionList Breakword" id="autoSuggestionsList1" style="padding-left:2px;text-align:left;">
								</div>
							</div>
							
							</td>-->
															
						</tr>					
						<tr id='addr31'></tr>									
					</tbody>										
				</table>						
			</div>	
		</div>	
		</div>
		<input type="hidden" name="frmStatus" id="frmStatus" value="" />

		<div class="row ">
			<div class="col-xs-10">
				<div class="form-actions" style="margin-top:30px;">
				<div class="col-xs-offset-6 col-xs-5">
					<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
					<input type="button" class="btn btn-info" value="Submit" name="submitButton" height="20" onclick = "javascript:validate('inProcess','<%=formName%>');"/>
					<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
					<input type="button"  class="btn btn-warning"  value="Save As Draft" name="submitButton" id="saveDraft" height="20" onclick = "javascript:validate('draft','<%=formName%>');"/>
				</div>
				</div>
			</div>
		</div>
		
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