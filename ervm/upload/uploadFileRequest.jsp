<%--
 -- Project Approval
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
<html>
<head>
<title>Role Mapping Upload</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!-- <link rel="stylesheet" href="../style/compliance.css"> -->

<script>

   function closeWindow (originalFileName, newFileName) 
	   {            
	    self.opener.document.getElementById('uploadOriginalFilePath').value = originalFileName;
	    self.opener.document.getElementById('uploadFilePath').value = newFileName;	       
		
		self.close();
        self.opener.focus();
   }

</script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;

	background-repeat: repeat-x;
</style>
</head>
<body>
<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
		<img src="../images/header.png" style="width: 100%;">
	</div>
<%       
      String DPATH  = EnvironmentProperties.getValue("ervm", "uploadPath");
	
%>
	  <center><table border="0" width="100%" cellpadding="0" cellspacing="0"> 
       
    <%@ include file = "uploadCodeSubmit.jsp"%>
    </table>
   </center>
   </body>
   </html> 