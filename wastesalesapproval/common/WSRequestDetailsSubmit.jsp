<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility" %>
<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setDateHeader ("Expires", 0); 
%>

<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="wasteSalesDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<jsp:useBean id="wasteSalesChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

 <!DOCTYPE >
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Process Waste Aprroval</title>	
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../css/style_1.css" rel="stylesheet"/>
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-multiselect.css" rel="stylesheet">
	<link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
	
	<style>
		.select2-container .select2-selection--single 
		{
			box-sizing: border-box;
			cursor: pointer;
			display: block;
			height: 34px;		
		}
		.fa.fa-sig:after {
  position: absolute;
  content: "/";
  color: GREY;
  font-weight: 700;
  font-size: 1.2em;
  left: 7px;
  top: -1px;
  padding:0;
  margin:0;
}
	</style>	
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>
	<script src="../js/bootstrap-multiselect.js"></script>	
	 <script src="../js/wysihtml5-0.3.0.min.js"></script>
	<script src="../js/bootstrap3-wysihtml5.js"></script>	
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/additional-methods.min.js"></script>	
	<script src="../js/util.js" type="text/javascript"></script>
	<script src="../js/common.js" type="text/javascript"></script>
	<script src="../js/wasteSales.js"></script>	
		<script>
	$(document).ready(function(){	
	
	$('.RelatedLinks ul li.RelLinks').hover(function() {
	$(this).find('.dropdownmenu').show();
	}, function(){
	$(this).find('.dropdownmenu').hide();
	});
	
	});
  </script>

</head>
<%
	String zonalHeadOId = "";
	String zonalHeadSapNum = "";
	String zonalHeadSapNum1	= "";
	String zonalHeadEmailid	= "";

	String actionStr = "";
	String requestId = (String)request.getParameter("requestId");
	String action = (String)request.getParameter("frmAction");

	String reference						= (String)request.getParameter("reference");
	reference								= Utility.replaceQuoteOracle(reference);

	String createdDate						= (String)request.getParameter("createdDate");
	createdDate								= Utility.replaceQuoteOracle(createdDate);

