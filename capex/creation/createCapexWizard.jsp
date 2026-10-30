<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<%@ page errorPage="../includes/error.jsp" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Capex Wizard </title>	
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
	<script src="../jscript/jquery.bootstrap.wizard.min.js"></script>
	<script src="../jscript/jquery.validate.min.js"></script>
	<script src="../jscript/additional-methods.min.js"></script>
    <script src="../jscript/capex.js"></script>
	<script src="../jscript/common.js"></script>

</head>
<%

    Hashtable ht = new Hashtable();
	Hashtable htable = new Hashtable();
    ht.put("COMPANYCODE","1000");
  //ArrayList locList =  capexHeaderController.listLocations(ht);
  //ArrayList deptList = capexHeaderController.listDepartments(ht);
   // ht.put("DEPTCODE",deptGroup);
  //ArrayList emailList = capexHeaderController.getEmailId(ht);
	ht.put("PAYROLLTYPE","ADIR','CONF");
	ArrayList drList = capexHeaderController.getEmailId(ht);
    
 // int locSize = locList.size();
 // int deptSize= deptList.size();
 // int emailSize = emailList.size();
	int deSize = drList.size();
	//out.println("review list size : "+deSize);
    String locStr = "";
    String deptStr = "";
    String emailStr = "";
    String drStr = "";
 /* if( locSize > 0){  
        for (int iii = 0; iii < locSize; iii++) {
            String locData[] = (String[]) locList.get(iii);      
            locStr+="<option value=\""+locData[4]+"\" style=normal>"+locData[5]+"</option>";
        }
    }
    if( deptSize > 0){  
        for (int jjj = 0; jjj < deptSize; jjj++) {
            String deptData[] = (String[]) deptList.get(jjj);      
            deptStr+="<option value=\""+deptData[2]+"\" style=normal>"+deptData[3]+"</option>";
        }
    }
    //    out.println(" emailSize :"+emailSize);
    if( emailSize > 0){  
        for (int kkk = 0; kkk < emailSize; kkk++) {
            String emailData[] = (String[]) emailList.get(kkk);      
            emailStr+="<option value=\""+emailData[6]+"\" style=normal>"+emailData[6]+"</option>";
        }
    }
	*/
  //  out.println(" deSize :"+deSize);
    if( deSize > 0){  
        for (int mmm = 0; mmm < deSize; mmm++) {
            String drData[] = (String[]) drList.get(mmm);    
		//	out.println( " drData[6] " + drData[6]);
            drStr+="<option value=\'"+drData[6]+"\' style=normal>"+drData[6]+"</option>";
        }
    }

	htable.put("DOCID","DOC1005");
	htable.put("PROFILETEXT","APPROVALS");
	ArrayList appList =  capexHeaderController.getZonalEmailId(htable);
    int appSize = appList.size();
//	out.println("approval list size : "+appSize);
	String appStr = "";
	if( appSize > 0){  
        for (int ccc = 0; ccc < appSize; ccc++) {
            String appData[] = (String[]) appList.get(ccc);     
		//	for (int ccc1 = 0; ccc1 < appData.length; ccc1++) {
        //    String appData2 = (String) appData[6];  			
		//	out.println("approval appData[7] : "+appData2);
           appStr+="<option value=\'"+appData[6]+"\' style=normal>"+appData[6]+"</option>";
			//}
        }
    }

	Hashtable htMy = new Hashtable();
	ArrayList arrList = new ArrayList();	

	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" , "Financial Year" ,"Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted" , "Project Closed Out Report", "Rationale" , "Project Description" ,"Particulars" , "Estimated Cost" , "Asset Disposal" , "Savings Envisaged","Payback Period" , "Project Sponsor" , "Project Coordinator" ,"Total","compAttachment","attachmentFolderName"};
	
    htMy.put("HEADERSECTION1", headerSection);
    htMy.put("DOCUMENTOID", "DOC1005");	
	htMy.put("HEADER", emailId);	
	htMy.put("SEARCH", "Project Coordinator");
	htMy.put("STATUS","CA");
	
    ArrayList searchList =  capexHeaderController.viewAll("sdf","sdfsd",htMy);
	String proposalList = "";
	int searchSize = searchList.size();
