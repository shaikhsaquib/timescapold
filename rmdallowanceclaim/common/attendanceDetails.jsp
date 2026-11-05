<%--
 -- @(#)attendanceDetails.jsp - 07-JULY-2012
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is used to fetch the attendance details of a user
 -- @author  -  Vikrant Desai/ Sachin Mehta/ Yogesh Kadam
 -- @version -  1.0
 -- This page is included in createLeave.jsp
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Vector,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.util.HtmlUtil"%>
<%@ include file = "../includes/hashStatus.jsp" %>
<%@ include file = "../includes/empHeader.jsp"%>		
<jsp:useBean id="employeeController" class="com.bccl.timemanagement.web.controllerbeans.EmployeeWebController" />


<%	

	String months[ ]			= {"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
	
	String week[ ]				= {"0", "SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" };

	GregorianCalendar today		= new GregorianCalendar();

	//String currDay				= week[today.get(Calendar.DAY_OF_WEEK)];

	String currDate				= today.get(Calendar.DAY_OF_MONTH) + "";

	int currYear				= today.get(Calendar.YEAR);
	
	String currMonth			= today.get(Calendar.MONTH) + 1 +"" ;

	if ( currDate.length() == 1 ) {

		currDate	=	0	+	currDate;

	}
	
	ArrayList attendanceList	=	new ArrayList();
	
	String selMonth				=	( String ) request.getParameter("selMonth");
	
	String selYear				=	( String ) request.getParameter("selYear");

	String empNumber1			=	( String ) request.getParameter("empNumber");

	

	if ( !selMonth.equals(currMonth) ) {
		
		Calendar calCurr = GregorianCalendar.getInstance();
		calCurr.set(Integer.parseInt(selYear), (Integer.parseInt(selMonth))-1, 1); // Months are 0 to 11
		currDate	=	calCurr.getActualMaximum(GregorianCalendar.DAY_OF_MONTH) + "";

	}

	String fromDate				=	"01"	 +	"-"	+	months[Integer.parseInt(selMonth)]	+ "-"	+ selYear;
	String toDate				=	currDate +  "-"	+	months[Integer.parseInt(selMonth)]	+ "-"	+ selYear;


	
	attendanceList				=	employeeController.getEmpAttendanceDetails( empNumber1, fromDate, toDate );
	
	
	//out.println( monthYear + "---"+ attendanceList.size() );
%>


<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8"><img src="../images/spacer.gif" width="1" border="0"></td>
	</tr>
	<tr >
		<td bgcolor = "#FFFFFF" class = "small"  width = "15%" height="40" align = "left">DATE</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "10%" height="40" align = "left">DAY</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "10%" height="40" align = "left">IN</td>
		<td bgcolor = "#FFFFFF" class = "small"  width = "18%" height="40" align = "left">EXCEPTION</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "10%" height="40" align = "left">OUT </td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "20%" height="40" align = "left">EXCEPTION</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "10%" height="40" align = "left">REGULAR HRS</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "12%" height="40" align = "left">DEFICIT HRS</td>
		<td bgcolor = "#FFFFFF"  class = "small"  width = "10%" height="40" align = "left">UNAPPROVED HRS</td>
	</tr>
	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8"><img src="../images/spacer.gif" width="1" border="0"></td>
	</tr>

<%
	if ( attendanceList.size() > 0 ) {

		String	inTime			=	"";
		String	outTime			=	"";
		String	inException		=	"";
		String	outException	=	"";
		String	fhLeave			=	"";
		String	shLeave			=	"";
		String	workingHours	=	"";
		String	regularHours	=	"";
		String	defictHours		=	"";
		String	excusedHours	=	"";
		String	extraHours		=	"";
		String	unapprovedHours	=	"";
		
		for ( int i = 0; i < attendanceList.size(); i++ ) {

			String tmpArr[]	=	( String [] ) attendanceList.get(i);
			
			inTime			= "";

			outTime			= "";

			inException		=	(tmpArr[8]== null)?"-":tmpArr[8];
			
			outException	=	(tmpArr[9]== null)?"-":tmpArr[9];
			
			regularHours	=	(tmpArr[12]== null)?"-":tmpArr[12];
			
			defictHours		=	(tmpArr[13]== null)?"-":tmpArr[13];
			
			unapprovedHours	=	(tmpArr[14]== null)?"-":tmpArr[14];

			if ( !(tmpArr[10] == null  || tmpArr[10].equals("") )) {

				inTime = ( String ) leaveDesc.get(tmpArr[10]);	
			
			} else if (!(tmpArr[6] == null || tmpArr[6].equals(""))) {
					
				inTime = (tmpArr[6] != null)?tmpArr[6]:"-";	

			} else if( ( tmpArr[4] != null  ) && tmpArr[4].equals("WO") )  {

				inTime = "WEEKLY OFF";
			
			} else if( ( tmpArr[4] != null  ) && tmpArr[4].equals("OH") )  {

				inTime = "Optional Holiday";

			} else if( ( tmpArr[4] != null  ) && tmpArr[4].equals("CO") )  {

				inTime = "Comp Off Availed";								

			}  else if( ( tmpArr[4] != null  ) && tmpArr[4].equals("HOLIDAY") )  {
				
				inTime = tmpArr[4];

			} else {

				inTime = "-";

			}

			if ( tmpArr[11] != null ) {

				outTime = ( String ) leaveDesc.get(tmpArr[11]);	
			
			}  else if( tmpArr[7] != null ) {

				outTime = (tmpArr[7] != null)?tmpArr[7]:"-";	

			} else if( ( tmpArr[5] != null  ) && tmpArr[5].equals("WO") )  {

				outTime = "WEEKLY OFF";
			
			} else if( ( tmpArr[5] != null  ) && tmpArr[5].equals("OH") )  {

				outTime = "Optional Holiday";

			} else if( ( tmpArr[5] != null  ) && tmpArr[5].equals("CO") )  {

				outTime = "Comp Off Availed";

			} else if( ( tmpArr[5] != null  ) && tmpArr[5].equals("HOLIDAY") )  {
				
				outTime = tmpArr[5];

			} else {

			   outTime = "-";
			}
			
%>
				
			<tr>
				<td bgcolor = "#FFFFFF" class = "small" height = "30" align = "left"><%= tmpArr[2] %></td>
				<td bgcolor = "#FFFFFF" class = "small"	height = "30" align = "left"><%= tmpArr[3] %></td>
				<td bgcolor = "#FFFFFF" class = "small"	height = "30" align = "left"><%= inTime %></td>

<%			//out.println(tmpArr[18]);
			if( !inException.equals("-") ) {

%>
			    <td bgcolor = "#FFFFFF" class="small"><%= inException %></span></td>

<%
			} else {
%>
				 <td bgcolor = "#FFFFFF" class = "small"><%= inException %></td>
<%
			}
%>
				<td bgcolor = "#FFFFFF" class = "small"			height = "30" align = "left" ><%= outTime %></td>
<%
			if( !outException.equals("-") ) {
%>
				<td bgcolor = "#FFFFFF" class="small"><%= outException %></span></td>
				
<%
			} else {
%>
				<td bgcolor = "#FFFFFF" class = "small"><%= outException %></td>
<%				
			}
%>
				<td bgcolor = "#FFFFFF" class = "small"			height = "30" align = "left"><%= regularHours %></td>
				<td bgcolor = "#FFFFFF" class = "small"			height = "30" align = "left"><%= defictHours %></td>
				<td bgcolor = "#FFFFFF" class = "small"			height = "30" align = "left"><%= unapprovedHours %></td>
				
				<input type= "hidden" name = "attendanceDate<%= i %>" value = "<%= tmpArr[2] %>" />
			</tr>
			<tr>
				<td colspan="100%" class="small" bgcolor="#E8E8E8"><img src="../images/spacer.gif" width="1" 		 border="0"></td>
			</tr>
	
<%
		} // END OF for LOOP

	} else {
%>	
	
	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8" height = "10"><img src="../images/spacer.gif" width="1" border="0"></td>
	</tr>
	<tr>
		<td colspan="100%" class="small" bgcolor="#E8E8E8" align = "center">No Attendance details found for the specific period!</td>
	</tr>

<%
	}
%>
	<input type= "hidden" name = "fromDate" />
</table>