//	String wsaPeriod						= (String)request.getParameter("headerOnTopQurter");
	String wsaPeriod						= (String)request.getParameter("wsaPeriodTxt");
	wsaPeriod								= Utility.replaceQuoteOracle(wsaPeriod);

	String branch							= (String)request.getParameter("branch");
	branch									= Utility.replaceQuoteOracle(branch);

	String headerRealisation				= (String)request.getParameter("realisationHeaderOnQurter");
	headerRealisation						= Utility.replaceQuoteOracle(headerRealisation);

	String realisationOnQnty				= (String)request.getParameter("headerOnTopQurter");
	realisationOnQnty						= Utility.replaceQuoteOracle(realisationOnQnty);

	String estimatedReal					= (String)request.getParameter("headerOnTopQurter");
	estimatedReal							= Utility.replaceQuoteOracle(estimatedReal);

	String previousRealisation				= (String)request.getParameter("previousRealisation");
	previousRealisation						= Utility.replaceQuoteOracle(previousRealisation);

	String currentRealisation				= (String)request.getParameter("currentRealisation");
	currentRealisation						= Utility.replaceQuoteOracle(currentRealisation);

	String increaseRealisation				= (String)request.getParameter("IncreaseRealisation");
	increaseRealisation						= Utility.replaceQuoteOracle(increaseRealisation);

	String headerCurrPeriodRate				= (String)request.getParameter("headerOnTopQurter");
	headerCurrPeriodRate					= Utility.replaceQuoteOracle(headerCurrPeriodRate);

	String headerPeriodRate1				= (String)request.getParameter("PeriodRate1");
	headerPeriodRate1						= Utility.replaceQuoteOracle(headerPeriodRate1);


	String headerPeriodRate2				= (String)request.getParameter("PeriodRate2");
	headerPeriodRate2						= Utility.replaceQuoteOracle(headerPeriodRate2);


	String headerPeriodRate3				= (String)request.getParameter("PeriodRate3");
	headerPeriodRate3						= Utility.replaceQuoteOracle(headerPeriodRate3);

	String headerPeriodRate4				= (String)request.getParameter("PeriodRate4");
	headerPeriodRate4						= Utility.replaceQuoteOracle(headerPeriodRate4);

	String field1							= (String)request.getParameter("field1");
	field1									= Utility.replaceQuoteOracle(field1);

	String field2							= (String)request.getParameter("field2");
	field2									= Utility.replaceQuoteOracle(field2);

	String field3							= (String)request.getParameter("field3");
	field3									= Utility.replaceQuoteOracle(field3);

	String field4							= (String)request.getParameter("field4");
	field4									= Utility.replaceQuoteOracle(field4);

	String field5							= (String)request.getParameter("field5");
	field5									= Utility.replaceQuoteOracle(field5);

	String finalPWM							= (String)request.getParameter("finalPWM");
	finalPWM								= Utility.replaceQuoteOracle(finalPWM);

	String field6							= (String)request.getParameter("field6");
	field6									= Utility.replaceQuoteOracle(field6);

	String field7							= (String)request.getParameter("field7");
	field7									= Utility.replaceQuoteOracle(field7);

	String field8							= (String)request.getParameter("field8");
	field8									= Utility.replaceQuoteOracle(field8);

	String field9							= (String)request.getParameter("field9");
	field9									= Utility.replaceQuoteOracle(field9);

	String field10							= (String)request.getParameter("field10");
	field10									= Utility.replaceQuoteOracle(field10);

	String finalTOW							= (String)request.getParameter("finalTOW");
	finalTOW								= Utility.replaceQuoteOracle(finalTOW);

	String field11							= (String)request.getParameter("field11");
	field11									= Utility.replaceQuoteOracle(field11);

	String field12							= (String)request.getParameter("field12");
	field12									= Utility.replaceQuoteOracle(field12);

	String field13							= (String)request.getParameter("field13");
	field13									= Utility.replaceQuoteOracle(field13);

	String field14							= (String)request.getParameter("field14");
	field14									= Utility.replaceQuoteOracle(field14);

	String field15							= (String)request.getParameter("field15");
	field15									= Utility.replaceQuoteOracle(field15);

	String finalRSP							= (String)request.getParameter("finalRSP");
	finalRSP								= Utility.replaceQuoteOracle(finalRSP);

	String field16							= (String)request.getParameter("field16");
	field16									= Utility.replaceQuoteOracle(field16);

	String field17							= (String)request.getParameter("field17");
	field17									= Utility.replaceQuoteOracle(field17);

	String field18							= (String)request.getParameter("field18");
	field18									= Utility.replaceQuoteOracle(field18);

	String field19							= (String)request.getParameter("field19");
	field19									= Utility.replaceQuoteOracle(field19);

	String field20							= (String)request.getParameter("field20");
	field20									= Utility.replaceQuoteOracle(field20);

	String finalPS							= (String)request.getParameter("finalPS");
	finalPS									= Utility.replaceQuoteOracle(finalPS);

	String field21							= (String)request.getParameter("field21");
	field21									= Utility.replaceQuoteOracle(field21);

	String field22							= (String)request.getParameter("field22");
	field22									= Utility.replaceQuoteOracle(field22);

	String field23							= (String)request.getParameter("field23");
	field23									= Utility.replaceQuoteOracle(field23);

	String field24							= (String)request.getParameter("field24");
	field24									= Utility.replaceQuoteOracle(field24);

	String field25							= (String)request.getParameter("field25");
	field25									= Utility.replaceQuoteOracle(field25);

	String finalAP							= (String)request.getParameter("finalAP");
	finalAP									= Utility.replaceQuoteOracle(finalAP);

	String headerNPRate1					= (String)request.getParameter("PeriodRate1");
	headerNPRate1							= Utility.replaceQuoteOracle(headerNPRate1);

	String headerNPRate2					= (String)request.getParameter("PeriodRate2");
	headerNPRate2							= Utility.replaceQuoteOracle(headerNPRate2);

	String headerNPRate3					= (String)request.getParameter("PeriodRate3");
	headerNPRate3							= Utility.replaceQuoteOracle(headerNPRate3);

	String headerNPRate4					= (String)request.getParameter("PeriodRate4"); 
	headerNPRate4							= Utility.replaceQuoteOracle(headerNPRate4);

	String headerNPRate5					= (String)request.getParameter("headerOnTopQurter");
	headerNPRate5							= Utility.replaceQuoteOracle(headerNPRate5);

	String npRate1							= (String)request.getParameter("npRate1");
	npRate1									= Utility.replaceQuoteOracle(npRate1);

	String npRate2							= (String)request.getParameter("npRate2");
	npRate2									= Utility.replaceQuoteOracle(npRate2);

	String npRate3							= (String)request.getParameter("npRate3");
	npRate3									= Utility.replaceQuoteOracle(npRate3);

	String npRate4							= (String)request.getParameter("npRate4");
	npRate4									= Utility.replaceQuoteOracle(npRate4);

	String npRate5							= (String)request.getParameter("npRate5");
	npRate5									= Utility.replaceQuoteOracle(npRate5);

	String pwm1								= (String)request.getParameter("pwm1");
	pwm1									= Utility.replaceQuoteOracle(pwm1);

	String pwm2								= (String)request.getParameter("pwm2");
	pwm2									= Utility.replaceQuoteOracle(pwm2);

	String pwm3								= (String)request.getParameter("pwm3");
	pwm3									= Utility.replaceQuoteOracle(pwm3);

	String pwm4								= (String)request.getParameter("pwm4");
	pwm4									= Utility.replaceQuoteOracle(pwm4);

	String pwm5								= (String)request.getParameter("pwm5");
	pwm5									= Utility.replaceQuoteOracle(pwm5);

	String tow1								= (String)request.getParameter("tow1");
	tow1									= Utility.replaceQuoteOracle(tow1);

	String tow2								= (String)request.getParameter("tow2");
	tow2									= Utility.replaceQuoteOracle(tow2);

	String tow3								= (String)request.getParameter("tow3");
	tow3									= Utility.replaceQuoteOracle(tow3);

	String tow4								= (String)request.getParameter("tow4");
	tow4									= Utility.replaceQuoteOracle(tow4);

	String tow5								= (String)request.getParameter("tow5");
	tow5									= Utility.replaceQuoteOracle(tow5);

	String resp1							= (String)request.getParameter("resp1");
	resp1									= Utility.replaceQuoteOracle(resp1);

	String resp2							= (String)request.getParameter("resp2");
	resp2									= Utility.replaceQuoteOracle(resp2);

	String resp3							= (String)request.getParameter("resp3");
	resp3									= Utility.replaceQuoteOracle(resp3);

	String resp4							= (String)request.getParameter("resp4");
	resp4									= Utility.replaceQuoteOracle(resp4);

	String resp5							= (String)request.getParameter("resp5");
	resp5									= Utility.replaceQuoteOracle(resp5);

	String ps1								= (String)request.getParameter("ps1");
	ps1										= Utility.replaceQuoteOracle(ps1);

	String ps2								= (String)request.getParameter("ps2");
	ps2										= Utility.replaceQuoteOracle(ps2);

	String ps3								= (String)request.getParameter("ps3");
	ps3										= Utility.replaceQuoteOracle(ps3);

	String ps4								= (String)request.getParameter("ps4");
	ps4										= Utility.replaceQuoteOracle(ps4);

	String ps5								= (String)request.getParameter("ps5");
	ps5										= Utility.replaceQuoteOracle(ps5);

	String ap1								= (String)request.getParameter("ap1");
	ap1										= Utility.replaceQuoteOracle(ap1);

	String ap2								= (String)request.getParameter("ap2");
	ap2										= Utility.replaceQuoteOracle(ap2);

	String ap3								= (String)request.getParameter("ap3");
	ap3										= Utility.replaceQuoteOracle(ap3);

	String ap4								= (String)request.getParameter("ap4");
	ap4										= Utility.replaceQuoteOracle(ap4);

	String ap5								= (String)request.getParameter("ap5");
	ap5										= Utility.replaceQuoteOracle(ap5);


	String editor							= (String)request.getParameter("editor");
	editor									= Utility.replaceQuoteOracle(editor);
	String zonalHeadBy						= (String)request.getParameter("zonalHeadEmailid");
	String compulsaryAttachmentSize			= (String)request.getParameter("hiddDirectorySizecompulsory");
	String additionalyAttachmentSize		= (String)request.getParameter("hiddDirectorySizeadditional");
	String compulsaryAttachName				= "";
	String addtionalAttachName				= "";

	if(compulsaryAttachmentSize == null || compulsaryAttachmentSize.equals("0")){
		compulsaryAttachName="";
	}else
	{
		int comp_Size							= 0;
		comp_Size								= Integer.parseInt(compulsaryAttachmentSize);

		for(int ii=0; ii < comp_Size; ii++){
		String compulsaryAttachName1		= (String)request.getParameter("hiddFilesName1compulsory"+ii);
		compulsaryAttachName				= compulsaryAttachName1+","+compulsaryAttachName;

		}

		if (compulsaryAttachName.endsWith(",")) {
			compulsaryAttachName = compulsaryAttachName.substring(0, compulsaryAttachName.length() - 1);
		}
	}

	if(additionalyAttachmentSize == null || compulsaryAttachmentSize.equals("0")){
		addtionalAttachName="";
	
	}else
	{
		int addtional_Size						= 0;

		addtional_Size							= Integer.parseInt(additionalyAttachmentSize);

		for(int ii=0; ii < addtional_Size; ii++)
		{
		String addtionalAttachName1			= (String)request.getParameter("hiddFilesName1additional"+ii);
		addtionalAttachName					= addtionalAttachName1+","+addtionalAttachName;

		}
		if (addtionalAttachName.endsWith(",")) 
		{
			addtionalAttachName = addtionalAttachName.substring(0, addtionalAttachName.length() - 1);
		}
	}


		if("I".equals(action) || "R".equals(action) || "UI".equals(action) )
	{
		zonalHeadBy							= Utility.replaceQuoteOracle(zonalHeadBy);
		
		zonalHeadOId						= zonalHeadBy.substring(0,zonalHeadBy.indexOf("|"));

		zonalHeadSapNum						= zonalHeadBy.substring(zonalHeadBy.indexOf("|")+1);

		zonalHeadSapNum1					= zonalHeadSapNum.substring(0,zonalHeadSapNum.indexOf("|"));

		zonalHeadEmailid					= zonalHeadSapNum.substring(zonalHeadSapNum.indexOf("|")+1);

		actionStr = "In -Process";

	}else if("D".equals(action)){
		actionStr = "Draft";
		if(zonalHeadBy.equals("0")){
			zonalHeadBy = "0";
            zonalHeadOId	= "0";
			zonalHeadSapNum = "0";
			zonalHeadSapNum1 = "0";
			zonalHeadEmailid = "0";

		}else{
			zonalHeadBy	= Utility.replaceQuoteOracle(zonalHeadBy);
			zonalHeadOId	= zonalHeadBy.substring(0,zonalHeadBy.indexOf("|"));
			zonalHeadSapNum	= zonalHeadBy.substring(zonalHeadBy.indexOf("|")+1);
			zonalHeadSapNum1 = zonalHeadSapNum.substring(0,zonalHeadSapNum.indexOf("|"));
			zonalHeadEmailid	= zonalHeadSapNum.substring(zonalHeadSapNum.indexOf("|")+1);
		}
	} 
	String applName = "Waste Sales Approvals";
	String zonalType = (String)request.getParameter("zoneType");

