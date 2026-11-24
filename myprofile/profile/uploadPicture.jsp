<%--
 -- @(#)uploadPicture.jsp	08-06-2004
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
 -- @author  Rathina
 -- @version 	1.00, 5/18/2004
 --%>

<%@ page errorPage="../common/errorPage.jsp"%>
<%@page buffer="1024kb"%>
<%@page autoFlush="false"%>

<%@ page language="java" %>
<%@ page import="java.util.Hashtable ,java.util.HashMap ,java.util.Collection, java.util.ArrayList,java.io.* ,java.util.Iterator" %>
<%@ page import="com.bccl.profile.web.util.Constants, com.bccl.util.Breadcrumbs" %>

<%@page import="com.bccl.util.*" %>
<%
	String emailId = request.getParameter("emailId");
%>

<html>
	<head>
		<title>Upload Picture</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">

        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/uploadPitcure.js"></script>

	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#EFEFEF">
 <form method="post" name="frmUploadPicture" enctype="multipart/form-data" action = "pictureUploadSubmit.jsp">
		<!-- Outer most table -->

			<table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="0">
				<tr>
					<td>
						<!-- Table to draw the black line starts -->

						<!-- Table to draw the black line ends -->
					</td>
				</tr>

				<tr>
					<td>
						<!--
							table to draw the middle portion
							middle portion includes left,middle,and right content
						-->
						<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
							<tr>
								<!-- the left black border of the page -->

								<!-- left border ends -->


								<td valign = "top">
                                     <%@ include file="../profile/uploadPictureContainer.jsp"%>
								</td>


								<!-- right black border begins -->

								<!-- right black border ends -->
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
						<%--
						 -- Include the footer over here.
						 --%>
					</td>
				</tr>
			</table>
		<!-- Outer most table ends here -->
	</form>
	</body>
</html>