<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Capex Proposal</title>	
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
                $(this).datepicker({ dateFormat: 'dd-M-yy',minDate:0 });	
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
    String requestId = (String)  request.getParameter("id");
    String status = (String)  request.getParameter("status");
    Hashtable htable = new Hashtable();
    ArrayList arraySer = new ArrayList();
    //out.println ( " status " + status);
    String remark1 ="";

     if ("CR".equals(status) || ("CA".equals(status))){

            htable.put("DOCUMENTOID", "DOC1005");
            htable.put("WORKITEMOID", requestId);
            arraySer = docChangeLogController.search("sdfsdf" ,"sdfsdf",htable);
            int sizeArray = arraySer.size();
        //    out.println ( " sizeArray " + sizeArray);
            if( sizeArray > 0){  
                    for (int eee = 0; eee < sizeArray; eee++) {
                      String headerData[] = (String[]) arraySer.get(eee);      
            //           out.println ( " headerData[4] " + headerData[4]);
                        remark1 = headerData[4];
                        remark1 =  ("-".equals(remark1)) ? "" : remark1;
                        
                    }
                }
     }
    Hashtable ht = new Hashtable();
    ht.put("COMPANYCODE","1000");  
    ht.put("PAYROLLTYPE","ADIR");
 
    String locStr = null;
    String deptStr = null;
    String emailStr = null;
    String drStr = null;
    String createdBy = null;
    String headerData[] = null;  
			
	String headerSection []	={"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" ,"Financial Year","Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted","Project Closed Out Report","Rationale","Project Description","Particulars","Estimated Cost","Total","Asset Disposal","Savings Envisaged","Payback Period","Project Sponsor","Project Coordinator","compAttachment","attachmentFolderName" ,"Opex Particulars", "Opex Estimated Cost","Total Opex"};
	
    ht.put("HEADERSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1005");
	ht.put("REQUESTOID", requestId);
    
    ArrayList headerDataList =  capexHeaderController.viewAll("sdf","sdfsd",ht);
    
    int headerSize = headerDataList.size();
     if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
           
           // for (int eee1 = 0; eee1 < headerData.length; eee1++) {
                createdBy = headerData[5];
         // out.println (" [ "+ eee1+"] : " +  headerData[eee1]); 
				
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
			
	String lastYear1 = faYearE+"-"+faYearF.substring(2,faYearF.length());
	String currYear1 = faYearS+"-"+faYearE.substring(2,faYearE.length());
	String newYear = faYearL+"-"+faYearS.substring(2,faYearS.length());
	String yearOption [] = {lastYear1,currYear1,newYear};
	String yearList = "";
	for (int hh=0;hh<yearOption.length;hh++){
		if(yearOption[hh].equals(headerData[15])){
			yearList+="<option value=\""+yearOption[hh]+"\" selected style=normal>"+yearOption[hh]+"</option>";
		}else{
			yearList+="<option value=\""+yearOption[hh]+"\" style=normal>"+yearOption[hh]+"</option>";				
		}
	}	
	
	
