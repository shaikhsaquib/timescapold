<%--
 -- @(#)viewProjectApprovals.jsp - 20/09/2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- @author  -  Sachin Mehta 21/09/2011
 -- @version -  1.0
 --%>
<%@page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SendMessage"%>
<jsp:useBean id="projectApprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>

<%--
	Make all your global declarations over here 
--%>

<html>
<head>
	<title>Project Approvals Status</title>
	<link rel="stylesheet" href="../style/CA.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/viewProjectApprovals.js"></script>
</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name  = "frmViewProjectApprovals" method = "post" >
		<%@ include file="../includes/status.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">						
		<%@ include file="../includes/menu.jsp"%>
<%
	
	String projectId = (String)request.getParameter("projectId");
	String status = (String)request.getParameter("status");
	String byWhom = (String)request.getParameter("byWhom");
	String approverEmailId = (String)request.getParameter("approverEmailId");
	//out.println(status);
	//out.println(byWhom);

	String newStatus = "P".equals(status)?"RR":"R";

	Hashtable dataHash = new Hashtable();
	
	if("1".equals(byWhom)){

		dataHash.put("RECOMMENEDBY1", timescapeUserOId+"");
		dataHash.put("RECOMMENDED1REMARKS", "NA");

	}else if("2".equals(byWhom)){

		dataHash.put("RECOMMENEDBY2", timescapeUserOId+"");
		dataHash.put("RECOMMENDED2REMARKS", "NA");

	}else if("12".equals(byWhom)){

		dataHash.put("RECOMMENEDBY1", timescapeUserOId+"");
		dataHash.put("RECOMMENDED1REMARKS", "NA");
		dataHash.put("RECOMMENEDBY2", timescapeUserOId+"");
		dataHash.put("RECOMMENDED2REMARKS", "NA");
	}
	
	dataHash.put("STATUS", newStatus);
	dataHash.put("PAID", projectId);
	dataHash.put("MODIFIEDBY", timescapeUserOId+"");

	boolean updateFlag =false;
	updateFlag = projectApprovalsController.updateProject(dataHash);

	//out.println(dataHash);
	//out.println(updateFlag);
%>

        <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="30px"><img height="30px" src="../images/spacer.gif"/></td>
        </tr>
<%
	if(updateFlag)
	{
		SendMessage postMan = new SendMessage( );

			String fromAddr = "timescape.admin@timesgroup.com";
			String toAddr = approverEmailId;
			String content = "A new request for Project Approval has been created.\n\n";
				content = content + "Request Details are as follows:\n\n";				
				content = content + "Project ID: " +projectId+"\n\n";
				content = content + "Please check and give your approval.\n\n";
				content = content + "Click on the below mentioned link to view the details:\n\n";
				content = content + "Link : http://timescape.timesgroup.com/irj/portal?NavigationTarget=navurl://ea87858e2830aea018bef8a94a1b4b6e&windowId=WID1349691149032\n\n";
				content = content + "Regards,\n\n";
				content = content + "TIMESCAPE Admin.";
			String emailsubject = "Project Approval Request Recommended";
			Hashtable mailer = new Hashtable();

			mailer.put("fromAddr", fromAddr);
			mailer.put("toAddr", toAddr);
			mailer.put("subject", emailsubject);
			mailer.put("content", content);
            boolean mailSendStatus = false;
			mailSendStatus = postMan.sendPinMail(mailer);
%>
		<tr>
			<td class = "style4"  bgcolor="#FFFFFF" colspan = "100%" align="center">
				Your request has been processed successfully			
			<td>
		</tr>
<%
	}else 
	{
%>	
		<tr>
			<td class = "style4" colspan = "100%">
				Oops! there was an error while processing the request.			
			<td>
		</tr>

<%
	}
%>
        <tr>
          <td align="left" bgcolor="#FFFFFF" height="30px"><img height="30px" src="../images/spacer.gif"/></td>
        </tr>
        <tr>
          <td bgcolor="#cccccc" height="1"><img height="1" src="../images/spacer.gif" width="1" /></td>
        </tr>
	</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>