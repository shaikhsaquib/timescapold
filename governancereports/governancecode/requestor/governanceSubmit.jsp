<%--
 -- Governance Code
 -- @(#)governanceSubmit.jsp	07/11/2010
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 07-NOV-2010
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceWebController" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<%
	//System.out.println(size);
	Hashtable feedback = new Hashtable();
	
	int size = Integer.parseInt((String)request.getParameter("size"));

	String action = (String)request.getParameter("action");
	String userFeedback = "";
	String remark = "";
	String feedbackid = "";
	String questionno = "";
	String checklist = "";
	String userAttach = "";
	
	//String userAttachment = "";
%>
<html>
<!-- <script Language="JavaScript" src="../jscripts/savechklist.js"></script> -->

<head>
<%@ include file="../includes/headerMenu.jsp"%>
<table width="100%" height="59" border="0" cellpadding="2" cellspacing="2">
  <tr>
    <td height="17" colspan="6" align="center" valign="middle" class="style4"><div align="left" class="headCompliance">My Governance Code</div></td>
  </tr>
  <tr>
    <td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
    <td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="2" cellspacing="2">
<tr>
 <%
	for(int i=0;i<size;i++){

		userFeedback = (String) request.getParameter("feedBackOptions"+i);
		remark = (String)request.getParameter("remark"+i);
		feedbackid = (String)request.getParameter("feedbackid"+i);
		questionno = (String) request.getParameter("questionno"+i);	
		checklist = (String) request.getParameter("checklist"+i);	
		userAttach = (String) request.getParameter("userAttachment"+i);	
		if(userAttach==null||userAttach.equals(""))
		userAttach="NA";
		if(remark==null||remark.equals(""))
		remark="NA";
			 
		String timescapeUserOID = Long.toString(timescapeUserOId);
		//userAttachment = (String)request.getParameter("userAttachment");
		//out.println(userAttach);
		String fdbkArr[] = {userFeedback,remark,feedbackid,questionno,checklist,timescapeUserOID,userAttach};

		feedback.put(i+"",fdbkArr);
	}

			boolean fdbkStatus= false;
			feedback.put(size+"", action);
			//out.println(feedback.size());
			//String action2 =(String) feedback.get((feedback.size()-1)+"");
			//out.println("action2 == "+action2);

			fdbkStatus = governanceController.updateFeedback(feedback);

	if(fdbkStatus && action.equals("Save")){

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Thank You, <br>Your Feedback has been saved successfully!!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.go(-1);\">here</a> to return.</td>");

	}else if(fdbkStatus && action.equals("SignOff")){

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Thank You, <br>You have been Sign Off successfully!!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"../requestor/governanceCode.jsp\">here</a> to return.</td>");

	}else {

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Sorry, <br> There was an error while submitting your feedback, Please Try again !!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.go(-1);\">here</a> to return.</td>");

	}
	//out.println(feedback);

%>
</tr>
</table>
</html>