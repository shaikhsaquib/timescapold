<%--
 -- @(#)viewAttendance.jsp - 07-JULY-2012
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is used to view the Time Card of a user
 -- @author  -  Vikrant Desai/ Sachin Mehta/ Yogesh Kadam
 -- @version -  1.0
 -- This page includes viewPunchContainer.jsp
 --%>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<jsp:useBean id="employeeController" class="com.bccl.timemanagement.web.controllerbeans.EmployeeWebController" />

<%@ include file="../includes/empHeader.jsp"%>		

<%--
	Make all your global declarations over here 
--%>

<%
	String roleId		= ( String ) session.getAttribute("leaveRole");
    String roleOId	    =	( String ) session.getAttribute("roleOId");
    String empNumber	=	( String ) request.getParameter("payId");
	String empSapNumber = sapId;
	String formName = "frmAttendance";
%>
<%@ include file="../includes/dates.jsp"%>	
<html>
<head>
	<title>TIMESCAPE</title>
	<link rel="stylesheet" href="../style/global.css">
	<link rel="stylesheet" href="../style/calendarControl.css">
	<link rel="stylesheet" href="../style/menu.css">
	<link rel="stylesheet" href="../style/toolTip.css">
	<script Language="JavaScript" src="../jscripts/calendarControl.js"></script>
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/menu.js"></script>
	<script Language="JavaScript" src="../jscripts/attendance.js"></script>
	<script Language="JavaScript" src="../jscripts/toolTip.js"></script>
	<!-- Tool tip css -->
		<style type="text/css">
		.ToolText{position:relative; }
		.ToolTextHover{position:relative;z-index:1;}
		.ToolText span#showremarks{display: none;}

		.ToolTextHover span#showremarks{
		  display:block;
		  position:absolute;
		  border:1px solid black;
		  /* top:1.3em;*/
		  right:180px;
	      color:white;
		  font-size:8pt;
		  font-family:Verdana, Arial, Helvetica, sans-serif;
		  text-align: justify;
		  width:200px;
		  background-color:#f8f8f8;
		}
		</style>

		<style type="text/css">
		.ToolText{position:relative; }
		.ToolTextHover{position:relative;z-index:1;}
		.ToolText span#showremarksout{display: none;}

		.ToolTextHover span#showremarksout{
		  display:block;
		  position:absolute;
		  border:1px solid black;
		  /* top:1.3em;*/
		  right:198px;
	      color:white;
		  font-size:8pt;
		  font-family:Verdana, Arial, Helvetica, sans-serif;
		  text-align: justify;
		  width:200px;
		  background-color:#f8f8f8;
		}
		</style>
	<!-- Tool tip css ends here-->
</head>
<%
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH);
	//out.println(month);
%>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" onLoad = "validateDate(<%=year%>,<%=(month+1)%>,<%=empNumber%>);" >
	<form name  = "frmAttendance" method = "post">
			<table border = "0" cellspacing="0" cellpadding="0" width = "100%">

			
<%
if(companyCode.equals("1000") && !(deptName.equals("1296") || deptName.equals("1297") || deptName.equals("1298") || deptName.equals("1299") || deptName.equals("1300"))){
%>
			<tr>
				<td class = "redbold" align = "center" colspan = "100%">					
					Please Note:  Attendance Data is available from 16-MAR-2013 onwards
				</td>
			</tr>
<%
}
%>
			<!-- <tr>
				<td class = "small" colspan = "100%">
					<%//@ include file="../includes/leaveBalance.jsp"%>		
				</td>
			</tr> -->
			<tr>
				<td class = "small" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->					
				</td>
			</tr>

			
			<tr>
				<td>
					<%@ include file="../common/viewAttendanceContainer.jsp"%>
				</td>
			</tr>

			<tr>
				<td class = "small" align = "left" colspan = "100%">
					&nbsp;
				</td>  
			</tr>

			
		</table>
		
	</form>
</body>
</html>
