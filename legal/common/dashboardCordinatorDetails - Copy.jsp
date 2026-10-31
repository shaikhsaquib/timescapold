<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title> Conversation </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal2.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-tagsinput.css" rel="stylesheet">
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.jscroll.min.js"></script>
	<script src="../js/bootstrap-tagsinput.js"></script>
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	
	<script>
	$(document).ready(function() {
	$('body').on('focus',".datepicker", function(){
			$(this).datepicker({ dateFormat: 'dd-mm-yy' });	
	});
	$('body').on('focus',"#textarea", function(){
			$(this).maxlength({alwaysShow: true});		
	});
$("input").val()	
	$(".multi").select2({ width: '100%'  });
   
	$('body').on('focus',".datepicker1", function(){
			$(this).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,
      changeYear: true });	
	});	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});
	$('.scroll').jscroll();
});
	</script>	
</head>
<%@ include file="../common/leagalHeaderDetailsConfig.jsp" %>
<% 
		String DPATH     = EnvironmentProperties.getValue("legalContractManagement", "uploadPath");		

		String requestId = (String)request.getParameter("requestId");
		String documentOId = (String)request.getParameter("docId");
		String whom = (String)request.getParameter("whom");

	//	out.println("requestId---"+requestId);
	//	out.println("documentOId---"+documentOId);

		Hashtable statusImg = new Hashtable( );
		statusImg.put("D",  "../images/draft.png");
		statusImg.put("I",  "../images/inProcess.png");
		//statusImg.put("A",  "../images/half_process.png");
		statusImg.put("R",  "../images/review.png");
		statusImg.put("A",  "../images/approved.png");
		statusImg.put("CL",  "../images/approved.png");


		ArrayList headerList = new ArrayList();
		ArrayList approvalList = new ArrayList();
    	ArrayList detailsList = new ArrayList();
		Hashtable detailsHash = new Hashtable();
		Hashtable headerHash = new Hashtable();
		Hashtable approvalHash = new Hashtable();

		String formName		= "frmViewRequest";

		headerHash.put("REQUESTOID", requestId);
		//headerHash.put("DOCUMENTOID", "DOC1002','DOC1003','DOC1004");
		headerHash.put("DOCUMENTOID", documentOId);
		headerHash.put("HEADERSECTION1", headerSection1);
		detailsHash.put("REQUESTOID", requestId);
		detailsHash.put("DETAILSECTION1", detailSection2);
		detailsHash.put("APPLICATION", "legalContractManagement");

		headerList = docHeaderController.viewAll("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",headerHash);
		detailsList = docDetailsController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailsHash);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");

		//SimpleDateFormat datOfAgreformat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat datOfAgreformat = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat datOfAgreformat1 = new SimpleDateFormat("dd-MMM-yyyy");

		//out.println("-----"+headerList.size());
	//	out.println("detailsList-----"+detailsList.size());

		String ApplicationName				= "";
		String statusType					= "";
		String createdby					= "";
		String documentstate				= "";

		String typeOfAgreement				= "";
		String partyName					= "";
		String reasonForSingAgreement		= "";
		String dateOfAgreement				= "";
		String valueOfAgreement				= "";
		String agreement					= "";
		String natureOfParties				= "";
		String address						= "";
		String jurisdiction					= "";
		String terminationFromDate			= "";
		String terminationToDate			= "";
		String userDeptEmailid				= "";
		String legalHeadEmailid				= "";
		String mainComments					= "";
		String createdOn					= "";

		for (int ii=0; ii<headerList.size(); ii++)
		{
			String strArr[] = (String[])headerList.get(ii);

			ApplicationName				= strArr[3];
			statusType					= strArr[4];
			createdby					= strArr[5];
			documentstate				= strArr[6];
			typeOfAgreement				= strArr[7];
			partyName					= strArr[8];
			reasonForSingAgreement		= strArr[9];
			dateOfAgreement				= strArr[10];
			valueOfAgreement			= strArr[11];
			agreement					= strArr[12];
			natureOfParties				= strArr[13];
			address						= strArr[14];
			jurisdiction				= strArr[15];
			terminationFromDate			= strArr[16];
			terminationToDate			= strArr[17];
			userDeptEmailid				= strArr[18];
			legalHeadEmailid			= strArr[19];
			mainComments				= strArr[20];
			createdOn					= strArr[22];

			//out.println("userDeptEmailid---"+strArr[22]);
		//	out.println("legalHeadEmailid---"+legalHeadEmailid);
			
		}

		String termOfAgreement					= "";
		String considerationOfAgreement			= "";
		String deliverablesNatureOfParty		= "";

		for(int t = 0; t <detailsList.size(); t++)
		{
			String strDetailsArr[] = (String[])detailsList.get(t);

			termOfAgreement						= strDetailsArr[2];
			considerationOfAgreement			= strDetailsArr[3];
			deliverablesNatureOfParty			= strDetailsArr[4];
		}

		try {
			Date date = (Date) format.parseObject(createdOn);

			Date date1 = (Date) datOfAgreformat.parseObject(dateOfAgreement);

			 createdOn = format2.format(date);	
			 
			 dateOfAgreement = datOfAgreformat1.format(date1);
			 
		} catch (ParseException e) { 
			e.printStackTrace();
		}

		String createdby1				= createdby.substring(0,createdby.indexOf("@"));
