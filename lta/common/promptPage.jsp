<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@page import="com.bccl.leave.web.util.Constants,com.bccl.leave.web.util.Utility,com.bccl.util.Breadcrumbs"%>

<jsp:useBean id="leaveController" class="com.bccl.leave.web.controllerbeans.LeaveController" />

<%
String message = "";
String param = (String) request.getParameter("msg");
String currUrl = "";

if(param.equals("1")){
	currUrl = (String)session.getAttribute("currLink");
	message = "No records found matching your search criteria. <br> <br> Please try a different criteria. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">back</a>";

}
if(param.equals("2")){
	session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = "Sorry , It seems you have already applied for leave in the selected period !!! "+
						  "<br> Kindly change your leave period appropriately "+
						  "<br><a href=\""+"javascript:history.back( )"+"\" class=\"boldunderline\">click here</a> to return";
}
if(param.equals("3")){
	currUrl = "../requestor/checkLeaveStatus.jsp";
	message = "Your leave application has been filed successfully. "+
						  "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to view its status";
}

if(param.equals("4")){
	currUrl = "../requestor/applyForLeave.jsp";
	message = "Sorry, There was an error filing your leave application. "
						+"<br>Please try again later. "
						+"<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("5")){
	currUrl = "../requestor/checkLeaveStatus.jsp";
	message = "Your leave application has been cancelled successfully. "+
						  "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("6")){
	session.removeAttribute("pendingAppl");
	currUrl = "../requestor/checkLeaveStatus.jsp";
	message = "You have processed the leave applications successfully. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("7")){
	session.removeAttribute("pendingAppl");
	//currUrl = "../approver/approveLeave.jsp";
	currUrl = "../authoriser/authoriseLeave.jsp";
	message = "Sorry, There was an error while processing one of the leave applications. "
						+"<br>Please try again later. "
						+"<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("8")){
	currUrl = "javascript:history.back( )";
	message = "Sorry, There was an error while processing your request. "
						+"<br>Please try again later. "
						+"<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("9")){
	currUrl = "../authoriser/selectParameters.jsp";
	message = "Sorry, There was an error while processing the leave applications. "
						+"<br>Please try again later. "
						+"<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("10")){
	session.removeAttribute("params");
	currUrl = "../authoriser/selectParameters.jsp";
	message = "Your request was processed successfully. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("11")){
	session.removeAttribute("reverter");
	currUrl = "../authoriser/cancelApprLeave.jsp";
	message = "Your leave application has been cancelled successfully. "+
						  "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("12")){
	currUrl = "../authoriser/viewExceptions.jsp";
	message = "Your request was processed successfully. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("13")){
	currUrl = "javascript:history.back( )";
	message = "Casual Leave cannot exceed 3 days. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("14")){
	currUrl = "javascript:history.back( )";
	message = "Privilege Leave cannot be less than 4 days. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("15")){
	currUrl = "javascript:history.back( )";
	message = "Nursing Leave cannot exceed 30 days. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("16")){
	currUrl = "javascript:history.back( )";
	message = "Maternity Leave cannot exceed 84 days. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("17")){
	session.removeAttribute("pendingAppl");
	currUrl = "../authoriser/authoriseLeave.jsp";
	message = "You have processed the leave applications successfully. "+
						 "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("18")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = "Sorry Comp Off cannot be club with PL, SL or OH." +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
} else if(param.equals("19")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = "Weekly OFF/Holidays should be included in Leave Application if it is prefixed AND suffixed with any leave type." +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
} else if(param.equals("20")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = "Sorry Optional Holiday cannot be club with PL, SL." +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
} else if(param.equals("21")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = " Sorry PL cannot be taken consecutively with CL, CO, CH and CL cannot be taken consecutively with PL, CO, CH" +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}else if(param.equals("22")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = " Weekly OFF/Holidays should be included in Leave Application if it is prefixed AND suffixed with any leave type." +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}else if(param.equals("23")){
	//session.removeAttribute("leaveDet");
	session.setAttribute("currLink","../requestor/applyForLeave.jsp");
	currUrl = (String) session.getAttribute("currLink");
	message = "Sorry your Leave cannot exceed your Leave quota" +
                         "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

String breadcrumbs = Breadcrumbs.get("leaveBreadcrumbs","promptPage.breadcrumb");
%>
<html>
<head>
	<title>B2E</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" href="/timescape/sapep/employeeselfservice/onlineleave/style/global.css">
</head>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
	<form name="frmAck" method="post">
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td valign = "top">
					<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
						<tr>
							<td><img src = "../images/spacer.gif" height = "50"></td>
						</tr>
						<tr>
							<td colspan="100%" align="center" class="normal">&nbsp;<%=message%></td>
						</tr>
						<tr>
							<td><img src = "../images/spacer.gif" height = "50"></td>
						</tr>
						</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>