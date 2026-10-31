<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat,com.bccl.util.AESencrp" %>
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
		<link href="../css/chat.css" rel="stylesheet"/>		
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
	 $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });
	$("input").val()	
	$(".multi").select2({ width: '100%'  });

	$('body').on('focus',".datepicker1", function(){
			$(this).datepicker({ dateFormat: 'dd/mm/yy',changeMonth: true,  changeYear: true });	
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

		//String requestId = (String)request.getParameter("requestId");
		AESencrp testEncrpt = new AESencrp();	

		String decryptRequestId = (String)request.getParameter("requestId");

		decryptRequestId = decryptRequestId.replaceAll("\\s", "+");

		String requestId = testEncrpt.decrypt(decryptRequestId);

		String documentOId = (String)session.getAttribute("docId");
		String whom = (String)session.getAttribute("whom");	

		String decryptStatus0 = (String)request.getParameter("status");

		String decryptStatus2 = (String)request.getParameter("encryStatus");

		decryptStatus2 = decryptStatus2.replaceAll("\\s", "+");

		String decryptStatus3 = testEncrpt.decrypt(decryptStatus2);

		
		int c = 0;
		
		if((decryptStatus0 == decryptStatus3) || decryptStatus0.equals(decryptStatus3))
		{
			c=c+1;
		}

		if(c>0)
		{


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
		String status1					= "";

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
			status1						= strArr[25];
			//out.println("createdby---"+createdby);

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

		session.setAttribute("requestId",requestId);
		session.setAttribute("userEmailId",createdby);
		session.setAttribute("userStatus",status1);

%>
<body onload="javascript:getDataOnClick(<%=requestId%>); javascript:showApproverAttachment('1'); javascript:showCurrentAttachmentFile('1','<%=statusType%>'); "> 
<!--  javascript:showApproverAttachment('1','<%//=requestId%>','<%//=createdby%>','<%//=statusType%>' -->
<form name="frmDashBoard" method="post">
<%@ include file="../includes/relatedLinks.jsp"%>
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
            <div class="panel-body" style="padding-bottom:2px;padding-top:8px;overflow-x:hidden;height:320px;" >
			<h4 class="form-section text-center"><i class="fa fa-info-circle"></i>   Document Number : <%=requestId%>  <span id="attachment3"></span></h4>
			<!--<div class="row">
			<p class="pull-right" "></p>
			 
			</div> -->
			<hr style="margin-bottom:2px;">
			<div class="row" >
			<div class="col-sm-12 col-lg-12" >
				<div class="form-group" >
					<label class="control-label col-sm-5 col-lg-5 col-md-5 col-xs-5" style="font-weight:bold; padding-top:5px;"><i class="fa fa-file-text-o fa-2x" style="color:#CF6A20;"></i> Agreement Type :</label>
					<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 ">
						<p class="form-control-static" style="padding-top:7px;word-break: break-all;">
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
					<label class="control-label col-sm-5 col-lg-5 col-md-5 col-xs-5" style="font-weight:bold;"><i class="fa fa-file-text-o fa-2x" style="color:#CF6A20;"></i> Agreement :</label>
					<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 ">
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
					<label class="control-label col-sm-5 col-lg-5 col-md-5 col-xs-5" style="font-weight:bold;"><i class="fa fa-inr fa-2x" style="color:#CF6A20;padding-left:5px;"></i>  Value Of Agreement : </label>
					<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 ">
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
					<label class="control-label col-sm-5 col-lg-5 col-md-5 col-xs-5" style="font-weight:bold;"><i class="fa fa-calendar fa-2x" style="color:#CF6A20;"></i> Date Of Agreement : </label>
					<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=dateOfAgreement%>
						</p>
					</div>
				</div>
			</div>
			</div>
			
			<hr>
			<div class="row">
			<div class="col-sm-12 col-lg-12">
				<div class="form-group">
					<label class="control-label col-sm-5 col-lg-5 col-md-5 col-xs-5" style="font-weight:bold;"><i class="fa fa-calendar fa-2x" style="color:#CF6A20;"></i> Created On :</label>
					<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 ">
						<p class="form-control-static" style="padding-top:7px;">
							<%=createdOn%>
						</p>
					</div>
				</div>
			</div>
			</div>
            </div>
			

			 <div class="panel-footer" style="padding-bottom:4px;height:180px;border: none;overflow-y:scroll;overflow-x:hidden;border-top: 1px solid #ddd;" >
			 
			 			  <h5><b>&nbsp;&nbsp;Document(s) </b>
<%
//out.println(status1);
			if(!"CL".equals(status1))
			{
%>
			 
			<a class="btn btn-default btn-sm  " onclick = "javascript:userAttachmentFile('current','<%=requestId%>','<%=createdby%>','<%=status1%>');" id="btn-chat" style="margin-left:4px;margin-bottom:3px;">  <i class="fa fa-paperclip"></i> Attach</a>
<%
			}	
%>
			 
			 </h5>
			  <div class="panel-group" id="accordion">
		
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">All Documents</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body" style="height:auto;overflow-y:hidden;padding-top:2px;padding-bottom:2px;">
								<p id="attachment"></p>
							</div>
						</div>
					</div>
			
				</div>

            </div>
			
        </div>
		</div
		<input type="hidden" name="requestoid" id="requestoid" value="<%=requestId%>"/>
		<div class="col-xs-6" style="padding-left:0;padding-right:0;">
            <div class="panel panel-primary" >
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Conversations

                </div>
                <div class="panel-body" style="padding-bottom:2px;" >
					
					<div class="header" style="margin-top:0px;">
						<strong  class="pull-left text-muted">  Overall Comments</strong ><br><br>
						<!-- <a href="mutual.doc" target="blank" class="pull-right " style="margin-top:0px;"><strong> click here to view current document   <i class="fa fa-file-word-o " ></i></strong></a>  -->
						<strong class="primary-font"><%=createdby1%> <small class=" text-muted pull-right" style="margin-top:0px;margin-left:6px;">
						Commented On:&nbsp;<!-- <i class="fa fa-calendar"></i>&nbsp; --><%=createdOn%></small> </strong>
						<hr>												
					</div>
					<div class="timeline-body">
						<p><%=mainComments%></p>
					</div>
					<hr style="margin-bottom:8px;">
					<!-- <ul class="chat">	 -->
					<ul class="list-unstyled media-block ">
						 <div id = "chatDetails"></div>
					</ul>
                </div>
                <div class="panel-footer" style="padding-bottom:4px;height:180px;">
	<%			if(!"CL".equals(status1))
				{
%>
					<div class="row" style="margin-top:5px;">
						<div class="col-xs-12">
							<textarea  name="msg"  id="msg" rows="3" class="form-control input-sm noresize " placeholder="Type your message here..." onfocus="javascript:showApproverAttachment('1','<%=requestId%>','<%=createdby%>','<%=statusType%>'); javascript:showCurrentAttachmentFile('1','<%=requestId%>','<%=createdby%>','<%=statusType%>'); " ></textarea>
						</div>
					</div>
					<div class="row" style="margin-top:4px; padding-right:2px;">
						<a class="btn btn-warning pull-right " id="send" onclick = "javascript:sendOnDash('<%=requestId%>','L');" >Send</a>
						<input type="hidden" name="legalHeadEmailid" id="legalHeadEmailid" value="<%=createdby%>" />
					</div>
<%
				}							
%>
					
					<div class="row" style="margin-top:10px;margin-bottom:13; padding-right:2px;">
					<div class="col-xs-12">
					
<%		//out.println("status1---"+status1);	
			if("US".equals(status1))
			{
%>					
				<input type="button" class="btn btn-info" value="Sign-Off" name="submitButton" height="20" onclick = "javascript:actionOnDash('<%=requestId%>','<%=documentOId%>','CL','0');"/>
				
				<input type="button"  class="btn btn-danger"  value="Review" name="submitButton" id="Review" height="20" onclick = "javascript:actionOnDash('<%=requestId%>','<%=documentOId%>','R','0');"/>
				
				<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
<%
			} else if("CL".equals(status1) || "ACK".equals(status1) || "R".equals(status1) || "A".equals(status1))
			{
%>	
				<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>

<%			}else
			{
%>
				<input type="button" class="btn btn-success" value="Accept" name="submitButton" height="20" onclick = "javascript:actionOnDash('<%=requestId%>','<%=documentOId%>','A','0');"/>

				<input type="button"  class="btn btn-danger"  value="Review" name="submitButton" id="Review" height="20" onclick = "javascript:actionOnDash('<%=requestId%>','<%=documentOId%>','R','0');"/>
				
				<button type="button" class="btn btn-primary" style="width:70px;"  align="center" onclick="javascript:history.back();">Close</button>
<%						
			}									
%>
						
					
					<input type="hidden" name="requestId" id="requestId" value="<%=requestId%>" />
					<input type="hidden" name="reqStatus" id="reqStatus" value="" />
	
					</div>
					</div>
                </div>
            </div>
		</div>	
	</div>
	</div>
	<div class="col-xs-1"></div>
	</div>
</div>

<%
		}else
		{

			String message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";
%>
	<body>
<%@ include file="../includes/relatedLinks.jsp" %>
<div class="container well">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
					<i class="fa fa-th"></i>  <strong></strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="frmCreateWasteSalesProcess" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
									</tr>
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<div class="col-xs-2"></div>
	</div>
</div>
					

<%}%>
<footer class="footer text-center">
	<div class="container">
		<p style="margin-bottom:2px;" class="ex">Copyright @ 2016 Bennett, Coleman & Co. Ltd. All rights reserved. </p>
	</div>
</footer>
</body>
</html>