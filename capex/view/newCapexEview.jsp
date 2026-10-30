<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexkeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Capex Proposal</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"  /> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/chat.css" rel="stylesheet">
	<style>
	.pagebreak 
	{ page-break-before: always; 
	}
	@media print 
	{
		body {width:900px; }
			div[class|=col-]{ float: none;}
			.col-sm-6{width:50%}			
		
		.table-responsive{
			width:100%;
			overflow-x:visible;
		}
		.table-bordered{
		border: 2px solid #000;
		border-collapse:collapse !important;
		}
		.table-bordered th,
		.table-bordered td {
		border: 1px solid #000 !important;
		}
		.np1{
		display:none;
		}
		.noborder td{
		border-style:none !important;
		}
		.RelatedLinks{
			display:none;
		}
		.panel-body{
			height:auto;
		}		
	}	
	</style>
	<script src="../jscript/html5shiv.js"></script>
	<script src="../jscript/respond.min.js"></script>	
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/capex.js"></script>
	<script src="../jscript/common.js"></script>
	

	
	<script>
	
	$(document).ready(function() {
	
	  var i=1;
    $("#add_row").click(function(){
		$('#addr'+i).html("<td>"+ (i+1) +"</td> <td><input name='date"+i+"' type='text' placeholder='issue date' class='form-control input-md datepicker_recurring_start normal'  /> </td><td><select  name='pub"+i+"'  class='form-control input-md normal'>'<option>Option 1</option>' '<option>Option 2</option>' '<option>Option 3</option>' '<option>Option 4</option>'</td><td><select  name='loc"+i+"'  class='form-control input-md normal'>'<option>Option 1</option>' '<option>Option 2</option>' '<option>Option 3</option>' '<option>Option 4</option>'</td>    ");		
		$('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
		i++; 
	});
    $("#delete_row").click(function(){
    	if(i>1){
			$("#addr"+(i-1)).html('');
			i--;
		}
	});
	
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});	
	
	$('.collapse').on('shown.bs.collapse', function(){
	$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
	}).on('hidden.bs.collapse', function(){
	$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
	});

	$('.closeall').click(function(){
	$('.panel1-collapse1.in ')
		.collapse('hide');
	});
	
	$('.openall').click(function(){
	$('.panel1-collapse1:not(".in")')
		.collapse('show');

		$('.panel-collapse:not(".in")')
		.collapse('show');

		});
	
	$('.printall').click(function(){
	$('.panel1-collapse1:not(".in")')
		.collapse('show');
		myFunction();
		
	});
	function myFunction(){
			 window.print();
	}

	//function openAllFunction(){
		//$('.panel1-collapse1:not(".in")').collapse('show');
		//$('.panel-collapse:not(".in")').collapse('show');
	//}

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
	
	function showhide()
	{
		var div = document.getElementById("firstdiv");
		if (div.style.display !== "none") {
		div.style.display = "none";
	}
	else {
		div.style.display = "block";
	}
	}
	  function setFocus() {
    var editor = $('.date');
    var value = editor.val();
    editor.val("");
    editor.focus();
    editor.val(value);
}
	</script>
</head>
<%	
	String locStr = null;
	String deptStr = null;
	String emailStr = null;
	String drStr = null;
	String createdBy = null;
	String createdOn = null;
	String headerData[] = null; 
	String proposalNo = null;
	String requestId = (String)  request.getParameter("id");
    String status = (String)  request.getParameter("status");
    String mode = (String)  request.getParameter("mode");

	//out.println(requestId + " : " +status);
    Hashtable ht = new Hashtable();
    String activeFlag ="";
    String disabledFlag ="";
	String keywords = 	"";
	String currStatus = "";
	//out.println(" emailId :"+ emailId);
//	emailId ="rishiraj.shukla@timesgroup.com";
	//status = "R";
	String detailsSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment","attachmentFolderName"};
	
    ht.put("DETAILSECTION1", detailsSection);
    ht.put("DOCUMENTOID", "DOC1005");
    ht.put("REQUESTOID", requestId);
    
    ArrayList headerDataList =  capexDeatilsController.view("sdf","sdfsd",ht);
    
    int headerSize = headerDataList.size();
     
//	out.println(" headerSize :"+ headerSize);
	if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
           
            for (int eee1 = 0; eee1 < headerData.length; eee1++) {
                 createdBy = headerData[4];
				 keywords = headerData[16] ;
				 createdOn = headerData[46] ;
				 proposalNo = headerData[7];
				 currStatus = headerData[49] ;
				//out.println (" headerData [ "+ eee1 +"] : " + headerData[eee1]);
            }
        }
    }
	//for(int eee11 = 0; eee11 < headerData.length; eee11++){               
   //   out.println(" headerData ["+eee11+"]-"+headerData[eee11]);
   //   }
	  
	  
	  
	  
	String headerSection []	={"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" ,"Financial Year","Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted","Project Closed Out Report","Rationale","Project Description","Particulars","Estimated Cost","Total","Asset Disposal","Savings Envisaged","Payback Period","Project Sponsor","Project Coordinator","compAttachment","attachmentFolderName" ,"Opex Particulars", "Opex Estimated Cost","Total Opex"};
	
	Hashtable htableHeader = new Hashtable();
	
    htableHeader.put("HEADERSECTION1", headerSection);
    htableHeader.put("DOCUMENTOID", "DOC1005");
	htableHeader.put("REQUESTOID", proposalNo);
    String hDetailsData[] = null; 
    ArrayList headerList =  capexHeaderController.viewAll("sdf","sdfsd",htableHeader);
	int hDetailsSize = headerList.size();
     
	//out.println(" ===============================================");
	if( hDetailsSize > 0){  
        for (int ee = 0; ee < hDetailsSize; ee++) {
           hDetailsData = (String[]) headerList.get(ee);            
        //    for (int ee1 = 0; ee1 < hDetailsData.length; ee1++) { 				
			//	out.println (" hDetailsData [ "+ ee1 +"] : " + hDetailsData[ee1]);
          //  }
        }
    }
	  
	  
			
	Hashtable htable = new Hashtable();
	
	htable.put("DOCUMENTOID", "DOC1005");
	htable.put("APPLICATION", "capex");
    htable.put("WORKITEMOID", requestId);
	ArrayList commentArray = new ArrayList();
	commentArray  = capexkeyWordController.view("","",htable);
	int commSize =  commentArray.size();
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat format3 = new SimpleDateFormat("dd-MMM-yyyy");
	try {
		Date date = (Date) format1.parseObject(createdOn);	
		createdOn = format3.format(date);										
	} catch (ParseException e) { 
	e.printStackTrace();
	}
	String loggedInUser[] = emailId.split("@");
	String keyWordsStr[] = null;
	String strKeySelect = "";
	if(keywords.contains(",")){
			keyWordsStr = keywords.split(",");	
			for(int ii=0;ii<keyWordsStr.length;ii++){
				String keyArray = keyWordsStr[ii];
				strKeySelect+="<option value="+keyArray+">"+keyArray+"</option>"; 										
			}				
		}else{
			strKeySelect+="<option value="+keywords+">"+keywords+"</option>"; 	
		}	
	
	
