<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- <title> Waste Aprroval Process </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" /> -->
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
	</style>	
<!-- 	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	 -->
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
	
	$(".js-example-basic-single").select2({ width: '100%'  });
	$('body').on('focus',".textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	$('.text').wysihtml5({
			"image": false,
			"link": false
		});
	//var text_max = 200;
//$('#count_message').html(text_max + ' remaining');

//$('.text').keyup(function() {
 // var text_length = $('.text').val().length;
 // var text_remaining = text_max - text_length;
  
 // $('#count_message').html(text_remaining + ' remaining');
//});
	

		
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
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});

	$("[name^=valueOfMaterials]").each(function () {
        $(this).rules("add", {
            required: true,
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});

	$("[name^=finalHighestBidder]").each(function () {
        $(this).rules("add", {
            required: true,
			pattern: /^(?=.*\d)\d*(?:\.\d\d)?$/,
			messages: {
            pattern:  "Valid Format is : 0.00"
        }
            
        });	
	});

	});
	</script>
	
	</head>
<%@ include file="../common/date.jsp" %>

<% 

		String headDesignation = "'CHIEF INFORMATION OFFICER','MANAGING DIRECTOR'";

		ArrayList emailidList			= new ArrayList();

		ArrayList proposedEmailidList	= new ArrayList();

		ArrayList deptHeadEmailidList	= new ArrayList();

		ArrayList bncEmailidList	= new ArrayList();

		ArrayList supportedEmailidList	= new ArrayList();

		ArrayList approverEmailidList	= new ArrayList();

		ArrayList branchList			= new ArrayList();

		ArrayList unitsList				= new ArrayList();


		Hashtable emailHash				= new Hashtable();

		Hashtable deptHeadEmailHash		= new Hashtable();

		Hashtable branchHash			= new Hashtable();
		Hashtable supportedHash			= new Hashtable();
		Hashtable approverHash			= new Hashtable();

		emailHash.put("COMPANYCODE", companyCode);
		emailHash.put("DEPTCODE", "1002");
		emailHash.put("EMAILID", emailId);

		/*deptHeadEmailHash.put("COMPANYCODE", companyCode);
		deptHeadEmailHash.put("DEPTCODE", deptGroup);


		branchHash.put("COMPANYCODE", companyCode);
		branchHash.put("DEPTCODE", "1002");

		supportedHash.put("COMPANYCODE", companyCode);
		//supportedEmailidList.put("DEPTCODE", "");

		approverHash.put("COMPANYCODE", companyCode);
		//approverHash.put("DEPTCODE", "");
		approverHash.put("DESIGNATION", headDesignation);*/ 




		branchHash.put("ZONENAME", "1002");
		branchHash.put("STATUS", "A");

		//emailidList = wasteSalesHeaderController.getEmailId(emailHash);

		proposedEmailidList		= wasteSalesHeaderController.getEmailId(emailHash);
		unitsList				= wasteSalesDetailsController.getUnits();

		
		String popupEmailId = "";
		String popupUnit = "";

		for (int ii=0; ii<proposedEmailidList.size(); ii++) 
		{
			String emailidArr[] = (String[])proposedEmailidList.get(ii);

			popupEmailId += "<option value='"+emailidArr[0]+"|"+emailidArr[4]+"|"+emailidArr[6]+"'>"+emailidArr[6]+"</option>";             
        }



		for(int jj=0; jj< unitsList.size(); jj++)
		{
			String tmpArr[] = (String[])unitsList.get(jj);

			popupUnit += "<option value='"+tmpArr[1]+"'>"+tmpArr[1]+"</option>";             

		}

		/*deptHeadEmailidList		= wasteSalesHeaderController.getEmailId(deptHeadEmailHash);

		bncEmailidList			= wasteSalesHeaderController.getEmailId(branchHash);

		supportedEmailidList	= wasteSalesHeaderController.getEmailId(supportedHash);

		approverEmailidList		= wasteSalesHeaderController.getEmailId(deptHeadEmailHash);
		*/
		//branchList				= wasteSalesHeaderController.getBranch(branchHash);


		
		String formName			= "frmCreateFixedAsset";
		
		String type			= (String)request.getParameter("type");

