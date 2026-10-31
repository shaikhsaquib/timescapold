<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Utility" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>

<!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Create Request </title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-table.min.css" rel="stylesheet"/> 	
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
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/bootstrap-table.min.js"></script>
	<script src="../js/bootstrap-table-toolbar.js"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/form-validation.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	

	<script>
	$(document).ready(function() {
	
    $('.RelatedLinks ul li.RelLinks').hover(function() {
			$(this).find('.dropdownmenu').show();
		}, function(){
			$(this).find('.dropdownmenu').hide();
	});

	});
	</script>	
	
</head>

<%
	String requestId					= (String)request.getParameter("requestId");
	String reqStatus					= (String)request.getParameter("reqStatus");
	String legalHeadEmailid				= (String)request.getParameter("legalHeadEmailid");
	

	String status						= "";
	String actionState					= "";
	String actMsg = "";
	String urlmsg = "";


	if("R".equals(reqStatus))
	{
		status						= "R";
		actionState					= "Reviewed";
		actMsg						= "reviewed";
		urlmsg = "../legalHead/approvalHistory.jsp";
		

	}else if("A".equals(reqStatus))
	{
		status						= "A";
		actionState					= "Approved";
		actMsg						= "approved";
		urlmsg = "../legalHead/approvalHistory.jsp";

	}else if("CL".equals(reqStatus))
	{
		status						= "CL";
		actionState					= "Closed";
		actMsg						= "closed";

		urlmsg = "../legalHead/approvalHistory.jsp";

	}else if("UA".equals(reqStatus))
	{
		status						= "UA";
		actionState					= "Updated";
		actMsg						= "updated";

		urlmsg = "../user/viewRequests.jsp";
	}
	else if("US".equals(reqStatus))
	{
		status						= "US";
		actionState					= "User Sign-Off";
		actMsg						= "sign-off";

		urlmsg = "../user/viewRequests.jsp";
	}