%>
<body onload = "showAttachmentFile('additional','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard')"> 
<%@ include file="../includes/relatedLinksnew.jsp" %>

 
<form action="#" class="form-horizontal" role="form" name="viewWizard">
	<div class="container-fluid">
	<div class="row">
	<div class="col-lg-1"></div>	
	<div class="col-xs-12 col-md-12 col-lg-10 col-sm-12 bs-example">
		<h3 class="form-section ">CAPEX Expenditure Note </h3><hr>
		<div class="row"><div class="col-xs-12 col-md-12 col-lg-12 col-sm-12 "> <a href="#" class="btn btn-primary openall np1"  onclick="showAttachmentFiles('additional','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard');"> <span class="glyphicon glyphicon-plus "></span> open all</a> <a href="#" class="btn btn-primary closeall np1"> <span class="glyphicon glyphicon-minus"></span> close all</a>
		 <a  class="btn btn-primary btn-sm col-xs-offset-2 pull-right printall np1"  ><i class="fa fa-print" aria-hidden="true"></i> Print</a></div></div>
		 
		  <div class="panel panel-default" style="margin-bottom:8px;margin-top:4px;">
            <div class="panel-heading">
                <h4 class="panel-title">
                    Project Details :<font color="red"><b style="float: right;"> Rs. in Lakhs</b></font>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in ">
                <div class="panel-body" style="height:auto;overflow-y:hidden;">				
				  <table class="table table-bordered" style="page">					
					<tbody>
						
						<tr>
							<td><strong>Project Title</strong></td>
							<td colspan="4"><%=headerData[6]%> <input type="hidden" id="projectTitle" name= "projectTitle" value="<%=headerData[6]%>"><input type="hidden" id="keywordsAll" name= "keywordsAll" value="<%=keywords%>"><input type="hidden" id="proposalNo" name= "proposalNo" value="<%=proposalNo%>"></td>
							<td><a href="#myModal2"  class="btn btn-default btn-sm pull-right np1" data-toggle="modal" onclick="showAttachmentFile('additional','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard');"><i class="fa fa-paperclip" style="color:green;"></i><b> View Attachments </b></a>  </td>
						</tr>
						<tr>
							<td><strong>Request No :</strong></td>
							<td class="text-right"><%=headerData[1]%><input type="hidden" id="requestId" name= "requestId" value="<%=headerData[1]%>"></td>
							<td><strong>Key Drivers :</strong></td>
						<td class="text-left" colspan="3"><%=keywords%><input type="hidden" id="createdOn" name= "createdOn" value="<%=createdOn%>"></td>
							<!--td><strong>Submitted On :</strong></td>
							<td class="text-right"><//%=createdOn%><input type="hidden" id="createdOn" name= "createdOn" value="<//%=createdOn%>"></td>
							<td><strong>Submitted By :</strong></td>
							<td  style="word-wrap: break-word;"><//%=headerData[45]%></td-->
						</tr>
						<tr>
							<td><strong>Proposed Amount :</strong></td>
							<td class="text-right"><%=headerData[9]%><input type="hidden" id="capexAmount" name= "capexAmount" value="<%=headerData[9]%>"></td>
							<td><strong>Opex Amount :</strong></td>
							<td class="text-right"><%=headerData[10]%><input type="hidden" id="opexAmount" name= "opexAmount" value="<%=headerData[10]%>"></td>
							<td><strong>Budgeted Amount :</strong></td>
							<td class="text-right"><%=headerData[15]%></td>
						</tr>
						<tr>
							<td><strong>Financial Year :</strong></td>
							<td class="text-right"><%=hDetailsData[15]%></td>
							<td><strong>Payback Period :</strong></td>
							<td><%=headerData[40]%></td>
							<td><strong>Savings Envisaged :</strong></td>
							<td class="text-right"><%=headerData[39]%></td>
						</tr>
						<tr>			
							<td><strong>Project Category :</strong></td>
							<td><%=headerData[8]%><input type="hidden" id="projectCategory" name= "projectCategory" value="<%=headerData[8]%>"></td>
							<td><strong>Location:</strong></td>
							<td><%=headerData[11]%></td>
							<td><strong>Function :</strong></td>
							<td><%=headerData[12]%><input type="hidden" id="projectFunction" name= "projectFunction" value="<%=headerData[12]%>"></td>
						</tr>
