<%--
 -- @(#)editQualifications.jsp	8/6/2002
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author  Vikrant Desai
 -- @version 	1.00, 24/8/2004
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>

<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />



<%
int startIndex = 0;
int endIndex = 0;

GregorianCalendar today = new GregorianCalendar();
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","1");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","editQualifications.breadcrumb");
%>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/editQualifications.js"></script>
        <script Language="JavaScript" src="../jscripts/help.js"></script>

	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">
			<input type="hidden" name="option" value="">
			<%@ include file="../includes/empHeader.jsp" %>


			<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
				<tr>
					<td valign = "top"  width = "80%">
						<%@ include file="../includes/profileTabs.jsp" %>
					</td>
				</tr>
			</table>

			<script language = "Javascript">
				function showPopUp(index,url)
				{
					if(url.indexOf("?") > 0) {
						url = "../utils/" + url + "&index="+index;
					}
					else{
						url = "../utils/" + url + "?index="+index;
					}
					win = window.open(url,"Institutes","width=550,height=250,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
				}

				function showQualificationHelp( ){
					window.open("../common/qualificationHelp.jsp","Qualification - Help","width=850,height=700,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes,resize=yes");
				}
			</script>

			<%
				String qualificationRow = "../includes/qualificationRow.jsp";

				String[] tempQualificationDetailId = null;
				String[] tempQualificationCode = null;
				String[] tempQualificationOID = null;
				String[] tempSpecialization = null;
				String[] tempInstitute = null;
				String[] tempUniversity = null;
				String[] tempStudyType = null;
				String[] tempPercentAcquired = null;
				String[] tempPassingYear = null;

				String dropDownUrl = "";

				String tempStr = "";

				  int qualSize = 0;

				   System.out.println("here ");
				   if (request.getParameterValues("qualificationCode") != null) {

					tempQualificationDetailId   = request.getParameterValues("qualificationDetailId");
					tempQualificationCode       = request.getParameterValues("qualificationCode");
					tempQualificationOID		= request.getParameterValues("qualificationOID");
					tempSpecialization          = request.getParameterValues("specialization");
					tempInstitute               = request.getParameterValues("institute");
					tempUniversity              = request.getParameterValues("boardUniversity");
					tempStudyType               = request.getParameterValues("studyType");
					tempPercentAcquired     	= request.getParameterValues("percentAcquired");
					tempPassingYear             = request.getParameterValues("passingYear");

					qualSize = tempQualificationDetailId.length;
				}
			%>

			<table width="100%" border="0" cellspacing="1" cellpadding="0">
				<tr>
					<td colspan="3" class="small" height = "5">
					</td>
				</tr>

				<tr>
					<td colspan="3" class="header" valign="middle">
						Qualification Information <a href="../common/qualificationHelp.jsp" target="_blank"><img src = "../images/qmark.gif" border = "0"></a>
					</td>
				</tr>

				<tr>
					<td colspan="3" class="small" height="5">
						<img src="../images/spacer.gif" width="1" height="1">
					</td>
				</tr>

				<tr>
					<td colspan="3" class="normal" height = "20" align = "left">
						<span class = "bold">Note&nbsp;:&nbsp;</span><span class = "bluenormal">Please use Internet Explorer version 5.0 or above while browsing Timescape to ensure best functional / visual experience.</span>
					</td>
				</tr>


				<tr>
					<td height="5" colspan="3" class="normal" align="left" height="20"><span class = "bold">Note&nbsp;:&nbsp;</span>All the fields in a single row are mandatory&nbsp;&nbsp;</td>
				</tr>

				<tr>
					<td height="5" colspan="3" class="normal" height="10"><img src="../images/spacer.gif" width="1" height="1"></td>
				</tr>

				<tr>
					<td colspan="3">
						<hr size="1">
					</td>
				</tr>
			<%
			/**
					Steps to paint the Page
					~~~~~~~~~~~~~~~~~~~
					1. Get the resultset (ArrayList) from the datasource
					2. Check for the size of the ArrayList
					3. If the size of the ArrayList == 0 then include a jsp which contains 3 blank empty
						rows of the required controls
					4. Else fetch the data up to the size of the ArrayList
					5. Paint empty controls for the remaining rows
			*/

			%>

				<tr>
					<td colspan="3">
			<%
						if(qualSize ==0){
							// No data found hence paint 3 empty  rows
							startIndex = 0;
							endIndex = 3;
			%>
							<%@ include file="../includes/qualificationRow.jsp" %>
			<%
						}else{
								startIndex = qualSize;
								endIndex = startIndex +1;

							// Start paintingthe rows with already existing data

			%>
							<%@ include file="../includes/populatedQualificationRow.jsp" %>
							<%@ include file="../includes/qualificationRow.jsp" %>

			<%
						}
			%>

					</td>
				</tr>



				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td height="2" colspan="3" bgcolor="#FFFFFF"><img src="../images/spacer.gif" width="1" height="1"></td>
				</tr>

				<tr>
					<td colspan = "3" align = "right">
						<a href = "javascript:addMore( )" class = "boldunderline">add more</a>
						</td>
				</tr>

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>

				<tr>
					<td colspan="3"><div align="center"><a href = "javascript:submitForm( )"><img src="../images/but_submit.gif" width="56" height="15" border = "0"></a>
						<a href = "javascript:history.back()"><img src="../images/but_back.gif" width="56" height="15" border = "0"></a></div>
					</td>
				</tr>

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</html>