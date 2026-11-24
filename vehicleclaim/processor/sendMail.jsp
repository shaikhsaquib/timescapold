<%--
 -- @(#)sendMail.jsp
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%-- 
 -- Comments ........
 -- Send an email Page
 --
 -- @author		Manisha Wadhawane
 -- @version	1.00	22/11/2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.SendImapMessage"%>


<%

	SendImapMessage postMan = new SendImapMessage( );

	String txnId = (String) request.getParameter("txnId");
	String appln = (String) request.getParameter("appln");
	String requestorName = (String) request.getParameter("requestorName");
	String requestorEmailId = (String) request.getParameter("requestorEmailId");
	String compCode = (String) request.getParameter("compCode");

	Hashtable details =  new Hashtable();
	String fromAddr   =  emailId;
	String toAddr     =  requestorEmailId.trim();
	String subject    =  "Claim Alert - Document not received";
	String content    =  "Dear " + requestorName + ", " +  "\n\n" 
				      +  "Physical copy of " + appln + ", TXN ID " + txnId + " is not received. "
				      +  "Please submit to respective Finance Department immediately."
					  +  "\n\nRegards,";

	details.put("fromAddr", fromAddr);
	details.put("toAddr", toAddr);
	details.put("subject", subject);
	details.put("content", content);

	String mailPath	  = "smtp.timesgroup.com";
	details.put("mailPath", mailPath);

	boolean status = postMan.sendMail(details);

	response.sendRedirect("../common/promptPage.jsp?msg=suc_email&compCode="+compCode);
%>