%>
	<div class="portlet box blue">
			<div class="portlet-title"> 
				<div class="caption">
				<i class="fa fa-th"></i>  <strong>Create Waste/Fixed Asset Disposal Request </strong>
			</div>			
			</div>			
	</div>
	<div class="portlet-body">
					<div class="row ">
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Type of Disposal</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-bars"></i>
									</span><input type="text" class="form-control "  name="disposalType" id="disposalType" value="<%=type%>" readonly/>
									<!-- <select class="form-control" id="approvalForDisposal" name="approvalForDisposal" placeholder="">
										<option value="0">Select Disposal</option>
										<option value="Fixed Asset Disposals">Fixed Asset Disposals</option>
										<option value="One-off Miscellaneous">One-off Miscellaneous</option>
										<option value="Damaged Newsprint Disposals">Damaged Newsprint Disposals</option>
									</select> -->
								</div>
							</div>
						</div>
						</div>
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Approval Sought For Disposal Of:</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-bars"></i>
									</span><input type="text" class="form-control "  name="disposalName" id="disposalName" placeholder="Disposal"  />
									<!-- <select class="form-control" id="approvalForDisposal" name="approvalForDisposal" placeholder="">
										<option value="0">Select Disposal</option>
										<option value="Fixed Asset Disposals">Fixed Asset Disposals</option>
										<option value="One-off Miscellaneous">One-off Miscellaneous</option>
										<option value="Damaged Newsprint Disposals">Damaged Newsprint Disposals</option>
									</select> -->
								</div>
							</div>
						</div>
						</div>
						
					</div>
					
					<div class="row ">
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Location:</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-map-marker" style="width:11px;"></i>
									</span>
									<select class="form-control" id="location1" name="location1">
										<option value="0">Select Location</option>
										<option value="Pune">Pune</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Ahemdabad">Ahemdabad</option>
										<option value="Kolhapur">Kolhapur</option>
									</select>
								</div>
							</div>
						</div>
						</div>

						<div class="col-xs-6 " >
						<div class="form-group">
							<label class="control-label col-xs-4">Date:</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</span>
									<input type="text" class="form-control datepicker "  name="createdDate" id="createdDate" value="<%=dayMonYear%>" disabled placeholder="Date" />
								</div>
							</div>
						</div>
						</div>
					</div>	
					<div class="row ">	
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Proposed By:</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon" >
										<i class="fa fa-pencil-square-o"></i>
									</span>

									<select class="form-control js-example-basic-single" name="dispProposedBy" id="dispProposedBy" >
											<option value = "0" >Select Emailid</option>
<%
												for (int ii=0; ii<proposedEmailidList.size(); ii++)
												{
													 String proposedEmailidArr[] = (String[])proposedEmailidList.get(ii);
%>
													<option value="<%=proposedEmailidArr[0]%>|<%=proposedEmailidArr[4]%>|<%=proposedEmailidArr[6]%>"><%=proposedEmailidArr[6]%></option>
					
<%
												}

%>

									</select>
									
								</div>
							</div>
						</div>
						</div>
						<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Disposal Approved By:</label>
							<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
									</span>
									<select class="form-control js-example-basic-single" name="dispApprovedBy" id="dispApprovedBy" >
											<option value = "0" >Select Emailid</option>
<%
												for (int ii=0; ii<proposedEmailidList.size(); ii++)
												{
													 String proposedEmailidArr[] = (String[])proposedEmailidList.get(ii);
%>
													<option value="<%=proposedEmailidArr[0]%>|<%=proposedEmailidArr[4]%>|<%=proposedEmailidArr[6]%>"><%=proposedEmailidArr[6]%></option>
					
<%
												}

