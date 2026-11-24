<%@ include file="../includes/sessionCheck.jsp" %>

<%@ page import="java.util.Hashtable, java.util.HashMap, java.util.Iterator,java.util.GregorianCalendar,java.util.Calendar, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs,com.bccl.util.HtmlUtil"%>

<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:335px;
	height:160px;
	z-index:1;
	left: 578px;
	top: 180px;
	class: "normal"
	background-color: #D2CE2D;
	background-color: #FF9900;
}
.style1 {
	color: #333333;
	font-size: 11px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style2 {color: #FFFFFF; font-size: 11px; font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; }
body {
	margin-left: 2px;
	margin-top: 2px;
	margin-right: 2px;
	margin-bottom: 2px;
}
.style3 {color: #333333}
-->
        </style>


<%

ArrayList personalDetails = mediclaimController.getPersonalDetails(timescapeUserOID);
double daysCompleted = 0.0;
double validPeriod = 0.0;
//out.println(timescapeUserOID);

%>

<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
<%
	if(!(company.equals("1000") || company.equals("1017") || company.equals("1037"))){

//out.println(company);

         for(int ii=0; ii < personalDetails.size(); ii++){
	
	     String detail[ ] = (String[ ]) personalDetails.get(ii);
%>
	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Company</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[0]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Branch</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[1]%>
		
			<div id="Layer1">
		    <p class="style1"><br>
			<Strong>Note:</strong><BR>
		      Kindly key in your nominees' name and choose the right relationship, date of birth and gender. When you click on the <strong>add</strong> link the information is submitted.</p>
		    <p class="style1">In case you need to change some information, kindly click on the delete link and delete the entire line. Then add a new entry again.</p>
		    <p class="style2"><span class="style3">Do not enter your own profile information.   </span><br>
		    </p>
		  </div>		
		
		</td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Location</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[2]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Department</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[3]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Activity Description</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[4]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Payroll ID</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[5]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">SAP Number</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[6]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Email Id</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[7]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Designation</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[8]%></td>
	</tr>

	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Date Of Birth</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[9]%></td>
	</tr>

<!--
	<tr>
		<td class="bold" height = "30" width = "24%" align="right">Date Of Joining</td>
		<td class="bold" height = "30" width = "6%"><div align="center">:</div></td>
		<td class="small" height = "30" width = "70%"><%=detail[10]%></td>
	</tr>
-->
<%
        daysCompleted =  Double.parseDouble(detail[11]);
        validPeriod = Double.parseDouble(detail[12]);
        //daysCompleted = 555;
        //out.println("her"+detail.length);
        //out.println("her daysCompleted "+daysCompleted);
        
        }
    }
%>
</table>
