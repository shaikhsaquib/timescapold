<%@ page language="java" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.HashMap,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.util.HtmlUtil"%>
<jsp:useBean id="attendanceController" class="com.bccl.leave.web.controllerbeans.AttendanceController" />

<%!
String months[ ] ={"0","Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
HashMap leaveType =  new HashMap( );
%>

<%
String payid = (String) request.getParameter("payId");

//out.println(payid);


leaveType.put("CL","Casual Leave");
leaveType.put("SL","Sick Leave");
leaveType.put("PL","Privilege Leave");
leaveType.put("HO","Holiday");
leaveType.put("WO","Weekly Off");
leaveType.put("ML","Maternity Leave");
leaveType.put("NL","Nursing Leave");
leaveType.put("PR","Present");
leaveType.put("AB","Absent");
leaveType.put("LP","Leave Without Pay");
leaveType.put("WP","Leave Without Pay");
leaveType.put("W","Weekly Off");
leaveType.put("HF","Half Day");
leaveType.put("CO","Comp Off");
leaveType.put("OD", "Outdoor Duty");
leaveType.put("O", "Outdoor Duty");
leaveType.put("HR", "Regional Holiday");
leaveType.put("OH", "Optional Holiday");
leaveType.put("SP","Accident Leave");

int currMonth = 0;
int lastYear = 0;
String currentMth = "";
int currYear = 0;
String color = "";
GregorianCalendar today = new GregorianCalendar();
String punchYear = "";
String punchMonth = "";
String message = "";

ArrayList attendance = new ArrayList( );
%>

<%
//session.setAttribute("currLink","viewAttendance.jsp");
%>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="/timescape/sapep/employeeselfservice/onlineleave/style/global.css">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<script Language="JavaScript" src="../jscripts/util.js">
		</script>
		<script Language="JavaScript" src="../jscripts/viewAttendance.js">
		</script>
		<form name="frmViewAttendance" method="post">
		<input type="hidden" name ="option">

<%
	currYear = today.get(Calendar.YEAR);
	lastYear = currYear - 1;

	punchYear = request.getParameter("punchYear");
	payId = request.getParameter("payId");
	//out.println(payId);

	String appliedMonth = request.getParameter("appliedMonth");
	//out.println(appliedMonth);

	punchMonth = request.getParameter("punchMonth");
	//out.println(punchMonth);

	String tempMonth = null;
	int temp = 0;
	int tempYear = 0;

	if(punchMonth == null)
	{
		temp = today.get(Calendar.MONTH)+1 ;
		currMonth = temp;
		currentMth = "" + temp;

		if(temp <= 9 )
		{
			tempMonth = "0"+String.valueOf(temp);
		}
		else
		{
			tempMonth = String.valueOf(temp);
		}

		tempYear = today.get(Calendar.YEAR);
	}
	else
	{
		tempMonth = punchMonth;
		currMonth = Integer.parseInt(tempMonth);
		currentMth = tempMonth;

        if(tempMonth.length( )==1)
		{
			tempMonth = "0" + tempMonth;
		}
		tempYear = Integer.parseInt(punchYear);
	}

	String date = tempYear + tempMonth + "%";

	String date1 = appliedMonth + "%";
	//out.println(date1);
//  For e.g. "200802%"
	int lYear =0;
	lYear = tempYear; //Integer.parseInt(punchYear);

//  Changed by Satyajit on 2nd Jan 2007. This code was changed because unable to view attendance of past
//  year. The attendance data is not yet archived. Once it is archived, need to change the code.

	attendance = attendanceController.viewAttendance(legacyCompanyCode, payid, date1,"payid");
    
/*
    if(lYear < currYear){
		attendance = attendanceController.viewArchivedAttendance(companyCode, payId, date,"payId");
	}else{
		attendance = attendanceController.viewAttendance(companyCode, payId, date,"payId");
	}
*/



	if(attendance.size( ) ==0){
		message = "No attendance details found for the specified period !";
	}
%>

<!-- <table width = "100%" border = "0"  align="center" cellspacing="0" cellpadding="1">
	 <tr>
		<td valign = "top">
		 <%//@ include file="../includes/attendance.html" %>  
		</td>
	</tr>
	<tr>
		<td valign = "top">
			  <%//@ include file="../includes/attendanceMenu.jsp" %>  
		</td>
	</tr> 
</table> -->


<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<tr>
		<td colspan="100%" class="whitesmall" height="10">&nbsp;</td>
	</tr>

	<tr class="normal">
		<td colspan="100%" bgcolor="#000000" class="whitesmall" height="20">&nbsp;ATTENDANCE DETAILS FOR &nbsp;<%=months[currMonth]%> &nbsp; <%=tempYear%></td>
	</tr>

	<tr>
		<td colspan="100%" align="right" class="normal"><span class="bold" valign="center">Select Month and Year </span>&nbsp;
			<select name="punchYear" class="normal"><%= HtmlUtil.getYearList(lastYear,currYear, tempYear,"desc")%></select>
			Month <select name="punchMonth" class="normal"><%= HtmlUtil.getMonthList(currentMth) %></select>
			&nbsp;<a href="javascript:viewAttendance( )"><img src="../images/greyarrow.gif" border="0"></a></td>
		</td>
	</tr>


	<tr class="white">
		<td width="2%" align="center" class="white" height="20" bgcolor="#000000">&nbsp;</td>
		<td width="11%" class="white" height="20" bgcolor="#000000">DATE</td>
		<td width="23%" height="20" bgcolor="#000000">CHECK&quot;IN&quot; DETAILS</td>
		<td width="14%" height="10" bgcolor="#000000">1st HALF</td>
		<td width="25%" height="20" bgcolor="#000000">CHECK&quot;OUT&quot; DETAILS</td>
		<td height="20" width="13%" bgcolor="#000000">2nd HALF</td>
		<td height="20" width="12%" bgcolor="#000000">TOTAL HRS</td>
	</tr>

	<tr>
		<td colspan="100%" bgcolor="#CCCCCC" align="center" class="normal" height="20"><%=message%></td>
	</tr>

	<%
		for(int ii=0; ii < attendance.size( ); ii++){
			String attData[ ] = (String[ ]) attendance.get(ii);
			color="normal";

			if( (attData[3].equals("AB")) || (attData[4].equals("AB")) ){
				color="rednormal";
			}
			else if( (attData[3].equals("OD")) || (attData[4].equals("OD")) ){
				color="brownnormal";
			}
			else if( (attData[3].equals("PR")) || (attData[4].equals("PR")) ){
			color="normal";
			}
			else if( (attData[3].equals("SL")) || (attData[4].equals("SL")) ){
			color="rednormal";
			}
			else if( (attData[3].equals("CL")) || (attData[4].equals("CL")) ){
			color="rednormal";
			}
			else if( (attData[3].equals("PL")) || (attData[4].equals("PL")) ){
			color="rednormal";
			}
			else{
			color="bluenormal";
			}
	%>

	<tr>
		<td width="2%" class="normal" align="right" height="30">&nbsp;</td>
		<td width="11%" class="normal" height="30"><%= attData[0] %></td>
		<td width="23%" class="normal"><%=attData[1] %></td>
		<td width="14%" class="<%=color%>"> <%= leaveType.get(attData[3]) %></td>
		<td width="25%" class="normal"><%= attData[2] %></td>
		<td width="13%" class="<%=color%>"><%= leaveType.get(attData[4]) %></td>
		<td width="12%" class="normal"><%= attData[5] %></td>
	</tr>

	<tr>
		<td colspan="100%" class="normal"><hr size="1" color="#EFEFEF"></td>
	</tr>

	<%
		}//for
	%>
</table>

</form>
</body>
</html>