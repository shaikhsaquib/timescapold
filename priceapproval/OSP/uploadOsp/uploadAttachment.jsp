<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File, java.io.*, java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<head>
<title>Waste Aprroval Process</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../css/global.css">
<script Language="JavaScript" src="../js/uploadFile.js"></script>  
</head>
<body>
<%
		String attachment = (String) request.getParameter("attachment");
		String requestStr = (String) request.getParameter("requestStr");
		out.println("requestStr--"+requestStr);
		out.println("attachment--"+attachment);

	//	String myfile  = (String) request.getParameter("myfile");
        
        String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");

		String emailId1  = emailId;

		if (emailId1.indexOf("@") > -1) 
		{
			emailId1 = emailId1.substring(0, emailId1.indexOf("@"));        
		}

		 boolean isMultipart = ServletFileUpload.isMultipartContent(request);

     if (!isMultipart) {
		 out.println("aaa--");

 } else {
	 out.println("isMultipart--");

 }
	%>