<tr>						
						<td colspan="6">
							<a href="#myModal1" class="btn btn-default btn-sm pull-left np1" data-toggle="modal"><i class="fa fa-comment fa-2x" style=
							"color:#2e6da4;padding-top:2px;"></i>  <b>Comments </b>  <span class="badge" style="margin-left:3px;"><%=commSize%></span></a>
						<% if("A".equals(mode)){  %>
						<a href="#myModal5"  class="btn btn-danger pull-right np1" data-toggle="modal" style="margin-left:3px;"><i class="fa fa-times"></i> Reject</a><a href="#myModal4"  class="btn btn-danger pull-right np1" data-toggle="modal"><i class="fa fa-check-circle"></i> Approve</a>
						<%}if("R".equals(mode)){ %>
						<a href="#myModal3" class="btn btn-danger pull-right np1" data-toggle="modal" style="margin-right:3px;"><i class="fa fa-eye" aria-hidden="true"></i> Review</a>
						<% }%>
						<a href="#"  class="btn btn-danger pull-right np1" style="margin-right:3px;" data-toggle="modal" onclick="history.back();"><i class="fa fa-check-circle"></i> Back</a>
						<% if(createdBy.equals(emailId) && (!"RJ".equals(currStatus) && !"R".equals(currStatus) && !"CL".equals(currStatus))){ %>
						<a href="#"  class="btn btn-danger pull-right np1" style="margin-right:3px;" data-toggle="modal" onClick = "javascript:startApproval();"><i class="fa fa-check-circle"></i> Initiate Approval Process</a>
						<a href="#myModal6"  class="btn btn-danger pull-right np1" style="margin-right:3px;" data-toggle="modal" ><i class="fa fa-check-circle"></i> Additional Reviewer</a>
						
						
						<% } %>
						</td>
						</tr>
						
					</tbody>
				</table>
				</div>
			</div>
		</div>
		 
		<div class="panel-group" id="accordion" style="margin-top:5px;">
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> <span class="glyphicon glyphicon-plus"></span> Project Brief  :</a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel1-collapse1 collapse">
                <div class="panel-body" style="height:auto;overflow-y:hidden;">
					<div class="table-responsive ">
			  <table class="table table-bordered">
				<tbody>
					<tr>
						<td><strong>Project Start Date :</strong></td>
						<td class="text-right"><%=hDetailsData[17]%></td>
						<td><strong>Project End Date :</strong></td>
						<td class="text-right"><%=hDetailsData[18]%></td>
						<td><strong>Project Close-Out Date :</strong></td>
						<td class="text-right"><%=hDetailsData[20]%></td>
					</tr>					
				</tbody>
			</table>
			</div>
			<div class="table-responsive ">
			  <table class="table table-bordered">				
				<tbody>
					<tr>
						<td width="5%"><strong>Reasons (If Unbudgeted):</strong></td>
						<td width="30%"><%=headerData[17]%></td>
					</tr>
					<tr>
						<td width="5%"><strong>Rationale:</strong></td>
						<td width="30%"><%=headerData[29]%></td>
					</tr>
					<tr>						
						<td><strong>Recommendation:</strong></td>
						<td><%=headerData[28]%></td>
					</tr>
					<tr>
						<td width="15%"><strong>Project Description:</strong></td>
						<td width="40%"><%=headerData[30]%></td>
					</tr>					
				</tbody>
			</table>
			</div>			
				</div>
			</div>
		</div>
		<div class="pagebreak"> </div>	
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"> <span class="glyphicon glyphicon-plus"></span> Capex Opex Details</a>
                </h4>
            </div>
            <div id="collapseThree" class="panel1-collapse1 collapse">
			<div class="panel-body" style="height:auto;overflow-y:hidden;">
			<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
			   <table class="table table-bordered">
			<thead>
			<tr class="info" >
				<th class="text-center" width="15%" colspan="6" style="text-align:left;">Capex Details &nbsp;&nbsp;(Rs. in Lakhs)</th>
			</tr>
			</thead>
			<thead>
			<tr class="active">
				<th class="text-center" width="1%">Sr.No.</th>							
				<th class="text-center" width="27%">Header</th>
				<th class="text-center" width="27%">Particulars</th>
				<th class="text-center" width="7%">Quantity/Jobs</th>
				<th class="text-center" width="9%">Estimated Cost</th>
				<th class="text-center" width="7%">Total Cost</th>	
			</tr>
			</thead>
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
			<tr>
				<td class="text-center"><%=ii+1%></td>
				<td class="text-left"><%=headers[ii]%></td>
				<td class="text-left"><%=particulars[ii]%></td>
				<td class="text-right"><%=quantities[ii]%></td>
				<td class="text-right"><%=estimatedCosts[ii]%></td>
				<td class="text-right"><%=totalCosts[ii]%></td>
			</tr>
						<% } %>
			<tr><td colspan="5"  class="text-right">Total</td><td  class="text-right"><%=headerData[38]%></td></tr>
		</tbody>
		</table>
            </div>			
			<!--div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 ">
			<table class="table table-bordered">
			<thead>
			<tr class="warning" >
				<th class="text-center" width="15%" colspan="3" style="text-align:left;">Opex Details</th>
			</tr>
			</thead>
			<thead>
			<tr class="">
				<th class="text-center" width="2%">Sr.No.</th>
				<th class="text-center" width="19%">Particulars</th>
				<th class="text-center" width="9%">Estimated Cost</th>
				
			</tr>
			</thead>			
		<tbody>
			<tr>
				<td class="text-center">1</td>
				<td class="text-left"></td>
				<td class="text-left"></td>
			</tr>			
		</tbody>
		</table>
            </div-->
            </div>
				</div>
			</div>
		</div>
	
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"> <span class="glyphicon glyphicon-plus"></span> Participants</a>
                </h4>
            </div>
            <div id="collapseFour" class="panel1-collapse1 collapse">
                <div class="panel-body" style="height:auto;overflow-y:hidden;">
				<table class="table table-bordered">
				<tbody>
					<tr>
						<td><strong>Created By :</strong></td>
						<td><%=headerData[45]%><input type="hidden" id="createdBy" name= "createdBy" value="<%=headerData[45]%>"></td>
						<td><strong>Project Manager :</strong></td>
						<td><%=headerData[13]%><input type="hidden" id="projectManager" name= "projectManager" value="<%=hDetailsData[13]%>"></td>						
					</tr>
					<tr>
						<td><strong>Project Sponsor :</strong></td>
						<td><%=hDetailsData[29]%><input type="hidden" id="projectSponsor" name= "projectSponsor" value="<%=hDetailsData[29]%>"></td>
						<td><strong>Project Co-Ordinator :</strong></td>
						<td><%=hDetailsData[30]%><input type="hidden" id="projectCoordinator" name= "projectCoordinator" value="<%=hDetailsData[30]%>"></td>						
					</tr>
					<tr>										
						<td><strong>Supported By / Recommended By  :</strong></td>
						<td>
						<% 
						
						String suppString[] = headerData[41].split(";");
						int suppSize = suppString.length;	
						for (int hh = 0; hh < suppSize; hh++){
						%>	<table class="table noborder" style="margin-bottom:2px;margin-top:2px;">
								<tr><td style="border-bottom: 1px solid #ddd;border-top:0px;"><%=suppString[hh]%></td></tr>
							</table>
						<%} %>
						</td>
						<td><strong>Approved By :</strong></td>
						<td>
						<%						
						String appString[] = headerData[42].split(";");
						int appSize = appString.length;	
						for (int ap = 0; ap < appSize; ap++){
						%>	<table class="table noborder" style="margin-bottom:2px;margin-top:2px;">
								<tr><td style="border-bottom: 1px solid #ddd;border-top:0px;"><%=appString[ap]%></td></tr>
							</table>
						<%} %>
						</td>		
					</tr>
					
				</tbody>
			</table>				
				</div>
			</div>
		</div>
		
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseFive" onclick="showAttachmentFiles('additional','<%=requestId%>','<%=createdBy%>','<%=status%>','viewWizard');"> <span class="glyphicon glyphicon-plus"></span>Attachments :</a>
                </h4>
            </div>
            <div id="collapseFive" class="panel1-collapse1 collapse ">
                <div class="panel-body" style="height:auto;overflow-y:hidden;">
				 <p id="attachment2"></p>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapsesix"> <span class="glyphicon glyphicon-plus"></span>Comments :</a>
                </h4>
            </div>
			<div id="collapsesix" class="panel1-collapse1 collapse ">
				<div class="panel">
				<!--Heading-->
				<!--Widget body-->
					<div id="demo-chat-body" class="collapse in">
						<div  style="height:auto">
							<div class="panel-body">
								<ul class="list-unstyled media-block">
								<%	if(commSize>0){				
									for (int yy=0;yy<commSize;yy++){
											String commentStrArray [] =(String[]) commentArray.get(yy);              
											String userEmail[] = commentStrArray[5].split("@");
											String createdOn1 = commentStrArray[6];
											String commentsHere = commentStrArray[4];
											String commentStatus = commentStrArray[7];
											commentsHere = commentsHere.replaceAll("%26","&");							
											SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
											SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
											try {
													Date date = (Date) format.parseObject(createdOn1);
													createdOn1 = format2.format(date);										
											} catch (ParseException e) { 
												e.printStackTrace();
												}
										if(loggedInUser[0].equals(userEmail[0])){		
								%> 								
									<li class="mar-btm">
										<div class="media-left">
											<img src="../images/user1.png" class="img-circle img-sm" alt="Profile Picture">
										</div>
									<div class="media-body pad-hor">
										<div class="speech">
											<a href="#" class="media-heading"><%=userEmail[0]%></a>
											<p><%=commentsHere%></p>
											<p class="speech-time" >
											<i class="fa fa-clock-o fa-fw"></i><%=createdOn1%>
											</p>
										</div>
									</div>
									</li>
									<%}else{    
												if("CL".equals(commentStatus) || "A".equals(commentStatus)){%>
													<li class="mar-btm">
														<div class="media-left">
															<img src="../images/user2.png" class="img-circle img-sm" alt="Profile Picture">
														</div>
													<div class="media-body pad-hor">
														<div class="speech">
															<a href="#" class="media-heading"><%=userEmail[0]%></a>
															<p><%=commentsHere%></p>
															<p class="speech-time">
															<i class="fa fa-clock-o fa-fw"></i> <%=createdOn1%>
															</p>
														</div>
													</div>
													</li>
												<% }else{ %>
													<li class="mar-btm">
														<div class="media-right">
															<img src="../images/user2.png" class="img-circle img-sm" alt="Profile Picture">
														</div>
													<div class="media-body pad-hor speech-right">
														<div class="speech">
															<a href="#" class="media-heading"><%=userEmail[0]%></a>
															<p><%=commentsHere%></p>
															<p class="speech-time">
															<i class="fa fa-clock-o fa-fw"></i> <%=createdOn1%>
															</p>
														</div>
													</div>
													</li>
												<% }}}}else{ %>
									<li class="mar-btm">										
									<div class="media-body pad-hor speech">
										<div class="speech-center">											
											<p class="text-center">No Comments Found</p>											
										</div>
									</div>
									</li>
								
								
							<%	} %>						
								</ul>
							</div>
							<div class="nano-pane">
								<div class="nano-slider" style="height: 141px; transform: translate(0px, 0px);">
								</div>
							</div>
						</div>

					<!--Widget footer-->					
					</div>
				</div>
			</div>			
		</div>
		</div>
		</div>
	<div class="col-lg-1 "></div>
	</div>	 