%>

									</select>
									<!-- <input type="text" class="form-control" name="approved" id="approved" placeholder=""> -->
								</div>
							</div>
						</div>
						</div>
					</div>
					<div class="row ">
					<h5 class="pull-right" style="font-weight:bold;">Rs/kg </h5>
						<table class="table table-bordered table-hover" id="tab_logic">			
							<thead>
								<tr class="info">
									<th class="text-center">
										Sr.<br>No.
									</th>
									<th class="text-center" width="20%">
										Description 
									</th>
									<th class="text-center" width="11%">
										Qty
									</th>
									<th class="text-center" width="9%">
										UOM
									</th>
									<th class="text-center" width="9%">
										Value Of Material<br>(Rs/UOM)
									</th>
									<th class="text-center" width="14%">
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
									<td>TOTAL VALUE</td>
									<td></td>
									<td></td>
									<td></td>
									<td class="text-right"><input type="text" class="form-control" name="totalValue" id="totalValue" value="0" disabled /></td>
									<td></td>
									<td width="16%">VAT & TDS extra</td>
								</tr>
							  </tfoot>
							<tbody>	
<%
								for(int i =0; i<5; i++)
								{
%>
								<tr id='addr0'>
									<td>
									<%=i+1%>
									</td>
									<td class="text-center ">
										<div class="form-group  " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control" name="desc" id="desc<%=i%>" placeholder="Description"></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="quantity" id="quantity<%=i%>" placeholder="Qty" ></div>
									</td>
									<td class="text-center ">
										
										<select class="form-control " name="uom" id="uom<%=i%>"  style="padding-right:2px;" >
										<%=popupUnit%>
										</select>

									</td>
									<td class="text-center grp has-feedback">
										<div class="form-group" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right" name="valueOfMaterials" id="valueOfMaterials<%=i%>" placeholder=""></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="finalNegotiatedAmt" id="finalNegotiatedAmt<%=i%>" onblur="javascript:indexCal(<%=i%>);" placeholder=" "></div>
									</td>
									<td class="text-center ">
										<div class="form-group grp has-feedback" style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control " name="finalHighestBidder" id="finalHighestBidder<%=i%>" placeholder=""></div>
									</td>
									<td>
										<textarea class="form-control noresize textarea " rows="2" name="comments" maxlength="255" id="comments<%=i%>" rel="tooltip"   placeholder="Remarks" ></textarea>
									</td>
								</tr>
											
<%
								}
