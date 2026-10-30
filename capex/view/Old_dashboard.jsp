<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> View </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/capex.js"></script>
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
	String requestId = "201512000627";//(String)  request.getParameter("id");
    String status = "L";//(String)  request.getParameter("status");
    Hashtable ht = new Hashtable();
    String activeFlag ="";
    String disabledFlag ="";	
//	emailId ="rishiraj.shukla@timesgroup.com";
	//status = "R";
	String headerSection []	= {"Application Name","Status Type", "Created By", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment"};
	
    ht.put("HEADERSECTION1", headerSection);
    ht.put("DOCUMENTOID", "DOC1003");
    ht.put("REQUESTOID", requestId);
    
    ArrayList headerDataList =  capexHeaderController.view("sdf","sdfsd",ht);
    
    int headerSize = headerDataList.size();
     if( headerSize > 0){  
        for (int eee = 0; eee < headerSize; eee++) {
           headerData = (String[]) headerDataList.get(eee);      
           
            for (int eee1 = 0; eee1 < headerData.length; eee1++) {
                createdBy = headerData[5];
        //  out.println (" headerData [ "+ eee1 +"] : " + createdBy);
            }
        }
    }
	for (int eee1 = 0; eee1 < headerData.length; eee1++) {               
        out.println(" headerData ["+eee1+"]-"+headerData[eee1]);
            }



%>
<body> 
<div class="row" style="margin-right:5px;">
	<div class="RelatedLinks">
		<ul>
			<li class="RelLinks"><a href="#">Related Links</a>
			<ul class="dropdownmenu">
					<li><a href="../creation/createProposalform.jsp">Capex Proposal</a></li>						
					<li><a href="../creation/createCapexWizard.jsp">Capex Expenditure Proposal</a></li>
					<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposal</a></li>
					<li><a href="../view/listOfPendingProposalRequest.jsp">View Pending Proposals</a></li>
					<li><a href="../view/viewCapexRequest.jsp">View Pending Capex Expenditure Proposal</a></li>					
					<li><a href="../view/viewMyCapexRequest.jsp">View My Capex Expenditure Proposal</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<hr>
<form action="#" class="form-horizontal" role="form">

			
<div class="container-fluid">
	<div class="row">
	<div class="col-xs-1"></div>
	<div class="col-xs-10 bs-example ">
	<div class="row">
	<div class="col-xs-4">
	<h4 class="form-section ">Capex/Opex Authorization Request No</h4></div>
	
		 <div class="col-xs-1 pull-right"><a href="view.html" type="button" class="btn btn-info pull-right" style="margin-left:15px;width:105px;" ><i class="fa fa-arrow-left"></i> Back to list</a></div>
		
		<div class="col-xs-1 pull-right"><a href="#" type="button" class="btn btn-primary pull-right" style="margin-left:10px;margin-right:15px;width:90px;"><i class="fa fa-file-o"></i>   Review</a></div>
		
		<div class="col-xs-1 pull-right"><a href="#" type="button" class="btn btn-info pull-right" style="margin-left:15px;margin-right:15px;width:90px;">
		<i class="fa fa-times"></i>  Reject</a></div>
		 
		 <div class="col-xs-1 pull-right"><a href="#"  type="button" class="btn btn-primary pull-right" style="margin-left:15px;margin-right:15px;width:98px;" ><i class="fa fa-check"></i>  Approve </a></div>
		
		<!--<div class="col-xs-2 pull-right"><a href="#"  type="button" class="btn btn-info pull-right" style="margin-right:25px;"  ><i class="fa fa-info"></i>  Addl info reqd </a></div>-->
	</div>
		<hr>
		<a href="#" class=" col-xs-4  text-center" style="margin-bottom:5px;">
		<button type="button" class="btn btn-primary" onclick="window.open('viewCapexNote.jsp?id=\'<%=requestId%>\'', '', '');"><i class="fa fa-eye"></i>View Application</button>
		</a>
	<div class="row">
	
	</div>
	<div class="col-xs-4" >
	<div class="list-group">
		<a href="#" class="list-group-item text-center" >
		<h4>Project Title </h4></a>
		<a href="#" class="list-group-item list-group-item-danger text-center">
		Submitted On : -</a>
		<a href="#" class="list-group-item list-group-item-info text-center">
		Submitted By :   <%=headerData[14]%>
		</a>
		<!--<a href="#" class="list-group-item list-group-item-warning text-center">
		<button type="button" class="btn btn-primary" onclick="window.open('capex_template.html', '', '');"><i class="fa fa-eye"></i>View Application</button>
		</a>-->
	</div>
	
	 <table class="table table-bordered" style="">
        
        <tbody>
			<tr>
			<td colspan="2">
			<h4 class="form-section text-center"><i class="fa fa-info-circle"></i>   Capex Request No.</h4></td>
			</tr>
            <tr class="info" >
                <td style="width:50%">Project Name : </td>
                <td><%=headerData[7]%></td>
              
            </tr>
            <tr class="info">
                <td>Created On : </td>
                <td>-</td>
               
            </tr>
			<tr class="info">
                <td>Proposal Amount : </td>
                <td><%=headerData[10]%></td>
              
            </tr>
            <tr class="info">
                <td>Budget amount : </td>
                <td><%=headerData[16]%></td>
               
            </tr>
            
			<tr class="info">
                <td>Project Manger : </td>
                <td><%=headerData[14]%></td>
               
            </tr>
            
			<tr class="info">
                <td>Category : </td>
                <td><%=headerData[9]%></td>
            </tr>
			<tr class="warning" >
			<td colspan="2">Rationale<hr>
			<p><%=headerData[30]%></p>
			</td>			
			</tr>	
			
            
        </tbody>
    </table>
	
</div>
		
          <ul class="timeline">
		   <div class="line text-muted"></div>
               <li class="timeline-inverted">
                <div class="timeline-badge"><i class="glyphicon glyphicon-check" ></i></div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
				  <div class="row">
				  <div class="col-xs-12 ">
						<div class="form-group">
							<label class="control-label col-xs-3">Keywords:</label>
							<label class="control-label"><%=headerData[17]%> </label><br/>
							<div class="col-xs-12">
								<textarea class="form-control noresize" rows="2" style="margin-left:5px;margin-right:5px;" maxlength='500' name="keyComments" id="keyComments"></textarea>
							</div>
						</div>
						<button type="button" class="btn btn-info pull-right" onClick = "saveComments();">Submit</button>
					</div>
				  </div>
				  <div class="row" style="margin-bottom:3px;" >
				  <button type="button" class="btn btn-link">Comments <span class="badge badge-warning ">4 </span></button>
				
				 </div>
				 
				 
				 
				   </div>
				   
                  <div class="timeline-body">
				  
				   <div class="header">
                                          <strong class="primary-font">Anurag Thakur</strong> <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
					 <i class="fa fa-calendar"></i>   14/10/2015</small> <small class="pull-right text-muted">
                                              Comment for: Doc. Name</small><hr>
                                      </div>
                    <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
					 <div class="footer">
									  <div class="row">
                                          <div class="col-xs-8 pull-right"><strong class="text-muted pull-right ">Commented On :  12 mins ago</strong> 
                                      </div>
									  </div>
                                  </div><hr/>
					 
					 <div class="header">
                                          <strong class="primary-font">Anurag Thakur</strong> <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
					 <i class="fa fa-calendar"></i>   14/10/2015</small> <small class="pull-right text-muted">
                                              Comment for: Doc. Name</small><hr>
                                      </div>
					 <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
					  <div class="footer">
									  <div class="row">
                                          <div class="col-xs-8 pull-right"><strong class="text-muted pull-right ">Commented On :  13 mins ago</strong> 
                                      </div>
									  </div>
                                  </div>
					<hr/>
					  
					 <div class="header">
                                          <strong class="primary-font">Anurag Thakur</strong> <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
					 <i class="fa fa-calendar"></i>   14/10/2015</small> <small class="pull-right text-muted">
                                              Comment for: Doc. Name</small><hr>
                                      </div>
					 <p>Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo. Manduma pindureta quium dia nois paga. Sapien in monti palavris qui num significa nadis i pareci latim. Interessantiss quisso pudia ce receita de bolis, mais bolis eu num gostis.</p>
					  <div class="footer">
									  <div class="row">
                                          <div class="col-xs-8 pull-right"><strong class="text-muted pull-right ">Commented On :  15 mins ago</strong> 
                                      </div>
									  </div>
                                  </div>
								  
                  </div>
				    </div>
              </li>
          </ul>
		  <div class="col-xs-1"></div>	
	</div>
<input type="text"  name="email_Id" id="email_id"  value="<%=emailId%>">
<input type="text"  name="requestId" id="requestId"  value="<%=requestId%>">
</div>
                  <hr style="margin-bottom:8px;">
				 <!--  <div class="row">
				  <button type="button" class="btn btn-link">Replies <span class="badge badge-success">3 </span></button>
			<!--	  <button type="button" class="btn btn-link pull-right" data-toggle="modal" data-target="#modal1">Reply <i class="fa fa-reply"></i></button>
				  </div>-->
				   <div id="modal2" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-md">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title">Write A Comment</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-10">
										<div class="form-group">
											<label class="control-label col-xs-3">Comment : </label>
											<div class="col-xs-9">
												<textarea class="form-control noresize" rows="3" maxlength='10' id='textarea'></textarea>
											
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								
								<button type="submit" class="btn btn-info">Submit</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</div>
				 
				  <div id="modal1" class="modal fade" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-md">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title">Reply</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-xs-10">
										<div class="form-group">
											<label class="control-label col-xs-3">Comment : </label>
											<div class="col-xs-9">
												<textarea class="form-control noresize" rows="3" maxlength='10' id='textarea'></textarea>
											
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								
								<button type="submit" class="btn btn-info">Submit</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							</div>
						</div>
					</div>
				</div>
</form>	

</body>
</html>
