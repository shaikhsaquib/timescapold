<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<%@ page errorPage="../includes/error.jsp" %>  
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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/3.5.2/select2.css" rel="stylesheet"/>

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
	<script src="../jscript/jquery.bootstrap.wizard.min.js"></script>
	<script src="../jscript/jquery.validate.min.js"></script>
	<script src="../jscript/additional-methods.min.js"></script>
    <script src="../jscript/capex.js"></script>
	<script src="../jscript/common.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/3.5.2/select2.js">;
<script>
	$(".multi").select2({ width: '100%'  });
</script>
</head>
<%
	
	
	
	
	String requestId = (String)request.getParameter("requestId");
	Hashtable htMy = new Hashtable();	
	
	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" , "Financial Year" ,"Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted" , "Project Closed Out Report", "Rationale" , "Project Description" ,"Particulars" , "Estimated Cost" , "Asset Disposal" , "Savings Envisaged","Payback Period" , "Project Sponsor" , "Project Coordinator" ,"Total","compAttachment","attachmentFolderName"};
	
	session.removeAttribute("requestNumber");
	session.removeAttribute("background");
	session.removeAttribute("rationale");
	session.removeAttribute("savingEnvisaged");
	session.removeAttribute("paybackPeriod");
	
    htMy.put("HEADERSECTION1", headerSection);
    htMy.put("DOCUMENTOID", "DOC1005");	
	htMy.put("REQUESTOID",requestId);
	String headerData [] = null;
	String headerData5 [] = null;
    ArrayList searchList =  capexHeaderController.viewAll("sdf","sdfsd",htMy);
	session.removeAttribute("dataList");
	
	String proposalList = "";
	String requestNumber = "";
	String background = "";
	String rationale = "";
	String savingEnvisaged = "";
	String paybackPeriod = "";
	
	int searchSize = searchList.size();

	if (searchSize> 0){
		for (int eee = 0; eee < searchSize; eee++) {
			 headerData = (String[]) searchList.get(eee);  
			for (int eee1 = 0; eee1 < headerData.length; eee1++) {
				//out.println(" headerData["+eee1+ "] " +headerData[eee1]) ;  
			}
			requestNumber = headerData[0];	
			background	= headerData[22];
			rationale = headerData[21];
			savingEnvisaged	= headerData[26];		 
			paybackPeriod = headerData[27];
			//proposalList+="<option value=\""+requestNumber+"\"  style='normal' selected>"+requestNumber+"</option>";		
		}
	}
	
	
	session.setAttribute("requestNumber",requestNumber);			
	session.setAttribute("background",background);			
	session.setAttribute("rationale",rationale);			
	session.setAttribute("savingEnvisaged",savingEnvisaged);			
	session.setAttribute("paybackPeriod",paybackPeriod);
	
	ArrayList propList = (ArrayList) session.getAttribute("searchList");
	int propSize = propList.size();
	
	if (propSize> 0){
		for (int eee1 = 0; eee1 < propSize; eee1++) {
			 headerData5 = (String[]) propList.get(eee1);  
			//for (int eee11 = 0; eee11 < headerData5.length; eee11++) {
				//out.println(" headerData["+eee11+ "] " +headerData5[eee11]) ;  
			
			String requestNo = headerData5[0];
			String projectTitle =  headerData5[7];
			 if(requestId.equals(requestNo)){
				 proposalList+="<option value=\""+requestNo+"\"  style='normal' selected>"+requestNo+"-"+projectTitle+"</option>";	
			 }else {
				 proposalList+="<option value=\""+requestNo+"\"  style='normal' >"+requestNo+"-"+projectTitle+"</option>";	
			 }
			//}	
		}
	}	
	
	
	String status = headerData[33];	
	Hashtable ht = new Hashtable();
	Hashtable htable = new Hashtable();
    ht.put("COMPANYCODE","1000");
 //   ArrayList locList =  capexHeaderController.listLocations(ht);
 //   ArrayList deptList = capexHeaderController.listDepartments(ht);
   // ht.put("DEPTCODE",deptGroup);
 //   ArrayList emailList = capexHeaderController.getEmailId(ht);
 //   ht.put("PAYROLLTYPE","ADIR','CONF");
 //   ArrayList drList = capexHeaderController.getEmailId(ht);
    
 //   int locSize = locList.size();
 //   int deptSize= deptList.size();
  //  int emailSize = emailList.size();
 //   int deSize = drList.size();
	
    String locStr = "";
    String deptStr = "";
    String emailStr = "";
    String drStr = "";
	/*
    if( locSize > 0){  
        for (int iii = 0; iii < locSize; iii++) {
            String locData[] = (String[]) locList.get(iii);    
			if(locData[4].equals(headerData[11])){
				locStr+="<option value=\""+locData[4]+"\"  style='normal' selected>"+locData[5]+"</option>";
			}else{			
				locStr+="<option value=\""+locData[4]+"\" style='normal' >"+locData[5]+"</option>";
			}
        }
    }
    if( deptSize > 0){  
        for (int jjj = 0; jjj < deptSize; jjj++) {
            String deptData[] = (String[]) deptList.get(jjj);   
			if(deptData[2].equals(headerData[12])){
				deptStr+="<option value=\""+deptData[2]+"\"  style='normal' selected>"+deptData[3]+"</option>";
			}else{			
				deptStr+="<option value=\""+deptData[2]+"\" style='normal'>"+deptData[3]+"</option>";
			}            
        }
    }
  
    if( emailSize > 0){  
        for (int kkk = 0; kkk < emailSize; kkk++) {
            String emailData[] = (String[]) emailList.get(kkk);   
			if(emailData[6].equals(headerData[13])){
				emailStr+="<option value=\""+emailData[6]+"\"  style='normal' selected>"+emailData[6]+"</option>";
			}else{			
				emailStr+="<option value=\""+emailData[6]+"\" style='normal'>"+emailData[6]+"</option>";
			}             
        }
    }
 
    if( deSize > 0){  
        for (int mmm = 0; mmm < deSize; mmm++) {
            String drData[] = (String[]) drList.get(mmm); 	
            drStr+="<option value=\""+drData[6]+"\" style='normal'>"+drData[6]+"</option>";
        }
    }
*/
	htable.put("DOCID","DOC1005");
	htable.put("PROFILETEXT","APPROVALS");
	ArrayList appList =  capexHeaderController.getZonalEmailId(htable);
    int appSize = appList.size();

	String appStr = "";
	if( appSize > 0){  
        for (int ccc = 0; ccc < appSize; ccc++) {
            String appData[] = (String[]) appList.get(ccc);  	
           appStr+="option value=\""+appData[6]+"\" style='normal'>"+appData[6]+"</option>";
		
        }
    }