%>
<body onload="javascript:getDataOnClick(<%=requestId%>);"> 
<form class="form-horizontal" role="form" id="" name="frmDashboardDeatails" method="post">
<%@ include file="../includes/relatedLinks.jsp" %>
<hr style="margin-bottom:10px;">
<div class="container-fluid">
	<div class="row">
	<div class="col-xs-1"></div>
	<div class="col-xs-10">
	<div class="row " >
		<div class="col-xs-6" style="padding-right:2px;">
		<div class="panel panel-primary"  >
			<div class="panel-heading" >
			<span class="glyphicon glyphicon-comment"></span> Details
			</div>
            <div class="panel-body" style="padding-bottom:2px;padding-top:20px;margin-bottom:10px;overflow-y:hidden;" >
			<h4 class="form-section text-center"><i class="fa fa-info-circle"></i>   Document Number : <%=requestId%></h4><hr>
			<div class="row" >
			<div class="col-sm-12 col-lg-12" >
				<div class="form-group" >
					<label class="control-label col-sm-6 col-lg-6 " style="font-weight:bold;"><i class="fa fa-file-text-o fa-2x" style="color:#CF6A20;"></i> Agreement Type :</label>
					<div class="col-sm-6 col-lg-4 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=typeOfAgreement%>
						</p>
					</div>
				</div>
			</div>
			</div>
			<hr>
			<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="form-group">
					<label class="control-label col-sm-6 col-lg-6 " style="font-weight:bold;"><i class="fa fa-file-text-o fa-2x" style="color:#CF6A20;"></i> Agreement :</label>
					<div class="col-sm-6 col-lg-4 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=agreement%>
						</p>
					</div>
				</div>
			</div>
			</div>
			
			<hr>
			<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="form-group">
					<label class="control-label col-sm-6 col-lg-6 " style="font-weight:bold;"><i class="fa fa-inr fa-2x" style="color:#CF6A20;padding-left:5px;"></i>  Value Of Agreement : </label>
					<div class="col-sm-6 col-lg-4 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=valueOfAgreement%>
						</p>
					</div>
				</div>
			</div>
			</div>
			<hr>
			<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="form-group">
					<label class="control-label col-sm-6 col-lg-6 " style="font-weight:bold;"><i class="fa fa-calendar fa-2x" style="color:#CF6A20;"></i> Date Of Agreement : </label>
					<div class="col-sm-6 col-lg-4 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=dateOfAgreement%>
						</p>
					</div>
				</div>
			</div>
			</div>
			
			<hr style=>
			<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="form-group">
					<label class="control-label col-sm-6 col-lg-6 " style="font-weight:bold;"><i class="fa fa-calendar fa-2x" style="color:#CF6A20;"></i> Created On :</label>
					<div class="col-sm-6 col-lg-4 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=createdOn%>
						</p>
					</div>
				</div>
			</div>
			</div>
             </div>
			 
			 <div class="panel-footer" style="padding-bottom:2px;height:160px;background-color: #FFF;border: none;" >
                </div>
			
        </div>
		</div>
		<input type="hidden" name="requestoid" id="requestoid" value="<%=requestId%>"/>
		
		<div class="col-xs-6" style="padding-left:0;padding-right:0;">
            <div class="panel panel-primary" >
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Conversation
                    <div class="btn-group pull-right">
					<div class="dropdown" >
					
                        <button type="button" class="btn btn btn-warning btn-xs dropdown-toggle" data-toggle="dropdown">
                           Add Participants   <span class="caret"></span>
                        </button>
						<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
							  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mussum ipsum</a></li>
							  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mussum ipsum</a></li>
							  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mussum ipsum</a></li>
							  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Mussum ipsum</a></li>
							</ul>
					</div>
                    </div>
                </div>
                <div class="panel-body" style="padding-bottom:2px;" >
				<div class="header" style="margin-top:0px;">
					<a href="mutual.doc" target="blank" class="pull-right " style="margin-top:0px;"><strong> click here to view current document   <i class="fa fa-file-word-o " ></i></strong></a>
					<strong class="primary-font"><%=createdby1%></strong> <small class=" text-muted" style="margin-top:0px;margin-left:6px;">
					<i class="fa fa-calendar"></i>&nbsp;<%=createdOn%></small> 
					 
					<div class="row pad10">
						<strong  class="pull-right text-muted">  Comment for: <%=requestId%></strong >
					</div>
					<hr>					
				</div>
				<div class="timeline-body">
                    <p><%=mainComments%></p>
                </div>
                <hr style="margin-bottom:8px;">
				<ul class="chat">
				<li class="left clearfix">
				<span class="chat-img pull-left">
					<img src="images/user_2.png" alt="User Avatar" class="img-circle">
				</span>
					<div class="chat-body clearfix">
					<div class="header">
						<strong class="primary-font">Lorem</strong> <small class=" text-muted" style="margin-top:4px;margin-left:6px;">
										<i class="fa fa-calendar"></i>   15/10/2015</small> <small class="pull-right text-muted">
							   Comment for:  Doc. Name</small><hr>
					</div>
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
						dolor, quis ullamcorper ligula sodales.
					</p>
									<div class="footer1">
										<div class="row">
						<div class="col-xs-8 pull-right"><strong class="text-muted pull-right ">Commented On :  15 mins ago</strong> 
											</div>
										</div>
									</div>
					</div>
				</li>
					<!-- <div id = "chatDetails"></div> -->
				</ul>

                </div>
                <div class="panel-footer" style="padding-bottom:2px;height:170px;">
					<!-- <div class="row" style="margin-bottom:4px;">
					<div class="col-xs-10">
						<div class="form-group">
							<label class="col-xs-4 control-label">Comment For</label>
							<div class="col-xs-8">
								<input type="text"  class="form-control " data-role="tagsinput" style="font-size:15px;" />
							</div>
						</div>
					</div>
					</div> -->
					<div class="row" style="margin-top:5px;">
						<div class="col-xs-12">
							<textarea  name="msg"  id="msg" rows="3" class="form-control input-sm noresize " placeholder="Type your message here..." ></textarea>
						</div>
					</div>
					<div class="row" style="margin-top:4px; padding-right:2px;">
						<button class="btn btn-warning pull-right " onclick = "javascript:sendOnDash('<%=requestId%>');" >Send</button>
						<button class="btn btn-default btn-sm pull-left "  id="btn-chat" style="margin-left:4px;" type="file">  <i class="fa fa-paperclip"></i>  Attach</button>
					</div>
                </div>
            </div>
		</div>	
	</div>
	</div>
	<div class="col-xs-1"></div>
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