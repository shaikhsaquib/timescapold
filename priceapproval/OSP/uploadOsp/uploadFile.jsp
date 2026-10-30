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
 -- @author     Krishna Vishwakarma
 -- @version 	1.00, 29-06-16
 --%>

<%@ page language="java" %>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<html>
	<head>
		<title>OSP Aprroval</title>
		<link rel="stylesheet" href="../css/global.css">

        <script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/OSP/js/uploadFile.js"></script>        
        <script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/OSP/js/util.js"></script>
     
	</head>
    
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" action= "uploadFileSubmit.jsp" name="frmUploadFile" enctype="multipart/form-data">
     
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
                                         <%@ include file="../uploadOsp/uploadFileContainer.jsp"%>       
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <img src="/timescape/sapep/employeeselfservice/priceapproval/images/spacer.gif" width="1" height="10">
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