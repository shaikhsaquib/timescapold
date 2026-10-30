<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<%@ page errorPage="../includes/error.jsp" %>  
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Capital Expenditure View  </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
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
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
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
	$('body').on('focus',".datepicker1", function(){
			$(this).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,
      changeYear: true });	
	});	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
});
	</script>
	
</head>
<%
	String locStr = null;
	String deptStr = null;
	String emailStr = null;
	String drStr = null;
	String createdBy = null;
	String headerData[] = null; 
	String proposalNo = null;
    String requestId = (String)  request.getParameter("id");
    String status = "";//(String)  request.getParameter("status");
    Hashtable htable = new Hashtable();
    ArrayList arraySer = new ArrayList();
    //out.println ( " status " + status);
    String remark1 ="";
	//proposalNo = requestId;
    String activeFlag ="";
    String disabledFlag ="";	
//	emailId ="rishiraj.shukla@timesgroup.com";
status = "A";
   
	
  
	Hashtable ht = new Hashtable();
	String appData = "";
	String appListData ="";   
	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment","attachmentFolderName"};
	
    ht.put("DETAILSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1005");
    ht.put("REQUESTOID", requestId);
    
 
	ArrayList headerDataList =  capexDetailsController.view("sdf","sdfsd",ht);	
    
    int headerSize = headerDataList.size();
	//out.println (" headerSize : " +  headerSize);
     if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
           
          //  for (int eee1 = 0; eee1 < headerData.length; eee1++) {
                createdBy = headerData[4];
				//out.println (" createdBy : " +  createdBy);
       //  out.println (" headerData [ "+ eee1 +"] : " +  headerData[eee1]);
          //  }
        }
    }	
        activeFlag = "readonly";
        disabledFlag = "disabled";
	
	
