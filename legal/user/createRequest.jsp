<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, org.json.simple.JSONObject, java.io.*, org.json.simple.parser.JSONParser" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Request </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />

	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 32px;		
			border-radius: 0;
			border: 1px solid #CCC;
		}
	.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
      color: #000;
      font-family: ...;
      font-size: 16px;
      font-weight: bold;
	 
}
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
		$(this).datepicker({ dateFormat: 'dd-mm-yy'   });		
	});	
	$('body').on('focus',".textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});

	$(".js-example-basic-single").select2({ width: '100%'  });
	/*$('.textareaEdi').wysihtml5({
			"image": false,
			"link": false
		});*/
	function format(icon) {
		var originalOption = icon.element;
		return '<i class="fa ' + $(originalOption).data('icon') + '"></i> ' + icon.text;
	}
	$(".multi").select2({ width: '100%', formatResult: format  });

    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	

	$('#input').keyup(function() {
		if (!$('#form')[0].checkValidity()) {
			$('#submit').click();
		}
	});

	$('#link').click(function() {
		if (!$('#form')[0].checkValidity()) {
			$('#submit').click();
		}
	});


	$(".tip-top").tooltip({
			placement : 'top'
    });
});
	</script>	
</head>
<body >
<%
	String vice_presd0 = (String)EnvironmentProperties.getValue("legalContractManagement", "VICE_PRESD");
	String vice_presd1 = (String)EnvironmentProperties.getValue("legalContractManagement", "VICE_PRESD1");

	String formName = "createRequest";
	//String popupEmailId1 = "";
	String popupEmailIdlegal1 = "";

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


	ArrayList emailidlegalList			= new ArrayList();
	
	Hashtable legalHash1			= new Hashtable();
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
				popupEmailIdlegal1 += "<option value='"+emailidArr+"'>"+emailidArr+"</option>";             
			}
		}
	}
%>
<body>
<%@ include file="../common/date.jsp" %>
<form name = "createRequest" class="form-horizontal" id="form" method="post"> 
<%@ include file="../includes/relatedLinks.jsp" %>