</div>  
 
<div id="myModal1" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-comment-o fa-2x"></i> Comments</h4>
			</div>
			<div class="modal-body">
			   <br>
				<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-12 ">
				<div class="panel-body" style="height:auto;overflow-y:hidden;">
				<div class="panel panel-primary">                
                <div class="panel-body" style="height: auto !important; overflow-y: hidden !important;">
                    <ul class="list-unstyled media-block">
					<%
						if(commSize > 0){
						for (int yy=0;yy<commSize;yy++){
								String commentStrArray [] =(String[]) commentArray.get(yy);              
								String userEmail[] = commentStrArray[5].split("@");
								String createdOn1 = commentStrArray[6];
								String commentsHere = commentStrArray[4];
								commentsHere = commentsHere.replaceAll("%26","&");							
								SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
								SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
								try {
										Date date = (Date) format.parseObject(createdOn1);
										createdOn1 = format2.format(date);										
								} catch (ParseException e) { 
									e.printStackTrace();
									}
							if(loggedInUser[0].equals(userEmail[0])){		
					%>
					 <li class="mar-btm">
									<div class="media-left">
										<img src="../images/user1.png" class="img-circle img-sm" alt="Profile Picture">
									</div>
								<div class="media-body pad-hor">
									<div class="speech">
										<a href="#" class="media-heading"><%=userEmail[0]%></a>
										<p><%=commentsHere%></p>
										<p class="speech-time">
										<i class="fa fa-clock-o fa-fw"></i><%=createdOn1%>
										</p>
									</div>
								</div>
								</li>
								<%}else{ %>
								<li class="mar-btm">
									<div class="media-right">
										<img src="../images/user2.png" class="img-circle img-sm" alt="Profile Picture">
									</div>
								<div class="media-body pad-hor speech-right">
									<div class="speech">
										<a href="#" class="media-heading"><%=userEmail[0]%></a>
										<p><%=commentsHere%></p>
										<p class="speech-time">
										<i class="fa fa-clock-o fa-fw"></i> <%=createdOn1%>
										</p>
									</div>
								</div>
								</li>
							<% }}}else{ %>
									<li class="mar-btm">										
									<div class="media-body pad-hor speech">
										<div class="speech-center">											
											<p class="text-center">No Comments Found</p>											
										</div>
									</div>
									</li>					
								
							<%	} %>	 
							</ul>
                </div>                
            </div>
				</div>
				<!--div class="panel-footer">
				<div class="input-group">
					<input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
					<span class="input-group-btn" >
						 <button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-left:5px;">Send</button>
					</span>
				</div>
			</div-->
		</div>
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			   
			</div>
		</div>
	</div>
