<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility, java.text.ParseException, java.text.SimpleDateFormat" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page errorPage="../includes/error.jsp" %>  
<jsp:useBean id="capexkeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexDeatilsController" class="com.bccl.workflows.web.controller.DocumentDetailsController"/>
<%

	String requestId =  (String)request.getParameter("requestId");
	String keyword =  (String)request.getParameter("keyword");
	String commentText =  (String)request.getParameter("commentText");
	String actionPro =  (String)request.getParameter("actionPro");
	String projectTitle =  (String)request.getParameter("projectTitle");
	String proposalNo =  (String)request.getParameter("proposalNo");
	String capexAmount =  (String)request.getParameter("capexAmount");
	String opexAmount =  (String)request.getParameter("opexAmount");
	String projectCategory =  (String)request.getParameter("projectCategory");
	String createdBy =  (String)request.getParameter("createdBy");
	String createdOn =  (String)request.getParameter("createdOn");
	String projectCoordinator =  (String)request.getParameter("projectCoordinator");
	


	Hashtable htHeader = new Hashtable(); 
	Hashtable ht = new Hashtable(); 
	Hashtable htDetails = new Hashtable(); 

	ht.put("APPLICATIONNAME", "capex");
	ht.put("DOCUMNETOID", "DOC1005");		
	ht.put("REMARKS",commentText);
	ht.put("REQUESTOID",requestId);
	ht.put("APPROVALEMAILID",emailId);  
	ht.put("WORKITEMRECIPIENT",emailId);   		
	ht.put("KEYWORD",keyword);
	ht.put("ACTIONTXT","-"); 

	htHeader.put("APPLICATION_NAME", "capex");		
	htHeader.put("CREATEDBY", emailId); 	
	htHeader.put("REQUESTOID", requestId); 	

	htDetails.put("APPLICATION_NAME", "capex");	
	htDetails.put("CREATEDBY", emailId); 	
	htDetails.put("REQUESTOID", requestId); 

if("Accept".equals(actionPro)){
	htHeader.put("ACTIONSTATE", "Approved");
	htHeader.put("STATUS", "A"); 		
	htDetails.put("STATUS", "A"); 
	ht.put("SEARCHSTATUS","L"); 
	ht.put("STATUS","A");
}		
if("Reject".equals(actionPro)){
	htHeader.put("ACTIONSTATE", "Rejected");
	htHeader.put("STATUS", "RJ"); 		
	htDetails.put("STATUS", "RJ"); 
	ht.put("SEARCHSTATUS","L");
	ht.put("STATUS","RJ");
}
if("Review".equals(actionPro)){
	htHeader.put("ACTIONSTATE", "Reviewed");
	htHeader.put("STATUS", "RR"); 		
	htDetails.put("STATUS", "RR"); 
	ht.put("SEARCHSTATUS","L','RR','I','R");
	ht.put("STATUS","R");
}				
	boolean headerResult = capexHeaderController.updateAction(" "," ",htHeader);
	boolean detailsResult = capexDeatilsController.updateAction(" "," ",htDetails);
	boolean flag12 = docChangeLogController.updateApproval("sees","sdfsdf",ht);		

if("Accept".equals(actionPro) || "Reject".equals(actionPro)){
	
	htHeader.put("APPLICATION_NAME", "capex");		
	htHeader.put("CREATEDBY", emailId); 	
	htHeader.put("REQUESTOID", proposalNo); 
	if("Accept".equals(actionPro)){
		htHeader.put("ACTIONSTATE", "Approved");
		htHeader.put("STATUS", "A"); 
	}else{
		htHeader.put("ACTIONSTATE", "Rejected");
		htHeader.put("STATUS", "RJ"); 
	}
		boolean headerResult1 = capexHeaderController.updateAction(" "," ",htHeader);
	
}
//	int myCounter = 5;
	if("Review".equals(actionPro)){
		ht.put("APPLICATION_NAME", "capex");		
		ht.put("DOCUMENTOID", "DOC1005"); 	
		ht.put("WORKITEMOID", proposalNo); 
		ht.put("HEADERSTATUS","L','I");
		ht.put("ACTIONTEXT","reviewedBy");
		int myCounter = docChangeLogController.countReviewer(ht);	
//		out.println("Counter"+createdBy);
		
		if(myCounter == 0){
			
			
				String str1 = "Dear Co-Ordinator, <br><br>"
						   + "<br> The following capex request reviewed by all reviwers. Please start the approval process on Timescape.<BR><BR>"
						   + "Created By	   : "+createdBy+" <br><BR>"
						   + "Request Details are as follows: <br><br>"
						   + "<table  width=\"89%\" border = \"1\" cellspacing = \"2\" cellpadding = \"2\" align = \"left\">"
						   + "<thead>"
						   + "<tr height=35 px><td class = \"normal\" width = \"40%\">Project Title</td><td class = \"normal\" width = \"15%\">Capex (Rs. in Lakhs)</td> "
						   + "<td class = \"normal\" width = \"15%\">Opex(Rs. in Lakhs)</td><td class = \"normal\" width = \"20%\">Project Category</td>"
						   + "<td class = \"normal\" width = \"15%\">Submitted On</td></tr>"
						   + "</thead>"
						   + "<tr height=35 px><td class = \"normal\">"+projectTitle+"</td><td class = \"normal\" align = \"right\">"+capexAmount+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+opexAmount+"</td><td class = \"normal\" align = \"right\">"+projectCategory+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+createdOn+"</td></tr>"
						   + "</table> <br><br><br>"
						   +"<br><br><br>"
						   +"<br><br><br>"						   
						   + "Alternatively you can also click on the following link:<BR>"
						   + "<a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://28bb1753eb46f2802cce847d1c162e5e'><BR>Capex Approval</a><BR> <br><br>"
						   + "<p>Regards,</p><p> Timescape Admin</p>"
						   +"<p><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capex_emaifooterr.jpg\" border = \"0\"></p>";
				String subject1= "Capex note review process is completed";

				String htmlstr1 = "<html>" + "\n" 
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
							+ "								<div align = \"left\">"+str1+"</div>" 
							+ "							</td>" 
							+ "			</tr><br>" 
							+ "				</td>" 
							+ "			</tr>" 
							+ "		</table>"
							+ "</form></body>" 
							+ "</html>";
						
						
				String mailFrom1 = "timescape.admin@timesgroup.com";
				String host1 = "apprelay.timesgroup.com";
				String mailTo1 = createdBy;
				
				Hashtable mailDetailsHash1 = new Hashtable();
				mailDetailsHash1.put("fromAddr", mailFrom1);
				mailDetailsHash1.put("mailPath", host1);
				mailDetailsHash1.put("toAddr", mailTo1);
			//	mailDetailsHash1.put("toAddr", "michelle.wadhwani@timesgroup.com");		
			//	mailDetailsHash1.put("toAddr", "rishiraj.shukla@timesgroup.com");		
				mailDetailsHash1.put("subject",subject1);
				mailDetailsHash1.put("content", htmlstr1);			
				
			boolean mailFlag1  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash1);		
			
		}
	}
	
