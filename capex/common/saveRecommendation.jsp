<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="capexChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<%
	Hashtable detailsHash = new Hashtable();   
	String recommendedBy = (String)request.getParameter("recommBy");
	String requestId = (String)request.getParameter("requestId");
	String findStr = (String)request.getParameter("findStr");
	String projectTitle = (String)request.getParameter("title");
//	String keywords = (String)request.getParameter("keywords");
	String actionPro =  (String)request.getParameter("actionPro");

	String proposalNo =  (String)request.getParameter("proposalNo");	
	String capexAmount =  (String)request.getParameter("capexAmount");
	String opexAmount =  (String)request.getParameter("opexAmount");
	String projectCategory =  (String)request.getParameter("projectCategory");
	String createdBy =  (String)request.getParameter("createdBy");
	String createdOn =  (String)request.getParameter("createdOn");
	String projectCoordinator =  (String)request.getParameter("projectCoordinator");
	
	//out.println(recommendedBy + " = "+ requestId + " = "+findStr);
	detailsHash.put("EMAILID",recommendedBy);
//	detailsHash.put("EMAILID","rishiraj.shukla@timesgroup.com");
	detailsHash.put("WORKITEMOID",requestId);
	detailsHash.put("APPLICATION_NAME", "capex");
	detailsHash.put("DOCUMENTOID", "DOC1005");   
	detailsHash.put("CREATEDBY", emailId);   
	detailsHash.put("QUERYSTRING", findStr);   
	boolean result	= docChangeLogController.addReviewer(detailsHash);
	

	if(result==true){
		
		ArrayList  lstArray= new ArrayList();		
			
				lstArray  = capexChangeLogController.getEmailid(recommendedBy);
				String strArr[] = (String[])lstArray.get(0);
				
				String str = "Dear "+strArr[0]+", <br><br>"
						   + "<br> The following capex request is pending for your review. Please review this request on Timescape.<BR><BR>"
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
			String mailTo = recommendedBy;
			
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
out.println(result);
%>
	