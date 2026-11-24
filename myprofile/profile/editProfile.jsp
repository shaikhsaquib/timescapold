<%--
 -- @(#)editProfile.jsp	8/6/2002
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
<%@ page buffer="1024kb" autoFlush="true" %>
<%@page errorPage="../common/errorPage.jsp"%>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>

<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>
<jsp:useBean id="coreWebController" class="com.bccl.core.web.controller.CoreWebController" />
<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
%>

<%
GregorianCalendar today = new GregorianCalendar();
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","0");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","editProfile.breadcrumb");

String tempStr = "";
String dropDownUrl = "";
%>

<%
	String detailAction = request.getParameter("detailAction");

	if (detailAction == null) {
		detailAction = "UPDATE";
	}
%>
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>

        <script Language="JavaScript" src="../jscripts/editProfile.js">
        </script>
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">
			<%@ include file="../includes/empHeader.jsp" %>


		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td valign = "top"  width = "80%">
					<%@ include file="../includes/profileTabs.jsp" %>
					<%@ include file="../includes/details.jsp" %>
				</td>
			</tr>
		</table>

		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bold">
		  <tr>
			<td colspan="3" class="header">
				Personal Information
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
				<td colspan="3" class="normal" align="left">
				<span class = "bold">Note&nbsp;:&nbsp;</span> All fields marked with <sup class="rednormal">*</sup> are mandatory&nbsp;&nbsp;
				</td>
			  </tr>
		 <tr>
			<td colspan="3" class="small" height="5">
				<img src="../images/spacer.gif" width="1" height="1">
			</td>
		  </tr>

			<%
				tempStr = request.getParameter("title");

				if (tempStr == null) {
					tempStr = "";
				}
				dropDownUrl = "../utils/title.jsp?selectedOption="+tempStr;

			%>


			<tr>
				<td width="22%" class="bold" height = "25"><div align="left">Title<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"><div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				   <jsp:include page="<%=dropDownUrl%>" flush="true" />
				</div>
				</td>
			</tr>

			<%
				tempStr = request.getParameter("firstName");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">First Name<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				<input type="text" name="firstName" value = "<%=tempStr%>" size="15" class="small" maxlength="50"></div></td>
			</tr>

			<%
				tempStr = request.getParameter("middleName");

				if (tempStr == null) {
					tempStr = "";
				}

			%>


			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">Middle Name</div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				<input type="text" name="middleName" value = "<%=tempStr%>" size="15" class="small" maxlength="50"></div></td>
			</tr>

		<%
				tempStr = request.getParameter("lastName");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

			<tr>
				<td width="22%" class="bold" height = "25"><div align="left">Last Name<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <input type="text" name="lastName" value = "<%=tempStr%>"  size="15" class="small" maxlength="50"></td>
			</tr>

		<%

				int day = 0;
				int month = 0;
				int year = 0;
				tempStr = request.getParameter("day");

				if (tempStr == null) {
					tempStr = "0";
				}
				day = Integer.parseInt(tempStr);

				tempStr = request.getParameter("month");

				if (tempStr == null) {
					tempStr = "0";
				}
				month = Integer.parseInt(tempStr);

				tempStr = request.getParameter("year");

				if (tempStr == null) {
					tempStr = "0";
				}
				year = Integer.parseInt(tempStr);

			%>

			<input type="hidden" name="day" value="<%=day%>">
			<input type="hidden" name="month" value="<%=month%>">
			<input type="hidden" name="year" value="<%=year%>">

			<!--
			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">Date of Birth</div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
					<select name="day" class="small">
					<%//= HtmlUtil.getDayList(day+"") %>
				</select>

				<select name="month" class="small">
					<%//= HtmlUtil.getMonthList(month+"") %>
				</select>
				<select name="year" class="small">
					<%//= HtmlUtil.getYearList(1900,today.get(Calendar.YEAR),year,"desc") %>
				</select>
			  </div></td>
			</tr>
			-->

		   <%
				tempStr = request.getParameter("gender");

				if (tempStr == null) {
					tempStr = "";
				}

			%>


			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">Gender<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				<select name="gender" class="small">
				<option value = "M" <%=("M".equals(tempStr)?"SELECTED":"")%> >Male</option>
				<option value = "F" <%=("F".equals(tempStr)?"SELECTED":"")%>>Female</option>
				</select>
				</div></td>
		  </tr>

		   <%
				tempStr = request.getParameter("maritalStatus");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

			<tr>
				<td width="22%" height="20" class="bold"> <div align="left">Marital Status<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				<select name="maritalStatus" class="small">
					<option value="Unmarried" <%=(("S".equals(tempStr) || "Unmarried".equalsIgnoreCase(tempStr))?"SELECTED":"")%>>Unmarried</option>
					<option value="Married" <%=(("M".equals(tempStr) || "Married".equalsIgnoreCase(tempStr))?"SELECTED":"")%>>Married</option>
					<option value="Divorced" <%=(("D".equals(tempStr) || "Divorced".equalsIgnoreCase(tempStr))?"SELECTED":"")%>>Divorced</option>
					<option value="Widowed" <%=(("W".equals(tempStr) || "Widowed".equalsIgnoreCase(tempStr))?"SELECTED":"")%>>Widowed</option>
				</select>
				</div></td>
			</tr>

		   <%
				tempStr = request.getParameter("noOfFamilyMembers");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">No of Dependents</div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				<input type="text" name="noOfFamilyMembers" value="<%=tempStr%>" size="3" class="small" maxlength="2">
				</div></td>
			</tr>

		   <%
				tempStr = request.getParameter("religion");

				if (tempStr == null) {
					tempStr = "";
				}

				dropDownUrl = "../utils/religion.jsp?selectedOption="+tempStr;
			%>

			<tr>
				<td width="22%" class="bold" height = "25"> <div align="left">Religion<sup class="rednormal">*</sup></div></td>
				<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
				<td width="68%" height = "25"> <div align="left">
				   <jsp:include page="<%=dropDownUrl%>" flush="true" />
				</div></td>
			</tr>
		   <%
				tempStr = request.getParameter("motherTongue");

				if (tempStr == null) {
					tempStr = "";
				}
			%>

			<%
				tempStr = request.getParameter("motherTongue");

				if (tempStr == null) {
					tempStr = "";
				}
				System.out.println("Language "+tempStr);
				dropDownUrl = "../utils/language.jsp?selectedOption="+tempStr;

			%>

		  <tr>
			<td width="22%" class="bold" height = "25"> <div align="left">Mother Tongue<sup class="rednormal">*</sup></div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <div align="left">
				   <jsp:include page="<%=dropDownUrl%>" flush="true" />
			  </div></td>
		  </tr>

		   <%
				/*
				tempStr = request.getParameter("birthMark");
				if (tempStr == null) {
					tempStr = "";
				}
				*/

			%>
			<!--
		  <tr>
			<td width="22%" class="bold" height = "25"> <div align="left">Birthmark</div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <div align="left">
				<input type="text" name="birthMark" value="<%//=tempStr%>"  size="25" class="small" maxlength="30">
			  </div></td>
		  </tr>
			-->

		   <%/*
				tempStr = request.getParameter("isHandicapped");
				if (tempStr == null) {
					tempStr = "";
				}
				*/
			%>

		<!--
		  <tr>
			<td width="22%" class="bold" height = "25">Handicap Description&nbsp;</td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <div align="left">
					<input type="text" name="isHandicapped" value="<%//=tempStr%>" size="25" class="small" maxlength="50">
			</td>
		  </tr>
		-->
		   <%
				tempStr = request.getParameter("passportNumber");

				if (tempStr == null) {
					tempStr = "";
				}

			%>


		  <tr>
			<td width="22%" class="bold" height = "25"> <div align="left"><div align="left">Passport Number</div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <div align="left">
				<input type="text" name="passportNumber" value="<%=tempStr%>" size="15" class="small" maxlength="15">
			  </div></td>
		  </tr>

		   <%
				tempStr = request.getParameter("bloodGroup");

				if (tempStr == null) {
					tempStr = "";
				}
				dropDownUrl = "../utils/bloodGroup.jsp?selectedOption="+tempStr;

			%>


		  <tr>
			<td width="22%" class="bold" height = "25"><div align="left">Blood Group<sup class="rednormal">*</sup></div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25">
				   <jsp:include page="<%=dropDownUrl%>" flush="true" />
			  </td>
		  </tr>

		   <%
				tempStr = request.getParameter("panNumber");

				if (tempStr == null) {
					tempStr = "";
				}

			%>


		  <tr>
			<td width="22%" class="bold" height = "25"><div align="left">PAN Number</div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <input type="text" name="panNumber" value="<%=tempStr%>" size="15" class="small" maxlength="15"></td>
		  </tr>

		   <%
				tempStr = request.getParameter("pfAccountNumber");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

		  <tr>
			<td width="22%" class="bold" height = "25"><div align="left">PF Account Number</div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <input type="text" name="pfAccountNumber" value="<%=tempStr%>" size="15" class="small" maxlength="40"></td>
		  </tr>

		   <%
				tempStr = request.getParameter("alternateEmailId");

				if (tempStr == null) {
					tempStr = "";
				}

			%>

		  <tr>
			<td width="22%" class="bold" height = "25"> <div align="left">Alternative Email ID</div></td>
			<td width="10%" class="bold" height = "25"> <div align="center"><strong>:</strong></div></td>
			<td width="68%" height = "25"> <div align="left">
				<input type="text" name="alternateEmailId" value="<%=tempStr%>" size="35" class="small" maxlength="35">
			  </div></td>
		  </tr>


		  <input type="hidden" name="detailAction" value="<%=detailAction%>">
		  <tr>
			<td width="22%" class="blackbold">&nbsp;</td>
			<td width="10%">&nbsp;</td>
			<td width="68%">&nbsp;</td>
		  </tr>
		  <tr>
			<td width="22%" class="blackbold">&nbsp;</td>
			<td width="10%">&nbsp;</td>
			<td width="68%">
				<a href="javascript:validateProfile( )"><img src="../images/but_submit.gif" width="56" height="15" border="0"></a>
				<a href="javascript:history.back( )"><img src="../images/but_back.gif" width="56" height="15" border="0"></a>
			</td>
		  </tr>
		</table>
		</form>
	</body>
</html>