</div>
<div id="myModal2" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-paperclip"></i>  Attachments</h4>
			</div>
			<div class="modal-body">
			  
				<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-12 ">
		  <p id="attachment1"></p>
		</div>
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			   
			</div>
		</div>
	</div>
</div>
<div id="myModal6" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-eye"></i> Additional Reviewer</h4>
			</div>
<div class="modal-body ">
			<div class="form-group"> 
				<br>
				 <label class="col-xs-2 control-label">Email Id : </label> 								
				 <div class="col-xs-8"> 
					   <input type="text" placeholder="Search" class="form-control width:4px;" name="recommendedBy" id="recommendedBy"  onkeyup="lookup(this.value);" style="font-size:12px;" >
						<div class="suggestionsBox" id="suggestions" style="display:none;text-align:left;" class="form-control">
							<div class="suggestionList Breakword" id="autoSuggestionsList" style="padding-left:2px;text-align:left;">
							</div>
						</div>	
				 </div> 
			</div> 
</div>			
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal" style="margin-left:5px;"  onClick ="saveRecommendation();">Send</button>				
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>			   
			</div>
		</div>
	</div>
</div>
<div id="myModal3" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-eye"></i>  Review</h4>
			</div>
			<div class="form-group"> 
				<br>
				 <label class="col-xs-2 control-label">Keywords  </label> 								
				 <div class="col-xs-8"> 
					 <select class="form-control" name="keywordRe" id ="keywordRe" > 										
					 <%=strKeySelect%>
					 </select> 
				 </div> 
			</div> 
			<div class="modal-body">			  
				<div class="row">
				<div class="form-group">
				<label class="col-xs-2 control-label">Comment</label>
				<div class="col-xs-8">
					<textarea class="form-control" rows="3" name="keyCommentsRe" id ="keyCommentsRe"></textarea>
				</div>
			</div>
		</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-left:5px;" onclick = "javascript:finalStatus('1','Review');">Send</button>	
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>			   
			</div>
		</div>
	</div>