%>								<input type="text" name="tabSize" id="tabSize" value = "5">
								<tr id='addr1'></tr>									
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
									
										<textarea class="form-control noresize  text" rows="3" placeholder='Comments' maxlength='4000' id="userTextComments" name="userTextComments" rel="tooltip" ></textarea>
										
										<h6 class="pull-right" id="count_message"></h6>
		
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<h5 style="font-weight:bold;margin-top:0px;margin-bottom:0;">Attachments</h5>
						<hr style="margin-top:10px;margin-bottom:10px;"/>
						<div class="row " >
							<div class="col-sm-12 col-lg-8 ">
							<!-- <form  name="frmUploadFile" enctype="multipart/form-data"> -->
							<table class="table table-bordered table-hover">											
								<tr>
									<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentDisposalFile('fixedAsset','0');" > <img src="../images/attachment.png" border="0" /></a> </td>	
								</tr>	
								<tr>
									<td colspan="2"  id="attachment"></td>	<!-- <input type="text" name="hiddDirectorySizecompulsary" id="hiddDirectorySizecompulsary" value="0"> -->
									
								</tr>			
							</table>
							<!-- </form> -->
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
								<tr id='addr20'>
									<td class="text-center">
									1
									</td>
									<td>
										<select class="form-control js-example-basic-single" name="userDeptHead" id="userDeptHead" onfocus="onLoadFixedDetail('1');>
										<option value = "0" >Select Emailid</option>
										 <%=popupEmailId%>
										</select>
									</td>
																	
								</tr>					
								<tr id='addr21'></tr>									
							</tbody>				
						</table>
							<a id='delete_row2' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row2" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>

					<input type="text" name="userDeptHeadSize" id="userDeptHeadSize" value="1" type="text" />
					</div>
					
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic3">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Branch B&C
									</th>
									
								</tr>
							</thead>
							<tbody>
								<tr id='addr30'>
									<td class="text-center">
									1
									</td>
									<td>
									<select class="form-control js-example-basic-single" name="branchHead" id="branchHead" ><option value = '0' >Select Emailid</option> <%=popupEmailId%></select>
									<!-- <input type="text" class="form-control " placeholder="Branch B&C" name="branchHead" id="branchHead" value="">	 -->					
									</td>
																	
								</tr>					
								<tr id='addr31'></tr>									
							</tbody>				
						</table>
							<a id='delete_row3' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row3" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						
						<input type="text" name="branchHeadSize" id="branchHeadSize" value="1" type="text" />
					</div>

					<div class="col-xs-6  ">
						<table class="table table-bordered table-hover" id="tab_logic5">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Supported by
									</th>
									
								</tr>
							</thead>
							<tbody>
								<tr id='addr50'>
									<td class="text-center">
									1
									</td>
									<td>
									<select class="form-control js-example-basic-single" name="supportedHead" id="supportedHead" ><option value = '0' >Select Emailid</option> <%=popupEmailId%></select>
									</td>
																	
								</tr>					
								<tr id='addr51'></tr>									
							</tbody>				
						</table>
							<a id='delete_row5' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row5" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>

						<input type="text" name="supportedHeadSize" id="supportedHeadSize" value="1" type="text" />
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
								<tr id='addr70'>
									<td class="text-center">
									1
									</td>
									<td>
									<select class="form-control js-example-basic-single" name="approvedBy" id="approvedBy" ><option value = '0' >Select Emailid</option> <%=popupEmailId%></select>
	
									</td>
																	
								</tr>					
								<tr id='addr71'></tr>									
							</tbody>				
						</table>
							<a id='delete_row7' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row7" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						<input type="text" name="approvedBySize" id="approvedBySize" value="1" type="text" />
					</div>
					</div> 
					
					<div class="row ">
						<div class="col-xs-10">
							<div class="form-actions" style="margin-top:30px;">
							<div class="col-xs-offset-6 col-xs-5">
								<!-- <button type="submit" class="btn btn-info " style="width:70px;">Submit</button>	 -->
								<input type="button" class="btn btn-info" value="Submit" name="submitButton" height="20" onclick = "javascript:assetValidate('inProcess','<%=formName%>');"/>
								<button type="reset" class="btn btn-primary" style="width:70px;">Reset</button>
							</div>
							</div>
						</div>
					</div>
				</div>
	<!-- 	</div> -->

		<script>



	$(document).ready(function(){
      var j=1;
    $("#add_row2").click(function(){
		$(".js-example-basic-single").select2({ width: '100%'  });		  

		$('#addr2'+j).html("<td class='text-center'>"+ (j+1) +"</td> <td><select class='form-control js-example-basic-single' name='userDeptHead"+j+"' id='userDeptHead"+j+"' ><option value = '0' >Select Emailid</option><%=popupEmailId%></select></td>");	
			
		$('#tab_logic2').append('<tr id="addr2'+(j+1)+'"></tr>');
		j++; 

		$('#userDeptHeadSize').val(j);
		$(".js-example-basic-single").select2({ width: '100%'  });
		
	});

	

    $("#delete_row2").click(function(){
    	if(j>1){
			$("#addr2"+(j-1)).html('');
			j--;

			$('#userDeptHeadSize').val(j);
		}
	});
	});
	</script>

