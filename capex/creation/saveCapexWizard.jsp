<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility, java.text.SimpleDateFormat,java.text.ParseException,java.text.Format,java.util.Date"%>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="capexChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
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
        <title> Create Proposal Form</title>	
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
		SimpleDateFormat sm2 = new SimpleDateFormat("dd-MMM-yyyy");
        Hashtable ht = new Hashtable();       

        String projectTitle =  Utility.replaceQuoteOracle(request.getParameter("projectTitle"));
        String proposalNo =  Utility.replaceQuoteOracle(request.getParameter("proposalNo"));
        String projectCategory  =  Utility.replaceQuoteOracle(request.getParameter("projectCategory"));
        String capexAmount =  Utility.replaceQuoteOracle(request.getParameter("capexAmount"));

        String opexAmount =  Utility.replaceQuoteOracle(request.getParameter("opexAmount"));
        String proLocation  =  Utility.replaceQuoteOracle(request.getParameter("proLocation"));
        String proFunction  =  Utility.replaceQuoteOracle(request.getParameter("proFunction"));
        String projectManager =  Utility.replaceQuoteOracle(request.getParameter("projectManager"));

        String projectDuration =  Utility.replaceQuoteOracle(request.getParameter("projectDuration"));
        String budgetAmount =  Utility.replaceQuoteOracle(request.getParameter("budgetAmount"));
        String keywords =  Utility.replaceQuoteOracle(request.getParameter("keywords"));
		String reasonIfUnbudgeted =  Utility.replaceQuoteOracle(request.getParameter("reasonIfUnbudgeted"));

        String capex1 =  Utility.replaceQuoteOracle(request.getParameter("capex1"));
        String capex2 =  Utility.replaceQuoteOracle(request.getParameter("capex2"));
        String capex3 =  Utility.replaceQuoteOracle(request.getParameter("capex3"));
        String capex4 =  Utility.replaceQuoteOracle(request.getParameter("capex4"));
        String capex5 =  Utility.replaceQuoteOracle(request.getParameter("capex5"));

        String opex1 =  Utility.replaceQuoteOracle(request.getParameter("opex1"));
        String opex2 =  Utility.replaceQuoteOracle(request.getParameter("opex2"));
        String opex3 =  Utility.replaceQuoteOracle(request.getParameter("opex3"));
        String opex4 =  Utility.replaceQuoteOracle(request.getParameter("opex4"));
        String opex5 =  Utility.replaceQuoteOracle(request.getParameter("opex5"));

        String background =  Utility.replaceQuoteOracle(request.getParameter("background"));
        String rationale =  Utility.replaceQuoteOracle(request.getParameter("rationale"));
        String projectScope =  Utility.replaceQuoteOracle(request.getParameter("projectScope"));
        String alternativesConsidered =  Utility.replaceQuoteOracle(request.getParameter("alternativesConsidered"));

        String risks =  Utility.replaceQuoteOracle(request.getParameter("risks"));
         int counter =   Integer.parseInt(request.getParameter("counter"));
         String headerList ="";
         String particularsList ="";
         String quantityList ="";
         String estimatedCostList ="";
         String totalCostList ="";

        for( int ii =0 ;ii <counter ; ii++){
            String header =  Utility.replaceQuoteOracle(request.getParameter("header"+ii));
            String particulars =  Utility.replaceQuoteOracle(request.getParameter("particulars"+ii));
            String quantity =  request.getParameter("quantity"+ii);
            String estimatedCost =  request.getParameter("estimatedCost"+ii);
            String totalCost =  request.getParameter("totalCost"+ii);

            headerList   = headerList +   header + "~";     
            particularsList   = particularsList +   particulars + "~";     
            quantityList   = quantityList +   quantity + "~";     
            estimatedCostList   = estimatedCostList +   estimatedCost + "~";     
            totalCostList   = totalCostList +   totalCost + "~";     
        }

        headerList = headerList.substring(0,headerList.length()-1 );
        particularsList = particularsList.substring(0,particularsList.length()-1 );
        quantityList = quantityList.substring(0,quantityList.length()-1 );
        estimatedCostList = estimatedCostList.substring(0,estimatedCostList.length()-1 );
        totalCostList = totalCostList.substring(0,totalCostList.length()-1 );

        String totalCapexAmt =  Utility.replaceQuoteOracle(request.getParameter("totalCapexAmt"));
        String savingsEnvisaged = Utility.replaceQuoteOracle(request.getParameter("savingsEnvisaged"));
        String paybackPeriod =  Utility.replaceQuoteOracle(request.getParameter("paybackPeriod"));
        int revCounter =  Integer.parseInt( request.getParameter("revCounter"));
        int appCounter =   Integer.parseInt(request.getParameter("appCounter"));
        String reviewedByList ="";
        String approvedByList ="";

       for (int yy = 0 ;yy < revCounter ; yy++){
         String reviewedBy =  Utility.replaceQuoteOracle(request.getParameter("reviewedBy"+yy));
         reviewedByList   = reviewedByList +   reviewedBy + ";";     
       }
        reviewedByList = reviewedByList.substring(0,reviewedByList.length()-1 );

        for (int zz = 0 ;zz < appCounter ; zz++){
         String approvedBy =  Utility.replaceQuoteOracle(request.getParameter("approvedBy"+zz));
         approvedByList = approvedByList +   approvedBy + ";";  
       }        
        approvedByList = approvedByList.substring(0,approvedByList.length()-1 );

        String additionalyAttachmentSize = (String)request.getParameter("hiddDirectorySizeadditional");
        int addtional_Size = Integer.parseInt(additionalyAttachmentSize);
        String addtionalAttachName = "";
		for(int ii=0; ii < addtional_Size; ii++){
		String addtionalAttachName1	= (String)request.getParameter("hiddFilesName1additional"+ii);
		addtionalAttachName	= addtionalAttachName1+";"+addtionalAttachName;
		}
        addtionalAttachName = addtionalAttachName.substring(0,addtionalAttachName.length()-1 );
    
	
		String valueDetailsSection [] =  {"capex" , "I" ,emailId, "OPEN"  ,projectTitle, proposalNo, projectCategory,capexAmount, opexAmount, proLocation,proFunction, projectManager, projectDuration, budgetAmount,  keywords, reasonIfUnbudgeted, capex1,capex2,capex3,capex4,capex5,opex1, opex2,opex3,opex4,opex5,background,rationale, projectScope, alternativesConsidered, risks,headerList,particularsList, quantityList,estimatedCostList,totalCostList, totalCapexAmt, savingsEnvisaged, paybackPeriod, reviewedByList, approvedByList , addtionalAttachName,"additional"};
		
		String DetailsSection [] = {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };
		
        String valueSection [] = { "capex" , "I" ,emailId, "OPEN"  ,projectTitle, proposalNo, projectCategory,capexAmount, opexAmount, projectManager, background, reviewedByList, approvedByList , addtionalAttachName,"additional"};
 
       	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Project Manager","Background","Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };
		
        ht.put("Application_Name", "capex");
        ht.put("HEADERSECTION1", headerSection);
        ht.put("HEADERSECTIONVAL1", valueSection);
        ht.put("DETAILSECTION2", DetailsSection);
        ht.put("DETAILSECTIONVAL2", valueDetailsSection);	
        String result  =  capexHeaderController.create( "sees","sdfsdf",ht);
		Hashtable approvalDetailsHash = new Hashtable();
    //    out.println(" result " + result);
        String message ="";				
	
	if (result == null){
         message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to create the Request.</h5>";	
    }else{
		
		String  createRequest = "";
		boolean  approvalFlag =false;

		if("".equals(reviewedByList) || reviewedByList==null){
			reviewedByList = "0";
		}
		if("".equals(approvedByList) || approvedByList==null){
			approvedByList ="0";
		}	
		
		reviewedByList = reviewedByList.replaceAll(";",",");
		approvedByList = approvedByList.replaceAll(";",",");	
	
		String approvalheaderSection []  = {"reviewedBy" ,"approvedBy"};
		String approvalheaderSectionVal [] = {reviewedByList ,approvedByList };

		approvalDetailsHash.put("REQUESTOID", result);
		approvalDetailsHash.put("DOCUMNETOID", "DOC1005");
		approvalDetailsHash.put("APPLICATIONNAME", "capex");
		approvalDetailsHash.put("CREATEDBY", emailId);

		if(!"".equals(reviewedByList) && !"".equals(approvedByList) ){
			approvalDetailsHash.put("APPROVALHEADERSECTION", approvalheaderSection);
			approvalDetailsHash.put("APPROVALHEADERSECTIONVAL", approvalheaderSectionVal);
			approvalFlag  = capexChangeLogController.insertApproval("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427", approvalDetailsHash);
		}			
		
		if (approvalFlag == true){
				message = "<h5>Request number <b>"+result+" </b>has been created successfully."
					+"<br> Click <a href=\"../view/viewMyCapexRequest.jsp\">here</a> to view the Request.</h5>";
					
			ArrayList  lstArray= new ArrayList();
			String emailStr[] = reviewedByList.split(",");
			Date currDate = new Date();
			String currentDate = sm2.format(currDate);
			for (int yy=0;yy<emailStr.length;yy++){
				lstArray  = capexChangeLogController.getEmailid(emailStr[yy]);
				String strArr[] = (String[])lstArray.get(0);
				
				String str = "Dear "+strArr[0]+", <br><br>"
						   + "<br> The following capex request is pending for your review. Please review this request on Timescape.<BR><BR>"
						   + "Created By	   : "+emailId+" <br><BR>"
						   + "Request Details are as follows: <br><br>"
						   + "<table  width=\"89%\" border = \"1\" cellspacing = \"2\" cellpadding = \"2\" align = \"left\">"
						   + "<thead>"
						   + "<tr height=35 px><td class = \"normal\" width = \"40%\">Project Title</td><td class = \"normal\" width = \"15%\">Capex (Rs. in Lakhs)</td> "
						   + "<td class = \"normal\" width = \"15%\">Opex(Rs. in Lakhs)</td><td class = \"normal\" width = \"20%\">Project Category</td>"
						   + "<td class = \"normal\" width = \"15%\">Submitted On</td></tr>"
						   + "</thead>"
						   + "<tr height=35 px><td class = \"normal\">"+projectTitle+"</td><td class = \"normal\" align = \"right\">"+capexAmount+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+opexAmount+"</td><td class = \"normal\" align = \"right\">"+projectCategory+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+currentDate+"</td></tr>"
						   + "</table> <br><br><br>"
						   +"<br><br><br>"
						   +"<br><br><br>"						   
						   + "Alternatively you can also click on the following link:<BR>"
						   + "<a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://28bb1753eb46f2802cce847d1c162e5e'><BR>Capex Approval</a><BR> <br><br>"
						   + "<p>Regards,</p><p> Timescape Admin</p>"
						   +"<p><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capex_emaifooterr.jpg\" border = \"0\"></p>";

				String subject= "Capex note pending for review";

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
			String mailTo = emailStr[yy];
			
			Hashtable mailDetailsHash = new Hashtable();
			mailDetailsHash.put("fromAddr", mailFrom);
			mailDetailsHash.put("mailPath", host);
			mailDetailsHash.put("toAddr", mailTo);
		//	mailDetailsHash.put("toAddr", "rishiraj.shukla@timesgroup.com");
			mailDetailsHash.put("subject",subject);
			mailDetailsHash.put("content", htmlstr);
			

			boolean mailFlag  = capexChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
		//	out.println("mailFlag : "+mailFlag);
			}
			//out.println("hi--"+mailFlag);			
				
					
		}else {			
			 message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to create the Request.</h5>";	
		}
         
	}
    
%>

<body>

<div class="container ">
	<div class="row " >
	<div class="col-xs-2"></div>
		<div class="col-xs-8 bs-example  " >
			<div class="portlet box blue">
				<div class="portlet-title">
					<div class="caption">
					<i class="fa fa-th"></i>  <strong>Submit Proposal Form</strong>
					</div>			
					</div>
					<div class="portlet-body">
						<form class="form-horizontal" role="form" id="demo_form" name ="create" method="post">
						<div class="form-body">
							<div class="row " style="margin-top:0px;margin-bottom:0;">
							
                                <table width="100%"  border="0" cellspacing="0" cellpadding="0" bgcolor="#F4F2F2" > 
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
