<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<%@ page errorPage="../includes/error.jsp" %>  
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Capex Proposal</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
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
.wideInput{
    text-align: left;
    padding-left:0;
    padding-top:0;
    padding-bottom:0.4em;
    padding-right: 0.4em;
    width: 400px;
    height: 200px;
}
.wide2input{
    text-align: left;
    padding-left:0;
    padding-top:0;
    padding-bottom:0.4em;
    padding-right: 0.4em;
    width: 400px;
    height: 200px;
}
.form-horizontal .form-group {
    margin-right: 0px;
    margin-left: 0px;
}
.capextext{
text-align:left!important;}
.form-control{padding-left:3px;}

</style> 
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="../jscript/select2.min.js"></script>
<script src="../jscript/bootstrap-maxlength.min.js"></script>
<script src="../jscript/capex.js"></script>
<script src="../jscript/common.js"></script>
	<script>
	$(document).ready(function() {
		$('body').on('focus',"#projectTitle", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#reasonIfUnbudgeted", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#rationale", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#projectDescription", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		
		$('body').on('focus','#particulars0', function(){
				$(this).maxlength({alwaysShow: true});		
			});
		
		$('body').on('focus',"#opexParticulars0", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		  
		
//	$('body').on('focus',".datepicker", function(){
			$("#proposalDate").datepicker({ dateFormat: 'dd-M-yy', minDate:0 });	
            $("#proposalDate").datepicker("setDate", new Date());
	        //$("#projectStartDate").datepicker({ dateFormat: 'dd-M-yy',minDate:0 });	
	        //$("#projectEndDate").datepicker({ dateFormat: 'dd-M-yy',minDate:0 });	
	        //$("#projectCloseOutReport").datepicker({ dateFormat: 'dd-M-yy',minDate:0 });	
			
			
		$("#projectStartDate").datepicker({
			dateFormat: 'dd-M-yy',
			minDate: 0,
			numberOfMonths: 1,
			onSelect: function(selected) {
				$("#projectEndDate").datepicker("option","minDate", selected)	
			}
		});
		$("#projectEndDate").datepicker({ 
			dateFormat: 'dd-M-yy',
			minDate: 0,
			numberOfMonths: 1,
			onSelect: function(selected) {
				$("#projectStartDate").datepicker("option","maxDate", selected),
				$("#projectCloseOutReport").datepicker("option","minDate", selected)
			}
		});  
			
		$("#projectCloseOutReport").datepicker({ 
			dateFormat: 'dd-M-yy',
			minDate: 0,
			numberOfMonths: 1,
			onSelect: function(selected) {
				$("#projectEndDate").datepicker("option","maxDate", selected)
			}
		}); 
//	});
		
	$(".multi").select2({ width: '100%'  });

    function toggleNavbarMethod() {
        if ($(window).width() > 768) {
            $('.navbar .dropdown').on('mouseover', function(){
                $('.dropdown-toggle', this).trigger('click'); 
            }).on('mouseout', function(){
                $('.dropdown-toggle', this).trigger('click').blur();
            });
        }
        else {
            $('.navbar .dropdown').off('mouseover').off('mouseout');
        }
    }
    toggleNavbarMethod();
    $(window).resize(toggleNavbarMethod);	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
});
	</script>		
	<script>
	$(document).ready(function(){		
		
    var q=1;
        $("#add_row3").click(function(){
        $('#addr'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td class='text-center'><input type='text' maxlength='50' class='form-control text-left ' name='particulars"+q+"' id='particulars"+q+"' ></td><td class='text-center'><input type='text' class='form-control  text-right' onblur='javascript:BlankNumber(\"Estimated Cost\",\"estimatedCost"+q+"\");calculateTotal();' name='estimatedCost"+q+"' id='estimatedCost"+q+"' maxlength='10' placeholder='Format (00.00)'></td>");
        $('#tab_logic1').append('<tr id="addr'+(q+1)+'"></tr>');
        q++; 
        $("#counter").val(q);		
        });
        $("#del_row2").click(function(){
            if(q>1){
                $("#addr"+(q-1)).html('');
                q--;
               $("#counter").val(q);
               calculateTotal();
                }
                });
             });
    </script>
	
	<script>
	$(document).ready(function(){
    var q1=1;
        $("#add_row4").click(function(){
        $('#opex'+q1).html("<td  class='text-center'>"+ (q1+1) +"</td> <td class='text-center'><input type='text' class='form-control text-left ' name='opexParticulars"+q1+"' id='opexParticulars"+q1+"' ></td><td class='text-center'><input type='text' class='form-control  text-right' onblur='javascript:BlankNumber(\"Estimated Cost\",\"opexEstimatedCost"+q1+"\");calculateOpexTotal();' name='opexEstimatedCost"+q1+"' id='opexEstimatedCost"+q1+"' maxlength='10' placeholder='Format (00.00)'></td>");
        $('#tab_logic2').append('<tr id="opex'+(q1+1)+'"></tr>');
        q1++; 
        $("#opexCounter").val(q1);
        });
        $("#del_row3").click(function(){
            if(q1>1){
                $("#opex"+(q1-1)).html('');
                q1--;
               $("#opexCounter").val(q1);
               calculateOpexTotal();
                }
                });
             });
             </script>
</head>
<%
    Hashtable ht = new Hashtable();
    ht.put("COMPANYCODE",1000);
    ht.put("APPLICATION_NAME","capex");
  //  ArrayList locList =  capexHeaderController.listLocations(ht);
  //  ArrayList deptList = capexHeaderController.listDepartments(ht);
    //ht.put("DEPTCODE",deptGroup);
 //   ArrayList emailList = capexHeaderController.getEmailId(ht);
   // ht.put("PAYROLLTYPE","ADIR");
	//ht.remove("DEPTCODE");
   // ArrayList drList = capexHeaderController.getEmailId(ht);

    
 
    String locStr = null;
    String deptStr = null;
    String emailStr = null;
    String drStr = null;
 
  
	Hashtable hTable2 = new Hashtable();
	hTable2.put("DOCUMENTOID","DOC1005");
	hTable2.put("PROFILETEXT","COORDINATOR");
	hTable2.put("APPLICATION_NAME","capex");
	//hTable2.put("","");
	ArrayList coordinatorArray = capexDeatilsController.listLocation(hTable2);	
 
	String codinatorList = "";
 //  int sizeStrArray = coordinatorArray.length;
   int sizeStrArray = coordinatorArray.size();
      //      out.println ( " sizeStrArray " + sizeStrArray);
            if( sizeStrArray > 0){  
                    for (int e = 0; e < sizeStrArray; e++) {
                     String headerData1[] = (String[]) coordinatorArray.get(e);      
                  //  out.println ( " headerData[12] " + headerData1[12]);
					
                    // if(emailId.equals(headerData1[12])){
                       //  codinatorList+="<option value=\""+headerData1[12]+"\" selected style=normal>"+headerData1[12]+"</option>";
                   //  }else{
                            codinatorList+="<option value=\""+headerData1[12]+"\" style=normal>"+headerData1[12]+"</option>";
                   // }
                    }
                }
			
	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
	int currYear = cal.get(Calendar.YEAR);
	int currMonth = cal.get(Calendar.MONTH);
    if(currMonth<3)
        currYear = currYear - 1;
	int lastYear = currYear - 1;
	int selYear = 0;
    String faYearL = String.valueOf(lastYear);
    String faYearS = String.valueOf(currYear);
    String faYearE = String.valueOf(currYear+1);
	String faYearF = String.valueOf(currYear+2);
	
%>
<body onload="onLoadDetail('0','create');"> 
<form action="#" class="form-horizontal" role="form" name="create" method="Post">
<%@ include file="../includes/relatedLinksnew.jsp" %>

	<div class="container-fluid ">
	<div class="row">

	<div class="col-xs-12 ">
    <div class="text-right"><font color="red"><b> Rs. in Lakhs</b></font></div>
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Capex Proposal
     
	</div>			
	</div>
	<div class="portlet-body">
				
				<div class="row">
					<div class="col-xs-8">
						<div class="form-group">
							<label class="control-label col-xs-3">Project Title</label>
							<div class="col-xs-9">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-bars" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control" placeholder="Project Title"  name="projectTitle" id="projectTitle" maxlength="100"> 
								</div>
							</div>
						</div>
					</div>
				 </div>
				 
						<div class="row">						
					<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Proposal Date </label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-calendar" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control input-xs datepicker" placeholder="Date" name="proposalDate" id="proposalDate" disabled>
										</div>
									</div>
								</div>
							</div>
				
				</div>
				<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-4">Proposed Amount</label>
								<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-inr" style="width:11px;"></i>
									</span>
									<input type="text" class="form-control"  placeholder="Rs. in Lakhs, Format (00.00)"   style = "text-align:right;" name="proposedAmount" id="proposedAmount" value="" onblur = "javascript:BlankNumber('Proposed Amount','proposedAmount');" maxlength="10"> 
									</div>
								</div>
							</div>
						</div>
			
					<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Opex Amount</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-inr" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control"  style = "text-align:right;" placeholder="Rs. in Lakhs, Format (00.00)" name="opexAmount" id="opexAmount" value="" onblur = "javascript:BlankNumber('Opex Amount','opexAmount');" maxlength="10"> 
										</div>
									</div>
								</div>
							</div>												
				</div>
				
				<div class="row">						
							
							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Location</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-bars" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Location" name="proLocation" id="proLocation" maxlength="50" onkeyup="lookupAll(this.value,'suggestions','autoSuggestionsList','loc');">											
										</div>
										<div class="suggestionsBox" id="suggestions" style="display:none;text-align:left;" class="form-control">
											<div class="suggestionList Breakword" id="autoSuggestionsList" style="padding-left:2px;text-align:left;">
										</div>
										</div>
									</div>
								</div>
							</div>
						 		<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Function</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-bars" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Function" name="proFunction" id="proFunction" maxlength="50" onkeyup="lookupAll(this.value,'suggestions2','autoSuggestionsList2','dept');">											
										</div>
										<div class="suggestionsDeptBox" id="suggestions2" style="display:none;text-align:left;" class="form-control">
											<div class="suggestionList Breakword" id="autoSuggestionsList2" style="padding-left:2px;text-align:left;">
										</div>
										</div>
									</div>
								</div>
							</div>					
						</div>
				<div class="row">				
					<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Project Manager</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-bars" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Project Manager" name="projectManager" 
										id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email'); ">						
										</div>
										<div class="suggestionsManagerBox" id="suggestions1" style="display:none;text-align:left;" class="form-control">
											<div class="suggestionList Breakword" id="autoSuggestionsList1" style="padding-left:2px;text-align:left;">
										</div>
										</div>
									</div>
								</div>
							</div>
					<div class="col-xs-6">
							<div class="form-group ">
								<label class="control-label col-xs-4">Project Category</label>
								<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-cogs" style="width:11px;"></i>
									</span>
									<select class="form-contr  multi" name="projectCategory" id="projectCategory" >										
										<option value="0">SELECT CATEGORY</option>	
                                        <option value="Productivity Improvement">Productivity Improvement</option>	
										<option value="Capacity Enhancement">Capacity Enhancement</option>
										<option value="Statutory Compliance">Statutory Compliance</option>
										<option value="Infrastructure">Infrastructure</option>
										<option value="Saving Payback">Saving/Payback</option>
										<option value="Obsolescence Replacement">Obsolescence/Replacement</option>
									</select>
									</div>
								</div>
							</div>
						</div>				
				</div>
				
				<div class="row">					
					<div class="col-xs-6">
							<div class="form-group ">
								<label class="control-label col-xs-4">Financial Year</label>
								<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-cogs" style="width:11px;"></i>
									</span>
									<select class="form-contr  multi" name="financialYear" id="financialYear" >										
										<option value="0">SELECT FINANCIAL YEAR</option>	
                                        <option value="<%=faYearE+"-"+faYearF.substring(2,faYearF.length())%>" ><%=faYearE+"-"+faYearF.substring(2,faYearF.length())%></option>			
                <option value="<%=faYearS+"-"+faYearE.substring(2,faYearE.length())%>" selected><%=faYearS+"-"+faYearE.substring(2,faYearE.length())%></option>
                
									</select>
									</div>
								</div>
							</div>
						</div>	
					
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Budget Amount</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-inr" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control"  placeholder="Rs. in Lakhs, Format (00.00)"  style = "text-align:right;" name="budgetAmount" id="budgetAmount" value="" onblur = "javascript:BlankNumber('Budget Amount','budgetAmount');" maxlength="10"> 
								</div>
							</div>
						</div>
					</div>
					
				
				</div>
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project Start Date</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-calendar" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control datepicker"  name="projectStartDate" id="projectStartDate" value="" placeholder="Date" readonly>
								</div>
							</div>
						</div>
					</div>
                
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project End Date</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-calendar" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control datepicker"  name="projectEndDate" id="projectEndDate" value="" placeholder="Date" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Reasons If Unbudgeted</label>
							<div class="col-xs-8">
								<textarea class="form-control noresize" rows="2" maxlength='100' id='reasonIfUnbudgeted'  name= 'reasonIfUnbudgeted' > </textarea>
							</div>
						</div>
					</div>					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project close-out Date</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-calendar" style="width:11px;"></i>
								</span>								
                                <input type="text" class="form-control datepicker"  name="projectCloseOutReport" id="projectCloseOutReport" value="" placeholder="Date" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<div class="row">						
				<div class="col-xs-6">
				<table class="table table-bordered">
					<tbody>				
						<tr>
							<td class="text-left"><b>Rationale</b></td>
                            </tr>
                            <tr>
							<td class="text-center ">							
							<div class="form-group grp " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='1000' id='rationale' name = 'rationale' style="overflow-y:hidden;" ></textarea></div>							
						</td>
						</tr>
					</tbody>
                  </table>
				  </div>
				<div class="col-xs-6">
				<table class="table table-bordered">
					<tbody>	
					<tr>
				<td class="text-left"><b>Project Description</b></td></tr>
				<tr><td class="text-right ">
				
				<div class="form-group grp " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='1000' id='projectDescription'  name = 'projectDescription' style="overflow-y:hidden;" ></textarea></div>				
				</td>
						</tr>
						</tbody>
                  </table>
				  </div>	
				  </div>	
				 <div class="row">						
				<div class="col-xs-6">
				<table class="table table-bordered" id="tab_logic1">
				<thead>
					<tr class="info" >
						<th class="text-center" width="15%" colspan="3" style="text-align:left;">Capex Details (Rs. in Lakhs)</th>
					</tr>
				</thead>
				<thead>
					<tr class="active">
						<th class="text-center" width="2%">Sr.No.</th>
						<th class="text-center" width="19%">Particulars</th>
						<th class="text-center" width="9%">Estimated Cost</th>						
					</tr>
				</thead>
				<tfoot>
					<tr class="active">
						<td></td>
						<td >TOTAL CAPEX</td>
						<td class="text-right"><input type="text" class="form-control text-left " name="totalCapexAmt"  style = "text-align:right;" id="totalCapexAmt" readonly  ></td>
					</tr>
			  </tfoot>
				<tbody>  
					<tr id='addr0'>
                    <td class="text-center">1</td>
                    <td class="text-center"><input type="text" class="form-control text-left " maxlength="50" name="particulars0" id="particulars0" value="" ></td>
                    <td class="text-center"><input type="text" class="form-control  text-right" name="estimatedCost0" id="estimatedCost0" value=""  onblur='javascript:BlankNumber("Estimated Cost","estimatedCost0");calculateTotal();' placeholder="Rs. in Lakhs, Format (00.00)" maxlength="10"></td>
					</tr>
					<tr id='addr1'></tr>
					
				</tbody>
			</table>
			<a id='del_row2' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row3" class="btn btn-default pull-right btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> Add Row</a>
			</div>
								
			<div class="col-xs-6">
			<table class="table table-bordered" id="tab_logic2">
				<thead>
					<tr class="info" >
						<th class="text-center" width="15%" colspan="3" style="text-align:left;">Opex Details (Rs. in Lakhs)</th>
					</tr>
				</thead>
				<thead>
					<tr class="active">
						<th class="text-center" width="2%">Sr.No.</th>
						<th class="text-center" width="19%">Particulars</th>
						<th class="text-center" width="9%">Estimated Cost</th>						
					</tr>
				</thead>
				<tfoot>
					<tr class="active">
						<td></td>
						<td >TOTAL OPEX</td>
						<td class="text-right"><input type="text" class="form-control text-left " name="totalOpexAmt"  style = "text-align:right;" id="totalOpexAmt" readonly  ></td>
					</tr>
			  </tfoot>
				<tbody>
					<tr id='opex0'>
                    <td class="text-center">1</td>
                    <td class="text-center"><input type="text" class="form-control text-left " maxlength="50" name="opexParticulars0" id="opexParticulars0" value="" ></td>
                    <td class="text-center"><input type="text" class="form-control  text-right" name="opexEstimatedCost0" id="opexEstimatedCost0" value=""  onblur='javascript:BlankNumber("Estimated Cost","opexEstimatedCost0");calculateOpexTotal();' placeholder="Rs. in Lakhs, Format (00.00)" maxlength="10"></td>
					</tr>
					<tr id='opex1'></tr>
					
				</tbody>
			</table>
			<a id='del_row3' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row4" class="btn btn-default pull-right btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> Add Row</a>
			</div>
			</div>
            	<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center" width="50%">Asset Disposal</td>
										<td class="text-center"><input type="text" class="form-control  " placeholder="Rs. in Lakhs, Format (00.00)"  style = "text-align:right;" name="assetDisposal" id="assetDisposal" value="" onblur = "javascript:BlankNumber('Asset Disposal','assetDisposal');" maxlength="10"></td>
									</tr>
									<tr>
										<td class="text-center" width="50%">Savings Envisaged</td>
										<td class="text-center"><input type="text" class="form-control  " placeholder="Rs. in Lakhs, Format (00.00)" name="savingsEnvisaged"   style = "text-align:right;" id="savingsEnvisaged" value=""  onblur = "javascript:BlankNumber('Savings Envisaged','savingsEnvisaged');" maxlength="10"></td>
									</tr>
									
									<tr>
										<td class="text-center" width="50%">Payback Period(Yrs/Month)</td>
										<td class="text-center"><input type="text" class="form-control  "  placeholder="Rs. in Lakhs, Format (12 Months)" name="paybackPeriod" id="paybackPeriod"  value="" maxlength="15"></td>
									</tr>
								</tbody>
							</table>			
			<div class="row">
				
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic3">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Project Sponsor
									</th>
									
								</tr>
							</thead>
							<tbody>
								<tr id='addr30'>
									<td class="text-center">
									1
									</td>
									<td>									
										<input type="text" class="form-control" placeholder="PROJECT SPONSOR" name="projectSponsor" 
										id="projectSponsor" maxlength="50" onkeyup="lookupAll(this.value,'suggestions3','autoSuggestionsList3','coor'); ">										
										<div class="suggestionsCoorBox" id="suggestions3" style="display:none;text-align:left;" class="form-control">
											<div class="suggestionList Breakword" id="autoSuggestionsList3" style="padding-left:2px;text-align:left;">
										</div>
										</div>	
									</td>
																	
								</tr>					
								<tr id='addr31'></tr>									
							</tbody>				
						</table>							
					</div>
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic5">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Project Co-ordinator
									</th>									
								</tr>
							</thead>
							<tbody>
								<tr id='addr50'>
									<td class="text-center">
									1
									</td>
									<td>
									<select class="form-contr  multi" name="projectCoordinator" id="projectCoordinator" onfocus="onLoadDetail('1','create');" >
                                    <option value="0">SELECT PROJECT COORDINATOR</option>
                                    <%=codinatorList%>
										</select>					
									</td>																	
								</tr>					
								<tr id='addr51'></tr>									
							</tbody>				
						</table>						
					</div>
					</div>					
					 <div class="row">  
						<div class="col-xs-12  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="2" class="text-center" >
												Attached Documents
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','0','create');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>	
										<tr>
											<td colspan="2"  id="attachment1"></td>											
										</tr>
									</tbody>			
								</table>
							</div>
							</div>		
			<div class="form-actions">
				<div class="row">
					<div class="col-xs-8">
						<div class="row">
							<div class="col-xs-offset-7 col-xs-5">
								<button type="Button" name= "Submit" class="btn btn-danger" onClick = "submitProposal('Submit');">Submit</button>
								<button type="Button" name= "Draft" class="btn btn-danger" onClick = "submitProposal('Draft');">Save as Draft</button>
								<input type="hidden" class="form-control  " name="counter" id="counter"  value="1">
								<input type="hidden" class="form-control  " name="opexCounter" id="opexCounter"  value="1">
							</div>
						</div>
					</div>
					<div class="col-xs-6">
					</div>
				</div>
			</div>
		
	</div>
	</div>			
	</div>
	
  </div>   
</div>
</form>	
<footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>

</html>
