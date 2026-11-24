<%--
 -- @(#)viewProfile.jsp	8/6/2002
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
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Iterator,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>

<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%
	GregorianCalendar today = new GregorianCalendar();
%>

<%!
String monthArr[] = {"00", "JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
%>

<%
session.setAttribute("currLink","personal information");
session.setAttribute("leftLink","2");
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","myEmpHist.breadcrumb");
%>



<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/empHistory.js"></script>
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form name  = "frmProfile" method = "post">

			<%@ include file="../includes/empHeader.jsp" %>

<%
	String timescapeUserOID = (String)profile.get("timescapeUserOID");

	ArrayList experienceList = profileController.getExperienceDetail(Long.parseLong(timescapeUserOID),payId,companyCode);

	
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
				<td colspan="5">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
			
						<tr class="bold"> 
							<td colspan="3"><div align="left" class="header">Employment History - Within Organization</div></td>
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
					</table>
				</td>
			</tr>

			<tr> 
				<td colspan="5" height="5"><img src="../images/spacer.gif" width="1" height="1"></td>
			</tr>

			<tr align="center" class="blackcontent"> 
				<td colspan="5" bgcolor="#FFFFFF"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>

			<tr> 
				<td class="white" align = "left" width="25%" height="20" bgcolor = "#000000">&nbsp;Department Name</td>
				<td class="white" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "normal">&nbsp;</td>
				<td class="white" align = "left" width="41%" height="20" bgcolor = "#000000">&nbsp;Job Description (150 characters)</td>
				<td class="white" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF" class = "normal">&nbsp;</td>
				<td class="white" align = "left" width="32%" height="20" bgcolor = "#000000">&nbsp;Designation / Duration</td>
			</tr>

			<tr align="left"> 
				<td height="5" colspan="5"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>

			<%
				if(experienceList.size() == 0){
			%>
			<tr> 
				<td height="20" align = "center" colspan = "5" class = "normal">&nbsp;No Experience Details Available</td>
			</tr>

			<%
				} else{

				boolean flag = true;

				for (int i = 0; i < experienceList.size(); i++) {

					String tempStr[] = (String [])experienceList.get(i);

					if(i == 0 && tempStr[3].equals("EX")){
					%>
						<tr> 
							<td height="20" align = "center" colspan = "5" class = "normal">&nbsp;</td>
						</tr>

						<tr> 
							<td height="20" align = "center" colspan = "5" class = "normal">&nbsp;No Internal Experience Details Available</td>
						</tr>

						<tr> 
							<td height="20" align = "center" colspan = "5" class = "normal">&nbsp;</td>
						</tr>

			<%
					}

					if(tempStr[3].equalsIgnoreCase("EX") && flag){
			%>
			<tr> 
				<td colspan="5" height="5"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>
			<tr> 
				<td colspan="5" class="header">Employment History - Previous Organizations</td>
			</tr>
			<tr> 
				<td colspan="5" height="5"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>
			<tr> 
				<td class="white" align = "left" width="25%" height="20" bgcolor = "#000000">&nbsp;Company Name</td>
				<td class="white" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF">&nbsp;</td>
				<td class="white" align = "left" width="41%" height="20" bgcolor = "#000000">&nbsp;Job Description (150 characters)</td>
				<td class="white" align = "left" width="1%"  height="20" bgcolor = "#FFFFFF">&nbsp;</td>
				<td class="white" align = "left" width="32%" height="20" bgcolor = "#000000">&nbsp;Designation / Duration</td>
			</tr>
			<%
					flag = false;
					}
			%>

			<tr> 
				<input type = "hidden" name = "experienceDetailId" value = "<%=tempStr[0]%>">
				<input type = "hidden" name = "experienceFlag" value = "<%=tempStr[3]%>">
				<input type = "hidden" name = "deptCompany" value = "<%=tempStr[2]%>">
				<input type = "hidden" name = "jobDesc" value = "<%=tempStr[4]%>">
				<input type = "hidden" name = "joinedAs" value = "<%=tempStr[5]%>">
				<input type = "hidden" name = "promotedDesignation" value = "<%=tempStr[6]%>">


				<td align="left" width="25%" valign="top" class = "small"><%=tempStr[2]%></td>
				<td align="left" width="1%" class = "normal"></td>
				<td align="left" width="41%" valign="top" class = "small"><%=tempStr[4]%></td>
				<td align="left" width="1%" class = "small"></td>
				<td align="left" width="32%" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr> 
							<td align="right" class="bold" height="25">Joined as</td>
							<td align="center" class="blackcontent" height="25">:</td>
							<td height="25" class = "small"><%=tempStr[5]%></td>
						</tr>

						<tr> 
							<td width="40%" align="right" class="bold" height="25">Last Designation Held</td>
							<td width="7%" align="center" class="blackcontent" height="25">:</td>
							<td width="53%" height="25" class = "small"><%=tempStr[6]%></td>
						</tr>

						<tr> 
							<td width="40%" align="right" class="bold" height="25">From</td>
							<td width="7%" align="center" class="blackcontent" height="25">:</td>
							<td width="53%" height="25" class = "small"> 
								<%
									String tempDate ="";
									String fromMonth = "00";
									String tempFromMonth = "00";
									String tempFromYear = "0000";

									tempDate = tempStr[7];
									if (tempDate.indexOf("-") > -1) {

										fromMonth = tempDate.substring(0,2);
										tempFromMonth = monthArr[Integer.parseInt(fromMonth)];
										tempFromYear = tempDate.substring(3,tempDate.length());
										

										//tempDate = monthArr[Integer.parseInt(tempDate.substring(0,2))-1] + tempDate.substring(2,tempDate.length());

									} else {

										fromMonth = tempDate.substring(4,6);
										tempFromMonth = monthArr[Integer.parseInt(fromMonth)];
										tempFromYear  = tempDate.substring(0,4);
									}
									
								%>
								<%=(tempFromMonth+"-"+tempFromYear)%>

								<input type = "hidden" name = "fromMonth" value = "<%=fromMonth%>">
								<input type = "hidden" name = "fromYear" value = "<%=tempFromYear%>">
							</td>
						</tr>

						<tr> 
							<td width="40%" align="right" class="bold" height="25">To</td>
							<td width="7%" align="center" class="blackcontent" height="25">:</td>
							<td width="53%" height="25" class = "small"> 
							<%
									String toMonth = "00";
									String tempToMonth = "00";
									String tempToYear = "00000";

									tempDate = tempStr[8];
									if (tempDate.indexOf("-") > -1) {

										toMonth = tempDate.substring(0,2);
										tempToMonth = monthArr[Integer.parseInt(toMonth)];
										tempToYear = tempDate.substring(3,tempDate.length());

										//tempDate = monthArr[Integer.parseInt(tempDate.substring(0,2))-1] + tempDate.substring(2,tempDate.length());

									} else {

										toMonth = tempDate.substring(4,6);
										tempToMonth = monthArr[Integer.parseInt(toMonth)];
										tempToYear  = tempDate.substring(0,4);
									}
									
								%>
								<%=(tempToMonth+"-"+tempToYear)%>

							<input type = "hidden" name = "toMonth" value = "<%=toMonth%>">
							<input type = "hidden" name = "toYear" value = "<%=tempToYear%>">

							</td>
						</tr>
					</table>
				</td>
			</tr>

			<tr> 
				<td align="center" colspan="5" valign="top" height="5"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>

			<tr bgcolor="#ECEFF2"> 
				<td align="center" colspan="5" valign="top" height="1"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>

			<tr> 
				<td align="center" colspan="5" valign="top" height="5"><img src="../images//spacer.gif" width="1" height="1"></td>
			</tr>

		<%

			}
			}
		%>
		  <tr>
			 <td colspan = "100%" align = "center"><a href="javascript:editExperience( )"><img src="../images/but_edit.gif" border="0"></a></td>
		  </tr>
		</table>

		</form>
	</body>
</html>