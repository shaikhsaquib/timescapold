<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,com.bccl.util.Utility" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.workflows.commonUtility.AppSignature"%>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="capexDetailsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
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
        Hashtable ht = new Hashtable();       

        String projectTitle =  Utility.replaceQuoteOracle(request.getParameter("projectTitle"));
		projectTitle = projectTitle.replaceAll("&", "and");
        String requestId =  request.getParameter("requestId");
		out.println("  requestId "+ requestId);
        String proposalNo =  request.getParameter("proposalNo");
        String projectCategory  =  Utility.replaceQuoteOracle(request.getParameter("projectCategory"));
        String capexAmount =  request.getParameter("capexAmount");

        String opexAmount =  request.getParameter("opexAmount");
        String proLocation  =  request.getParameter("proLocation");
        String proFunction  =  request.getParameter("proFunction");
        String projectManager =  request.getParameter("projectManager");

        String projectDuration =  Utility.replaceQuoteOracle(request.getParameter("projectDuration"));
        String budgetAmount =  request.getParameter("budgetAmount");
        String keywords =  Utility.replaceQuoteOracle(request.getParameter("keywords"));
		keywords = keywords.replaceAll("&", "and");
		String reasonIfUnbudgeted =  Utility.replaceQuoteOracle(request.getParameter("reasonIfUnbudgeted"));
		reasonIfUnbudgeted = reasonIfUnbudgeted.replaceAll("&", "and");
        String capex1 =  request.getParameter("capex1");
        String capex2 =  request.getParameter("capex2");
        String capex3 =  request.getParameter("capex3");
        String capex4 =  request.getParameter("capex4");
        String capex5 =  request.getParameter("capex5");

        String opex1 =  request.getParameter("opex1");
        String opex2 =  request.getParameter("opex2");
        String opex3 =  request.getParameter("opex3");
        String opex4 =  request.getParameter("opex4");
        String opex5 =  request.getParameter("opex5");

        String background =  Utility.replaceQuoteOracle(request.getParameter("background"));
		background = background.replaceAll("&", "and");
        String rationale =  Utility.replaceQuoteOracle(request.getParameter("rationale"));
		rationale = rationale.replaceAll("&", "and");
        String projectScope =  Utility.replaceQuoteOracle(request.getParameter("projectScope"));
		projectScope = projectScope.replaceAll("&", "and");
        String alternativesConsidered =  Utility.replaceQuoteOracle(request.getParameter("alternativesConsidered"));
		alternativesConsidered = alternativesConsidered.replaceAll("&", "and");
        String risks =  Utility.replaceQuoteOracle(request.getParameter("risks"));
		risks = risks.replaceAll("&", "and");
         int counter =   Integer.parseInt(request.getParameter("counter"));
         String headerList ="";
         String particularsList ="";
         String quantityList ="";
         String estimatedCostList ="";
         String totalCostList ="";

        for( int ii =0 ;ii <counter ; ii++){
            String header =  Utility.replaceQuoteOracle(request.getParameter("header"+ii));
			header = header.replaceAll("&", "and");
            String particulars =  Utility.replaceQuoteOracle(request.getParameter("particulars"+ii));
			particulars = particulars.replaceAll("&", "and");
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

        String totalCapexAmt =  request.getParameter("totalCapexAmt");
        String savingsEnvisaged = request.getParameter("savingsEnvisaged");
        String paybackPeriod =  Utility.replaceQuoteOracle(request.getParameter("paybackPeriod"));
		paybackPeriod = paybackPeriod.replaceAll("&", "and");
        int revCounter =  Integer.parseInt( request.getParameter("revCounter"));
        int appCounter =   Integer.parseInt(request.getParameter("appCounter"));
        String reviewedByList ="";
        String approvedByList ="";

       for (int yy = 0 ;yy < revCounter ; yy++){
         String reviewedBy =  request.getParameter("reviewedBy"+yy);
         reviewedByList   = reviewedByList +   reviewedBy + ";";     
       }
        reviewedByList = reviewedByList.substring(0,reviewedByList.length()-1 );

        for (int zz = 0 ;zz < appCounter ; zz++){
         String approvedBy =  request.getParameter("approvedBy"+zz);
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
    
/*	
        String valueSection[] = { "Capex" , "I" ,emailId, "OPEN"  ,projectTitle, proposalNo, projectCategory,capexAmount, opexAmount, proLocation,proFunction, projectManager, projectDuration, budgetAmount,  keywords, reasonIfUnbudgeted, capex1,capex2,capex3,capex4,capex5,opex1, opex2,opex3,opex4,opex5,background,rationale, projectScope, alternativesConsidered, risks,headerList,particularsList, quantityList,estimatedCostList,totalCostList, totalCapexAmt, savingsEnvisaged, paybackPeriod, reviewedByList, approvedByList , addtionalAttachName,"additional"};

       	String headerSection [ ]	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List", "compAttachment","attachmentFolderName"};
		
        ht.put("Application_Name", "capex");		
        ht.put("REQUESTOID",requestId);
        ht.put("HEADERSECTION1", headerSection);
        ht.put("HEADERSECTIONVAL1", valueSection);	
     //   String result  =  capexHeaderController.create( "sees","sdfsdf",ht);
	  Boolean result  = capexHeaderController.update( "sees","sdfsdf",ht);

    //    out.println(" result " + result);
        String message ="";
	
	
*/	
		String valueDetailsSection [] =  {"capex" , "I" ,emailId, "OPEN"  ,projectTitle, proposalNo, projectCategory,capexAmount, opexAmount, proLocation,proFunction, projectManager, projectDuration, budgetAmount,  keywords, reasonIfUnbudgeted, capex1,capex2,capex3,capex4,capex5,opex1, opex2,opex3,opex4,opex5,background,rationale, projectScope, alternativesConsidered, risks,headerList,particularsList, quantityList,estimatedCostList,totalCostList, totalCapexAmt, savingsEnvisaged, paybackPeriod, reviewedByList, approvedByList , addtionalAttachName,"additional"};
		
		String DetailsSection [] = {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Location","Function", "Project Manager", "Project Duration", "Budget Amount", "Keywords", "Reason If Unbudgeted" ,"Capex1" ,"Capex2" ,"Capex3" ,"Capex4" ,"Capex5","Opex1", "Opex2","Opex3","Opex4","Opex5","Background","Rationale", "Project Scope", "Alternatives Considered", "Risks","Header List","Particulars List", "QuantityList","Estimated Cost List","Total Cost List", "Total Capex Amt", "Savings Envisaged", "Payback Period", "Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };
		
        String valueSection [] = { "capex" , "I" ,emailId, "OPEN"  ,projectTitle, proposalNo, projectCategory,capexAmount, opexAmount, projectManager, background, reviewedByList, approvedByList , addtionalAttachName,"additional"};
 
       	String headerSection []	= {"Application Name","Status Type", "createdby", "Document State","Project Title" ,"Proposal No",  "Project Category","Capex Amount", "Opex Amount", "Project Manager","Background","Reviewed By List", "Approved By List","compAttachment","attachmentFolderName" };
		
        ht.put("Application_Name", "capex");		
        ht.put("REQUESTOID",requestId);
        ht.put("HEADERSECTION1", headerSection);
        ht.put("HEADERSECTIONVAL1", valueSection);		
        ht.put("APPROVALEMAILID", emailId);
		boolean result  =  capexHeaderController.update( "sees","sdfsdf",ht);
        ht.put("DETAILSECTION1", DetailsSection);
        ht.put("DETAILSECTIONVAL1", valueDetailsSection);	
        ht.put("STATUS", "I");	
           
        boolean result2  =  capexDetailsController.update( "sees","sdfsdf",ht);
		
		Hashtable approvalDetailsHash = new Hashtable();
        out.println(" result " + result + " result2 " + result2 );
        String message ="";	
	
	
	
	
if (result == false || result2 == false){
         message = "<h5>Some error occured while processing your request."
					+"<br> Click <a href=\"javascript:history.back();\">here</a> to update the Request.</h5>";	

    }else{
         message = "<h5>Your proposal has been updated successfully."
					+"<br> Click <a href=\"../view/viewMyCapexRequest.jsp\">here</a> to view the Request.</h5>";
	}
   
    
%>

<body>
<%@ include file="../includes/relatedLinksnew.jsp" %>
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
