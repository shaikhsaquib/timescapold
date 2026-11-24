<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<jsp:useBean id="domainObjectsWebController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" scope="session"/>


<%
      String roleId = (String)session.getAttribute("roleId"); // rolecode of the user
      String company1="";  

%>
   
<html>
<head>
<title>Search</title>
<link href="../style/compliance.css" rel="stylesheet" type="text/css" />
<!-- <script Language="JavaScript" src="../jscripts/approveDaily.js"></script> -->
<script Language="JavaScript" src="../jscripts/common.js"></script>
<script Language="JavaScript" src="../jscripts/search.js"></script>
 <script Language="JavaScript" src="../jscripts/report.js"></script>
<link href="../style/calendarControl.css"rel="stylesheet">
<script src="../jscripts/calendarControl.js"language="javascript"></script>
</title>
</head>

<body >
<form name="frmUserControlsSearch" method = "post" action = "">


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#98BF00"><img src="../images/header.jpg" width="519px" height="39" /></td>
  </tr>


  <tr>
	<td colspan="100%" height="1px" bgcolor="#cccccc"><block type="spacer" height="1px"></td>
  </tr>


</table>

<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center">
	<tr>
		<td  class="normal" colspan="100%" align="left" height="20px">
            <a href="../requestor/weekly.jsp" class="style2"><%="MY COMPLIANCE"%></a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="../approver/approveDaily.jsp" class="style2"><%="ENSURE COMPLIANCE"%></a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="../reviewer/dashBoardDaily.jsp" class="style2"><%="DASHBOARD"%></a>
</table>

<!------------------------------------- Search Table Begins --------------------------------------------------->

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td bgcolor="#4498C6" colspan="100%" class="style1" height="20px" align="center">
					Operational Controls Search
				</td>
			</tr>
		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>
      
		<tr>
			<td class = "style2" height = "30" colspan = "3" align = "left">Search By Frequency </td>
		</tr>


		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>
         
      <tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Select Frequency</td>
			<td class = "bold" height = "30" width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width = "65%" align = "left">
			<select name="frequency" id="frequency" class="normal" style="width:150;">
				<option value="0">Select Frequency</option>
				<option value="all|all">All</option>
				<option value="1|Daily">Daily</option>
				<option value="2|Weekly">Weekly</option>
				<option value="3|Fort Nightly">Fort Nightly</option>
				<option value="4|Monthly">Monthly</option>
				<option value="5|Quarterly">Quarterly</option>
				<option value="6|Half Yearly">Half Yearly</option>
				<option value="7|Annually">Annually</option>
				</select>
			</td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "style2" height = "30" width = "70%" align = "left" colspan = "2">AND</td>
		</tr>

		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

	<!-- 	<tr>
			<td class = "style2" height = "30" colspan = "3" align = "left">Search By Control & Date Combination</td>
		</tr>
		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr> -->


	<!-- 	<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Enter Control</td>
			<td class = "bold" height = "30" width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width = "65%" align = "left">
				<input type="text" class="normal" id="controlName" name="controlName" size="25">
			</td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "style2" height = "30" width = "70%" align = "left" colspan = "2">OR</td>
		</tr> -->

		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>
<!-- 
		<tr>
			<td class = "style2" height = "30" colspan = "3" align = "left">Search By Function</td>
		</tr>
		
		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>


		<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Select Function</td>
			<td class = "bold" height = "30" width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width = "65%" align = "left">
			<select name="Function" id="Function" class="normal" style="width:150;">
				<option value="0">Select Function</option>
				<option value="all">All</option>
				<option value="FINANCE">Finance</option>
				<option value="OPERATIONS">Operations</option>
				<option value="HR">HR</option>
				<option value="PROCUREMENT">Procurement</option>
				<option value="MKTNG TJ">Mktng TJ</option>
				<option value="MKTNG MB">Mktng MB</option>
				<option value="TECHNOLOGY INFRASTRUCTURE">Technology Infrastructure</option>
				<option value="TECHNOLOGY TJ">Technology TJ</option>
				<option value="TECHNOLOGY MB">Technologhy MB</option>
				<option value="FAIRS_TJ & ERM">Fairs_TJ & ERM</option>
				<option value="MB FAIRS">MB Fairs</option>
			</select>
			</td>
	


		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "style2" height = "30" width = "70%" align = "left" colspan = "2">AND</td>
		</tr>
	</tr> -->
		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

		<tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Select From Date</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type="text" class="normal" id="frmDate" name="frmDate" onfocus="showCalendarControl(this);" readOnly size="21"></td>
		</tr>
		<tr>
			<td height="5px" colspan="100%"><block type="spacer" height="5px"></td>
		</tr>

		<tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Select To Date</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type="text" class="normal" id="toDate" name="toDate" onfocus="showCalendarControl(this);" readOnly size="21"></td>
		</tr>

		<tr>
			<td height="25px" colspan="100%"><block type="spacer" height="25px"></td>
		</tr>
		<tr>
			<td height="15" colspan="100%" align="center" valign="middle" class="style4">
				<div align="left" style="width:30%;">
				<input type="button" name="Submit" value="Submit"  onclick="ensurerControlsSearchValidate()"/>  
				<input type="reset" name="reset" value="Reset"/>
				</div>
			</td>
		</tr>
	</table>
<!---------------------------------------- Search Table Ends ------------------------------------------------>
	</form>
</html>