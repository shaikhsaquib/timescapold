
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

	String subject = (String) request.getParameter("hidsubject");
	String project = (String) request.getParameter("hidproject");
	String description = (String) request.getParameter("hiddescription");
	String justification = (String) request.getParameter("hidjustification");
	String value = (String) request.getParameter("hidvalue");
	String workdone = (String) request.getParameter("hidworkdone");
	String projecthead = (String) request.getParameter("hidprojecthead");
	String attachment1 = (String) request.getParameter("hidattachment1");
	String attachment2 = (String) request.getParameter("hidattachment2");
	String attachment3 = (String) request.getParameter("hidattachment3");
	String recommendedby1 = (String) request.getParameter("hidrecommendedby1");
	String recommendedby2 = (String) request.getParameter("hidrecommendedby2");
	String approvedby = (String) request.getParameter("hidapprovedby");

	//Creating a Sub Node "reqDetails"
	String reqDetails []  = {"reqDetails", "subject", "project", "description", "justification", "value", "workdone", "projecthead"};
	String reqDetailsValues[] ={"subNode", subject, Utility.replaceQuoteOracle(project),Utility.replaceQuoteOracle(description), Utility.replaceQuoteOracle(justification), value, Utility.replaceQuoteOracle(workdone),Utility.replaceQuoteOracle(projecthead)};	

	Hashtable updationHash = new Hashtable();
	
	updationHash.put("attachment1", attachment1);
	updationHash.put("attachment2", attachment2);
	updationHash.put("attachment3", attachment3);
	updationHash.put("recommendedby1", recommendedby1);
	updationHash.put("recommendedby2", recommendedby2);
	updationHash.put("approvedby", approvedby);
	updationHash.put("createdBy", Long.toString(timescapeUserOId));
	updationHash.put("modifiedBy", Long.toString(timescapeUserOId));
	updationHash.put("status", "P");
	
	ArrayList createRequest = new ArrayList();

	createRequest.add(reqDetails);	
	createRequest.add(reqDetailsValues);
	createRequest.add(updationHash);

	System.out.println(createRequest.size());
	System.out.println(updationHash);

	//boolean alertStatus = false;
	//boolean status = true;
	boolean status = projectApprovalsController.createProject(createRequest);
	
	if(status){
		
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