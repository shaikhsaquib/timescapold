<%--
 -- @(#)viewQualifications.jsp	8/6/2002
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
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","1");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myQualifications.breadcrumb");
%>



<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>

        <script Language="JavaScript" src="../jscripts/editQualifications.js">
        </script>

	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">

			<%@ include file="../includes/empHeader.jsp" %>

         <%
             long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");

             // Getting the TimescapeUser Qualification Details
             ArrayList qualificationDetails = profileController.getQualificationDetail(timescapeUserOID, payId, companyCode);


         %>

		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td valign = "top"  width = "80%">
					<%@ include file="../includes/profileTabs.jsp" %>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">

		  <tr>
			 <td height="5" colspan="3" align = "left" class="header"><!--<img src="../images/qual_info.jpg" width="195" height="32">-->Qualification Information</td>
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
			 <td height="5" colspan="3"><img src="../images/spacer.gif" width="1" height="1"></td>
		  </tr>
		  <tr>
			 <td colspan="3">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
				  <%
					String tempArr[] = null;

					int listSize = 0;
					String boardUniv = "";

					if (qualificationDetails != null) {
						listSize = qualificationDetails.size();
					}

					if( ( qualificationDetails == null ) || ( listSize == 0) ){
				%>
					<tr>
						<td colspan = "8" class = "normal" align = "center" height = "40">No Qualification Details found</td>
					</tr>			
				<%
					} else {

					for (int ii=0; ii<listSize; ii++) {

						tempArr = (String [])qualificationDetails.get(ii);

						if (tempArr[6].indexOf("~~") > -1) {

							boardUniv = tempArr[6].substring(tempArr[6].indexOf("~~")+2);
							if (tempArr[6].startsWith(" ")) {
								boardUniv = "";
								tempArr[6] = "";
							}

						} else {

							boardUniv = tempArr[6];
						}

				  %>
					<tr>
						<td width="19%" class = "bold">Qualification</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="30%" height="25" class="small"><%=tempArr[3]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
						<td width="19%" bgcolor="#FFFFFF" class = "bold">Institute</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="28%" class = "small"><%=tempArr[5]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
					</tr>

					<tr>
						<td width="24%" class = "bold">Specialization</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="24%" height="25" class = "small"><%=tempArr[4]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
						<td width="20%" class = "bold">Board / University</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="28%" class = "small"><%=boardUniv%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
					</tr>

					<tr>
						<td width="24%" class = "bold">% Marks/CGPA</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="24%" height="25" class = "small"><%=tempArr[8]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
						<td width="20%" class = "bold">Type</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="28%" height="25" class = "small"><%=tempArr[7]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
					</tr>

					<tr>
						<td width="24%" class = "bold">Year</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;:&nbsp;</td>
						<td width="24%" height="25" class = "small"><%=tempArr[9]%></td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
						<td width="20%">&nbsp;</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
						<td width="28%" height="25">&nbsp;</td>
						<td width="1%" valign="middle" height = "20" class = "bold" align = "center">&nbsp;</td>
					</tr>
				  <tr class="normal">
					 <td height="5" colspan="8"><img src="../images/spacer.gif" width="1" height="1"></td>
				  </tr>
					  <input type="hidden" name="qualificationDetailId" value="<%=tempArr[0]%>">
					  <input type="hidden" name="qualificationCode" value="<%=tempArr[3]%>">
					  <input type="hidden" name="qualificationOID" value="<%=tempArr[2]%>">
					  <input type="hidden" name="specialization" value="<%=tempArr[4]%>">
					  <input type="hidden" name="institute" value="<%=tempArr[5]%>">
					  <input type="hidden" name="boardUniversity" value="<%=boardUniv%>">
					  <input type="hidden" name="studyType" value="<%=tempArr[7]%>">
					  <input type="hidden" name="percentAcquired" value="<%=tempArr[8]%>">
					  <input type="hidden" name="passingYear" value="<%=tempArr[9]%>">

					  <%
					  if (ii <= listSize) {
					  %>

						  <tr>
								<td colspan = "8" class = "normal" height = "10">
								<hr size="1">
								</td>
						  </tr>

				  <%
					  }
					}
			  }//end of the else block which checks for null
				  %>


				</table>
				</td>
		  </tr>
		  <!--
		  <tr>
			 <td height = "1" colspan="3" bgcolor="#FFFFFF"><img src="../images/spacer.gif" width="1" height="1"></td>
		  </tr>
		  -->
		  <tr>
			 <td colspan="3">&nbsp;</td>
		  </tr>
		  <tr>
			 <td colspan="3"><div align="center">
					<!-- <a href="javascript:editQualification()" class="normal"><img src="../images/but_edit.gif" border="0"></a> -->
					<a href="javascript:editQualification()" class="normal"><img src="../images/but_edit.gif" border="0"></a>
			</td>
		  </tr>
		  <tr>
			 <td colspan="3">&nbsp;</td>
		  </tr>
		</table>
		</form>
	</body>
</html>