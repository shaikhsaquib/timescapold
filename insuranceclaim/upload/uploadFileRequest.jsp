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
<%@ include file="../includes/header.jsp"%>
<html>
<head>
<title>B2E</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/global.css">
<script Language="JavaScript" src="../jscripts/uploadFile.js"></script>  
</head>
<body>
<%
		String requestNo = (String) request.getParameter("hiddRequestNo");
		String formName  = (String) request.getParameter("formName");
        
        String DPATH     = EnvironmentProperties.getValue("insuranceclaim", "uploadPath");

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