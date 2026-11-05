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
<%@ include file="../includes/empHeader.jsp"%>
<html>
<head>
<title>B2E</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!--<link rel="stylesheet" href="../style/compliance.css">-->

<script>

   function closeWindow (attachmentName, newFileName) 
	   {
		newFileName = newFileName.replace(/ /g,"%20");
        var ff = document.frmUploadFileSubmit;
		var temp = ff.uploadFileName.value;
		//alert(attachmentName);
		//alert(newFileName);
		field= eval("self.opener.document.frmCreateAsset."+attachmentName); 
		//field2= eval("self.opener.document.frmCreateAsset."+attachmentName+"1"); 
       
		field.value=temp;
		//field2.value=newFileName;

		self.close();
      }

</script>
</head>
<body>
<%
		String attachmentName	= (String)request.getParameter("attachmentName");
	    
      //  String projectName		= (String)request.getParameter("projectName");
        
        String DPATH            = EnvironmentProperties.getValue("assetmanagement", "uploadPath");

		String emailId1         = emailId;

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