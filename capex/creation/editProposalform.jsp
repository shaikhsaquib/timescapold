<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>

 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit Capex Proposal</title>	
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
<script src="../jscript/select2.min.js"></script>	
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script src="../jscript/bootstrap-maxlength.min.js"></script>
<script src="../jscript/capex.js"></script>
<script src="../jscript/common.js"></script>
	
	<script>
	function myFunction() {
		window.print();
	}
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
        //$('body').on('focus',".datepicker", function(){
         //       $(this).datepicker({ dateFormat: 'dd-M-yy',minDate:0 });	
        //});
		$("#proposalDate").datepicker({ dateFormat: 'dd-M-yy', minDate:0 });
		$("#proposalDate").datepicker("setDate", new Date());			
			
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

		$('.printall').click(function(){
			//$('.panel-collapse:not(".in")')
			//.collapse('show');
			myFunction();
		});
    });
	</script>	
</head>

<%

    String requestId = (String)  request.getParameter("id");
    String status = (String)  request.getParameter("status");
    String xxx = (String)  request.getParameter("xxx");
   	String referer = request.getHeader("referer");
    String activeFlag ="";
    String disabledFlag ="";
    if ("D".equals(status)){
        activeFlag = "";
        disabledFlag = "";
    }else {
        activeFlag = "readonly";
        disabledFlag = "disabled";
    }
 
    Hashtable htable = new Hashtable();
    ArrayList arraySer = new ArrayList(); 
    String remark1 ="";

     if ("R".equals(status) || ("A".equals(status))){
            htable.put("DOCUMENTOID", "DOC1005");
            htable.put("WORKITEMOID", requestId);
            arraySer = docChangeLogController.search("sdfsdf" ,"sdfsdf",htable);
            int sizeArray = arraySer.size();
       
            if( sizeArray > 0){  
                    for (int eee = 0; eee < sizeArray; eee++) {
                      String headerData[] = (String[]) arraySer.get(eee);      
            //           out.println ( " headerData[4] " + headerData[4]);
                        remark1 = headerData[4];
                    }
                }
     }


 
    Hashtable ht = new Hashtable();  
    String locStr = null;
    String deptStr = null;
    String emailStr = null;
    String drStr = null;
    String headerData[] = null;  
	
	String headerSection [] = {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" ,"Financial Year","Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted","Project Closed Out Report","Rationale","Project Description","Particulars","Estimated Cost","Total","Asset Disposal","Savings Envisaged","Payback Period","Project Sponsor","Project Coordinator","compAttachment","attachmentFolderName" ,"Opex Particulars", "Opex Estimated Cost","Total Opex"};

    ht.put("HEADERSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1005");
   ht.put("REQUESTOID", requestId); 

    
    ArrayList headerDataList =  capexHeaderController.viewAll("sdf","sdfsd",ht);
    int headerSize = headerDataList.size();
	
     if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
          //  for (int eee1 = 0; eee1 < headerData.length; eee1++) {
			//	out.println(" headerData ["+eee1+"] "+headerData[eee1]);
           // }
        }
    }


 


				
	Hashtable hTable2 = new Hashtable();
	hTable2.put("DOCUMENTOID","DOC1005");
	hTable2.put("PROFILETEXT","COORDINATOR");
	
	ArrayList coordinatorArray = capexDeatilsController.listLocation(hTable2);
	String codinatorList = "";
	int sizeStrArray = coordinatorArray.size();
		if( sizeStrArray > 0){  
			codinatorList+="<option value=\"0\">SELECT COORDINATOR</option>";
		for (int e = 0; e < sizeStrArray; e++){
			String headerData1[] = (String[]) coordinatorArray.get(e);      
			if(headerData[30].equals(headerData1[12])){	
			codinatorList+="<option value=\""+headerData1[12]+"\" selected style=normal>"+headerData1[12]+"</option>";			
			}else{
			codinatorList+="<option value=\""+headerData1[12]+"\" style=normal>"+headerData1[12]+"</option>";
			}
	}
		
	}
			
				
		
	String  category [] = {"Productivity Improvement","Capacity Enhancement","Statutory Compliance","Infrastructure","Saving Payback","Obsolescence Replacement"};
	String categoryList = "";
   int sizeCatArray = category.length;
     
	if( sizeCatArray > 0){  	
			for (int ew = 0; ew < sizeCatArray; ew++) {
			 String headerCat1 = (String) category[ew];
			 if(headerData[14].equals(headerCat1)){
					categoryList+="<option value=\""+headerCat1+"\" selected style=normal>"+headerCat1+"</option>";
			 }else{
					categoryList+="<option value=\""+headerCat1+"\" style=normal>"+headerCat1+"</option>";
				}
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
<body onload = "showAttachmentFile('1','<%=requestId%>','<%=emailId%>','<%=status%>','create')"> 

<%@ include file="../includes/relatedLinksnew.jsp" %>

	<div class="container-fluid ">
	<div class="row">
	
	<div class="col-xs-12">
    <div class="text-right"><a  class="btn btn-primary btn-sm col-xs-offset-2 printall np1"  ><i class="fa fa-print" aria-hidden="true"></i> Print</a>	<font color="red"><b> Rs. in Lakhs</b></font></div>
	<div class="portlet box blue">
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Edit Capex Proposal     
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
								<input type="text" class="form-control" placeholder="Project Title" name="projectTitle" id="projectTitle"  value="<%=headerData[7]%>" maxlength='100' readonly> 
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
									<input type="text" class="form-control"   style = "text-align:right;" placeholder="Rs. in Lakhs, Format (00.00)" name="proposedAmount" id="proposedAmount" value="<%=headerData[9]%>"  <%=activeFlag%> onblur = "javascript:BlankNumber('Proposed Amount','proposedAmount');" maxlength="10"> 
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
										<input type="text" class="form-control"  style = "text-align:right;" placeholder="Rs. in Lakhs, Format (00.00)" name="opexAmount" id="opexAmount" value="<%=headerData[10]%>"  <%=activeFlag%>  onblur = "javascript:BlankNumber('Opex Amount','opexAmount');" maxlength="10"> 
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
										<i class="fa fa-bars" style="width:11px;"></i>
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
								<i class="fa fa-bars" style="width:11px;"></i>
								</span>
								<input type="text" class="form-control" placeholder="Project Manager" name="projectManager" 
								id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email');" <%=disabledFlag%> value="<%=headerData[13]%>">						
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
									<select class="form-contr  multi" name="projectCategory" id="projectCategory" <%=disabledFlag%>>
										<%=categoryList%>									
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
									<select class="form-contr  multi" name="financialYear" id="financialYear" <%=disabledFlag%>>
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
								<input type="text" class="form-control"   style = "text-align:right;" placeholder="Budget Amount" name="budgetAmount" id="budgetAmount" value="<%=headerData[16]%>"  <%=activeFlag%> onblur = "javascript:BlankNumber('Budget Amount','budgetAmount');" maxlength="10"> 
								</div>
							</div>
						</div>
					</div>					
					<!--/span-->
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
								<input type="text" class="form-control datepicker"  name="projectStartDate" id="projectStartDate" value="<%=headerData[17]%>" placeholder="Date" readonly >
								
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
					<!--/span-->
				</div>
				<div class="row">
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Reasons If Unbudgeted</label>
							<div class="col-xs-8">
							<%   String reasonIf = headerData[19].replaceAll("and", "&");	
									reasonIf = reasonIf.replaceAll("''", "'");							
							%>
								<textarea class="form-control noresize" rows="2" maxlength='100' id='reasonIfUnbudgeted'  name= 'reasonIfUnbudgeted'   <%=activeFlag%>><%=reasonIf%></textarea>
							</div>
						</div>
					</div>
					
					<div class="col-xs-6">
						<div class="form-group">
							<label class="control-label col-xs-4">Project Close-Out Report Date</label>
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
				  <div class="row">						
				<div class="col-xs-6">
				<table class="table table-bordered">
					<tbody>				
						<tr>
							<td class="text-left"><b>Rationale</b></td>
                            </tr>
							<%   String rationale = headerData[21].replaceAll("and", "&");
										rationale = rationale.replaceAll("''", "'");								
							%>
                            <tr>
							<td class="text-center ">							
							<div class="form-group grp " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='1000' id='rationale' name = 'rationale' style="overflow-y:hidden;" <%=activeFlag%> ><%=rationale%></textarea></div>							
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
				<%   String projectDesc = headerData[22].replaceAll("and", "&");
						projectDesc = projectDesc.replaceAll("''", "'");		
				
				%>
				<div class="form-group grp " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="6" maxlength='1000' id='projectDescription'  name = 'projectDescription' style="overflow-y:hidden;"  <%=activeFlag%>  ><%=projectDesc%></textarea></div>				
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
						<td class="text-right"><input type="text" class="form-control text-left " name="totalCapexAmt"  style = "text-align:right;" id="totalCapexAmt"  value="<%=headerData[25]%>" readonly  ></td>
					</tr>
			  </tfoot>
				<tbody>  
				<%                 
						String part22 = headerData[23].replaceAll(";", ",");
				         String particulars [] = part22.split("~");   
						 
                        String estimatedCost [] = headerData[24].split("~");          
                        int counter = particulars.length;
                        for(int ii=0 ;ii<counter ; ii++){
							
						String	particulars22 = particulars[ii].replaceAll("''", "'");	
                %>
					<tr id='addr9<%=ii%>'>
                    <td class="text-center"><%=(ii+1)%></td>
                    <td class="text-center"><input type="text" class="form-control text-left " maxlength="50" name="particulars<%=ii%>" id="particulars<%=ii%>" value="<%=particulars22%>" <%=activeFlag%> onblur = "javascript:checkBlank('Particulars','particulars<%=ii%>'),calculateTotal();"></td>
                    <td class="text-center"><input type="text" class="form-control  text-right" name="estimatedCost<%=ii%>" id="estimatedCost<%=ii%>"  onblur='javascript:BlankNumber("Estimated Cost","estimatedCost0");calculateTotal();'  value="<%=estimatedCost[ii]%>" <%=activeFlag%> maxlength="10" placeholder=" Rs. in Lakhs, Format (00.00)" ></td>
					</tr>
					<%  }  %>
					<tr id='addr9<%=counter%>'>
					
				</tbody>
			</table>
			<%  if ("D".equals(status)){ 
             %>
			<a id='del_row2' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row3" class="btn btn-default pull-right btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> Add Row</a>
			<% } %>		
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
						<td class="text-right"><input type="text" class="form-control text-left " name="totalOpexAmt"  style = "text-align:right;" value="<%=headerData[35]%>" readonly  ></td>
					</tr>
			  </tfoot>
				<tbody>
				<%                 
						String part221 = headerData[33].replaceAll(";", ",");					
                        String opexParticulars [] = part221.split("~");   
                        String opexEstimatedCost [] = headerData[34].split("~");          
                        int opexCounter = opexParticulars.length;
                        for(int iii=0 ;iii<opexCounter ; iii++){
							String	opexParticulars33 = opexParticulars[iii].replaceAll("''", "'");	
                %>
					<tr id='opex<%=iii%>'>
                    <td class="text-center"><%=(iii+1)%></td>
                    <td class="text-center"><input type="text" class="form-control text-left " maxlength="50"  name="opexParticulars<%=iii%>" id="opexParticulars<%=iii%>"  onblur = "javascript:checkBlank('Opex Particulars','opexParticulars<%=iii%>'),calculateOpexTotal();"  value="<%=opexParticulars33%>" <%=activeFlag%> ></td>
                    <td class="text-center"><input type="text" class="form-control  text-right" name="opexEstimatedCost<%=iii%>" id="opexEstimatedCost<%=iii%>"  onblur='javascript:BlankNumber("Estimated Cost","opexEstimatedCost0");calculateOpexTotal();'  value="<%=opexEstimatedCost[iii]%>" <%=activeFlag%> maxlength="10"></td>
					</tr>
					<%  }  %>
					<tr id='opex<%=opexCounter%>'>
					
				</tbody>
			</table>
			<%  if ("D".equals(status)){ 
             %>
			<a id='del_row3' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row4" class="btn btn-default pull-right btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> Add Row</a>
			<% } %>	
			</div>
			</div>	 
					
			
			<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center">Asset Disposal</td>
										<td class="text-center"><input type="text" class="form-control  "  style = "text-align:right;" name="assetDisposal" id="assetDisposal" value="<%=headerData[26]%>" <%=activeFlag%> onblur = "javascript:BlankNumber('Asset Disposal','assetDisposal');" maxlength="10"></td>
									</tr>
									<tr>
										<td class="text-center">Savings Envisaged</td>
										<td class="text-center"><input type="text" class="form-control  "   style = "text-align:right;" name="savingsEnvisaged" id="savingsEnvisaged" value="<%=headerData[27]%>" <%=activeFlag%>  onblur = "javascript:BlankNumber('Savings Envisaged','savingsEnvisaged');" maxlength="10"></td>
									</tr>
									
									<tr>
										<td class="text-center">Payback Period(yrs/Month)</td>
										<td class="text-center"><input type="text" class="form-control  " name="paybackPeriod" id="paybackPeriod"  value="<%=headerData[28]%>" <%=activeFlag%> maxlength="15"></td>
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
										<input type="text" class="form-control" placeholder="SPONSOR" name="projectSponsor" 
										id="projectSponsor" maxlength="50" onkeyup="lookupAll(this.value,'suggestions3','autoSuggestionsList3','coor'); "<%=disabledFlag%> value="<%=headerData[29]%>">										
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
									<select class="form-contr  multi" name="projectCoordinator" id="projectCoordinator" value="<%=headerData[30]%>"  onfocus="showAttachmentFile('additional','<%=requestId%>','<%=emailId%>','<%=status%>','create');" <%=disabledFlag%>>
									                           
									<%=codinatorList%>	
																	
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
											<th colspan="2" class="text-center" >
												 Attached Documents
											</th>
										</tr>
									</thead>
									<tbody>	
                                    <%  
                                        if ("D".equals(status)){ 
                                    %>
                                         <tr>
											<td colspan="2"  > Click on image to attach file <a href="javascript:attachmentFile('additional','<%=requestId%>','create');" ><img src="../images/attachment.png" border="0" /></a> </td>	
										</tr>
                                        <% } %>
										<tr>
											<td colspan="2"  id="attachment1"></td>											
										</tr>
									</tbody>			
								</table>
							</div>
                              <%  
                                    if (!"D".equals(status) || !"L".equals(status)){ 
                                    %>
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
                                            <td colspan="6" ><input type="text" class="form-control  " name="remark" id="remark" value="<%=remark1%>" readonly ></td>		
										</tr>
                                       
									</tbody>			
								</table>
							</div>
                              <% } %>
					    </div>
						
			<div class="form-actions">
				<div class="row">
					<div class="col-xs-10">
						<div class="row">
							<div class="col-xs-offset-6 col-xs-6">		
                            <% 
                                if("D".equals(status)){
                             %>
								<button type="Button" name= "Submit" class="btn btn-danger" onClick = "javascript:editProposalForm('Submit');">Submit</button>
								<button type="Button" name= "Draft" class="btn btn-danger" onClick = "javascript:editProposalForm('Draft');">Save as Draft</button>
                                <% } %>
                                <button type="Button" name= "Close" class="btn btn-danger" onClick = "javascript:closeProposalForm();">Close</button>
															
                                	<input type="hidden" class="form-control  " name="counter" id="counter"  value="<%=counter%>">
                                	<input type="hidden" class="form-control  " name="opexCounter" id="opexCounter"  value="<%=opexCounter%>">
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
<script>
	$(document).ready(function(){
			//alert($("#counter").val());	
			var y = $("#counter").val();
		  var q = y;
   // var q=1;
        $("#add_row3").click(function(){
        $('#addr9'+parseInt(q)).html("<td  class='text-center'>"+ (parseInt(q)+1) +"</td> <td class='text-center'><input type='text' class='form-control text-left ' name='particulars"+q+"' id='particulars"+q+"' ></td><td class='text-center'><input type='text' class='form-control  text-right' onblur='javascript:BlankNumber(\"Estimated Cost\",\"estimatedCost"+q+"\");calculateTotal();' name='estimatedCost"+q+"' id='estimatedCost"+q+"' maxlength='10'></td>");
		var x = parseInt(q)+1;
        $('#tab_logic1').append('<tr id="addr9'+x+'"></tr>');
        q++; 
        $("#counter").val(q);
        });
        $("#del_row2").click(function(){
            if(q>1){
                $("#addr9"+(q-1)).html('');
                q--;
               $("#counter").val(q);
               calculateTotal();
                }
                });
             });
    </script>	
	<script>
	$(document).ready(function(){
			//alert($("#counter").val());	
			var y = $("#opexCounter").val();
		  var q = y;
   // var q=1;
        $("#add_row4").click(function(){
        $('#opex'+parseInt(q)).html("<td  class='text-center'>"+ (parseInt(q)+1) +"</td> <td class='text-center'><input type='text' class='form-control text-left ' name='opexParticulars"+q+"' id='opexParticulars"+q+"' ></td><td class='text-center'><input type='text' class='form-control  text-right' onblur='javascript:BlankNumber(\"Opex Estimated Cost\",\"opexEstimatedCost"+q+"\");calculateOpexTotal();' name='opexEstimatedCost"+q+"' id='opexEstimatedCost"+q+"' maxlength='10'></td>");
		var x = parseInt(q)+1;
        $('#tab_logic2').append('<tr id="opex'+x+'"></tr>');
        q++; 
        $("#opexCounter").val(q);
        });
        $("#del_row3").click(function(){
            if(q>1){
                $("#opex"+(q-1)).html('');
                q--;
               $("#opexCounter").val(q);
               calculateOpexTotal();
                }
                });
             });
             </script>	
</html>
