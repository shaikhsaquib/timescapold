<%--
 -- @(#)uploadFile.jsp	25/8/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 -- 
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 -- 
 --%>

 <%--
 -- Comments....
 -- 
 --
 --
 --
 -- @author  Amruta Gangan
 -- @version 	1.00, 25/8/2008
 --%>

<%@ page errorPage="../common/errorPage.jsp"%>

<%@ page language="java" %>

<html>
	<head>
		<title> Controls--Attachment </title>
		<link rel="stylesheet" href="../style/compliance.css">

        <script Language="JavaScript" src="../jscripts/uploadFile.js"></script>        
        <script Language="JavaScript" src="../jscripts/util.js"></script>
     
	</head>
    
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
     <form method="post" action= "uploadFileSubmit.jsp" name="frmUploadFile" enctype="multipart/form-data">

<%
      String attachNo = request.getParameter("attachNo");
	 // out.println(attachNo);	
%>
      <input type="hidden" name="attachNo" value="<%=attachNo%>">
            <!-- Outer most table -->

                <table width = "780" border = "0"  align="center" cellspacing="0" cellpadding="0">
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