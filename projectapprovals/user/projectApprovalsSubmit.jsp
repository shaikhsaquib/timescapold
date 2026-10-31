
<%@ page import = "java.util.Hashtable, java.util.ArrayList, com.bccl.util.Utility, java.util.GregorianCalendar, java.util.Calendar, java.util.*, java.text.*, javax.mail.*, javax.mail.internet.*, javax.activation.*, java.sql.*, com.bccl.util.SendMessage, java.io.*, java.util.Date " %>
<%@ page import = "com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>

<%--
	Make all your global declarations over here 
--%>

<html>
<head>
	<title>Project Approvals - Create Sanction Note - Sumbit</title>
	<link rel="stylesheet" href="../style/CA.css">
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
		<%@ include file="../includes/empHeader.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/header.jpg" width="825" height="62"/></div>
				<td>
			</tr>
			
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;
				</td>
			</tr>
<%

	String subject = (String) request.getParameter("subject");
	String project = (String) request.getParameter("project");
	String description = (String) request.getParameter("description");
	String justification = (String) request.getParameter("justification");
	String cost = (String) request.getParameter("cost");
	String workdone = (String) request.getParameter("workdone");
	String projecthead = (String) request.getParameter("projecthead");
	String attachment1 = (String) request.getParameter("attachment1");
	String attachment2 = (String) request.getParameter("attachment2");
	String attachment3 = (String) request.getParameter("attachment3");
	String attachment11 = (String) request.getParameter("attachment11");
	String attachment21 = (String) request.getParameter("attachment21");
	String attachment31 = (String) request.getParameter("attachment31");
	String recommendedby1 = (String) request.getParameter("recommendedby1");
	//String recommendedby2 = (String) request.getParameter("recommendedby2");
	String recommendedby2 = (String) request.getParameter("recommendedby1");
	String approvedby = (String) request.getParameter("approvedby");
	String recommendedby1OId = (String) request.getParameter("recommendedby1OId");
	String recommendedby2OId  = (String) request.getParameter("recommendedby1OId");
	String approvedbyOId  = (String) request.getParameter("approvedbyOId");

	//Creating a Sub Node "reqDetails"
	String reqDetails []  = {"reqDetails", "subject", "project", "description", "justification", "value", "workdone", "projecthead"};
	String reqDetailsValues[] ={"subNode", subject, Utility.replaceQuoteOracle(project),Utility.replaceQuoteOracle(description), Utility.replaceQuoteOracle(justification), cost, Utility.replaceQuoteOracle(workdone),Utility.replaceQuoteOracle(projecthead)};	
	
	if (attachment11.equals("")) {

		attachment11 = "NA";

	}

	if (attachment21.equals("")) {

		attachment21 = "NA";

	}

	if (attachment31.equals("")) {

		attachment31 = "NA";

	}

	Hashtable updationHash = new Hashtable();
	
	updationHash.put("attachment1", attachment11);
	updationHash.put("attachment2", attachment21);
	updationHash.put("attachment3", attachment31);
	updationHash.put("preparedbyRemarks", "-");
	updationHash.put("recommendedby1", recommendedby1OId);
	updationHash.put("recommendedby1Remarks", "-");
	updationHash.put("recommendedby2", recommendedby2OId);
	updationHash.put("recommendedby2Remarks", "-");
	updationHash.put("approvedby", approvedbyOId);
	updationHash.put("approvedbyRemarks", "-");
	updationHash.put("createdBy", timescapeUserOId+"");
	updationHash.put("modifiedBy", timescapeUserOId+"");
	updationHash.put("status", "P");
	
	ArrayList createRequest = new ArrayList();

	createRequest.add(reqDetails);	
	createRequest.add(reqDetailsValues);
	createRequest.add(updationHash);

	//System.out.println(createRequest.size());
	//System.out.println(updationHash);

	//boolean alertStatus = false;
	//boolean status = true;
	boolean status = projectApprovalsController.createProject(createRequest);
	
	if(status){
		
		SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = recommendedby1;
			String content = "A new request for Project Approval has been created.\n\n";
				content = content + "Request Details are as follows:\n\n";
				content = content + "Subject: "+ subject + "\n\n";
				content = content + "Project Name: " +project+"\n\n";
				content = content + "Description: " +description+"\n\n";
				content = content + "Click on the below mentioned link to view the details:\n\n";
				content = content + "Link : http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://ea87858e2830aea018bef8a94a1b4b6e&windowId=WID1349691149032\n\n";
				content = content + "Regards,\n\n";
				content = content + "TIMESCAPE Admin.";
			String emailsubject = "Project Approval Request Created";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", emailsubject);
			mailer.put("content", content);
            boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);
%>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Your request for Project Approval has been filed successfully !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="../user/viewProjectApprovals.jsp">here</a> to view your Project Approval Request(s)
				</td> 
			</tr>
			
<%
	}else{
		//response.sendRedirect(../common/promptPage.jsp?promptStr=<messageId>);
		//return;
%>		
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >There is some problem while filing the Project Approval Request !!!
				</td> 
			</tr>
			<tr>
				<td colspan= "100%" align = "center" >&nbsp;</td>
			</tr>
			<tr>
				<td colspan= "100%" align = "center" class = "style5" >Click <a href="javascript:history.back()">here</a> to try again
				</td> 
			</tr>
<%
	}
%>
</table>
</body>
</html>