<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility,java.text.SimpleDateFormat,java.text.ParseException,java.text.Format,java.util.Date" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<%@ page errorPage="../includes/error.jsp" %>  
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
        <title> Edit Proposal Form</title>	
        <link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
        <link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>

    <link href="../css/capex.css" rel="stylesheet"/>
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
     <script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../jscript/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../jscript/select2.min.js"></script>	
	<script src="../jscript/bootstrap-maxlength.min.js"></script>
	<script src="../jscript/capex.js"></script>	
    </head>
<%
        Hashtable ht = new Hashtable();       
		SimpleDateFormat sm2 = new SimpleDateFormat("dd-MMM-yyyy");
        String projectTitle =  Utility.replaceQuoteOracle(request.getParameter("projectTitle"));
		projectTitle = projectTitle.replaceAll("&", "and");
		projectTitle = projectTitle.replaceAll("'", "''");
        String state =  request.getParameter("state");		
        String proposalNo =  Utility.replaceQuoteOracle(request.getParameter("proposalNo"));
        String proposalDate =  Utility.replaceQuoteOracle(request.getParameter("proposalDate"));
        String proposalAmount =  Utility.replaceQuoteOracle(request.getParameter("proposedAmount"));
        String opexAmount =  Utility.replaceQuoteOracle(request.getParameter("opexAmount"));
        String proLocation  =  Utility.replaceQuoteOracle(request.getParameter("proLocation"));
        String proFunction  =  Utility.replaceQuoteOracle(request.getParameter("proFunction"));
        String projectManager =  Utility.replaceQuoteOracle(request.getParameter("projectManager"));
        String projectCategory  =  Utility.replaceQuoteOracle(request.getParameter("projectCategory"));
        String financialYear =  Utility.replaceQuoteOracle(request.getParameter("financialYear"));
        String budgetAmount =  Utility.replaceQuoteOracle(request.getParameter("budgetAmount"));
        String projectStartDate =  Utility.replaceQuoteOracle(request.getParameter("projectStartDate"));
        String projectEndDate =  Utility.replaceQuoteOracle(request.getParameter("projectEndDate"));
		String reasonIfUnbudgeted =  Utility.replaceQuoteOracle(request.getParameter("reasonIfUnbudgeted"));
		reasonIfUnbudgeted = reasonIfUnbudgeted.replaceAll("'", "''");
		reasonIfUnbudgeted = reasonIfUnbudgeted.replaceAll("&", "and");
        String projectClosedOutReport =  Utility.replaceQuoteOracle(request.getParameter("projectCloseOutReport"));
        String rationale =  Utility.replaceQuoteOracle(request.getParameter("rationale"));
		rationale = rationale.replaceAll("'", "''");
		rationale = rationale.replaceAll("&", "and");
        String projectDescription =  Utility.replaceQuoteOracle(request.getParameter("projectDescription"));
		projectDescription = projectDescription.replaceAll("'", "''");
		projectDescription = projectDescription.replaceAll("&", "and");
        String assetDisposal =  Utility.replaceQuoteOracle(request.getParameter("assetDisposal"));
        String savingsEnvisaged = Utility.replaceQuoteOracle(request.getParameter("savingsEnvisaged"));
        String paybackPeriod =  Utility.replaceQuoteOracle(request.getParameter("paybackPeriod"));
		paybackPeriod = paybackPeriod.replaceAll("'", "''");
		paybackPeriod = paybackPeriod.replaceAll("&", "and");
        String projectSponsor =  Utility.replaceQuoteOracle(request.getParameter("projectSponsor"));
        String projectCoordinator =  Utility.replaceQuoteOracle(request.getParameter("projectCoordinator"));
        String totalCapexAmt =  request.getParameter("totalCapexAmt");
        String totalOpexAmt =  request.getParameter("totalOpexAmt");
        int counter = Integer.parseInt(request.getParameter("counter"));
        int opexCounter = Integer.parseInt(request.getParameter("opexCounter"));
        String additionalyAttachmentSize = (String)request.getParameter("hiddDirectorySizeadditional");
    //    out.println( " additionalyAttachmentSize " + additionalyAttachmentSize ); 
        int addtional_Size = Integer.parseInt(additionalyAttachmentSize);
        String addtionalAttachName = "";
		String addtionalAttachName1	= "";
		if(addtional_Size > 0){
			for(int ii=0; ii < addtional_Size; ii++){
			addtionalAttachName1	= Utility.replaceQuoteOracle((String)request.getParameter("hiddFilesName1additional"+ii));
			addtionalAttachName	= addtionalAttachName1+"-"+addtionalAttachName;
			}
			addtionalAttachName = addtionalAttachName.substring(0,addtionalAttachName.length()-1 );
		}
       //   out.println( " addtionalAttachName " + addtionalAttachName ); 
        String particulars = "";
        String estimatedCost = "";
		String particulars1 = "";
		String estimatedCost1= "";
		if(counter > 0){
			for ( int zz =0 ; zz < counter; zz++){
				particulars1 =  Utility.replaceQuoteOracle(request.getParameter("particulars"+zz));
				particulars1 = particulars1.replaceAll("&", "and");
				estimatedCost1=  Utility.replaceQuoteOracle(request.getParameter("estimatedCost"+zz));
				particulars = particulars +particulars1 +"~";
				estimatedCost = estimatedCost +estimatedCost1 +"~";
			}
			particulars = particulars.substring(0,particulars.length()-1 );
		//	particulars = particulars.replaceAll(",", ";");
			particulars = particulars.replaceAll("'", "''");
			estimatedCost = estimatedCost.substring(0,estimatedCost.length()-1 );
		}
		String opexParticulars = "";
        String opexEstimatedCost = "";
		String particulars11 = "";
		String estimatedCost11= "";
		if(opexCounter > 0){
			for ( int zz1 =0 ; zz1 < opexCounter; zz1++){
				particulars11 =  Utility.replaceQuoteOracle(request.getParameter("opexParticulars"+zz1));
				particulars11 = particulars11.replaceAll("&", "and");
				estimatedCost11=  Utility.replaceQuoteOracle(request.getParameter("opexEstimatedCost"+zz1));
				opexParticulars = opexParticulars +particulars11 +"~";
				opexEstimatedCost = opexEstimatedCost +estimatedCost11 +"~";
			}
			opexParticulars = opexParticulars.substring(0,opexParticulars.length()-1 );
		//	opexParticulars = opexParticulars.replaceAll(",", ";");
			opexParticulars = opexParticulars.replaceAll("'", "''");
			opexEstimatedCost = opexEstimatedCost.substring(0,opexEstimatedCost.length()-1 );
		}
		
		String status = "";
		if("D".equals(state)){			
			 	status ="D";			
		}else {
				status ="L";	
		}
        String valueSection[] = { "Capex" , status ,emailId, "OPEN"  ,projectTitle, proposalDate, proposalAmount, opexAmount, proLocation,proFunction, projectManager, projectCategory, financialYear, budgetAmount,  projectStartDate, projectEndDate, reasonIfUnbudgeted, projectClosedOutReport, rationale, projectDescription, particulars, estimatedCost,opexParticulars,opexEstimatedCost,totalOpexAmt, assetDisposal, savingsEnvisaged, paybackPeriod, projectSponsor, projectCoordinator , totalCapexAmt, addtionalAttachName,"additional"};	
        
       	String headerSection [] = {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal Date", "Proposal Amount", "Opex Amount","Location","Function","Project Manager","Project Category" , "Financial Year" ,"Budget Amount","Project Start Date","Project End Date", "Reason If Unbudgeted" , "Project Closed Out Report", "Rationale" , "Project Description" ,"Particulars" , "Estimated Cost" ,"Opex Particulars" , "Opex Estimated Cost", "Total Opex", "Asset Disposal" , "Savings Envisaged","Payback Period" , "Project Sponsor" , "Project Coordinator" ,"Total","compAttachment","attachmentFolderName"};


		ht.put("Application_Name", "capex");		
        ht.put("REQUESTOID",proposalNo);        
        ht.put("HEADERSECTION1", headerSection);
        ht.put("HEADERSECTIONVAL1", valueSection);	
        Boolean result  = capexHeaderController.update( "sees","sdfsdf",ht);

    //    out.println(" result " + result);
        String message ="";
	
if (result == false){
         message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to update the Request.</h5>";	

    }else{
         message = "<h5>The proposal has been updated successfully."
					+"<br> Click <a href=\"../view/listOfMyProposalRequest.jsp\">here</a> to view the Proposals.</h5>";
	
			if("L".equals(state)){
			ArrayList  lstArray= new ArrayList();

			lstArray  = docChangeLogController.getEmailid(projectCoordinator);
			String strArr[] = (String[])lstArray.get(0);
			Date currDate = new Date();
			String currentDate = sm2.format(currDate);
			String str = "Hi, <br><br>"					  
		   + "A new request for Capex Approval has been created by "+emailId+" .<br><br>"
		   + "Request Details are as follows: <br><br>"
		   + "<table  width=\"89%\" border = \"1\" cellspacing = \"0\" cellpadding = \"4\" align = \"left\">"
		   + "<thead>"
		   + "<tr height=25 px><td class = \"normal\" width = \"40%\">Project Title</td><td class = \"normal\" width = \"15%\">Capex (Rs. in Lakhs)</td> "
		   + "<td class = \"normal\" width = \"15%\">Opex(Rs. in Lakhs)</td><td class = \"normal\" width = \"20%\">Project Category</td>"
		   + "<td class = \"normal\" width = \"15%\">Submitted On</td></tr>"
		   + "</thead>"
		   + "<tr height=25 px><td class = \"normal\">"+projectTitle+"</td><td class = \"normal\" align = \"right\">"+proposalAmount+"</td>"
		   + "<td class = \"normal\" align = \"right\">"+opexAmount+"</td><td class = \"normal\">"+projectCategory+"</td>"
		   + "<td class = \"normal\" align = \"right\">"+currentDate+"</td></tr>"
		   + "</table> <br><br><br>"	
		   + "<br><br><br>"	   
		   + "Project Manager     : "+projectManager+" <br><BR>"
		   + "Project Sponsor     : "+projectSponsor+" <br><BR>"
		   + "Capex Co-ordinator  : "+projectCoordinator+" <br><BR><BR>"
		   + "<p>Regards,</p><p> Timescape Admin</p>"
		   +"<p><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capex_emaifooterr.jpg\" border = \"0\"></p>";

			String subject= "New Capex Request "+projectTitle+ " has been created.";

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
						+ "	<form name = \" \" method = \"post\">" 
                        			+ "     <table width = \"100%\" border = \"0\" cellspacing = \"0\" cellpadding = \"0\" align = \"left\">" 
                        			+ "			<tr>" 
                        			+ "				<td colspan = \"3\" align = \"left\"><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capex_emailheader1.jpg\" border = \"0\"></td>" 
                        			+ "		    </tr>" 
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
						+ "			</tr><br>" 

						+ "				</td>" 
						+ "			</tr>" 
						+ "		</table>"
						+ "</form></body>" 
						+ "</html>";
			
			String mailFrom = "timescape.admin@timesgroup.com";
			String host = "apprelay.timesgroup.com";
			String mailTo = emailId+","+projectManager+","+projectSponsor+","+projectCoordinator;
			
			Hashtable mailDetailsHash = new Hashtable();
			mailDetailsHash.put("fromAddr", mailFrom);
			mailDetailsHash.put("mailPath", host);
			mailDetailsHash.put("toAddr", mailTo);					
			mailDetailsHash.put("subject",subject);
			mailDetailsHash.put("content", htmlstr);
			

			boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
			//out.println("mailFlag : "+mailFlag);
	
			}
	}
%>

<body>
<%@ include file="../includes/relatedLinksnew.jsp" %>
<div class="container ">
	<div class="row ">
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  ">
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
                    
					<i class="fa fa-th"></i>  <strong>Edit Proposal Form</strong>
					</div>			
					</div>
                 
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="create" method="post">
						
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
                        </form>
					</div>
                 
				</div>
			</div>
		</div>
	<div class="col-xs-2"></div>
	</div>
</div>
				

</body>
</html>
