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
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.StringTokenizer, java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<html>

<html>
	<head>
		<title> </title>
		<!-- <link rel="stylesheet" href="../style/global.css"> -->
        <script Language="JavaScript" src="../js/ervm.js"></script>        
        <!-- <script Language="JavaScript" src="../jscripts/utilMapping.js"></script> -->
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
	background-repeat: repeat-x;

	
.col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
  position: relative;
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
}
.col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
  float: left;
}
.col-xs-12 {
  width: 100%;
}
.col-xs-11 {
  width: 91.66666667%;
}
.col-xs-10 {
  width: 83.33333333%;
}
.col-xs-9 {
  width: 75%;
}
.col-xs-8 {
  width: 66.66666667%;
}
.col-xs-7 {
  width: 58.33333333%;
}
.col-xs-6 {
  width: 50%;
}
.col-xs-5 {
  width: 41.66666667%;
}
.col-xs-4 {
  width: 33.33333333%;
}
.col-xs-3 {
  width: 25%;
}
.col-xs-2 {
  width: 16.66666667%;
}
.col-xs-1 {
  width: 8.33333333%;
}

@media (min-width: 992px) {
  .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
    float: left;
  }
  .col-md-12 {
    width: 100%;
  }
  .col-md-11 {
    width: 91.66666667%;
  }
  .col-md-10 {
    width: 83.33333333%;
  }
  .col-md-9 {
    width: 75%;
  }
  .col-md-8 {
    width: 66.66666667%;
  }
  .col-md-7 {
    width: 58.33333333%;
  }
  .col-md-6 {
    width: 50%;
  }
  .col-md-5 {
    width: 41.66666667%;
  }
  .col-md-4 {
    width: 33.33333333%;
  }
  .col-md-3 {
    width: 25%;
  }
  .col-md-2 {
    width: 16.66666667%;
  }
  .col-md-1 {
    width: 8.33333333%;
  }}
</style>
	</head>
    
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" action= "#" name="frmUploadFileSubordinate" enctype="multipart/form-data">  
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
                                         <%@ include file="../upload/uploadFileSubContainer.jsp"%>       
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