%>
<body onload = "showAttachmentFile('1','<%=requestId%>','<%=createdBy%>','<%=status%>','create')"> 
<%@ include file="../includes/relatedLinksnew.jsp" %>

	<div class="container-fluid ">
	<div class="row">
	<div class="col-xs-2"></div>	
	<div class="col-xs-8 bs-example">
    <div class="text-right"><font color="red"><b> Rs. in Lakhs</b></font></div>
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Capex Proposal     
	</div>			
	</div>
	<div class="portlet-body">
		<form action="#" class="form-horizontal" role="form" name="create" method="Post">
			<div class="form-body">
				
				<div class="row">
					<div class="col-xs-12">
						<div class="form-group">
							<label class="control-label col-xs-2">Project Title</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-bars" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control" placeholder="Project Title" name="projectTitle" id="projectTitle"  onblur = "javascript:checkBlank('Project Title','projectTitle');" value="<%=headerData[7]%>" readonly> 
								</div>
							</div>
						</div>
					</div>
				 </div>
				 <div class="row">							
						</div>
						<div class="row">
						<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-4">Proposal No.</label>
								<div class="col-xs-8">
								<div class="input-group">
									<span class="input-group-addon">
									<i class="fa fa-bars" style="width:11px;"></i>
									</span>
									<input type="text" class="form-control"  placeholder="" name="proposalNo" id="proposalNo" readonly value="<%=headerData[0]%>"> 
									</div>
								</div>
							</div>
						</div>					
					<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Proposal Date </label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-calendar" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control datepicker"  name="proposalDate" id="proposalDate" value="<%=headerData[8]%>" placeholder="Date" readonly>
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
									<input type="text" class="form-control "  style = "text-align:right;" placeholder="Proposed Amount Format (00.00)" name="proposedAmount" id="proposedAmount" value="<%=headerData[9]%>" onblur = "javascript:checkBlankNumber('Proposed Amount','proposedAmount');" readonly> 
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
										<input type="text" class="form-control" placeholder="Opex Amount Format (00.00)"   style = "text-align:right;" name="opexAmount" id="opexAmount" value="<%=headerData[10]%>" onblur = "javascript:checkBlankNumber('Opex Amount','opexAmount');" readonly> 
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
								<input type="text" class="form-control" placeholder="Location" name="proLocation" id="proLocation" maxlength="50" onkeyup="lookupAll(this.value,'suggestions','autoSuggestionsList','loc');" value="<%=headerData[11]%>" readonly >
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
								<input type="text" class="form-control" placeholder="Function" name="proFunction" id="proFunction" maxlength="50" onkeyup="lookupAll(this.value,'suggestions2','autoSuggestionsList2','dept');" value="<%=headerData[12]%>" readonly></div>
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
								id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email');" value="<%=headerData[13]%>" readonly>						
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
									<select class="form-contr  multi" name="projectCategory" id="projectCategory" disabled>
										<option value="<%=headerData[14]%>"><%=headerData[14]%></option>									
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
									<select class="form-contr  multi" name="financialYear" id="financialYear" disabled>
										<%=yearList%>									
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
								<input type="text" class="form-control"  placeholder="Budget Amount"  style = "text-align:right;" name="budgetAmount" id="budgetAmount" value="<%=headerData[16]%>" onblur = "javascript:checkBlankNumber('Budget Amount','budgetAmount');" readonly> 
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
								<input type="text" class="form-control datepicker"  name="projectStartDate" id="projectStartDate" value="<%=headerData[17]%>" placeholder="Date" readonly>
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
								<input type="text" class="form-control datepicker"  name="projectEndDate" id="projectEndDate"value="<%=headerData[18]%>" placeholder="Date" readonly>
								</div>
							</div>
						</div>
					</div>					
				
				</div>
				<div class="row">
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Reasons If Unbudgeted</label>
						
							<%   String reasonIf = headerData[19].replaceAll(";", ",");
								// headerData[19] = headerData[19].replaceAll("^", ":");
							%>
							<div class="col-xs-8">
								<textarea class="form-control noresize" rows="2" maxlength='10' id='reasonIfUnbudgeted'  name= 'reasonIfUnbudgeted' onblur = "javascript:checkBlank('Reasons If Unbudgeted','reasonIfUnbudgeted');" readonly><%=reasonIf%></textarea>
							</div>
						</div>
					</div>
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project close-out report Date</label>
							<div class="col-xs-8">
							<div class="input-group">
								<span class="input-group-addon">
								<i class="fa fa-calendar" style="width:11px;"></i>
								</span>								
                                <input type="text" class="form-control datepicker"  name="projectCloseOutReport" id="projectCloseOutReport" value="<%=headerData[20]%>" placeholder="Date" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>	
			
				<table class="table table-bordered">
					<tbody>				
						<tr>
							<td class="text-left"><b>Rationale</b></td>
							<%   String rationale = headerData[21].replaceAll(";", ",");
								// headerData[21] = headerData[21].replaceAll("^", ":");
							%>
                            </tr>
                            <tr>
							<td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='2000' id='rationale'  name = 'rationale' style="overflow-y:hidden;"   onblur = "javascript:checkBlankTextField('Rationale','rationale');"  readonly><%=rationale%>
							</textarea></div></td>
						</tr>
					
					<tr>
				<td class="text-left"><b>Project Description</b></td></tr>
					<%   String projectDesc = headerData[22].replaceAll(";", ",");			
				%>
				<tr><td class="text-left "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='2000' id='projectDescription'  name = 'projectDescription' style="overflow-y:hidden;"   onblur = "javascript:checkBlankTextField('Project Description','projectDescription');"  readonly><%=projectDesc%>
							</textarea></div></td>
						</tr></tbody>
                  </table>
				<table class="table table-bordered">
				<thead>
					<tr class="warning" >
						<th class="text-center" width="15%" colspan="3" style="text-align:left;">Capex Details (Rs. in Lakhs)</th>
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="2%">Sr.No.</th>
						<th class="text-center" width="19%">Particulars</th>
						<th class="text-center" width="9%">Estimated Cost</th>
						
					</tr>
				</thead>
				<tfoot>
					<tr class="success">
						<td></td>
						<td >TOTAL CAPEX</td>
						<td class="text-right"><input type="text"  style = "text-align:right;" class="form-control text-left " name="totalCapexAmt" id="totalCapexAmt" readonly  value="<%=headerData[25]%>"></td>
					</tr>
			  </tfoot>
				<tbody>
                <%                 
						String part22 = headerData[23].replaceAll(";", ",");
                        String particulars [] = part22.split("~");   
                        String estimatedCost [] = headerData[24].split("~");              
                        for(int ii=0 ;ii<particulars.length ; ii++){
                %>
					<tr>
						<td class="text-center"><%=(ii+1)%></td>
						<td class="text-center"><input type="text" class="form-control text-left " name="particulars" id="particulars"  onblur = "javascript:checkBlank('Particulars','particulars');"  value="<%=particulars[ii]%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control  text-right"  name="estimatedCost" id="estimatedCost"  onblur = "javascript:checkBlankNumber('Estimated Cost','estimatedCost');"  value="<%=estimatedCost[ii]%>" readonly></td>
					</tr>
					<%  }  %>
				</tbody>
			</table>
				<table class="table table-bordered">
				<thead>
					<tr class="warning" >
						<th class="text-center" width="15%" colspan="3" style="text-align:left;">Opex Details (Rs. in Lakhs)</th>
					</tr>
				</thead>
				<thead>
					<tr class="info">
						<th class="text-center" width="2%">Sr.No.</th>
						<th class="text-center" width="19%">Particulars</th>
						<th class="text-center" width="9%">Estimated Cost</th>
						
					</tr>
				</thead>
				<tfoot>
					<tr class="success">
						<td></td>
						<td >TOTAL OPEX</td>
						<td class="text-right"><input type="text"  style = "text-align:right;" class="form-control text-left " name="totalOpexAmt" id="totalOpexAmt" readonly  value="<%=headerData[35]%>"></td>
					</tr>
			  </tfoot>
				<tbody>
                <%                 
						String part221 = headerData[33].replaceAll(";", ",");
                        String opexParticulars [] = part221.split("~");   
                        String opexEstimatedCost [] = headerData[34].split("~");              
                        for(int iii=0 ;iii<opexParticulars.length ; iii++){  
                %>
					<tr>
						<td class="text-center"><%=(iii+1)%></td>
						<td class="text-center"><input type="text" class="form-control text-left " name="opexParticulars" id="opexParticulars"  onblur = "javascript:checkBlank('Opex Particulars','opexParticulars');"  value="<%=opexParticulars[iii]%>" readonly></td>
						<td class="text-center"><input type="text" class="form-control  text-right"  name="opexEstimatedCost" id="opexEstimatedCost"  onblur = "javascript:checkBlankNumber('opexEstimated Cost','opexEstimatedCost');"  value="<%=opexEstimatedCost[iii]%>" readonly></td>
					</tr>
					<%  }  %>
				</tbody>
			</table>					
			<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center">Asset Disposal</td>
										<td class="text-center"><input type="text" class="form-control  " style = "text-align:right;" name="assetDisposal" id="assetDisposal" value="<%=headerData[26]%>" onblur = "javascript:checkBlankNumber('Asset Disposal','assetDisposal');"  readonly></td>
									</tr>
									<tr>
										<td class="text-center">Savings Envisaged</td>
										<td class="text-center"><input type="text" class="form-control  "  style = "text-align:right;" name="savingsEnvisaged" id="savingsEnvisaged" value="<%=headerData[27]%>" onblur = "javascript:checkBlankNumber('Savings Envisaged','savingsEnvisaged');"  readonly></td>
									</tr>
									
									<tr>
										<td class="text-center">Payback Period(yrs/Month)</td>
										<td class="text-center"><input type="text" class="form-control  " style = "text-align:right;" name="paybackPeriod" id="paybackPeriod"  value="<%=headerData[28]%>" readonly></td>
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
									<select class="form-control  multi" name="projectSponsor" id="projectSponsor" onfocus="showAttachmentFile('additional','<%=requestId%>','<%=emailId%>','<%=status%>','create');" disabled>   
									 <option value="<%=headerData[29]%>" selected><%=headerData[29]%></option>
										</select>					
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
									<select class="form-control  multi" name="projectCoordinator" id="projectCoordinator" disabled onfocus="showAttachmentFile('additional','<%=requestId%>','<%=emailId%>','<%=status%>,'create');">                               	
									 <option value="<%=headerData[30]%>" selected><%=headerData[30]%></option>
                                   		   
										</select>					
									</td>
																	
								</tr>					
								<tr id='addr51'></tr>									
							</tbody>				
						</table>						
					</div>
					</div>
					<div class="col-sm-12 col-lg-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >
											<th colspan="6" class="text-center" >
												 Attached Documents
											</th>                                            
										</tr>
									</thead>
									<tbody>											
										<tr>
											<td colspan="6"  id="attachment1"></td>		                                            		
										</tr>
                                       
									</tbody>			
								</table>
							</div>		
                            <div class="col-sm-12 col-lg-6  ">
								<table class="table table-bordered table-hover" id="tab_logic7">			
									<thead>
										<tr >											
                                            <th colspan="6" class="text-center" >
												Remark
											</th>
										</tr>
									</thead>
									<tbody>											
										<tr>				
                                         <%  if ("CR".equals(status) || ("CA".equals(status))){  %>
                                            <td colspan="6" ><input type="text" class="form-control  " name="remark" id="remark" value="<%=remark1%>" readonly ></td>		
                                            <%} else {%>
                                             <td colspan="6" ><input type="text" class="form-control  " name="remark" id="remark" value="<%=remark1%>" onblur = "javascript:checkBlank('remark','remark');"  ></td>	
                                             <% } %>
										</tr>
                                       
									</tbody>			
								</table>
							</div>
					    </div>
						
			<div class="form-actions">
				<div class="row">
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-offset-6 col-xs-6">
								
                                <%  if ("CR".equals(status) || ("CA".equals(status))){  %>
								
                                <% }else { %>
                                    <button type="Button" name= "Approved"class="btn btn-info" onClick = "javascript:approvedProposal('CA');">Review</button>
								<button type="Button" name= "Rejected"class="btn btn-info" onClick = "javascript:approvedProposal('CR');">Reject</button>
                                <% } %>
                                <button type="Button" name= "Close"class="btn btn-info" onClick = "javascript:window.close();">Close</button>
                                <input type="hidden" class="form-control  " name="remarkStatus" id="remarkStatus"  value="">
								
							</div>
						</div>
					</div>
					<div class="col-xs-6">
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