//	out.println(" searchSize " +searchSize) ;  
	if (searchSize> 0){
		for (int eee = 0; eee < searchSize; eee++) {
			String headerData [] = (String[]) searchList.get(eee);  
			for (int eee1 = 0; eee1 < headerData.length; eee1++) {
			//	out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
			}
			String requestNumber = headerData[0];
			String projectTitle =  headerData[7];			
			proposalList+="<option value=\""+requestNumber+"\" style=normal>"+requestNumber+"-"+projectTitle+"</option>";		
		}
	}
		session.setAttribute("searchList",searchList);
%>
<body onload="onLoadDetail('0','createForm');"> 
<%@ include file="../includes/relatedLinksnew.jsp" %>


	<div class="container-fluid " >
	<div class="row">
	
	<div class="col-xs-12 ">
	<div class="text-right"><font color="red"><b> Rs. in Lakhs</b></font></div>
	<div class="portlet box blue" >
	<div class="portlet-title">
	<div class="caption">
		<i class="fa fa-th"></i>  Capital Expenditure 
	</div>			
	</div>
	<div class="portlet-body" >
		<form id="createForm" method="post"  class="form-horizontal" name="createForm">
			
				<div id="rootwizard">
					<div class="navbar" style="margin-bottom: 2px;">
					<div class="navbar-inner">
					    <div class="container">
					<ul>
					  	<li><a href="#tab1" data-toggle="tab"><span class="badge">1</span> Project Description</a></li>
						<li><a href="#tab2" data-toggle="tab"><span class="badge">2</span> Cost Projections </a></li>
						<li><a href="#tab3" data-toggle="tab"><span class="badge">3</span> Rationale</a></li>
						<li><a href="#tab4" data-toggle="tab"><span class="badge">4</span> Cost Summary</a></li>
						<li><a href="#tab5" data-toggle="tab"><span class="badge">5</span> ROI</a></li>
						<li><a href="#tab6" data-toggle="tab"><span class="badge">6</span> Annexures</a></li>
						<li><a href="#tab7" data-toggle="tab"><span class="badge">7</span> Participants</a></li>						
					</ul>
					</div>
					</div>
					</div>
                    <div id="bar" class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
                    </div>
					<div class="tab-content" >
					    <div class="tab-pane" id="tab1" >
						 <div class="row" >							
							<div class="col-xs-6">
								<div class="form-group grp">
									<label class="control-label col-xs-4">Proposal No.</label>
									<div class="col-xs-8">
									<div class="input-group">										
										<span class="input-group-addon">
										<i class="fa fa-list-ol" style="width:11px;"></i>
										</span>										
										<select class="form-control  multi" name="proposalNo" id="proposalNo" onChange="javascript:loadDetailsTab1();">
											<option value="0">SELECT PROPOSAL NUMBER</option>
											<%=proposalList%>											
										</select>										
										</div>
									</div>
								</div>
							</div>
						 </div>
					      <div class="row" >
							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Project Title</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-bars" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Project Title" name="projectTitle" id="projectTitle" maxlength="150" > 
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
									<select class="form-control  multi" name="projectCategory" id="projectCategory" >
										<option value="0">SELECT CATEGORY</option>	
                                        <option value="Productivity Improvement">Productivity Improvement</option>	
										<option value="Capacity Enhancement">Capacity Enhancement</option>
										<option value="Statutory Compliance">Statutory Compliance</option>
										<option value="Infrastructure">Infrastructure</option>
										<option value="Saving/Payback">Saving/Payback</option>
										<option value="Obsolescence/Replacement">Obsolescence/Replacement</option>	
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
										<input type="text" class="form-control  text-right"  placeholder="Capex Amount " name="capexAmount" id="capexAmount" onblur = "javascript:checkBlankNumber('Capex Amount','capexAmount');" maxlength="7"> 
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
										<input type="text" class="form-control  text-right" placeholder="Opex Amount " name="opexAmount" id="opexAmount" onblur = "javascript:checkBlankNumber('Opex Amount','opexAmount');" maxlength="7"> 
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
										<input type="text" class="form-control" placeholder="Location" name="proLocation" id="proLocation" maxlength="50" onkeyup="lookupAll(this.value,'suggestions','autoSuggestionsList','loc');" >									
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
										<input type="text" class="form-control" placeholder="Function" name="proFunction" id="proFunction" maxlength="50" onkeyup="lookupAll(this.value,'suggestions2','autoSuggestionsList2','dept');" ></div>
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
										id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email');" ></div>
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
									<input type="text" class="form-control  "  placeholder="Project Duration Format (Year /Months)" name="projectDuration" id="projectDuration"  value="" maxlength="25">
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
									<input type="text" class="form-control text-right"  placeholder="Budget Amount " name="budgetAmount" id="budgetAmount" onblur = "javascript:checkBlankNumber('Budget Amount','budgetAmount');" maxlength="7"> 
									</div>
								</div>
							</div>
						</div>
							<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-4">Keywords</label>
								<div class="col-xs-8">
									<input type="text" class="form-control text-left " name="keywords" id="keywords"  placeholder="Discussion keywords separated by comma (,)" maxlength="100">
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="form-group">
								<label class="control-label col-xs-4">Reasons If Unbudgeted</label>
								<div class="col-xs-8">
									<textarea class="form-control noresize" rows="2" maxlength='100' id='reasonIfUnbudgeted'  name='reasonIfUnbudgeted'> </textarea>
								</div>
								</div>
							</div>
						</div>
				
					    </div>
					    <div class="tab-pane" id="tab2">
					      <table class="table table-bordered">
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
							<td class="text-center">Capex (Rs.in Lakhs)</td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex1"  id="capex1" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex2"  id="capex2" placeholder="Format 0.0" maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex3"  id="capex3" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex4"  id="capex4" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="capex5"  id="capex5" placeholder="Format 0.0"  maxlength="7"></div></td>							
						</tr>
						<tr>
							<td class="text-center">Opex (Rs.in Lakhs)</td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex1"  id="opex1" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex2"  id="opex2" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex3"  id="opex3" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex4"  id="opex4" placeholder="Format 0.0"  maxlength="7"></div></td>
							<td class="text-center"><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><input type="text" class="form-control text-right " name="opex5"  id="opex5" placeholder="Format 0.0"  maxlength="7"></div></td>
							
						</tr>
						</tbody>
					</table>
					    </div>
					    
						<div class="tab-pane" id="tab3">
							<table class="table table-bordered">
					<tbody>						
						<tr>
							<td class="text-left"><b>Rationale</b></td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength='500' id='rationale' name= 'rationale'> </textarea></div></td>
						</tr>
						<tr>
							<td class="text-left" width="17%"><b>Recommendation</b></td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength='500' id='background' name= 'background'></textarea></div></td>
						</tr>
						<tr>
							<td class="text-left"><b>Project Scope</b></td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength='500' id='projectScope' name='projectScope'></textarea></div></td>
						</tr>
						<tr>
							<td class="text-left"><b>Alternatives Considered</b></td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength='500' id='alternativesConsidered' name='alternativesConsidered'></textarea></div></td>
						</tr>
						<tr>
							<td class="text-left"><b>Risks</b></td>
							<td class="text-center "><div class="form-group grp has-feedback " style="margin-left:5px;margin-right:5px;"><textarea class="form-control noresize" rows="2" maxlength='500' id='risks' name = 'risks'> </textarea></div></td>
						</tr>
						</tbody>
					</table>
					    </div>
						<div class="tab-pane" id="tab4">
					<table class="table table-bordered" id="tab_logic1">
						<thead>
							<tr class="warning" >
								<th class="text-center" width="15%" colspan="6" style="text-align:left;">Capex Details</th>
							</tr>
						</thead>
					<thead>
						<tr class="info">
							<th class="text-center" width="2%">Sr.No.</th>					
							<th class="text-center" width="29%">Header</th>
							<th class="text-center" width="29%">Particulars</th>
							<th class="text-center" width="6%">Quantity/Jobs</th>
							<th class="text-center" width="9%">Estimated Cost</th>
							<th class="text-center" width="9%">Total Cost</th>						
						</tr>
					</thead>
						<tfoot>
							<tr class="success">
								<td></td>
								<td colspan="4">TOTAL CAPEX</td>
								<td><input type="text" class="form-control text-left " name="totalCapexAmt"  style = "text-align:right;" id="totalCapexAmt" readonly  ></td>
							</tr>
						</tfoot>
						<tbody>
							<tr id='rowId0'>					
								<td class="text-center">1</td>
								<td class="text-center"><input type="text" class="form-control text-left " name="header0" id="header0" maxlength="100"></td>
								<td class="text-center"><input type="text" class="form-control text-left " name="particulars0" id="particulars0" maxlength="500"></td>
								<td class="text-center"><input type="text" class="form-control text-right " name="quantity0" id="quantity0" onblur = "javascript:calculateTotalQuantity();" maxlength="5"></td>
								<td class="text-center"><input type="text" class="form-control text-right " name="estimatedCost0" id="estimatedCost0" onblur = "javascript:checkBlankNumber('Estimated Cost','estimatedCost0'); calculateTotalQuantity();"  placeholder="" maxlength="7"></td>
								<td class="text-center"><input type="text" class="form-control text-right " name="totalCost0" id="totalCost0" readonly></td>				
							</tr>
							<tr id='rowId1'></tr>	
						</tbody>
						</table>
						<a id='row4_del' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="row4_add" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a><br><br>
						<input type="hidden" class="form-control  " name="counter" id="counter"  value="1">
					    </div>
						<div class="tab-pane" id="tab5">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="text-center">Savings Envisaged / Annum </td>
										<td class="text-center"><input type="text" class="form-control text-right " placeholder="Savings Envisaged " name="savingsEnvisaged"    id="savingsEnvisaged" value=""  onblur = "javascript:checkBlankNumber('Savings Envisaged','savingsEnvisaged');" maxlength="7"></td>
									</tr>
									
									<tr>
										<td class="text-center">Payback Period(Yrs/Month)</td>
										<td class="text-center"><input type="text" class="form-control text-right " name="paybackPeriod" id="paybackPeriod"  placeholder="Like 1 year 2 months / 8 months" maxlength="20"></td>
									</tr>                                   
								</tbody>
							</table>
					    </div>
						<div class="tab-pane" id="tab6">
							<table class="table table-bordered table-hover" id="tab_logic7">			
							<thead>
								<tr>									
								</tr>
							</thead>
							<tbody>
                        			<tr>
									<td> Attach Documents: </td>	
									<td colspan="2" >	Click on image to attach file <a href="javascript:attachmentFile('additional','0','createForm');" ><img src="../images/attachment.png" border="0" /></a> </td></tr>										
								  	<tr><td> List Of Documents: </td>	                                  
									<td colspan="2" id="attachment1"></td>								
                                    </tr>	                              
							</tbody>				
						</table>
					    </div>
						<div class="tab-pane" id="tab7">
						<div class="row">
					
						<div class="col-xs-6 ">
						<table class="table table-bordered table-hover" id="tab_logic4">			
								<thead>
									<tr>
										<th class="text-center" >
											Sr.No.
										</th>
										<th class="text-center">
											Supported/Recommended By
										</th>									
									</tr>
								</thead>
								<tbody>
									<tr id='addr40'>
										<td class="text-center">
										1
										</td>
										<td>
										<select class="form-contr  multi" name="reviewedBy0" id="reviewedBy0"  >
										<option value="0">SELECT SUPPORTED/RECOMMENDED BY</option>
										<%=drStr%>
											</select>										
										</td>																	
									</tr>					
									<tr id='addr41'></tr>									
								</tbody>				
							</table>
								<a id='delete_row4' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row4" class="btn btn-default pull-right btn-sm"><i class="fa fa-plus"></i> Add Row</a>
								   <input type="hidden" class="form-control  " name="revCounter" id="revCounter"  value="1" >
						</div>					
						<div class="col-xs-6  ">
							<table class="table table-bordered table-hover" id="tab_logic3">			
								<thead>
									<tr>
										<th class="text-center" >
											Sr.No.
										</th>
										<th class="text-center">
											Approved By
										</th>
										
									</tr>
								</thead>
								<tbody>
									<tr id='addr30'>
										<td class="text-center">
										1
										</td>
										<td>
										<select class="form-control multi" name="approvedBy0" id="approvedBy0" >
												<option value='0'>SELECT APPROVED BY</option>
												<%=appStr%>
											</select>						
										</td>
																		
									</tr>					
									<tr id='addr31'></tr>									
								</tbody>				
							</table>
							<a id='delete_row3' class=" btn btn-default pull-right btn-sm" style="margin-left:10px;margin-bottom:10px;"><i class="fa fa-times"></i> Delete Row</a><a id="add_row3" class="btn btn-default pull-right btn-sm" style="margin-bottom:10px;"><i class="fa fa-plus"></i> Add Row</a>
							<input type="hidden" class="form-control  " name="appCounter" id="appCounter"  value="1" >
						</div>
						</div>
						</div>					
					</div>
						
						<div class="row">
						<div style="float:right;margin-right:15px;margin-bottom:5px;" >
							<input type='Button' class='btn btn-info next' name='next' value='Next' id="showAtt" onfocus="onLoadDetail('1','createForm');" />
							<input type='Button' class='btn btn-primary next finish' name='Submit' value='Submit' style="display:none;"  onClick = "submitCapexWizard();"/>
						</div>
						<div style="float:left;margin-left:15px;margin-bottom:5px;">
							<input type='button' class='btn btn-warning previous' name='previous' value='Previous' />
						</div>
						</div>	
						
				</div>
				</form>
			</div>
	</div>
	</div>			
	</div>
	
  </div>   
  <footer class="footer ">
	<div class="container text-center">
		<p style="margin-bottom:2px; margin-left:80px;" class="ex ">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
	<script>
	$(document).ready(function() {
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#projectTitle", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#reasonIfUnbudgeted", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#rationale", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#background", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#projectScope", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#alternativesConsidered", function(){
			$(this).maxlength({alwaysShow: true});		
		});
		$('body').on('focus',"#risks", function(){
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
	<script>
	$(document).ready(function(){		
		  var q=1;
		$("#add_row2").click(function(){
			$('#addr2'+q).html("<td  class='text-center'>"+ (q+1) +"</td> <td><input name='support"+q+"' id='support"+q+"' type='text' placeholder='Reviewed By' class='form-control '  /> </td>");		
			$('#tab_logic2').append('<tr id="addr2'+(q+1)+'"></tr>');
			q++; 			
		});
		$("#delete_row2").click(function(){
			if(q>1){
				$("#addr2"+(q-1)).html('');
				q--;
			}
		});
	});
	</script>
	<script>
	$(document).ready(function(){		
		  var r=1;
		$("#add_row3").click(function(){
			$('#addr3'+r).html("<td  class='text-center'>"+ (r+1) +"</td> <td><select name='approvedBy"+r+"' id='approvedBy"+r+"'  placeholder='Approved By' class='form-control multi '  ><option value='0'>SELECT APPROVED BY</option><%=appStr%></select></td>");		
			$('#tab_logic3').append('<tr id="addr3'+(r+1)+'"></tr>');
			r++;
			$("#appCounter").val(r);
			$(".multi").select2({ width: '100%'  });
		});
		$("#delete_row3").click(function(){
			if(r>1){
				$("#addr3"+(r-1)).html('');
				r--;
			$("#appCounter").val(r);
			}
		});
	});
	</script>
	<script>
	$(document).ready(function(){		
		  var s=1;
		$("#add_row4").click(function(){
			$('#addr4'+s).html("<td  class='text-center'>"+ (s+1) +"</td> <td><select name='reviewedBy"+s+"' id='reviewedBy"+s+"'  placeholder='Reviewed By' class='form-control multi '  > <option value='0'>SELECT SUPPORTED/RECOMMENDED BY</option><%=drStr%></select> </td>");
			$('#tab_logic4').append('<tr id="addr4'+(s+1)+'"></tr>');
			s++;  
			$("#revCounter").val(s);
		});
		$("#delete_row4").click(function(){
			if(s>1){
				$("#addr4"+(s-1)).html('');
				s--;
				$("#revCounter").val(s);
			}
		});
	});
	</script>	
	<script>
	$(document).ready(function(){		
		  var p=1;
		$("#add_row5").click(function(){
			$('#addr5'+p).html("<td  class='text-center'>"+ (p+1) +"</td> <td><input name='mas"+p+"' id='mas"+p+"' type='text' placeholder='Approved By' class='form-control '  /> </td>");		
			$('#tab_logic5').append('<tr id="addr5'+(p+1)+'"></tr>');
			p++; 
		});
		$("#delete_row5").click(function(){
			if(p>1){
				$("#addr5"+(p-1)).html('');
				p--;
			}
		});
	});
	</script>
<script>
	$(document).ready(function() {
		var $validator = $("#createForm").validate({
		  rules: {
		    num: {
		      required: true,
			  number:true		      
		    },
		    namefield: {
		      required: true,
		      minlength: 3
		    },
		    urlfield: {
		      required: true,
		      minlength: 3,
		      url: true
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

	  	$('#rootwizard').bootstrapWizard({
		'nextSelector': '.next', 'previousSelector': '.previous',  'lastSelector': '.next last','.lastSelector':'.next finish',
	  		'tabClass': 'nav nav-pills',
	  		'onNext': function(tab, navigation, index) {
          //  alert(index);
	  		/*	var $valid = $("#createForm").valid();
	  			if(!$valid) {
	  				$validator.focusInvalid();
	  				return false;
	  			}
				*/
      
                  if(index==1) {
					                
                    if (!checkBlankSelect('Proposal No','proposalNo')){		
                    return false;
                    }
					
					//if (!checkBlank('Project Title','projectTitle')){		
                   //     return false;
                   // }
					
                    if (!checkBlankSelect('Project Category','projectCategory')){		
                        return false;
                    }
                    if (!checkBlankNumber('Capex Amount','capexAmount')){		
                        return false;
                    }
                    if (!checkBlankNumber('Opex Amount','opexAmount')){		
                        return false;
                    }
                    if (!checkBlank('Location','proLocation')){		
                        return false;
                    }
                    if (!checkBlank('Function','proFunction')){		
                        return false;
                    }
                    if (!checkBlank('Project Manager','projectManager')){		
                        return false;
                    }	
                    if (!checkBlank('Project Duration','projectDuration')){		
                        return false;
                    }
                    if (!checkBlankNumber('Budget Amount','budgetAmount')){		
                        return false;
                    }
					if (!checkBlankTextField('Reason If Unbudgeted','reasonIfUnbudgeted')){							
                        return false;
                    }
                    if (!checkBlank('Keywords','keywords')){		
                        return false;
                    }
				//	var reasonif =  $('#reasonIfUnbudgeted').val();
					//alert(reasonif.length);
				//	if(reasonif.length =='0'){
				//		alert(" Kindly Enter Reason If Unbudgeted");
				//		return false;
				//	}
					
                }
                 if(index==2) {
					 var xCount = 0;
					
                    if (!checkBlankNumber('Capex','capex1')){	
						xCount = 1;			
                        return false;
                    }
                    if (!checkBlankNumber('Capex','capex2')){	
						 xCount = 1;			
                         return false;
                    }
                    if (!checkBlankNumber('Capex','capex3')){		
                        xCount = 1;		
						return false;
                    }
                    if (!checkBlankNumber('Capex','capex4')){		
                        xCount = 1;		
						return false;
                    }
                    if (!checkBlankNumber('Capex','capex5')){		
                         xCount = 1;		
						 return false;
                    }
                    if (!checkBlankNumber('Opex','opex1')){		
						 xCount = 1;		
                         return false;
                    }
                    if (!checkBlankNumber('Opex','opex2')){		
						xCount = 1;		
                        return false;
                    }
                    if (!checkBlankNumber('Opex','opex3')){		
						xCount = 1;		
                        return false;
                    }
                    if (!checkBlankNumber('Opex','opex4')){		
						xCount = 1;		
                        return false;
                    }
                    if (!checkBlankNumber('Opex','opex5')){		
                        xCount = 1;		
						return false;
                    }
					
					if(xCount ==0){
						
							loadDetailsTab3();
							
						}
                 }
               
                    if(index==3){					
                        if (!checkBlankTextField('Rationale','rationale')){									
                            return false;
                        }
						if (!checkBlankTextField('Recommendation','background')){										
                            return false;
                        }						
						if (!checkBlankTextField('Project Scope','projectScope')){							
                            return false;
                        }				
                        if (!checkBlankTextField('Alternatives Considered','alternativesConsidered')){							
                            return false;
                        }
						if (!checkBlankTextField('Risks','risks')){								
                            return false;
                        }
						var riskss =  $('#risks').val();
						//alert(riskss.length);
                        if(riskss.length =='0'){
							alert(" Kindly Enter Risks");							
							return false;
						}
					
						
                    }
                 
                    if(index==4){
						var yCount = 0;
						
                         var countsNo =  $('#counter').val();                        
                        for (ii=0 ; ii<countsNo; ii++){		
                            if (!checkBlank('Header','header'+ii)){	
								yCount = 1;							
                                return false;
                            }
                        }
                        for (ii=0 ; ii<countsNo; ii++){		
                            if (!checkBlank('Particulars','particulars'+ii)){		
                                yCount = 1;
								return false;
                            }
                        }
                        for (ii=0 ; ii<countsNo; ii++){		
                            if (!checkBlankNumber('Quantity','quantity'+ii)){		
                                yCount = 1;
								return false;
                            }
                        }
                        for (ii=0 ; ii<countsNo; ii++){		
                            if (!checkBlankNumber('Estimated Cost','estimatedCost'+ii)){		
                                yCount = 1;
								return false;
                            }
                        }   
					
						if(yCount ==0){
							
							loadDetailsTab5();
						}

                    }
                   
                    if(index==5){
				
                        if (!checkBlankNumber('Savings Envisaged','savingsEnvisaged')){		
                            return false;
                        }

                        if (!checkBlank('Payback Period','paybackPeriod')){		
                            return false;
                        }
						
						
                    } 
                    if(index==6){
                      var attachCounter =   $('#hiddDirectorySizeadditional').val();
					  if (attachCounter ==0){		
							alert("Please attached atleast one  Document !");
							return false;
						}
                    } 
                    if(index==7){
                            var rCounter =  $('#revCounter').val();    
                            var aCounter =  $('#appCounter').val();    
                            
                            for (jj=0 ; jj<rCounter; jj++){		
                                if (!checkBlankSelect('Recommended By','reviewedBy'+jj)){		
                                    return false;
                                }
                            }	
                            for (zz=0 ; zz<aCounter; zz++){		
                                if (!checkBlankSelect('Approved By','approvedBy'+zz)){		
                                    return false;
                                }
                            }
                    } 
                

	  		},
			'onTabClick': function(tab, navigation, index) {
			return false;
		},
		'onTabShow': function(tab, navigation, index) {
			var $total = navigation.find('li').length;
			var $current = index+1;
			var $percent = ($current/$total) * 100;
			$('#rootwizard .progress-bar').css({width:$percent+'%'});
			
			if($current >= $total) {
				$('#rootwizard').find('.next').hide();
				$('#rootwizard').find('.finish').show();
				$('#rootwizard').find('.finish').removeClass('disabled');
			} else {
				$('#rootwizard').find('.next').show();
				$('#rootwizard').find('.finish').hide();
			}
		}
	  	});
		
		window.prettyPrint && prettyPrint();
	});
	</script>
<script>
	$(document).ready(function(){		
		  var r=1;
		$("#row4_add").click(function(){
		$('#rowId'+r).html("<td  class='text-center'>"+ (r+1) +"</td> <td class='text-center'><input type='text' class='form-control text-left ' name='header"+r+"' id='header"+r+"' maxlength='100'></td><td class='text-center' ><input type='text' class='form-control text-left ' name='particulars"+r+"' id='particulars"+r+"' maxlength='500'></td><td class='text-right'><input type='text' class='form-control text-right ' name='quantity"+r+"' id='quantity"+r+"'  onblur = 'javascript:calculateTotalQuantity();' maxlength='5'></td><td class='text-right'><input type='text' class='form-control text-right ' name='estimatedCost"+r+"' id='estimatedCost"+r+"' onblur='javascript:checkBlankNumber(\"Estimated Cost\",\"estimatedCost"+r+"\"); calculateTotalQuantity();' placeholder='Format (00.00)' maxlength='7'></td><td class='text-right'><input type='text' class='form-control text-right ' name='totalCost"+r+"' id='totalCost"+r+"' readonly></td>");		
			$('#tab_logic1').append('<tr id="rowId'+(r+1)+'"></tr>');
			r++; 
            $("#counter").val(r);
		});
		$("#row4_del").click(function(){
			if(r>1){
				$("#rowId"+(r-1)).html('');
				r--;
           $("#counter").val(r);
           calculateTotalQuantity();
			}
		});
	});
</script>
</html>
