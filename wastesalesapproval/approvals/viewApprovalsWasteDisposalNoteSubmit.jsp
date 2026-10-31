<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>

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
        String reference =  request.getParameter("reference");
		reference		= Utility.replaceQuoteOracle(reference);

         String workItemOID =  request.getParameter("workItemOID");
		 workItemOID		= Utility.replaceQuoteOracle(workItemOID);

        
        int counter  = 0;
        int counterApprovedBy = 0;
         int counterSupportedBy = 0;
         String remark  = "";
        String requestNos = "";
        String approvedBy = "";
        String supportedBy = "";
        String status = "";
        String docRef = "";
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
        String docRefArray[] = null;

        String cities = "";
        String pwm = "";
        String tow = "";
        String re = "";
        String pg  = ""; 
        String ap  = "";
        counter = Integer.parseInt((request.getParameter("listSize") == null) ? "0" : request.getParameter("listSize"));
        counterApprovedBy = Integer.parseInt((request.getParameter("counterApprovedBy") == null) ? "0" : request.getParameter("counterApprovedBy"));
        counterSupportedBy = Integer.parseInt((request.getParameter("counterSupportedBy")== null) ? "0" : request.getParameter("counterSupportedBy"));

        for (int kk = 0; kk < counter; kk++){
             String city  = request.getParameter("city"+kk);
			 city		= Utility.replaceQuoteOracle(city);

            cities = cities + city +",";
            String pwms =  request.getParameter("pwm"+kk);
			pwms		= Utility.replaceQuoteOracle(pwms);

            pwm = pwm + pwms +",";
            String tows =  request.getParameter("tow"+kk);
			tows		= Utility.replaceQuoteOracle(tows);

            tow = tow + tows +",";
            String res = request.getParameter("re"+kk);
			res		= Utility.replaceQuoteOracle(res);

            re = re + res +",";
            String pgs =  request.getParameter("pg"+kk);
			pgs		= Utility.replaceQuoteOracle(pgs);

            pg = pg + pgs +",";
            String aps =  request.getParameter("ap"+kk);
			aps		= Utility.replaceQuoteOracle(aps);

            ap = ap + aps +",";
             String requestNo = request.getParameter("requestNo"+kk);
			 requestNo		= Utility.replaceQuoteOracle(requestNo);

             requestNos = requestNos + requestNo+",";
             String docReference = request.getParameter("docReference"+kk);
			 docReference		= Utility.replaceQuoteOracle(docReference);

             docRef = docRef + docReference+",";
            String remarks =( request.getParameter("remark"+kk) == null || request.getParameter("remark"+kk) == ""  ) ? "NA" : request.getParameter("remark"+kk);
			remarks		= Utility.replaceQuoteOracle(remarks);

            remark = remark + remarks +",";
            String approves = (request.getParameter("approve"+kk) == null  || request.getParameter("approve"+kk) == ""  ) ? "NA" : request.getParameter("approve"+kk) ;
            if (!"NA".equals(approves)) {
                      status = status +approves +",";
             }                 
            String reviews = (request.getParameter("review"+kk) == null || request.getParameter("review"+kk) == "" ) ? "NA" : request.getParameter("review"+kk) ;                
            if (!"NA".equals(reviews)) {
                    status = status +reviews +",";
            }   
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
        requestNos = requestNos.substring(0,requestNos.length()-1);
        reqNumber = requestNos.split(","); 
        status = status.substring(0,status.length()-1);   
        statusArray = status.split(","); 
        docRef = docRef.substring(0,docRef.length()-1);   
        docRefArray = docRef.split(",");

         for (int ii = 0; ii < counter; ii++) {  
            String wasteArray[] = { reqNumber[ii],remarkArray[ii] ,statusArray[ii],reference, docRefArray[ii] ,cityArray[ii], pwmArray[ii], towArray[ii] , reArray[ii],pgArray[ii] ,apArray[ii] };
         
            wasteList.add(wasteArray);
         }

     //   String  jValue = session.getId(); 
    //    String  appSign = wasteSalesHeaderController.createRequest(jValue,"");  
       	String headerSection [ ]	 = {"REQUESTNO" ,"REMARK" , "STATUS" ,"REFERENCE","DOCREFERENCE","CITY", "PWM", "TOW","REW","PGW","APW"};
        processWasteDetailsHash.put("HEADERSECTION", headerSection);
        processWasteDetailsHash.put("HEADERSECTIONVAL", wasteList);	
        processWasteDetailsHash.put("WORKITEMOID",workItemOID);
       // processWasteDetailsHash.put("ZONALTYPE",zoneType);
       // processWasteDetailsHash.put("LISTAPPROVEDBY",appArray);
       // processWasteDetailsHash.put("LISTSUPPORTEDBY",suppArray);
        processWasteDetailsHash.put("EMAILID",emailId);
        processWasteDetailsHash.put("DOCUMENTOID","DOC1001");
      //  processWasteDetailsHash.put("STATUS","I");
       // processWasteDetailsHash.put("ZONALTYPE","WEST ZONE");
    //    processWasteDetailsHash.put("DOCUMENTSTATUS","Zonal Head Approved");
		Boolean  result  = false;
		String message = "";
        
		result  = docChangeLogController.update( null,null,processWasteDetailsHash);

	//	 out.println("result----"+result);

		if(result)
		{
          message = "<h5>Request has been updated successfully."
					+"<br> Click <a href=\"../user/viewWSApprovals.jsp\">here</a> to view the pending request(s).</h5>";


			int reviewCount = 0;
			
			String mailFrom ="timescape.admin@timesgroup.com";

			String host ="apprelay.timesgroup.com";

			for (int jj = 0; jj < counter; jj++) 
			{  			
				if(statusArray[jj].equals("R"))
				{
					reviewCount++;

					Hashtable approverHash = new Hashtable();
					ArrayList approverList = new ArrayList();

					approverHash.put("REQUESTID", reqNumber[jj]);
					//approverHash.put("STATUS", "A");
					approverHash.put("REQUESTIDSTATUS", "R");
					approverList  = docChangeLogController.searchApproverMail( "sees","sdfsdf",approverHash);

					for(int kk = 0; kk < approverList.size(); kk++)
					{
						String strArr[] = (String[])approverList.get(kk);
						Hashtable mailDetailsHash = new Hashtable();

						String requestNo	= strArr[1];
						String mailTo		= strArr[4];
						String mailCCTo		= strArr[6];

						boolean mailFlag =false;
						ArrayList  lstArray= new ArrayList();

						lstArray  = docChangeLogController.getEmailid(mailTo);
						String strArr2[] = (String[])lstArray.get(0);


					//	String  str = "<p>Dear All ,</p><p>Request number " +requestNo+ " has been Reviewed by  " +emailId+ ".</p><p> This is for your kind information. PlantHead " +mailTo+ " zonalHead " +mailCCTo+ " </p><p>Regards,</p><p> Timescape Admin</p>";

						String str = "Dear "+strArr2[0]+", <br>" //manager[2] + "<br>"
							   + "<br> The following Sale Approval (SAR Note) request has been put on review by Approver. Please update the request and submit again on Timescape<BR><BR>"
							   + "SAR Note ID	   : "+requestNo+"<br>"
							   + "Reference		   : "+docRefArray[jj]+" <br>" 
							   + "Last Actioned By : "+emailId+" <br><BR>"
							   + "Alternatively you can also click on the following link:<BR> <a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://db6b2f31872d3befc50f7f254ea44cbd'>Sale Approval(SAR Note)</a><br><br>"
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
		

						
						/*mailDetailsHash.put("CREATEDBYEMAILID", emailId);
						mailDetailsHash.put("MAILTO", mailTo);
						mailDetailsHash.put("MAILCCTO", mailCCTo);
						mailDetailsHash.put("MAILSTATUS", "R");
						mailDetailsHash.put("SUBJECT", subject);
						mailDetailsHash.put("MESSAGE", htmlstr);
						mailDetailsHash.put("REQUESTID", requestNo);*/
						

						mailDetailsHash.put("fromAddr", mailFrom);
						mailDetailsHash.put("mailPath", host);
						mailDetailsHash.put("toAddr", mailTo);
						mailDetailsHash.put("ccAddr", mailCCTo);
						mailDetailsHash.put("subject",subject);
						mailDetailsHash.put("content", htmlstr);
						
						

						mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);

						//out.println("mailFlag-------"+mailFlag);
						//out.println("mailDetailsHash-------"+mailDetailsHash);
					}
					
				}
			}
			if(reviewCount == 0)
			{
				Hashtable approverHash = new Hashtable();
				ArrayList approverList = new ArrayList();

				approverHash.put("REQUESTID", workItemOID);
				approverHash.put("STATUS", "L");
				approverList  = docChangeLogController.searchApproverMail( "sees","sdfsdf",approverHash);

				if(approverList.size()>0)
				{
					for(int kk = 0; kk < approverList.size(); kk++)
					{
						String strArr[] = (String[])approverList.get(kk);
						Hashtable mailDetailsHash = new Hashtable();

						String workItemOId = strArr[1];
						String mailTo = strArr[3];

						boolean mailFlag =false;

						ArrayList  lstArray= new ArrayList();

						lstArray  = docChangeLogController.getEmailid(mailTo);
						String strArr1[] = (String[])lstArray.get(0);

						//String  str = "<p>Dear All ,</p><p>Request number " +workItemOId+ " has been Approved by  " +emailId+ ".</p><p> This is for your kind information. Kindly Approve it.</p><p>Regards,</p><p> Timescape Admin</p>";
						
						String str = "Dear "+strArr1[0]+", <br>" //manager[2] + "<br>"
						   + "<br> The following Sale Approval (SAR Note) request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
						   + "SAR Note ID    : "+workItemOId+"<br>"
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
						mailDetailsHash.put("REQUESTID", workItemOId);*/

						mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);

					//	out.println("mailFlag----"+mailFlag);
					}
				}
			}

		}else
		{
			message = "<h5>Some error occured while processing request ."
					+"<br> Click <a href=\"javascript:history.back()\">here</a> to view the Request.</h5>";
		}

	%>
<body>
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
</div></body>
</html>