</div>
<div id="myModal4" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-check-circle"></i>  Approve</h4>
			</div>
			<div class="form-group"> 
				<br>
				 <label class="col-xs-2 control-label">Keywords  </label> 								
				 <div class="col-xs-8"> 
					 <select class="form-control" name="keywordAc" id ="keywordAc" > 										
					 <%=strKeySelect%>
					 </select> 
				 </div> 
			</div> 
			<div class="modal-body">
			  
				<div class="row">
				<div class="form-group">
				<label class="col-xs-2 control-label">Comment</label>
				<div class="col-xs-8">
					<textarea class="form-control" rows="3" name="keyCommentsAc" id ="keyCommentsAc"></textarea>
				</div>
				</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-left:5px;" onclick = "javascript:finalStatus('1','Accept');">Send</button>	
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			   
			</div>
		</div>
	</div>
</div>
<div id="myModal5" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			   <h4 class="modal-title"><i class="fa fa-times"></i>  Reject</h4>
			</div>
			<div class="form-group"> 
				<br>
				 <label class="col-xs-2 control-label">Keywords  </label> 								
				 <div class="col-xs-8"> 
					 <select class="form-control" name="keywordRj" id ="keywordRj" > 										
					 <%=strKeySelect%>
					 </select> 
				 </div> 
			</div> 
			<div class="modal-body">
				<div class="row">
				<div class="form-group">
				<label class="col-xs-2 control-label">Comment</label>
				<div class="col-xs-8">
					<textarea class="form-control" rows="3" name="keyCommentsRj" id ="keyCommentsRj"></textarea>
				</div>
			</div>
		</div>
			</div>
			<div class="modal-footer">			
				<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin-left:5px;"  onclick = "javascript:finalStatus('1','Reject');">Send</button>					
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			   
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


           


