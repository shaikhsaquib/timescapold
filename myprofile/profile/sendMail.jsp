<%//@ page language="java" buffer="1024kb" autoFlush="false"%>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%//@page errorPage="../common/errorPage.jsp"%>

<%@ page import="java.util.Hashtable, java.util.ArrayList,java.io.*" %>
<%@page import="com.bccl.util.SendImapMessage"%>

<%
	//Hashtable profile	=  (Hashtable)session.getAttribute("profile");
	//String fullName       = (String) profile.get("fullName");
	//String title                = (String) profile.get("title");
	//String emailId 		   = (String) profile.get("emailId");
	String subject		   = "Modify Employee Details For "+ title + " " + fullName;

	Hashtable sendMail = new Hashtable();

	SendImapMessage sendMessage = new SendImapMessage();

	out.println("1");
	content += "\n\n"+ employeeDetails;
	content += "\n\nThis is an automated email powered by Timescape.\n\n";

	out.println("1");
	sendMail.put("fromAddr",emailId);
	sendMail.put("toAddr","timescape.admin@timesgroup.com");
	sendMail.put("content",content);
	sendMail.put("subject",subject);
	sendMessage.sendMail(sendMail);

	//response.sendRedirect("../common/promptPage.jsp?msg=4");
	//return;
%>