<hr style="margin-bottom:10px;">
	<div class="container-fluid">
	<div class="row">

	<div class="col-xs-12 ">
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
					<label class="control-label col-xs-4">Type Of Agreement : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
							<i class="fa fa-file-word-o"></i>
						</span>
						<!-- <select class="form-control multi" name="typeOfAgreement" id="typeOfAgreement"> -->
						<select class="form-control js-example-basic-single" name="typeOfAgreement" id="typeOfAgreement">
							<option value="0" data-icon="fa-file-text-o">Select Type of Agreement</option>
							<option value="Agency agreement">Agency Agreement</option>
							<option value="Non-disclosure agreement" >Non-disclosure Agreement</option>
							<option value="Publicist agreement">Publicist Agreement</option>
							<option value="Artist agreement">Artist Agreement</option>
							<option value="Barter agreement">Barter Agreement</option>
							<option value="Business center agreement">Business Center Agreement</option>
							<option value="In-house photographer">In-house Photographer</option>
							<option value="Commissioned photographer">Commissioned Photographer</option>
							<option value="Sourced photographer">Sourced Photographer</option>
							<option value="Dealership agreement">Dealership Agreement</option>
							<option value="Memorandum of understanding">Memorandum Of Understanding</option>
							<option value="Indemnity bond">Indemnity Bond</option>
							<option value="Knowledge partner">Knowledge Partner</option>
							<option value="Leave and license">Leave and License</option>
							<option value="Logistics agreement">Logistics Agreement</option>
							<option value="Master event agreement">Master Event Agreement</option>
							<option value="Master services agreement">Master Services Agreement</option>
							<option value="Miss diva agreement">Miss Diva Agreement</option>
							<option value="Printing agreement">Printing Agreement</option>
							<option value="Procurement agreement">Procurement Agreement</option>
							<option value="TM assignment agreement">TM Assignment Agreement</option>
						</select> 
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-html="true" data-original-title="Please choose a type basis the nature of relation we intend to undertake through this Agreement." style="color:#00b33c;font-size: 18px;cursor:pointer;">
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
						<input type="text" class="form-control textarea" placeholder="" name="partyName" id="partyName" value="" maxlength="100">
						 <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please enter the full name of the entity/ individual with which are entering the agreement." style="color:#00b33c;font-size:18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
						<!--  <span class="label label-success sm help1" style="font-size: 100%;cursor:pointer;"><i class="fa fa-question" aria-hidden="true"></i> </span> -->

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
						<select class="form-control" name="natureOfParties" id="natureOfParties">
							<option value="0">Select Nature Of Parties</option>
							<option value="Company">Company</option>
							<option value="Partnership">Partnership</option>
							<option value="Sole Proprietorship">Sole Proprietorship</option>
							<option value="Government Agency">Government Agency</option>
							<option value="Individual">Individual</option>
							<option value="NGO">NGO</option>
						</select>
						 <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please specify whether the other party is a Company, Partnership firm, Sole Proprietorship, HUF, an individual, etc." style="color:#00b33c;font-size: 18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
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
						<option value="0">Select Agreement</option>
							<option value="New">New</option>
							<option value="Renewal">Renewal</option>
						</select>
						 <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Please indicate if this is a new Agreement or renewal of existing agreement." style="color:#00b33c;font-size: 18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
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
						   <input type="text" name="valueOfAgreement" id="valueOfAgreement" class="form-control" value=""  placeholder=""  required="required" />
						    <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="The consideration that will be exchanged under the Agreement." style="color:#00b33c;font-size: 18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
				
					</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<!-- <label class="control-label col-xs-4">Date Of Agreement : </label> -->
					<label class="control-label col-xs-4">Request Date : </label>
					<div class="col-xs-8">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="dateOfAgreement" id="dateOfAgreement" value="<%=dayMonYear%>"  placeholder="From"/>
						 <span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="The date from which Agreement is expected to commence." style="color:#00b33c;font-size: 18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
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
						<div class="input-group">
							<textarea class="form-control noresize textarea" rows="2" maxlength="1000" name="reasonForSingAgreement" id="reasonForSingAgreement" placeholder="Reason"></textarea>
							<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Reason for engaging the Party." style="color:#00b33c;font-size: 18px;cursor:pointer;">
								<i class="fa fa-question-circle" aria-hidden="true"></i>
							</span> 
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-6">
				<div class="form-group ">
					<label class="control-label col-xs-4">Address : </label>
					<div class="col-xs-8">
						<div class="input-group">
							<textarea class="form-control noresize textarea" name = "address" id ="address" rows="2" maxlength="1000" placeholder="Address" ></textarea>
							<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Complete address of the Party." style="color:#00b33c;font-size: 18px;cursor:pointer;">
								<i class="fa fa-question-circle" aria-hidden="true"></i>
							</span> 
						</div>
					</div>
					
				</div>
			</div>
			
		</div>
		<div class="row">			
			<div class="col-xs-6">
				<div class="form-group ">
					<!-- <label class="control-label col-xs-4">Termination Period : </label> -->
					<label class="control-label col-xs-4">Duration of the Agreement : </label>

					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationFromDate" id="terminationFromDate" value="<%=dayMonYear%>"  placeholder="From"/>
						
					</div>
					</div>
					<div class="col-xs-4">
					<div class="input-group">
						<span class="input-group-addon">
						<i class="fa fa-calendar"></i>
						</span>
						<input type="text" class="form-control datepicker " name="terminationToDate" id="terminationToDate" value="<%=dayMonYear%>"  placeholder="To"/>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Duration of Agreement." style="color:#00b33c;font-size: 18px;cursor:pointer;">
								<i class="fa fa-question-circle" aria-hidden="true"></i>
							</span> 
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
							<option value="0">Select Jurisdiction</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Delhi">Delhi</option>
						</select>
						<span class="input-group-addon tip-top" data-toggle="tooltip" data-original-title="Select one" style="color:#00b33c;font-size: 18px;cursor:pointer;">
							<i class="fa fa-question-circle" aria-hidden="true"></i>
						</span> 
					</div>
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
					<textarea class=" form-control textarea" placeholder="Enter text here.." style=" height: 120px;margin-top:10px;margin-bottom:8px;" name="mainComments" id="mainComments" maxlength="500"></textarea>
			</div>
		</div>


		<div class="row clearfix">
			<div class="col-xs-12  ">
			<h5 style="font-weight: 600;margin-top:8px;" > Approvals :<span class="tip-top" data-html="true" data-toggle="tooltip" data-original-title="Department Head: Email of the Department head <br> Legal: Email of the legal approver." style="color:#00b33c;font-size: 18px;cursor:pointer;">
				<i class="fa fa-question-circle" aria-hidden="true"></i>
			</span>
			</h5>
			<hr style="margin-top:0;margin-top:8px;">
			<div class="col-xs-6  ">
				<table class="table table-bordered table-hover" id="tab_logic2">			
					<thead>
						<tr >
							<td class="text-center" style="font-weight: 600;" >
								Sr.No.
							</td>
							<td class="text-center" style="font-weight: 600;" >
								Department Approver
							</td>
							
						</tr>
					</thead>
					<tbody>
						<tr id='addr20'>
							<td class="text-center">
							1
							</td>
							<td>
							 <div class="col-sm-15 col-lg-20">
									<div class="input-group">
										<span class="input-group-addon">
											<i class="fa fa-user"></i>
										</span>
										<select class="form-control js-example-basic-single" name="userDeptHead" id="userDeptHead">
											<option value = "0" >Select Email id</option>
<%
												  for (int ii=0; ii<emailidList.size(); ii++){
													 String emailidArr[] = (String[])emailidList.get(ii);
%>
													<option value="<%=emailidArr[6]%>"><%=emailidArr[6]%></option>					
<%
												}  
%>

										</select>
									</div>
								</div>  
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
							<td class="text-center" style="font-weight: 600;">
								Sr.No.
							</td>
							<td class="text-center" style="font-weight: 600;">
								Legal Representative
							</td>
							
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
											<option value = "0" >Select Email id</option>
											<%= popupEmailIdlegal1%>


										</select>
									</div>
								</div>
							</td>    
															
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
<footer class="footer text-center">
	<div class="container">
		<p style="margin-bottom:2px;" class="ex">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>