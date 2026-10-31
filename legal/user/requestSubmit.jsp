<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Utility" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

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
	String vice_presd0 = (String)EnvironmentProperties.getValue("legalContractManagement", "VICE_PRESD");
	String vice_presd1 = (String)EnvironmentProperties.getValue("legalContractManagement", "VICE_PRESD1");

	GregorianCalendar today		= new GregorianCalendar();
	int todayDay				= today.get(Calendar.DAY_OF_MONTH);

	String months[ ]			={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};
	String monthsStr[ ]			= {"0","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

	String todayMon				= months[today.get(Calendar.MONTH)+1];
	String todayMonStr			= monthsStr[today.get(Calendar.MONTH) + 1] ;

	int  todayMonInt = Integer.parseInt(todayMon);

	int  todayYear				= today.get(Calendar.YEAR);

	String  todayYearStr		= todayYear+"";
	String  todayMon1		= "";

	String todayDay1			= Integer.toString(todayDay);

	if(todayDay1.length()==1){

		todayDay1 = "0"+todayDay1;
	}

	if(todayMon.length()==1){

		todayMon1 = "0"+todayMon;
	}
	
	String dayMonYear			= todayDay1+ "-" +todayMonStr+ "-" +todayYear;

	ArrayList  approverlstArray= new ArrayList();
	ArrayList  vicePresdlstArray= new ArrayList();
	String userDeptName					= "";
	String userDeptOId					= "";
	String userDeptSapNum				= "";
	String userDeptSapNum1				= "";
	String userDeptEmailid				= "";

	String legalHeadName			= "";
	String legalHeadOId				= "";
	String legalHeadSapNum				= "";
	String legalHeadSapNum1				= "";
	String legalHeadEmailid				= "";

	String applName = "";
	String logApplName = "legalContractManagement";
	String actionStr = "";
	applName = "Legal Contract Management";
	String documentOID = "DOC1006";

	
	Hashtable processWasteDetailsHash = new Hashtable();
	Hashtable approvalDetailsHash = new Hashtable();

	String action							= (String)request.getParameter("frmStatus");

	String typeOfAgreement					= (String)request.getParameter("typeOfAgreement");
	typeOfAgreement							= Utility.replaceQuoteOracle(typeOfAgreement);

	String partyName						= (String)request.getParameter("partyName");
	partyName								= Utility.replaceQuoteOracle(partyName);

	String reasonForSingAgreement			= (String)request.getParameter("reasonForSingAgreement");
	reasonForSingAgreement					= Utility.replaceQuoteOracle(reasonForSingAgreement);

	String dateOfAgreement					= (String)request.getParameter("dateOfAgreement");
	dateOfAgreement							= Utility.replaceQuoteOracle(dateOfAgreement);

	String valueOfAgreement					= (String)request.getParameter("valueOfAgreement");
	valueOfAgreement						= Utility.replaceQuoteOracle(valueOfAgreement);

	if(valueOfAgreement.equals("") || valueOfAgreement==null)
	{
		valueOfAgreement = "0";
	}

	int valueOfAgreementNum = Integer.parseInt(valueOfAgreement);

	String valueOfAgreement1 = valueOfAgreement;

	int len = 0;

	int counter = 1;

	int lenCount = len-1;

	String temp = "";

	if(valueOfAgreement1.contains("."))
	{
	String[] parts  = valueOfAgreement1.split("\\.");
	String part1    = parts[0];
	//String part2    = parts[1];
	valueOfAgreement1 = part1;
	len = valueOfAgreement1.length();
	lenCount = len-1;
	if(len>3)
	{
		while(lenCount>=0)
		{
			if((counter>3) && (counter%2==0))
				{
					temp = temp + ",";
				}
			
			temp = temp + valueOfAgreement1.charAt(lenCount);
			
			lenCount--;
			counter++;
		}
		temp =  new StringBuffer(temp).reverse().toString();

		valueOfAgreement1 = temp;
	 }
		valueOfAgreement1 +="."+parts[1];

		valueOfAgreement1 = valueOfAgreement1.substring(0,valueOfAgreement1.length() - 3);

	}  else
	{
		len = valueOfAgreement1.length();
			
		lenCount = len-1;

		counter = 1;

		if(len>3)
		{
			while(lenCount>=0)
			{
				if((counter>3) && (counter%2==0))
					{
						temp = temp + ",";
					}
				
				temp = temp + valueOfAgreement1.charAt(lenCount);
				
				lenCount--;
				counter++;
			}
			temp =  new StringBuffer(temp).reverse().toString();
	   
			valueOfAgreement1 = temp;
			
		}
	}

	String agreement						= (String)request.getParameter("agreement");
	agreement								= Utility.replaceQuoteOracle(agreement);

	String natureOfParties					= (String)request.getParameter("natureOfParties");
	natureOfParties							= Utility.replaceQuoteOracle(natureOfParties);

	String address							= (String)request.getParameter("address");
	address									= Utility.replaceQuoteOracle(address);

	//String termOfAgreement					= (String)request.getParameter("termOfAgreement");
	//termOfAgreement							= Utility.replaceQuoteOracle(termOfAgreement);
	String termOfAgreement = "NA";

	String jurisdiction						= (String)request.getParameter("jurisdiction");
	jurisdiction							= Utility.replaceQuoteOracle(jurisdiction);
/*
	String considerationOfAgreement			= (String)request.getParameter("considerationOfAgreement");
	considerationOfAgreement				= Utility.replaceQuoteOracle(considerationOfAgreement);

	String deliverablesNatureOfParty		= (String)request.getParameter("deliverablesNatureOfParty");
	deliverablesNatureOfParty				= Utility.replaceQuoteOracle(deliverablesNatureOfParty);
*/
	String considerationOfAgreement			= "";
	String deliverablesNatureOfParty		= "";

	String terminationFromDate				= (String)request.getParameter("terminationFromDate");
	terminationFromDate						= Utility.replaceQuoteOracle(terminationFromDate);

	String terminationToDate				= (String)request.getParameter("terminationToDate");
	terminationToDate						= Utility.replaceQuoteOracle(terminationToDate);

	String userDeptName1					= (String)request.getParameter("userDeptHead");
	userDeptName1							= Utility.replaceQuoteOracle(userDeptName1);

	String legalHeadName1					= (String)request.getParameter("legalHead");
	legalHeadName1							= Utility.replaceQuoteOracle(legalHeadName1);

	String mainComments					= (String)request.getParameter("mainComments");
	mainComments							= Utility.replaceQuoteOracle(mainComments);

	if("I".equals(action))
	{
		actionStr = "In - Process";

	}else if("D".equals(action))
	{
		actionStr = "Draft";
	}

	if(userDeptName1.equals("0") || "".equals(userDeptName1) || userDeptName1 == null)
	{
		userDeptName= "0";

	}else
	{
		/*userDeptOId					= userDeptName1.substring(0,userDeptName1.indexOf("|"));

		userDeptSapNum				= userDeptName1.substring(userDeptName1.indexOf("|")+1);

		userDeptSapNum1				= userDeptSapNum.substring(0,userDeptSapNum.indexOf("|"));

		userDeptEmailid				= userDeptSapNum.substring(userDeptSapNum.indexOf("|")+1);*/

	//	userDeptName				= userDeptEmailid+","+userDeptName;

		userDeptName					= userDeptName+userDeptName1+",";

		/*if(j==0)
		{
			mailTo  = userDeptEmailid;
		}*/
	}

	userDeptName = userDeptName.substring(0, userDeptName.length() - 1);

									
	if(legalHeadName1.equals("0") || "".equals(legalHeadName1) || legalHeadName1 == null)
	{
		legalHeadName= "0";

	}else
	{

		/*legalHeadOId				= legalHeadName1.substring(0,legalHeadName1.indexOf("|"));

		legalHeadSapNum				= legalHeadName1.substring(legalHeadName1.indexOf("|")+1);

		legalHeadSapNum1			= legalHeadSapNum.substring(0,legalHeadSapNum.indexOf("|"));

		legalHeadEmailid			= legalHeadSapNum.substring(legalHeadSapNum.indexOf("|")+1);*/

		//branchHeadName			= branchHeadEmailid+","+branchHeadName;

		legalHeadName				= legalHeadName+legalHeadName1+",";
	}
	
	legalHeadName = legalHeadName.substring(0, legalHeadName.length() - 1);
%>
<%@ include file="../common/leagalHeaderDetailsConfig.jsp" %>

<%
	String headerSectionVal1 [ ]	= { applName, action, emailId, actionStr, typeOfAgreement, partyName, reasonForSingAgreement, dateOfAgreement, valueOfAgreement, agreement, natureOfParties, address, jurisdiction, terminationFromDate, terminationToDate, userDeptName, legalHeadName, mainComments};

	//out.println(applName+);
	
	String detailSectionVal2 [ ]	 = {termOfAgreement,considerationOfAgreement,deliverablesNatureOfParty};

	processWasteDetailsHash.put("HEADERSECTION1", headerSection1);
	processWasteDetailsHash.put("HEADERSECTIONVAL1", headerSectionVal1);

	processWasteDetailsHash.put("DETAILSECTION2", detailSection2);
	processWasteDetailsHash.put("DETAILSECTIONVAL2", detailSectionVal2);
	processWasteDetailsHash.put("Application_Name", logApplName);

	String  createRequest = "";
	boolean  approvalFlag =false;
	boolean  textFlag =false;


	textFlag  = docChangeLogController.validationOnText(processWasteDetailsHash);

	String message ="";

	if(textFlag)
	{
		 message = "<h5>There was some error occured while processing your request."
						+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";	
	}else
	{



		createRequest  = docHeaderController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", processWasteDetailsHash);

		//System.out.println("createRequest-----"+createRequest);


		if("".equals(userDeptName) || userDeptName==null)
		{
			userDeptName = "0";
		}

		if("".equals(legalHeadName) || legalHeadName==null)
		{
			legalHeadName ="0";
		}

		
		
		//String approvalheaderSection [ ]				= {"UserDepartmentHead","LegalHead"};
		String[] approvalStrArray = new String[1];
		String[] approvalStrArray1 = new String[1];
		String[] vicePresidentStrArray0 = new String[1];
		String[] vicePresidentStrArray1 = new String[1];
		approvalStrArray [0]		= userDeptName;
		approvalStrArray1 [0]		= legalHeadName;


		String approvalheaderSection [ ]				= {"LegalHead"};
		String approvalheaderSectionVal [ ]				= {legalHeadName};

		approverlstArray.add(approvalStrArray);
		approverlstArray.add(approvalStrArray1);

		if(valueOfAgreementNum > 4999999)
		{
			vicePresidentStrArray0 [0]	= vice_presd0;
			vicePresidentStrArray1 [0]	= vice_presd1;
			vicePresdlstArray.add(vicePresidentStrArray0);
			vicePresdlstArray.add(vicePresidentStrArray1);
		}

		//System.out.println("---"+approverlstArray.size());
		approvalDetailsHash.put("REQUESTOID", createRequest);
		approvalDetailsHash.put("DOCUMNETOID", documentOID);
		approvalDetailsHash.put("APPLICATIONNAME",logApplName);
		approvalDetailsHash.put("CREATEDBY", emailId);
		

		if(!"".equals(userDeptName) || !"".equals(legalHeadName))
		{
			approvalDetailsHash.put("APPROVALHEADERSECTION", approvalheaderSection);
			approvalDetailsHash.put("APPROVALHEADERSECTIONVAL", approvalheaderSectionVal);

			approvalFlag  = docChangeLogController.insertApproval("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", approvalDetailsHash);
		}

	//System.out.println("approvalFlag-----"+approvalFlag);

		
		if ("AuthFail".equals(createRequest)){
			 message = "<h5>There was some error occured while processing your request."
						+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";	

		}else{
			 message = "<h5>The request number <b>"+createRequest+" </b>has been created successfully."
						+"<br> Click <a href=\"../user/viewRequests.jsp\">here</a> to view your request.</h5>";
						

			if("I".equals(action))
			{
				String mailFrom ="timescape.admin@timesgroup.com";

				String host ="apprelay.timesgroup.com";
				//String  str = "<p>Dear All ,</p><p>Request number " +createRequest+ " has been created by  " +emailId+ " from " +branch+ " .</p><p> This is for your //kind information. Kindly approve\review it.</p><p>Regards,</p><p> Timescape Admin</p>";

				for(int k =0; k < approverlstArray.size(); k++)
				{
					String appEmailidArr[] = (String[])approverlstArray.get(k);

					String mailTo = appEmailidArr[0];

					ArrayList  lstArray= new ArrayList();

					lstArray  = docChangeLogController.getEmailid(mailTo);
					String strArr[] = (String[])lstArray.get(0);

					String str = "Dear "+strArr[0]+", <br>" 
							   + "<br>"+displayName+", from "+deptName+" team has submitted request number <strong>"+createRequest+"</strong> on <strong>"+dayMonYear+"</strong> for a <strong>"+agreement+"</strong> of <strong>"+typeOfAgreement+"</strong>.<BR><BR>"
							   //+ "Please click on the link below to go to the page. "
							    //+" <a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'>"
							   //+" <a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
							  // +"<BR>Legal Contract Document</a><br><br>"
							   + "<p>Regards,<BR> Timescape Admin</p>";


					String subject= "Legal Contract Document submitted by your team";

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
								+ "				<td colspan = \"3\" align = \"left\"><img src = \"https://tsweb.timesgroup.com/timescape/sapep/collaboration/workflow/legal/images/legalheaderEmail.jpg\" border = \"0\"></td>" 
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

					//mailTo = "kavita.yadav@timesgroup.com";

					Hashtable mailDetailsHash = new Hashtable();
					mailDetailsHash.put("fromAddr", mailFrom);
					mailDetailsHash.put("mailPath", host);
					mailDetailsHash.put("toAddr", mailTo);
					mailDetailsHash.put("subject",subject);
					mailDetailsHash.put("content", htmlstr);


					
					boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
				}

				for(int ll =0; ll < vicePresdlstArray.size(); ll++)
				{
					String appEmailidArr[] = (String[])vicePresdlstArray.get(ll);

					String mailTo = appEmailidArr[0];

					ArrayList  lstArray= new ArrayList();

					lstArray  = docChangeLogController.getEmailid(mailTo);
					String strArr[] = (String[])lstArray.get(0);

					ArrayList  lstArrayLegal= new ArrayList();

					lstArrayLegal  = docChangeLogController.getEmailid(legalHeadName);
					String strArrLeg[] = (String[])lstArrayLegal.get(0);

					String str = "Dear "+strArr[0]+", <br>" 
							   + "<br>"+displayName+", from "+deptName+" team has submitted request number <strong>"+createRequest+"</strong> on <strong>"+dayMonYear+"</strong> of high value <img src = \"http://tsweb.timesgroup.com/timescape/sapep/collaboration/workflow/legal/images/rupeesSign.png\" border = \"0\" width = \"13px\" height = \"13px\" style = \"padding-top:5px\"> "+valueOfAgreement1+". You may contact <strong>"+strArrLeg[0]+"</strong> for further detail.<BR><BR>"
							   //+ "Please click on the link below to go to the page. "
							   //+" <a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://d31f5e43897bc6374fac8fcf58b57d3a'><BR>Legal Contract Document</a><br><br>"
							   //+" <a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://d184fee255f5d8da0e5909bf2626cb49'><BR>Legal Contract Document</a><br><br>"

							   + "<p>Regards,<BR> Timescape Admin</p>";
	
					
			
					String subject= "Legal Contract Document - "+createRequest+ " submitted for high value";

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

					//mailTo = "kavita.yadav@timesgroup.com";

					Hashtable mailDetailsHash = new Hashtable();
					mailDetailsHash.put("fromAddr", mailFrom);
					mailDetailsHash.put("mailPath", host);
					mailDetailsHash.put("toAddr", mailTo);
					mailDetailsHash.put("subject",subject);
					mailDetailsHash.put("content", htmlstr);

					boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
				}

			}

		}
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
					<i class="fa fa-th"></i>  <strong>Submit Request</strong>
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