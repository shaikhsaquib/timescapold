<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="wasteSalesHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>


<% 
    response.setHeader("Cache-Control","no-cache"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", 0); 
%>
<!DOCTYPE >
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Waste Approval Process </title>	
        <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
        <link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="../css/style_1.css" rel="stylesheet"/>
        <link href="../css/select2.min.css" rel="stylesheet">
        <link href="../css/bootstrap-multiselect.css" rel="stylesheet">
        <link href="../css/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />

        <style>
        .select2-container .select2-selection--single {
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
    </head>
<%
	    ArrayList <String[]> wasteList = new ArrayList<String[]> ();	
         Hashtable processWasteDetailsHash = new Hashtable();
        String reference		 =  request.getParameter("reference");
		reference				 = Utility.replaceQuoteOracle(reference);


        String zoneType			 =  request.getParameter("zoneType");
		zoneType				 = Utility.replaceQuoteOracle(zoneType);


        String approvalNote		=  request.getParameter("approvalNote");
		approvalNote			= Utility.replaceQuoteOracle(approvalNote);

        String approvalNote1	=  request.getParameter("approvalNote1");
		approvalNote1			= Utility.replaceQuoteOracle(approvalNote1);


        int counter  = 0;
        int counterApprovedBy = 0;
         int counterSupportedBy = 0;
        String cities = "";
        String pwm = "";
        String tow = "";
        String re = "";
        String pg  = ""; 
        String ap  = "";
        String reffNo = "";
        String remark  = "";
        String requestNos = "";
        String approvedBy = "";
        String supportedBy = "";
        String status = "";
        String statusR = "";
		String createdBy ="";
         String cityArray[] = null;
        String pwmArray[] = null;
        String towArray[] = null;
        String reArray[] = null;
        String pgArray[] = null;
        String apArray[] = null;
        String remarkArray[] = null;
        String appArray[] = null;
        String suppArray[] = null;
        String reqNumber[] = null;
        String statusArray[] = null;
        String refArray[] = null;
		String createdByArray[] = null;
		Hashtable headerHash = new Hashtable();

		boolean updateHeaderFlag	= false;
		boolean updateDetailsFlag	= false;

        counter = Integer.parseInt((request.getParameter("listSize") == null) ? "0" : request.getParameter("listSize"));
        counterApprovedBy = Integer.parseInt((request.getParameter("counterApprovedBy") == null) ? "0" : request.getParameter("counterApprovedBy"));
        counterSupportedBy = Integer.parseInt((request.getParameter("counterSupportedBy")== null) ? "0" : request.getParameter("counterSupportedBy"));
		int apprCount= 0;
		int rwCount= 0;
		int rwflag= 0;
		
		String mailFrom ="timescape.admin@timesgroup.com";

		String host ="apprelay.timesgroup.com";

        for (int kk = 0; kk < counter; kk++)
		{
			String aprStatus = (String)request.getParameter("approve"+kk);
			String rwStatus = (String)request.getParameter("review"+kk);

			String approves = (aprStatus == null  || aprStatus == ""  ) ? "NA" : aprStatus ;

			 if (!"NA".equals(approves)) {
				 if (!(aprStatus == null) || !(aprStatus == "")) {
					 
					status = status +aprStatus +",";  
					apprCount = apprCount+1;

				}else
				{
					break;
				}
			 }

			String reviews = (rwStatus == null || rwStatus == "" ) ? "NA" : rwStatus ; 
						
			if (!"NA".equals(reviews)) 
			{
					statusR = statusR +reviews +",";
					rwCount = rwCount+1;
			}  //change by kaviata

			if ("R".equals(reviews)) 
			{
				String requestNo1 = request.getParameter("requestNo"+kk);
				requestNo1	= Utility.replaceQuoteOracle(requestNo1);

				String referenceNo1 = request.getParameter("referenceNo"+kk);
				referenceNo1	= Utility.replaceQuoteOracle(referenceNo1);

				String createByEmailId1 = request.getParameter("createdby"+kk);
				createByEmailId1	= Utility.replaceQuoteOracle(createByEmailId1);

				headerHash.put("APPLICATION_NAME", "wastesalesapprovals");
				headerHash.put("REQUESTOID", requestNo1);
				headerHash.put("STATUS", "RH");
				headerHash.put("ACTIONSTATE", "Zonal Head Reviewed");
				headerHash.put("CREATEDBY", emailId);
				updateHeaderFlag  = wasteSalesHeaderController.updateAction("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", headerHash);
				updateDetailsFlag  = docDetailsController.updateAction("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", headerHash);
				
				if(updateHeaderFlag && updateDetailsFlag)
				{
					rwflag= rwflag+1;
				}else
				{
					rwflag= 0;
				}

				Hashtable mailDetailsHash = new Hashtable();
				if(updateHeaderFlag && updateDetailsFlag)
				{				
					boolean mailFlag =false; 
					ArrayList  lstArray= new ArrayList();
					lstArray  = docChangeLogController.getEmailid(createByEmailId1);
					String strArr2[] = (String[])lstArray.get(0);
					
					String str = "Dear "+strArr2[0]+", <br>" //manager[2] + "<br>"
							   + "<br> The following Sale Approval (SAR Note) request has been put on review by Zonal Head. Please update the request and submit again on Timescape.<BR><BR>"
							   + "SAR Note ID		: "+requestNo1+"<br>"
							   + "Reference		    : "+referenceNo1+" <br>"
							   + "Last Actioned By  : "+emailId+" <br><BR>"
							   + "Alternatively you can also click on the following link: <BR><a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://db6b2f31872d3befc50f7f254ea44cbd'>Sale Approval(SAR Note)</a><br><br>"
							   + "<p>Regards,</p><p> Timescape Admin</p>";

					String subject= "SAR Note pending for update";

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

					mailDetailsHash.put("fromAddr", mailFrom);
					mailDetailsHash.put("mailPath", host);
					mailDetailsHash.put("toAddr", createByEmailId1);
					mailDetailsHash.put("subject",subject);
					mailDetailsHash.put("content", htmlstr);
					
					/*mailDetailsHash.put("CREATEDBYEMAILID", emailId);
					mailDetailsHash.put("MAILTO", createByEmailId1);
					mailDetailsHash.put("MAILSTATUS", "RH");
					mailDetailsHash.put("SUBJECT", subject);
					mailDetailsHash.put("MESSAGE", htmlstr);
					mailDetailsHash.put("REQUESTID", requestNo1);*/

					mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
				
				}		

			}
	
		}

		for (int pp = 0; pp < apprCount; pp++) 
		{  
			
			String city  = request.getParameter("city"+pp);
			city	= Utility.replaceQuoteOracle(city);
			cities = cities + city +",";

			String pwms =  request.getParameter("pwm"+pp);
			pwms	= Utility.replaceQuoteOracle(pwms);
			pwm = pwm + pwms +",";

			String tows =  request.getParameter("tow"+pp);
			tows	= Utility.replaceQuoteOracle(tows);
			tow = tow + tows +",";

			String res = request.getParameter("re"+pp);
			res	= Utility.replaceQuoteOracle(res);
			re = re + res +",";

			String pgs =  request.getParameter("pg"+pp);
			pgs	= Utility.replaceQuoteOracle(pgs);
			pg = pg + pgs +",";

			String aps =  request.getParameter("ap"+pp);
			aps	= Utility.replaceQuoteOracle(aps);
			ap = ap + aps +",";

			String requestNo = request.getParameter("requestNo"+pp);
			requestNo	= Utility.replaceQuoteOracle(requestNo);
			requestNos = requestNos + requestNo+",";

			String referenceNo = request.getParameter("referenceNo"+pp);
			referenceNo	= Utility.replaceQuoteOracle(referenceNo);
			reffNo = reffNo + referenceNo+",";

			String createByEmailId = request.getParameter("createdby"+pp);
			createByEmailId	= Utility.replaceQuoteOracle(createByEmailId);
			createdBy = createdBy + createByEmailId+",";
			 
			String remarks =( request.getParameter("remark"+pp) == null || request.getParameter("remark"+pp) == ""  ) ? "NA" : request.getParameter("remark"+pp) ;
			remarks	= Utility.replaceQuoteOracle(remarks);

			remark = remark + remarks +",";
		}
		
		for (int aa = 0 ;aa < counterApprovedBy ;aa++){
		//for (int aa = 0 ;aa < apprCount ;aa++){
             String appBy  = request.getParameter("approvedBy"+aa);
             approvedBy = approvedBy + appBy +",";
        }
        for (int jj = 0 ;jj < counterSupportedBy ;jj++){
       // for (int jj = 0 ;jj < apprCount ;jj++){
             String supportes  = request.getParameter("supportedBy"+jj);
             supportedBy = supportedBy + supportes +",";
        }

		cities = cities.substring(0,cities.length()-1 );
		cityArray = cities.split(",");     
		pwm = pwm.substring(0,pwm.length()-1 );
        pwmArray = pwm.split(",");   
        tow = tow.substring(0,tow.length()-1 );
        towArray = tow.split(",");   
        re = re.substring(0,re.length()-1 );
        reArray = re.split(",");     
        pg = pg.substring(0,pg.length()-1 );
        pgArray = pg.split(",");     
        ap = ap.substring(0,ap.length()-1 );
        apArray = ap.split(",");     
        remark = remark.substring(0,remark.length()-1 );
        remarkArray = remark.split(",");  
        approvedBy = approvedBy.substring(0,approvedBy.length()-1);
        appArray = approvedBy.split(",");
        supportedBy = supportedBy.substring(0,supportedBy.length()-1);
        suppArray = supportedBy.split(","); 
        requestNos = requestNos.substring(0,requestNos.length()-1);
        reqNumber = requestNos.split(","); 
        status = status.substring(0,status.length()-1);   
        statusArray = status.split(","); 
		

        refArray = reffNo.split(","); 
		createdBy = createdBy.substring(0,createdBy.length()-1);
        createdByArray = createdBy.split(","); 
		
      for (int ii = 0; ii < apprCount; ii++) {  
			 String wasteArray[] = { reqNumber[ii],cityArray[ii], pwmArray[ii], towArray[ii] , reArray[ii],pgArray[ii] ,apArray[ii],remarkArray[ii] ,statusArray[ii],reference,refArray[ii],createdByArray[ii]};
			 		
            wasteList.add(wasteArray);
         }


       	String headerSection [ ]	 = {"REQUESTNO" ,"CITY", "PWM", "TOW","REW","PGW","APW","REMARK" , "STATUS" ,"REFERENCE","DOCREFERENCE","CREATEDBY"};
        processWasteDetailsHash.put("HEADERSECTION", headerSection);
        processWasteDetailsHash.put("HEADERSECTIONVAL", wasteList);	
        processWasteDetailsHash.put("REFERENCE",reference);
        processWasteDetailsHash.put("LISTAPPROVEDBY",appArray);
        processWasteDetailsHash.put("LISTSUPPORTEDBY",suppArray);

        processWasteDetailsHash.put("APPROVALNOTE",approvalNote);
        processWasteDetailsHash.put("APPROVALNOTE1",approvalNote1);

        processWasteDetailsHash.put("EMAILID",emailId);
        processWasteDetailsHash.put("DOCUMENTOID","DOC1001");
        processWasteDetailsHash.put("STATUS","AI");
        processWasteDetailsHash.put("ZONALTYPE",zoneType);
        processWasteDetailsHash.put("DOCUMENTSTATUS","Zonal Head Approved");
       
		String result  = docChangeLogController.create( "sees","sdfsdf",processWasteDetailsHash);

		String message = "";
	//	String result = "201511000192";

		if ("Error".equals(result)){
            message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to view the Request.</h5>";	
        } else{
			message = "<h5>Request number <b> " + result +"</b> has been created successfully."
					+"<br> Click <a href=\"../user/viewWSZonalRequests.jsp\">here</a> to view the Request.</h5>";	
					
			int reviewCount = 0;

			for (int jj = 0; jj < apprCount; jj++) 
			{  			
				if(statusArray[jj].equals("R"))
				{
					reviewCount++;
				}
			}

			if(reviewCount == 0)
			{
				Hashtable approverHash = new Hashtable();
				ArrayList approverList = new ArrayList();

				approverHash.put("REQUESTID", result);
				approverHash.put("STATUS", "L");
				approverList  = docChangeLogController.searchApproverMail( "sees","sdfsdf",approverHash);

				if(approverList.size()>0)
				{
					for(int kk = 0; kk < approverList.size(); kk++)
					{
						String strArr[] = (String[])approverList.get(kk);
						Hashtable mailDetailsHash = new Hashtable();

						String requestNo = result;
						String mailTo = strArr[3];

						ArrayList  lstArray= new ArrayList();

						lstArray  = docChangeLogController.getEmailid(mailTo);
						String strArr1[] = (String[])lstArray.get(0);

						boolean mailFlag =false;

						//String  str = "<p>Dear All ,</p><p>Request number " +requestNo+ " has been Approved by  " +emailId+ " for " +zoneType+ " .</p><p> This is //for your kind information. Kindly approve or review it.</p><p>Regards,</p><p> Timescape Admin</p>";

						String str = "Dear "+strArr1[0]+", <br>" //manager[2] + "<br>"
						   + "<br> The following Sale Approval (SAR Note) request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
						   + "SAR Note ID   : "+requestNo+"<br>"
						   + "Reference		: "+reference+" <br>"
						   + "Created By	: "+emailId+" <br><BR>"
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

						mailDetailsHash.put("fromAddr", mailFrom);
						mailDetailsHash.put("mailPath", host);
						mailDetailsHash.put("toAddr", mailTo);
						mailDetailsHash.put("subject",subject);
						mailDetailsHash.put("content", htmlstr);
						
						/*mailDetailsHash.put("CREATEDBYEMAILID", emailId);
						mailDetailsHash.put("MAILTO", mailTo);
						mailDetailsHash.put("MAILSTATUS", "A");
						mailDetailsHash.put("SUBJECT", subject);
						mailDetailsHash.put("MESSAGE", htmlstr);
						mailDetailsHash.put("REQUESTID", requestNo);*/

						mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);

					//	out.println("mailFlag----"+mailFlag);
					}
				}
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
						<form class="form-horizontal" role="form" id="demo_form" name ="frmViewWasteSalesProcess" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
								<table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2"> 
									<tr>
										<td align="left" ><img src="../images/spacer.gif" width="1" height="40"></td>
									</tr>
									<tr>
										<td align="center" class="normal" valign = "top" ><%=message%></td>
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
