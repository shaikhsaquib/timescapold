<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@page import="com.bccl.profile.web.util.Constants,com.bccl.util.Breadcrumbs"%>


<%
String message = "";
String param = (String) request.getParameter("msg");
String currUrl = "";

if(param.equals("1")){
	currUrl = "../profile/viewProfile.jsp";
	message = "Your Personal Details have been filed successfully with the Human Resource Systems.<br><br><br>We thank you for your support and time."+
						  "<br><br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to view your Personal Information";
}

if(param.equals("2")){
	currUrl = "../profile/viewQualifications.jsp";
	message = "Your Qualification Details have been filed successfully with the Human Resource Systems.<br><br><br>We thank you for your support and time."+
						  "<br><br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to view your Qualification Information";
}

if(param.equals("3")){
	currUrl = "../profile/viewExperience.jsp";
	message = "Your Experience Details have been filed successfully with the Human Resource Systems.<br><br><br>We thank you for your support and time."+
						  "<br><br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to view your Employment History";
}

if(param.equals("4")){
	currUrl = "javascript:history.go(-2)";
	message = "Your request has been successfully sent to the Human Resource Department.<br><br><br>We thank you for your support and time."+
						  "<br><br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}

if(param.equals("6")){
	currUrl = "../profile/viewProfile.jsp";
	message = "Sorry,  There was an error while processing your request. "+
                         "<br><br>Please try again after some time " +
						  "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}
if(param.equals("7")){
	currUrl = "../search/search.jsp";
	message = "No Results were found using you search criteria. "+
                         "<br><br>Try searching using another criteria " +
						  "<br><br><a href=\""+currUrl+"\" class=\"boldunderline\">click here</a> to return";
}
String breadcrumbs = Breadcrumbs.get("myProfileBreadcrumbs","promptPage.breadcrumb");
%>
<html>
<head>
<title>B2E</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/timescape/sapep/myprofile/style/global.css">
</head>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
	<form name="frmAck" method="post">
		<%@ include file="../includes/empHeader.jsp" %>

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
