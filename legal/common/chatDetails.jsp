<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.io.File,java.util.*" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil,com.bccl.claim.web.util.Utility,java.text.ParseException, java.text.SimpleDateFormat" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<jsp:useBean id="docHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>
<jsp:useBean id="docChangeLogController" class="com.bccl.workflows.web.controller.DocumentChangeLogController"/>
<jsp:useBean id="docKeyWordController" class="com.bccl.workflows.web.controller.DocumentKeywordsController"/>
<%
/*String msg			= (String)request.getParameter("comment");
String requestoid			= (String)request.getParameter("requestoid");
	String id					= (String)request.getParameter("id");


out.println("msg--"+msg+"--requestoid--"+requestoid+"---id--"+id);*/

	String legalHeadEmailid		= (String)request.getParameter("legalHeadEmailid");
	//String requestoid			= (String)request.getParameter("requestoid"); ///changes
	String requestoid			= (String)session.getAttribute("requestId");
	String id					= (String)request.getParameter("id");
	String msg					= (String)request.getParameter("comment");

	
	String keyWord = "-";
	String actionText = "-";
	Hashtable  insertHash = new Hashtable();
	Hashtable  detailHash = new Hashtable();
	ArrayList detailsList		= new ArrayList();

	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
	

	if("1".equals(id))
	{
		
		boolean insertFlag = false;

		//msg					= (String)request.getParameter("comment");
		insertHash.put("COMMENTS", msg);
		insertHash.put("DOCUMENTOID", "DOC1006");			
		insertHash.put("WORKITEMOID", requestoid);			
		insertHash.put("EMAILID", emailId);			
		insertHash.put("KEYWORDS", keyWord);			
		insertHash.put("ACTIONTEXT", actionText);			
		insertHash.put("STATUS", "A");			
		insertHash.put("APPLICATION_NAME", "legalContractManagement");	
		insertHash.put("APPLICATION", "legalContractManagement");	
		 
		insertFlag = docKeyWordController.create("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",insertHash);
		//System.out.println("insertFlag----"+insertFlag);
		if(insertFlag)	
		{
				//System.out.println("aa----"+legalHeadEmailid);
		String mailTo = legalHeadEmailid;

		ArrayList  lstArray= new ArrayList();

		lstArray  = docChangeLogController.getEmailid(legalHeadEmailid);

		//System.out.println("lstArray==="+lstArray.size());

		String strArr[] = (String[])lstArray.get(0);

		String str = "Dear "+strArr[0]+", <br>" //manager[2] + "<br>"
				   + "<br> The following request is pending for your approval. Please approve or review this request on Timescape.<BR><BR>"
				   + "Document Id : "+requestoid+"<br>"
				   + "Message	  : "+msg+" <br><BR>"
				   + "Created By  : "+emailId+" <br><BR>"
				   + "Alternatively you can also click on the following link: "
				   //+"<a href='http://tsqa.timesgroup.com/irj/portal?NavigationTarget=navurl://b02590634b92bea5072ed01cc1b3dac7'>"
				   +"<a href='https://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://95bc12a0271888356ddeabdd7b6026bc'>"
				   +"<BR>Legal Contract Document</a><br><br>"
				   + "<p>Regards,</p><p> Timescape Admin</p>";

		String subject= "Legal Contract Document Notification";

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
					+ "				<td colspan = \"3\" align = \"left\">"
					//+"<img src = \"http://wsqa.timesgroup.com/timescape/sapep/collaboration/workflow/wastesalesapproval/images/bannerfinal.jpg\" border = \"0\"></td>" 
					+"<img src = \"http://tsweb.timesgroup.com/timescape/sapep/collaboration/workflow/wastesalesapproval/images/bannerfinal.jpg\" border = \"0\"></td>" 
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
		mailDetailsHash.put("CREATEDBYEMAILID", emailId);		
		mailDetailsHash.put("MAILTO", mailTo);
		mailDetailsHash.put("MAILSTATUS", "I");
		mailDetailsHash.put("REQUESTID", requestoid);
		mailDetailsHash.put("SUBJECT", subject);
		mailDetailsHash.put("MESSAGE", htmlstr);
		System.out.println("ssss===");

		//boolean mailFlag  = docChangeLogController.sendMail("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",mailDetailsHash);
//System.out.println("mailFlag==="+mailFlag);

		}

	}

	
	detailHash.put("DOCUMENTOID", "DOC1006");
	detailHash.put("WORKITEMOID", requestoid); 
	detailHash.put("STATUS", "A");
	detailHash.put("APPLICATION", "legalContractManagement");		
	detailsList = docKeyWordController.view("1A530637289A03B07199A44E8D531427","1A530637289A03B07199A44E8D531427",detailHash);
	String comments ="";
	String createdBy ="";
	String createdOn ="";

	for (int ii=0; ii<detailsList.size(); ii++) 
	{
		String strArr[] = (String[])detailsList.get(detailsList.size()-1);	
		
		comments = strArr[4];
		createdBy = strArr[5];
		createdBy				= createdBy.substring(0,createdBy.indexOf("@"));

		try 
		{
			Date date = (Date) format.parseObject(strArr[6]);

			createdOn = format2.format(date);	
										
		} catch (ParseException e) { 
		e.printStackTrace();
		}

	}

String s1 = comments+"@"+createdBy+"@"+createdOn;
out.println(s1);

%>