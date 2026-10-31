<%--
 -- 
 -- @(#)uploadFileRequest.jsp	13/06/2012
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Ashutosh Shimpi
 -- @version 	1.00, 13/06/2012
 --%>
   
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%@ include file="../includes/empHeader.jsp" %>
<html>
<head>
<title>Waste Aprroval Process</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../css/global.css">
<script Language="JavaScript" src="../js/uploadFile.js"></script>  
</head>
<body>
<%
		
		String attachment = (String)session.getAttribute("attachmentName");
		String requestStr = (String)session.getAttribute("requestStr");
		//String attachment = (String) request.getParameter("attachment");
		//String requestStr = (String) request.getParameter("requestStr");
		

		//String formName  = (String) request.getParameter("formName");
        
        String DPATH     = EnvironmentProperties.getValue("wastesalesapprovals", "uploadPath");

		String emailId1  = emailId;

		if (emailId1.indexOf("@") > -1) 
			{
				emailId1 = emailId1.substring(0, emailId1.indexOf("@"));        
			}

         
%>
	 <center><table border="0" width="100%" cellpadding="0" cellspacing="0">
        <tr><td></td></tr>
    <%@ include file = "uploadCodeSubmit.jsp"%>
    </table>
   </center>
   </body>
   </html> 