%>
<body onload = "showAttachmentFile('1','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard')"> 
<%@ include file="../includes/relatedLinksnew.jsp" %>
	<div class="container-fluid ">
	<div class="row">
		
	<div class="col-xs-12">
	<div class="text-right"><font color="red"><b> Rs. in Lakhs</b></font></div>
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Capital Expenditure View
	</div>			
	</div>
	<div class="portlet-body">
		<form action="#" class="form-horizontal" role="form" name="viewWizard">
			<div class="form-body">
				<h4 class="form-section " ><b>Project Description</b></h4><hr>
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label class="control-label col-xs-2">Project Title</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-bars" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control" placeholder="Project Title" name="projectTitle" id="projectTitle" value="<%=headerData[6]%>" disabled> 
								</div>
							</div>
						</div>
					</div>
				 </div>
				 <div class="row">
							<div class="col-xs-6">
								<div class="form-group grp">
									<label class="control-label col-xs-4">Proposal No.<span style="color: #e32;"></span></label>
									<div class="col-xs-8">
									<div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-list-ol" style="width:11px;"></i>
										</span>
													
										<input type="text" class="form-control text-right" placeholder="Proposal No" name="proposalNo" id="proposalNo"  value="<%=headerData[7]%>" disabled>
										
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
									<select class="form-contr  multi" name="projectCategory" id="projectCategory" <%=disabledFlag%>>									
									<option value="<%=headerData[8]%>"><%=headerData[8]%></option>
									</select>
									</div>
								</div>
							</div>
							</div>							
						</div>
						
				<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-4">Capex Amount</label>
								<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-inr" style="width:11px;"></i>
									</span>
									<input type="text" class="form-control text-right"  placeholder="Capex Amount" name="capexAmount" id="capexAmount" value="<%=headerData[9]%>" <%=activeFlag%> maxlength="7"> 
									</div>
								</div>
							</div>
						</div>
					<!--/span-->
					<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Opex Amount</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-inr" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control text-right" placeholder="Opex Amount" name="opexAmount" id="opexAmount" value="<%=headerData[10]%>" <%=activeFlag%> maxlength="7"> 
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
										<i class="fa fa-map-marker" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Location" name="proLocation" id="proLocation" maxlength="50" onkeyup="lookupAll(this.value,'suggestions','autoSuggestionsList','loc');" <%=disabledFlag%> value="<%=headerData[11]%>">									
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
										<i class="fa fa-cog" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Function" name="proFunction" id="proFunction" maxlength="50" onkeyup="lookupAll(this.value,'suggestions2','autoSuggestionsList2','dept');" <%=disabledFlag%> value="<%=headerData[12]%>"></div>
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
								<i class="fa fa-users" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control" placeholder="Project Manager" name="projectManager" 
								id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email');" <%=disabledFlag%> value="<%=headerData[13]%>"></div>
								<div class="suggestionsManagerBox" id="suggestions1" style="display:none;text-align:left;" class="form-control">
									<div class="suggestionList Breakword" id="autoSuggestionsList1" style="padding-left:2px;text-align:left;">
								</div>
								</div>
							</div>
						</div>
					</div>						
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project Duration</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-calendar" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control"  placeholder="Project Duration"  name = "projectDuration" id ="projectDuration" value="<%=headerData[14]%>" <%=activeFlag%> maxlength="25">
								
							</div>
							</div>
						</div>
					</div>					
					
				</div>				
				<div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Budget Amount</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-inr" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control text-right"  placeholder="Budget Amount" name="budgetAmount" id="budgetAmount" value="<%=headerData[15]%>" <%=activeFlag%> maxlength="7"> 
								</div>
							</div>
						</div>
					</div>
					 <div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Keywords</label>
							<div class="col-xs-8">
								<input type="text" class="form-control text-left " name="keywords" id="keywords"  value="<%=headerData[16]%>" <%=activeFlag%> maxlength="20">
							</div>
						</div>
					</div>
				 </div>
				 <div class="row">
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Reasons If Unbudgeted</label>
							<div class="col-xs-8">
								<textarea class="form-control noresize" rows="3" maxlength='100' id='reasonIfUnbudgeted' name = 'reasonIfUnbudgeted' <%=activeFlag%>><%=headerData[17]%></textarea>
							</div>
						</div>
					</div>
				</div>	
				<hr>
				<div>
				  <table class="table table-bordered">
						<thead>
							<tr class="warning" >
								<th class="text-center" width="15%" colspan="6" style="text-align:left;">Cost Projections (Rs. in Lakhs)</th>
							</tr>
						</thead>
							<thead>
								<tr class="info">
									<th class="text-center" width="15%">Expenditure</th>
									<th class="text-center" width="15%">Year 1</th>
									<th class="text-center" width="15%">Year 2 </th>
									<th class="text-center" width="15%">Year 3</th>
									<th class="text-center" width="15%">Year 4</th>
									<th class="text-center" width="15%">Year 5</th>							
								</tr>
							</thead>
						<tbody>
						<tr>
							<td class="text-center">Capex</td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex1"  id="capex1" placeholder="" onblur = "javascript:checkBlankNumber('Capex','capex1');" maxlength="7" value="<%=headerData[18]%>" <%=activeFlag%>> </div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex2"  id="capex2" placeholder="" onblur = "javascript:checkBlankNumber('Capex','capex2');" maxlength="7" value="<%=headerData[19]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex3"  id="capex3" placeholder="" onblur = "javascript:checkBlankNumber('Capex','capex3');" maxlength="7" value="<%=headerData[20]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex4"  id="capex4" placeholder="" onblur = "javascript:checkBlankNumber('Capex','capex4');" maxlength="7" value="<%=headerData[21]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex5"  id="capex5" placeholder="" onblur = "javascript:checkBlankNumber('Capex','capex5');" maxlength="7" value="<%=headerData[22]%>" <%=activeFlag%>></div></td>							
						</tr>
						<tr>
							<td class="text-center">Opex</td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex1"  id="opex1" placeholder="" onblur = "javascript:checkBlankNumber('Opex','opex1');" maxlength="7" value="<%=headerData[23]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex2"  id="opex2" placeholder="" onblur = "javascript:checkBlankNumber('Opex','opex2');" maxlength="7" value="<%=headerData[24]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex3"  id="opex3" placeholder="" onblur = "javascript:checkBlankNumber('Opex','opex3');" maxlength="7" value="<%=headerData[25]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex4"  id="opex4" placeholder="" onblur = "javascript:checkBlankNumber('Opex','opex4');" maxlength="7" value="<%=headerData[26]%>" <%=activeFlag%>></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex5"  id="opex5" placeholder="" onblur = "javascript:checkBlankNumber('Opex','opex5');" maxlength="7" value="<%=headerData[27]%>" <%=activeFlag%>></div></td>
							
						</tr>
						</tbody>
					</table>				
				</div>		
				<h4 class="form-section "><b>Project Snapshot</b></h4><hr>
				<div class="row">
				  <div class="col-xs-6">				
					<table class="table table-bordered">
						<tbody>	
						<tr>
							<td class="text-left" width="18%">Rationale</td>
							<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="5" maxlength='500' id='rationale' name="rationale" <%=activeFlag%>><%=headerData[29]%>
							</textarea></div></td>
						</tr>
						</tbody>
					</table>
				 </div>
					<div class="col-xs-6">				
						<table class="table table-bordered">
						<tbody>	
							<tr>
								<td class="text-left" width="18%">Recommendation</td>
								<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="5" maxlength='500' id='background' name="background" <%=activeFlag%>><%=headerData[28]%>
								</textarea></div></td>
							</tr>							
						</tbody>
					</table>
				</div>
				</div>
				<div class="row">
				  <div class="col-xs-6">
				  <table class="table table-bordered">
						<tbody>
						<tr>
								<td class="text-left" width="18%">Project Scope</td>
								<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="5" maxlength='500' id='projectScope'  name='projectScope' <%=activeFlag%>><%=headerData[30]%></textarea></div></td>
							</tr>
						</tbody>
					</table>
					</div>
					<div class="col-xs-6">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="text-left" width="18%">Alternatives Considered</td>
								<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="5" maxlength='500' id='alternativesConsidered' name= 'alternativesConsidered'  <%=activeFlag%>><%=headerData[31]%></textarea></div></td>
							</tr>							
						</body>
				  </table>		
				  </div>
				</div>
				<div class="row">
				  <div class="col-xs-6">
				  <table class="table table-bordered">
					<tbody>
						<tr>
							<td class="text-left" width="18%">Risks</td>
							<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="5" maxlength='500' id='risks'  name='risks' <%=activeFlag%>><%=headerData[32]%> </textarea></div></td>
						</tr>
					</tbody>
					</table>
				  </div>
				</div>
				<h4 class="form-section "><b>Cost Summary</b></h3><hr>
				<table class="table table-bordered" id="tab_logic1">
				<thead>
					<tr class="warning" >
						<th class="text-center" width="15%" colspan="6" style="text-align:left;">Capex Details (Rs. in Lakhs )</th>
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="2%">Sr.No.</th>					
						<th class="text-center" width="17%">Header</th>
						<th class="text-center" width="17%">Particulars</th>
						<th class="text-center" width="12%">Quantity/Jobs</th>
						<th class="text-center" width="12%">Estimated Cost</th>
						<th class="text-center" width="9%">Total Cost</th>						
					</tr>
				</thead>
				<tfoot>
					<tr class="success">
						<td></td>
						<td colspan="4">TOTAL CAPEX</td>
						<td class="text-right"><input type="text" class="form-control text-left " name="totalCapexAmt"  style = "text-align:right;" id="totalCapexAmt"  value="<%=headerData[38]%>" <%=activeFlag%>> </td>
					</tr>
			  </tfoot>
				<tbody>
				<%                 
                        String headers [] = headerData[33].split("~");   
                        String particulars [] = headerData[34].split("~");   
                        String quantities [] = headerData[35].split("~");   
                        String estimatedCosts [] = headerData[36].split("~");              
                        String totalCosts [] = headerData[37].split("~");    
						int hCounter = headers.length;					
                        for(int ii=0 ;ii < hCounter; ii++){
                %>
					<tr id='rowId9<%=(ii)%>'>						
						<td class="text-center"><%=(ii+1)%></td>
						<td class="text-center"><input type="text" class="form-control text-left " name="header<%=ii%>" id="header<%=ii%>" value="<%=headers[ii]%>" <%=activeFlag%> maxlength="20"></td>
						<td class="text-center"><input type="text" class="form-control text-left " name="particulars<%=ii%>" id="particulars<%=ii%>" value="<%=particulars[ii]%>" <%=activeFlag%> maxlength="20"></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="quantity<%=ii%>" id="quantity<%=ii%>" value="<%=quantities[ii]%>" <%=activeFlag%> maxlength="5" onblur = "javascript:calculateTotalQuantity();"></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="estimatedCost<%=ii%>" id="estimatedCost<%=ii%>" value="<%=estimatedCosts[ii]%>" <%=activeFlag%> maxlength="7" onblur = "javascript:checkBlankNumber('Estimated Cost','<%=estimatedCosts[ii]%>'); calculateTotalQuantity();" ></td>
						<td class="text-center"><input type="text" class="form-control text-right " name="totalCost<%=ii%>" id="totalCost<%=ii%>" value="<%=totalCosts[ii]%>" disabled ></td>				
					</tr>
					
						<% } %>	
						<tr id='rowId9<%=hCounter%>'>									
				</tbody>
			</table>
			<%   
						//if(createdBy.equals(emailId)){  
								if("I".equals(status)){
									%>
			<a id='row4_del' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="row4_add" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a><br>
            <input type="hidden" class="form-control  " name="counter" id="counter"  value="<%=hCounter%>">
								<% } %>
			<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center">Savings Envisaged</td>
										<td class="text-center"><input type="text" class="form-control text-right" name="savingsEnvisaged" id="savingsEnvisaged" value="<%=headerData[39]%>" <%=activeFlag%> maxlength="7"></td>
									</tr>									
									<tr>
										<td class="text-center">Payback Period(yrs/Month)</td>
										<td class="text-center"><input type="text" class="form-control" name="paybackPeriod" id="paybackPeriod"  value="<%=headerData[40]%>" <%=activeFlag%> maxlength="15"></td>
									</tr>
								</tbody>
							</table>
			<h4 class="form-section "></h3><hr>
			<div class="row">				
				<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic4">			
							<thead>
								<tr >
									<th class="text-center" >
										Sr.No.
									</th>
									<th class="text-center">
										Supported/Recommended By 
									</th>									
								</tr>
							</thead>
							<tbody>
							<%                 
								String reviewedBy [] = headerData[41].split(";"); 	
								int reviewedByCount = reviewedBy.length;	
								//out.println(" reviewedByCount "+reviewedByCount);									
								for(int jj=0 ;jj<reviewedByCount ; jj++){
								
							%>
								<tr id='addr4<%=jj%>'>
									<td class="text-center">
									<%=(jj+1)%>
									</td>
									<td><select class="form-control  multi" name="reviewedBy<%=jj%>" id="reviewedBy<%=jj%>" <%=disabledFlag%>>
										<option value="<%=reviewedBy[jj]%>" style=normal><%=reviewedBy[jj]%></option>
									</select>
									</td>																	
								</tr>									
									<% 
										} %>	
							<tr id='addr4<%=(reviewedByCount)%>'>										
							</tbody>				
						</table>
						<%   
				//	if(createdBy.equals(emailId)){  
								if("I".equals(status)){ 
								%>
						<a id='delete_row4' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row4" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						<% }%>
                         <input type="hidden" class="form-control" name="revCounter" id="revCounter" value="<%=reviewedByCount%>">	</div>					
					<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic5">			
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
								String approvedBy [] = headerData[42].split(";"); 	
								String appDataArray [] = appData.split(";"); 	
								
								int approvedByCount = approvedBy.length;		
							//	out.println(" approvedByCount "+approvedByCount);					
								for(int kk=0 ;kk<approvedByCount ; kk++){										
									
								%>
								<tr id='addr5<%=kk%>'>
									<td class="text-center">
									<%=(kk+1)%>
									</td>
									<td>
								<%   // out.println(" createdBy " +createdBy); %>
									<select class="form-control  multi" name="approvedBy<%=kk%>" id="approvedBy<%=kk%>" onfocus="showAttachmentFile('additional','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard');" <%=disabledFlag%>>								
									<option value="<%=approvedBy[kk]%>" style=normal><%=approvedBy[kk]%></option>
									                                 
									</select>									
									</td>																	
								</tr>
															
								<%  } %>	
								<tr id='addr5<%=approvedByCount%>'>									
							</tbody>				
						</table>
						<% //if(createdBy.equals(emailId)){ 
						if("I".equals(status)){
						%>
						<a id='delete_row5' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row5" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
						<% } %>
                         <input type="hidden" class="form-control" name="appCounter" id="appCounter" value="<%=approvedByCount%>">						
					</div>
					<br/><br/>
					<div class="col-sm-12  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="6" class="text-center" >
												List Of Documents:
											</th>                                            
										</tr>
									</thead>
									<tbody>									 
                                       <% 
									 //   if(createdBy.equals(emailId)){  
									   if("I".equals(status)){ 
									   %>                                    
									 <tr>
										<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','<%=requestId%>','viewWizard');" ><img src="../images/attachment.png" border="0" /></a> </td>	
									</tr>
									<% } %>									
									<tr>
										<td colspan="6"  id="attachment1"></td>	                                            		
									</tr>
                                       
									</tbody>			
								</table>
					</div>	
					<div class="form-actions">
				<div class="row">
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-offset-7 col-xs-5">		
                            <% 
                               // if(createdBy.equals(emailId)){   
                              if( "I".equals(status)){  
							  %>  
								<button type="Button" name= "Submit"class="btn btn-info" onClick = "javascript:saveEditCapexProposal();">Submit</button>
                                <% } %>
                                <button type="Button" name= "Close"class="btn btn-info" onClick = "javascript:window.close();">Close</button>		
                                <input type="hidden" name="requestId" id="requestId" value="<%=requestId%>" > 	
							</div>
						</div>
					</div>
					<div class="col-xs-6">
					</div>
				</div>
			</div>
			</div>			
			</div>			
		</form>	
	</div>
	</div>			
	</div>
	<div class="col-xs-2"></div>
  </div>   
</div>
<footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
	
</html>