String  category [] = {"Productivity Improvement","Capacity Enhancement","Statutory Compliance","Infrastructure","Saving/Payback","Obsolescence/Replacement"};
String categoryList = "";
   int sizeCatArray = category.length;
 
            if( sizeCatArray > 0){  
                    for (int ew = 0; ew < sizeCatArray; ew++) {
						 String headerCat1 = (String) category[ew];      
						 if(headerData[14].equals(headerCat1)){
								categoryList+="<option value=\""+headerCat1+"\"  style='normal' selected>"+headerCat1+"</option>";
						 }else{
								categoryList+="<option value=\""+headerCat1+"\" style='normal'>"+headerCat1+"</option>";
						}
                    }
                }

				
				
				
//session.setAttribute("dataList",searchList);
%>

					
					    <div class="tab-pane" id="tab1">
						 <div class="row"  id="loadPage">							
							<div class="col-xs-6">
								<div class="form-group grp">
									<label class="control-label col-xs-4">Proposal No.</label>
									<div class="col-xs-8">
									<div class="input-group">										
										<span class="input-group-addon">
										<i class="fa fa-list-ol" style="width:11px;"></i>
										</span>
										<select class="form-control multi" name="proposalNo" id="proposalNo" onChange="javascript:loadDetailsTab1();">
											<option value="0">SELECT PROPOSAL NUMBER</option>
															<%=proposalList%>						
										</select>										
										</div>
									</div>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group grp">
									<label class="control-label col-xs-4">&nbsp;</label>
									<div class="col-xs-8">
									<div class="input-group">										
										<span class="input-group-addon">
										<!--i class="fa fa-list-ol" style="width:11px;"></i-->
										</span>
										<button type="button" class="btn btn-primary" onclick="window.open('../view/viewProposal.jsp?status=A&id=<%=requestId%>', '', '');"><i class="fa fa-eye"></i>&nbsp;View Proposal</button>										
										</div>
									</div>
								</div>
							</div>							
						 </div >
					      <div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label class="control-label col-xs-4">Project Title</label>
									<div class="col-xs-8">
									<div class="input-group">
										<span class="input-group-addon">
										<i class="fa fa-bars" style="width:11px;"></i>
										</span>
										<input type="text" class="form-control" placeholder="Project Title" name="projectTitle" id="projectTitle" maxlength="150" value="<%=headerData[7]%>" >
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
                                        <%=categoryList%>
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
									<input type="text" class="form-control  text-right"  placeholder="Capex Amount " name="capexAmount" id="capexAmount" onblur = "javascript:checkBlankNumber('Capex Amount','capexAmount');" maxlength="7" value="<%=headerData[9]%>"> 
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
										<input type="text" class="form-control  text-right" placeholder="Opex Amount " name="opexAmount" id="opexAmount" onblur = "javascript:checkBlankNumber('Opex Amount','opexAmount');" maxlength="7" value="<%=headerData[10]%>"> 
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
										<input type="text" class="form-control" placeholder="Location" name="proLocation" id="proLocation" maxlength="50" onkeyup="lookupAll(this.value,'suggestions','autoSuggestionsList','loc');" value="<%=headerData[11]%>" >								
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
											<input type="text" class="form-control" placeholder="Function" name="proFunction" id="proFunction" maxlength="50" onkeyup="lookupAll(this.value,'suggestions2','autoSuggestionsList2','dept');" value="<%=headerData[12]%>"></div>
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
								id="projectManager" maxlength="50" onkeyup="lookupAll(this.value,'suggestions1','autoSuggestionsList1','email');" value="<%=headerData[13]%>"></div>
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
								<input type="text" class="form-control text-right"  placeholder="Budget Amount " name="budgetAmount" id="budgetAmount" onblur = "javascript:checkBlankNumber('Budget Amount','budgetAmount');" maxlength="7" value="<%=headerData[16]%>"> 
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
								<textarea class="form-control noresize" rows="2" maxlength="100" id="reasonIfUnbudgeted"  name="reasonIfUnbudgeted"><%=headerData[19]%></textarea>
							</div>
						</div>
					</div>
				</div>
				
		</div>
					   
