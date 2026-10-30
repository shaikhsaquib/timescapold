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
<%
      String attachmentName	 = request.getParameter("attachmentName");
      String priceId	 = request.getParameter("priceId");
      //String projectName	 = request.getParameter("projectName");

	  //out.println(attachmentName);		
	  //out.println("jj"+priceId);		
%>
<html>
	<head>
		<title>LTA </title>		
		
        <script Language="JavaScript" src="../jscripts/uploadFileMD.js"></script>        
        <script Language="JavaScript" src="../jscripts/util.js"></script> 
     
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
                                         <%@ include file="../uploadMD/uploadFileContainer.jsp"%>       
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