<script>
 
	$(document).ready(function(){		
		  var k=1;
		$("#add_row3").click(function(){
			$('#addr3'+k).html("<td  class='text-center'>"+ (k+1) +"</td> <td><select class='form-control js-example-basic-single' name='branchHead"+k+"' id='branchHead"+k+"'  placeholder='Branch B&C'><option value = '0' >Select Emailid</option><%=popupEmailId%></select> </td>");		
			$('#tab_logic3').append('<tr id="addr3'+(k+1)+'"></tr>');
			k++; 
			$('#branchHeadSize').val(k);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row3").click(function(){
			if(k>1){
				$("#addr3"+(k-1)).html('');
				k--;
				
				$('#branchHeadSize').val(k);
			}
		});
	});
	</script>

	<script>
	$(document).ready(function(){		
		  var q=1;
		$("#add_row5").click(function(){
			$('#addr5'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td><select class='form-control js-example-basic-single' name='supportedHead"+q+"' id='supportedHead"+q+"'   placeholder='Supported by'><option value = '0' >Select Emailid</option><%=popupEmailId%></select>  </td>");		
			$('#tab_logic5').append('<tr id="addr5'+(q+1)+'"></tr>');
			q++; 

			$('#supportedHeadSize').val(q);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row5").click(function(){
			if(q>1){
				$("#addr5"+(q-1)).html('');
				q--;

				$('#supportedHeadSize').val(q);
			}
		});
	});
	</script>


	<script>
	$(document).ready(function(){		
		  var s=1;
		$("#add_row7").click(function(){
			$('#addr7'+s).html("<td  class='text-center'>"+ (s+1) +"</td> <td><select class='form-control js-example-basic-single' name='approvedBy"+s+"' id='approvedBy"+s+"'   placeholder='Approved by'><option value = '0' >Select Emailid</option><%=popupEmailId%></select>  </td>");		
			$('#tab_logic7').append('<tr id="addr7'+(s+1)+'"></tr>');
			s++;
			$('#approvedBySize').val(s);
			$(".js-example-basic-single").select2({ width: '100%'  });

		});
		$("#delete_row7").click(function(){
			if(s>1){
				$("#addr7"+(s-1)).html('');
				s--;
				$('#approvedBySize').val(s);
			}
		});
	});
	</script>

<script>
	$(document).ready(function(){
 		$("#add_row").click(function(){
		var t=0;
	//	var val1 = $('#tabSize').val();
	//	alert("val1---"+val1)
		
		for (var i = 5; i < 9; i ++) {
			$('#addr'+i).html("<td>"+i+"</td> <td class='text-center'><div class='form-group ' style='margin-left:5px;margin-right:5px;'><input name='desc' id='desc"+i+"' type='text' placeholder='Description' class='form-control '  /></div> </td><td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='quantity' id='quantity"+i+"' type='text' placeholder='Qty' class='form-control text-right'  /></div> </td><td class='text-center'><div class='form-group' style='margin-left:5px;margin-right:5px;'><select name='uom' id='uom"+i+"' placeholder='UOM' class='form-control' style='padding-right:2px;'><%=popupUnit%></select></div></td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='valueOfMaterials' id='valueOfMaterials"+i+"' type='text' placeholder='' class='form-control text-right'  /> </div> </td>  <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='finalNegotiatedAmt' id='finalNegotiatedAmt"+i+"' type='text' placeholder='' class='form-control text-right' onblur='javascript:indexCal("+i+");'  /> </div></td> <td class='text-center'><div class='form-group grp has-feedback ' style='margin-left:5px;margin-right:5px;'><input name='finalHighestBidder' id='finalHighestBidder"+i+"' type='text' placeholder='' class='form-control '  /></div> </td> <td><div class='form-group  ' style='margin-left:5px;margin-right:5px;'><textarea name='comments' id='comments"+i+"' placeholder='Remarks' class='form-control noresize textarea' rows='2' maxlength='255' id='textarea' rel='tooltip' title=''/></textarea> </div></td> ");		
			$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
			$("#add_row").hide();
			t = i;
			};
		//	alert("outside3 loop===="+i)
			$('#tabSize').val(t);

			
		});

		$("#delete_row").click(function(){
			var val1 = $('#tabSize').val();
			var x = parseInt(val1)+1;
			if(x>5){
				//alert("inside delete loop===="+i)

				$("#addr"+(x-1)).html('');
				x--;

				$('#tabSize').val(x-1);
			}
			$("#add_row").show();
		});
});
</script>

<!-- <script>
	$(document).ready(function(){  
  $(".sel").change(function() {   
    $(".sel").not(this).find("option[value="+ $(this).val() + "]").attr('disabled', true);
  }); 
}); 
	</script>  -->

	<!-- <script>
	$(document).ready(function(){
		$(".go").change(function(){
			var selVal=[];
			$(".go").each(function(){
				selVal.push(this.value);
			});
		   
			$(this).siblings(".go").find("option").removeAttr("disabled").filter(function(){
			   var a=$(this).parent("select").val();
			   return (($.inArray(this.value, selVal) > -1) && (this.value!=a))
			}).attr("disabled","disabled");
		});

		$(".go").eq(0).trigger('change');
		});
	</script>
 -->