//out.println(headerResult +  " : "+ detailsResult+ " : "+ flag12);


	if(flag12 == true && "Accept".equals(actionPro)){
				ht.clear();
				ht.put("DOCUMENTOID", "DOC1005");
				ht.put("APPLICATION_NAME", "capex");
				ht.put("WORKITEMOID", requestId);
				ht.put("EMAILID", emailId);
				ht.put("ACTIONTEXT", "approvedBy");
				
				ArrayList emailList = docChangeLogController.findEmailId(ht);
				
				if(emailList.size()>0){
					for(int zz=0;zz<emailList.size();zz++){
						String emailArr[] = (String[])emailList.get(zz);					
						
				ArrayList  lstArray= new ArrayList();		
			
				lstArray  = docChangeLogController.getEmailid(emailArr[3]);
				String strArr[] = (String[])lstArray.get(0);
				
				String str = "Dear "+strArr[0]+", <br><br>"
						   + "<br> The following capex request is pending for your approval. Please accept or reject this request on Timescape.<BR><BR>"
						   + "Created By	   : "+createdBy+" <br><BR>"
						   + "Request Details are as follows: <br><br>"
						   + "<table  width=\"89%\" border = \"1\" cellspacing = \"2\" cellpadding = \"2\" align = \"left\">"
						   + "<thead>"
						   + "<tr height=35 px><td class = \"normal\" width = \"40%\">Project Title</td><td class = \"normal\" width = \"15%\">Capex (Rs. in Lakhs)</td> "
						   + "<td class = \"normal\" width = \"15%\">Opex(Rs. in Lakhs)</td><td class = \"normal\" width = \"20%\">Project Category</td>"
						   + "<td class = \"normal\" width = \"15%\">Submitted On</td></tr>"
						   + "</thead>"
						   + "<tr height=35 px><td class = \"normal\">"+projectTitle+"</td><td class = \"normal\" align = \"right\">"+capexAmount+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+opexAmount+"</td><td class = \"normal\" align = \"right\">"+projectCategory+"</td>"
						   + "<td class = \"normal\" align = \"right\">"+createdOn+"</td></tr>"
						   + "</table> <br><br><br>"
						   +"<br><br><br>"
						   +"<br><br><br>"						   
						   + "Alternatively you can also click on the following link:<BR>"
						   + "<a href='http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://28bb1753eb46f2802cce847d1c162e5e'><BR>Capex Approval</a><BR> <br><br>"
						   + "<p>Regards,</p><p> Timescape Admin</p>"
						   +"<p><img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/capex/images/capex_emaifooterr.jpg\" border = \"0\"></p>";
				String subject= "Capex note pending for approval";

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
				String mailTo = emailArr[3];
				
				Hashtable mailDetailsHash = new Hashtable();
				mailDetailsHash.put("fromAddr", mailFrom);
				mailDetailsHash.put("mailPath", host);
				mailDetailsHash.put("toAddr", mailTo);
			//	mailDetailsHash.put("toAddr", "michelle.wadhwani@timesgroup.com");		
				mailDetailsHash.put("subject",subject);
				mailDetailsHash.put("content", htmlstr);			
				
				boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
				//out.println("mailFlag : "+mailFlag);
					
					}					
				}
				
			}
%>
  


