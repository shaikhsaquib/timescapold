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
 -- @author     Afroz Sayed
 -- @version 	1.00, 25/7/2011
 --%>

<%@ page language="java" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<html>
	<head>
		<title>Waste Aprroval Process </title>
		<link rel="stylesheet" href="../css/global.css">
		<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/>

		<script src="../js/jquery-1.9.1.min.js"></script>
		<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
		<script Language="JavaScript" src="../js/uploadFile.js"></script>        
        <script Language="JavaScript" src="../js/util.js"></script>
   
	</head>
    
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" action= "uploadFileSubmit.jsp" name="frmFixedUploadFile" enctype="multipart/form-data">
     
			<!-- Outer most table -->

                <table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
                   
                    <tr>
                        <td>
                            <table border = "0" cellspacing="0" cellpadding="0" width = "100%">
                                <tr>

                                    <td valign = "top">
                                         <%@ include file="../upload/fixedUploadFileContainer.jsp"%>       
                                    </td>

                                </tr>

                            </table>
                        </td>
                    </tr>			
                   
                </table>


            <!-- Outer most table ends here -->
        </form>
	</body>
</html>