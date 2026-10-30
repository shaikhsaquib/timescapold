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
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page language="java" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer, java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<html>

<html>
	<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- <meta content="width=device-width, initial-scale=1" name="viewport"> -->
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ota.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	
	<!-- <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<meta content="width=device-width, initial-scale=1" name="viewport">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;IE=5;IE=6;chrome=1">   

	<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.css">
	<link rel="stylesheet" href="../css/ota.css"/>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ota.js"></script> 
	<script Language="JavaScript" src="../js/util.js"></script> 
    <script Language="JavaScript" src="../js/common.js"></script> 
    <script src="../js/jquery1.min.js"></script>
	<link rel="stylesheet" href="../js/jquery-ui.css" type="text/css" />
	<script src="../js/jquery-ui.min.js"></script>
		<title> </title>
		<!-- <link rel="stylesheet" href="../style/global.css"> 
        <script Language="JavaScript" src="../js/ota.js"></script> -->       
        <!-- <script Language="JavaScript" src="../jscripts/utilMapping.js"></script> -->
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
	background-repeat: repeat-x;
</style>
	</head>
    
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" action= "#" name="frmUploadFile" enctype="multipart/form-data">  
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
 
</table>

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
                                         <%@ include file="../upload/bulkUploadContainer.jsp"%>       
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