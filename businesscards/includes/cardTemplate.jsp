<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<%
    String cardTemplate			= (String)request.getParameter("cardTemplate");
    String firstName1			= (String)request.getParameter("firstName");
    String lastName				= (String)request.getParameter("lastName");
    String designation1			= (String)request.getParameter("designation");
    String activityName1		= (String)request.getParameter("activityName");
    String addressLine1			= (String)request.getParameter("addressLine1");
    String addressLine2			= (String)request.getParameter("addressLine2");
    String directPhoneNo		= (String)request.getParameter("directPhoneNo");
    String mobileNumber			= (String)request.getParameter("mobileNumber");
    String fax					= (String)request.getParameter("fax");
	String userBoardNumber		= (String)request.getParameter("userBoardNumber");
 	String extensionNumber		= (String)request.getParameter("extensionNumber");
	String workArea				= (String)request.getParameter("workArea");
	String department				= deptName;
    String userEmail			= emailId;
	String compName				= (String)request.getParameter("compName");
	String website				= (String)request.getParameter("website");

%>
<%@ include file = "../includes/listCardTemplate.jsp" %>