//	out.println("status---"+status);

	String applName = "";
	String logApplName = "legalContractManagement";
	String actionStr = "";
	applName = "Legal Contract Management";
	String documentOID = "DOC1006";
	String keyWord = "-";
	String actionText = "-";

	
	Hashtable processLegalHeaderHash = new Hashtable();
	Hashtable processLegalDetailsHash = new Hashtable();
	Hashtable approvalDetailsHash = new Hashtable();
	Hashtable commHash = new Hashtable();

	boolean updateHeaderFlag	= false;
	boolean updateDetailsFlag	= false;
	boolean  approvalFlag		=false;
	boolean  insertFlag			=false;
	
	processLegalHeaderHash.put("APPLICATION_NAME", logApplName);
	processLegalHeaderHash.put("REQUESTOID", requestId);
	processLegalHeaderHash.put("STATUS", status);
	processLegalHeaderHash.put("ACTIONSTATE", actionState);
	processLegalHeaderHash.put("CREATEDBY", emailId);


	processLegalDetailsHash.put("REQUESTOID", requestId);
	processLegalDetailsHash.put("APPLICATION_NAME", logApplName);
	processLegalHeaderHash.put("STATUS", status);
	processLegalHeaderHash.put("ACTIONSTATE", actionState); 
	processLegalHeaderHash.put("CREATEDBY", emailId);


	approvalDetailsHash.put("WORKITEMOID", requestId);
	approvalDetailsHash.put("DOCUMNETOID", documentOID);
	approvalDetailsHash.put("APPLICATIONNAME",logApplName);
	approvalDetailsHash.put("CREATEDBY", emailId);
	approvalDetailsHash.put("STATUS", status);

	/*commHash.put("WORKITEMOID", requestId);
	commHash.put("DOCUMENTOID", documentOID);
	commHash.put("APPLICATION",logApplName);
	commHash.put("COMMENTS",remarks);
	commHash.put("KEYWORDS", keyWord);			
	commHash.put("ACTIONTEXT", actionText);	
	commHash.put("EMAILID", emailId);
	commHash.put("STATUS", status);
	insertFlag = docKeyWordController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",commHash);
	*/
	/*updateHeaderFlag= true;
	updateDetailsFlag= true;
	approvalFlag= true;*/

	updateHeaderFlag  = docHeaderController.updateAction("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processLegalHeaderHash);

	updateDetailsFlag  = docDetailsController.updateAction("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processLegalHeaderHash);

	approvalFlag  = docChangeLogController.updateAction("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", approvalDetailsHash);

//System.out.println("updateHeaderFlag---"+updateHeaderFlag);
//System.out.println("updateDetailsFlag---"+updateDetailsFlag);
//System.out.println("approvalFlag---"+approvalFlag);
	

	String message ="";
	if(updateHeaderFlag && updateDetailsFlag  && approvalFlag)	{
		 message = "<h5>The request has been "+actMsg+" successfully."
		+"<br> Click <a href=\""+urlmsg+"\">here</a> to view the request.</h5>";
				
				String mailFrom ="timescape.admin@timesgroup.com";
				String host ="apprelay.timesgroup.com";

				String mailTo = legalHeadEmailid;
				
				String str = "";
				
				String subject= "Legal Contract Document - " +requestId+ " has been "+actMsg+".";

				ArrayList  lstArray= new ArrayList();

				lstArray  = docChangeLogController.getEmailid(legalHeadEmailid);
				String strArr[] = (String[])lstArray.get(0);

				if("A".equals(reqStatus))
				{
					 str = "Dear "+strArr[0]+", <br>" 
					   + "<br>"+displayName+" has approved the final draft under request number <strong>"+requestId+"</strong> for signing."
					 //+" Please take the signatures of the Authorised Signatory and upload the draft in the portal.<BR><BR>"
					 +" Please take the signatures of the Authorized Signatory and upload the scanned copy of executed document in pdf format in the portal.<BR><BR>"
					   + "Please click on the link below to go to the page. "
					   //+" <a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'>"
					   +"<a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
					   +"<BR>Legal Contract Document</a><br><br>"
					   + "<p>Regards,<BR> Timescape Admin</p>";

				}else if("R".equals(reqStatus))
				{
					str = "Dear "+strArr[0]+", <br>" 
					   + "<br>Request number <strong>"+requestId+"</strong> has been put for review by "+displayName+".<br><br>"
					   + "Kindly update the required as per the comments.<br><br>"
					   + "Please click on the link below to go to the page. "
					   //+"<a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'>"
					   +"<a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
					   +"<BR>Legal Contract Document</a><br><br>"
					   + "<p>Regards,<BR> Timescape Admin</p>";

				}else if("UA".equals(reqStatus) || "US".equals(reqStatus))
				{
					
					str = "Dear "+strArr[0]+", <br>" 
					   + "<br>"+displayName+", from "+deptName+" team has submitted request for modifications to be made to the draft under request number <strong>"+requestId+"</strong>.<BR><BR>"
					   + "Please click on the link below to go to the page. "
					   //+"<a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'>"
					   +"<a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
					   +"<BR>Legal Contract Document</a><br><br>"
					   + "<p>Regards,<BR> Timescape Admin</p>";

				}else if("CL".equals(reqStatus))
				{
					
					str = "Dear "+strArr[0]+", <br>" 
					   + "<br>Request number <strong>"+requestId+"</strong> is now closed.<BR><BR>"
					   + "Please click on the link below to go to the page. "
					   //+"<a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'>"
					   +"<a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
					   +"<BR>Legal Contract Document</a><br><br>"
					   + "<p>Regards,<BR> Timescape Admin</p>";
				}

						//String str = "Dear "+strArr[0]+", <br>" //manager[2] + "<br>"
						//   + "<br> The following  request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
						//   + "Document Id : "//+requestId+"<br>"
						//   + "Created By	   : "//+emailId+" <br><BR>"
						//+ "Alternatively you can also click on the following link: <a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://b02590634b92bea5072ed01cc1b3dac7'><BR>Legal Contract Document</a><br><br>"
						//   + "<p>Regards,</p><p> Timescape Admin</p>";			

					String htmlstr = "<html>" + "\n" 
								+ "<head>" + "\n" 
								+ "	<title>Email Alert</title>" + "\n" 
								+ "	<style>" + "\n" 
								+ "		.bold {FONT-WEIGHT: bold; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.normal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.bluenormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #6097cf; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "		.rednormal {FONT-WEIGHT: normal; FONT-SIZE: 8.5pt; COLOR: #ff0000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none}" 
								+ "	</style>"
								+ "</head>" 
								+ "<body>" 
								+ "	<form name = \"frmMessage\" method = \"post\">" 
								+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/sapep/collaboration/workflow/legal/images/legalheaderEmail.jpg\" border = \"0\"></td>" 
								+ "		    </tr>" 
								+ "		</table> "
								+ "		<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "			<tr>" 
								+ "				<td width = \"100%\" class = \"normal\" align = \"left\">" 
								+ "					<table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"20\">&nbsp;</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\">&nbsp;</td>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\">" 
								+ "								<div align = \"left\">"+str+"</div>" 
								+ "							</td>" 
								+ "						</tr>" 
								+ "						<tr>" 
								+ "							<td colspan = \"3\" align = \"left\" class = \"normal\" height = \"30\"></td>" 
								+ "						</tr>" 
								+ "					</table> "					
								+ "				</td>" 
								+ "			</tr><br>" 
								+ "		</table>"
								+ "</form></body>" 
								+ "</html>";

					//mailTo = "sachin.kale@timesgroup.com";

					Hashtable mailDetailsHash = new Hashtable();
					mailDetailsHash.put("fromAddr", mailFrom);
					mailDetailsHash.put("mailPath", host);
					mailDetailsHash.put("toAddr", mailTo);
					mailDetailsHash.put("subject",subject);
					mailDetailsHash.put("content", htmlstr);

				/*Hashtable mailDetailsHash = new Hashtable();
				mailDetailsHash.put("CREATEDBYEMAILID", emailId);		
				mailDetailsHash.put("MAILTO", mailTo);
				mailDetailsHash.put("MAILSTATUS", "I");
				mailDetailsHash.put("REQUESTID", requestId);
				mailDetailsHash.put("SUBJECT", subject);
				mailDetailsHash.put("MESSAGE", htmlstr);*/
				boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
		


	}else
	{
		message = "<h5>There was some error occured while processing request ."
				+"<br> Click <a href=\"javascript:history.back()\">here</a> to view the request.</h5>";

			
	}


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
					<i class="fa fa-th"></i>  <strong>Request Details</strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="frmRequestSubmit" method="post">
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
					

</body>
</html>
