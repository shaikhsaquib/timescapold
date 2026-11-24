<%--
 -- Governance Code
 -- @(#)governanceApproverSubmit.jsp	11/02/2011
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
 -- @version 	1.00, 11-FEB-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceApprover" class="com.bccl.governancecode.web.controllerbeans.GovernanceAppWebController" />
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<%

	Hashtable Afeedback = new Hashtable();

	int size = Integer.parseInt((String)request.getParameter("size"));
	//System.out.println(size);
	String action = (String)request.getParameter("action");
	String userFeedback = "";
	String remark = "";
	String feedbackid = "";
	String questionno = "";
	String checklist = "";
	String roleCode = "";

//out.println(size);
//out.println(action);
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
				<td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-04-2024 to 31-03-2025 </span></div></td>
				<td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
			</tr>
		</table>
		<table width="100%" border="0" cellpadding="2" cellspacing="2">
			<tr>
<%
	for(int i=0;i<size;i++){

		String overriddenRating = (String) request.getParameter("overriddenRating"+i);
		String overriddenRemarks = (String) request.getParameter("overriddenRemarks"+i);
		userFeedback = (String) request.getParameter("feedBackOptions"+i);
		remark = (String)request.getParameter("remark"+i);
		//out.println(remark);
		feedbackid = (String)request.getParameter("feedbackid"+i);
		questionno = (String) request.getParameter("questionno"+i);	
		checklist = (String) request.getParameter("checklist"+i);	
		roleCode  = (String) request.getParameter("roleCode");
		//if(userAttach==null||userAttach.equals(""))
		//userAttach="NA";

		//out.println(overriddenRating);
		//out.println(overriddenRemarks);
	if	( remark.equals("null") || remark == null||remark.equals("")) {

		remark = "NA";

		//out.println(roleCode);
	}
	
	if(overriddenRemarks==null||"".equals(overriddenRemarks))
			overriddenRemarks="-";
		//out.println(overriddenRemarks);
    

		String timescapeUserOID = Long.toString(timescapeUserOId);
		//out.println(feedbackid);
		//userAttachment = (String)request.getParameter("userAttachment");
		//out.println(userAttach);
		//out.println(feedbackid);
		remark = Utility.replaceQuoteOracle(remark);
		overriddenRemarks = Utility.replaceQuoteOracle(overriddenRemarks);

		String fdbkArr[] = {userFeedback,remark,feedbackid,questionno,checklist,timescapeUserOID,overriddenRemarks,overriddenRating, roleCode,emailId};

		Afeedback.put(i+"",fdbkArr);
}
				
		boolean fdbkStatus= false;
		Afeedback.put(size+"", action);
		//out.println(Afeedback.size());
		//String action2 =(String) Afeedback.get((Afeedback.size()-1)+"");
		//out.println("action2 == "+action2);
		//out.println(Afeedback);
		fdbkStatus = governanceApprover.updateAFeedback(Afeedback);

if(fdbkStatus && action.equals("Save")){

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Thank You, <br>Your Feedback has been saved successfully!!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:goback();\">here</a> to return.</td>");

}else if(fdbkStatus && action.equals("SignOff")){

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Thank You, <br>You have been Sign Off successfully!!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"../approver/governanceAppr.jsp\">here</a> to return.</td>");

}else {

		out.println("<td clospan=\"100%\" class=\"normal\" align=\"center\">Sorry, <br> There was an error while submitting your feedback, Please Try again !!</td></tr><tr><td clospan=\"100%\" class=\"normal\" align=\"center\">Click <a href=\"#\" onclick=\"javascript:history.go(-1);\">here</a> to return.</td>");

}
		//out.println(feedback);

%>
		</tr>
	</table>
</html>