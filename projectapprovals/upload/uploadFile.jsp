<%--
 -- Project Approval
 -- @(#)uploadFile.jsp	13/06/2012
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
   

<%@ page language="java" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<html>
	<head>
		<title> B2E--Attachment </title>
		<link rel="stylesheet" href="../style/global.css">

        <script Language="JavaScript" src="../jscripts/uploadFile.js"></script>        
        <script Language="JavaScript" src="../jscripts/util.js"></script>
     
	</head>
    
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" action= "" name="frmUploadFile" enctype="multipart/form-data">
     
<%
      String attachmentName	 = request.getParameter("attachmentName");
      String projectName	 = request.getParameter("projectName");

	  //out.println(attachmentName);		
	  //out.println(projectName);		
%>
			<!-- Outer most table -->

                <table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
                    <tr>
                  <td>
				</td>
                    </tr>

                    <tr>
                        <td>
                            <table border = "0" cellspacing="0" cellpadding="0" width = "100%">
                                <tr>

                                    <td valign = "top">
                                         <%@ include file="../upload/uploadFileContainer.jsp"%>       
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <img src="../images/spacer.gif" width="1" height="10">
                                    </td>
                                </tr>


                            </table>
                        </td>
                    </tr>			
                    <tr>
                        <td>
                        </td>
                    </tr>
                </table>
            <!-- Outer most table ends here -->
        </form>
	</body>
</html>