%>
<!-- 	<%//@ include file="../common/processHeaderDetailsConfig.jsp" %>
 -->
 <%

String headerSection1 [ ]				= { "ApplicationName","statusType", "createdby", "documentstate","zonalType","reference","period","date","branch","oldRealisationHeader","oldRealisation","estRealisationHeader","estRealisation","currentRealisation","IncRealisation", "npRateQ1Header","npRateQ2Header","npRateQ3Header","npRateQ4Header","npRateQ5Header", "highlightsForTender","approvals","compAttachment","addAttachment", "npRateQ1","npRateQ2","npRateQ3","npRateQ4","npRateQ5","attachmentFolderName"};

	String detailSection2 [ ]				=  {"wcQ1Header","wcQ2Header","wcQ3Header","wcQ4Header","wcQ5Header","pwmQ1FinalRate","pwmQ2FinalRate","pwmQ3FinalRate","pwmQ4FinalRate","pwmQ5FinalRate","pwmPercentFinalRate","towQ1FinalRate","towQ2FinalRate","towQ3FinalRate","towQ4FinalRate","towQ5FinalRate","towPercentFinalRate","rspQ1FinalRate","rspQ2FinalRate","rspQ3FinalRate","rspQ4FinalRate","rspQ5FinalRate","rspPercentFinalRate","psQ1FinalRate","psQ2FinalRate","psQ3FinalRate","psQ4FinalRate","psQ5FinalRate","psPercentFinalRate","apQ1FinalRate","apQ2FinalRate","apQ3FinalRate","apQ4FinalRate","apQ5FinalRate","apPercentFinalRate","pwmQ1Index","pwmQ2Index","pwmQ3Index","pwmQ4Index","pwmQ5Index","towQ1Index","towQ2Index","towQ3Index","towQ4Index","towQ5Index","rspQ1Index","rspQ2Index","rspQ3Index","rspQ4Index","rspQ5Index","psQ1Index","psQ2Index","psQ3Index","psQ4Index","psQ5Index","apQ1Index","apQ2Index","apQ3Index","apQ4Index","apQ5Index" };


	String headerSectionVal1 [ ] = {applName, action, emailId, actionStr, zonalType, reference,wsaPeriod,createdDate,branch,headerRealisation, realisationOnQnty,estimatedReal,previousRealisation, currentRealisation,increaseRealisation,headerNPRate1,headerNPRate2, headerNPRate3,headerNPRate4,headerNPRate5,editor, zonalHeadOId,compulsaryAttachName,addtionalAttachName, npRate1,npRate2,npRate3,npRate4,npRate5,"compulsory,additional"};

	String detailSectionVal2 [ ]	=  {headerPeriodRate1,headerPeriodRate2,headerPeriodRate3,headerPeriodRate4,headerCurrPeriodRate,field1,field2,field3,field4,field5,finalPWM,field6,field7,field8,field9,field10,finalTOW,field11,field12,field13,field14,field15,finalRSP,field16,field17,field18,field19,field20,finalPS,field21,field22,field23,field24,field25,finalAP,pwm1,pwm2,pwm3,pwm4,pwm5,tow1,tow2,tow3,tow4,tow5,resp1,resp2,resp3,resp4,resp5,ps1,ps2,ps3,ps4,ps5,ap1,ap2,ap3,ap4,ap5};

	Hashtable processWasteHeaderHash = new Hashtable();
	Hashtable processWasteDetailsHash = new Hashtable();

	processWasteHeaderHash.put("REQUESTOID", requestId);
	processWasteHeaderHash.put("HEADERSECTION1", headerSection1);
	processWasteHeaderHash.put("HEADERSECTIONVAL1", headerSectionVal1);
	

	processWasteDetailsHash.put("REQUESTOID", requestId);
	processWasteDetailsHash.put("STATUS", action);
	processWasteDetailsHash.put("DETAILSECTION1", detailSection2);
	processWasteDetailsHash.put("DETAILSECTIONVAL1", detailSectionVal2);


	boolean updateHeaderFlag = false;
	boolean updateDetailsFlag = false;
	String message = "";

	updateHeaderFlag  = wasteSalesHeaderController.update("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processWasteHeaderHash);

	if(updateHeaderFlag){
		updateDetailsFlag  = wasteSalesDetailsController.update("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processWasteDetailsHash);
	}

	if(updateHeaderFlag && updateDetailsFlag)	{
		 message = "<h5>Request has been updated successfully."
		+"<br> Click <a href=\"../user/viewWSProcess.jsp\">here</a> to view the Request.</h5>";	

		if("I".equals(action) || "UI".equals(action))
		{
			//String  str = "<p>Dear All ,</p><p>Request number " +requestId+ " has been created by  " +emailId+ " from " +branch+ " .</p><p> This is for your kind //information. Kindly approve\review it.</p><p>Regards,</p><p> Timescape Admin</p>";


			ArrayList  lstArray= new ArrayList();
			String mailFrom ="timescape.admin@timesgroup.com";

			String host ="apprelay.timesgroup.com";

			lstArray  = wasteSalesChangeLogController.getEmailid(zonalHeadEmailid);
			String strArr[] = (String[])lstArray.get(0);

			String str = "Dear "+strArr[0]+", <br>" //manager[2] + "<br>"
				   + "<br> The following Sale Approval (SAR Note) request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
				   + "SAR Note ID    : "+requestId+"<br>"
				   + "Reference		 : "+reference+" <br>"
				   + "Created By	 : "+emailId+" <br><BR>"
				   + "Alternatively you can also click on the following link: <BR><a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://db6b2f31872d3befc50f7f254ea44cbd'>Sale Approval(SAR Note)</a><br><br>"
				   + "<p>Regards,</p><p> Timescape Admin</p>";


			String subject= "SAR Note pending for approval";

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
                        + "				<td colspan = \"3\" align = \"left\"><img src = \"http://tsweb.timesgroup.com/timescape/sapep/collaboration/workflow/wastesalesapproval/images/bannerfinal.jpg\" border = \"0\"></td>" 
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


		
			Hashtable mailDetailsHash = new Hashtable();
			mailDetailsHash.put("fromAddr", mailFrom);
			mailDetailsHash.put("mailPath", host);
			mailDetailsHash.put("toAddr", zonalHeadEmailid);
			mailDetailsHash.put("subject",subject);
			mailDetailsHash.put("content", htmlstr);
			/*mailDetailsHash.put("CREATEDBYEMAILID", emailId);
			
			mailDetailsHash.put("MAILTO", zonalHeadEmailid);
			mailDetailsHash.put("MAILSTATUS", "I");
			mailDetailsHash.put("REQUESTID", requestId);
			mailDetailsHash.put("SUBJECT", subject);
			mailDetailsHash.put("MESSAGE", htmlstr);*/
			boolean mailFlag  = wasteSalesChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);

			
		}

	}

%>
	<body>
<%@ include file="../common/relatedLinks.jsp" %>
<div class="container well">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
					<i class="fa fa-th"></i>  <strong>Submit Process Waste Aprroval</strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="frmCreateWasteSalesProcess" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" height="20px" >&nbsp;</td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
									</tr>
									<tr>
										<td align="left" height="20px" >&nbsp;</td>
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