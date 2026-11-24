<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceWebController" />

<%
	Hashtable feedback = new Hashtable();
	String size = (String)request.getParameter("size");
	String temp = (String)request.getParameter("temp");
	String temp1 = (String)request.getParameter("temp1");
	System.out.println(size);
	String userFeedback = (String) request.getParameter("feedBackOption");
	String remark = (String)request.getParameter("remark");
	String userAttachment = (String)request.getParameter("isAttach");

	out.println(userFeedback);
	out.println(remark);
	out.println(userAttachment);
			
	//feedback.put("userFeedback",userFeedback);
	//feedback.put("remark",remark);
	//feedback.put("userAttachment",userAttachment);
	
	
	//out.println(feedback);
	   
	boolean fdbkStatus= false;
	fdbkStatus = governanceController.updateFeedback(feedback);

	//out.println(mobileNoArr[0]);

%>
