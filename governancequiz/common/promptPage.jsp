




<%--
 -- @(#) promptPage.jsp - 01-Aug-2007 
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments -  Prompt page
 -- @author  -  Vikrant Desai
 -- @version -  1.0
 -- This jsp is used to flash messages to the end-user
 --%>
 
<%@ page import="java.util.Calendar, java.util.GregorianCalendar, java.util.ArrayList" %>

<%
	String msg = "";
	String promptMsg ="";
	String currUrl = "";
	String currUrl1="";

	if(request.getParameter("msg") != null){
		msg = request.getParameter("msg");
	}

	if(msg.equals("ERR LOGIN")){
		promptMsg = "Error while logging on";

	} 
	
	if(msg.equals("SUC ACT")) {
		currUrl = "../identitymanager/activateUser.jsp";
		promptMsg  = "Your activation(s) have been successfully processed." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	} 
	
	if(msg.equals("ERR ACT")) {
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		promptMsg  = "There was an error processing your activation request(s)." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";

	}
	
	if(msg.equals("SUC REG")) {
		currUrl = "../identitymanager/createIdentity.jsp";
		promptMsg  = "Your registration request(s) have been successfully processed." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}
	
	if(msg.equals("MSG REG")) {
		currUrl = "../identitymanager/createIdentity.jsp";
		promptMsg  = "It seems that this user is already a registered Timescape User" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}
	
	if(msg.equals("ERR REG")) {
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		
		promptMsg  = "There was an error processing registration request(s)." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";

	} 
	
	if(msg.equals("SUC SUS")) {
		currUrl = "../identitymanager/suspendIdentity.jsp";
		promptMsg  = "Users have been sucessfully suspended" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}
	
	if(msg.equals("ERR SUS")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		currUrl= "../requestor/cvContribution.jsp";
		promptMsg  = "There was an error processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return to the previous page";

	}
	
	if(msg.equals("SUC MSG")) {
		//currUrl = "../identitymanager/callCentre.jsp";
		currUrl= "../requestor/cvContribution.jsp";
		promptMsg  = "Your Message Was Sucessfully Sent" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}

if(msg.equals("SUC MSG ADMIN")) {
		//currUrl = "../identitymanager/callCentre.jsp";
		currUrl= "../reviewer/cvContribution.jsp";
		promptMsg  = "Your Message Was Sucessfully Sent" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}

	if(msg.equals("ERR SUS ADMIN")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		currUrl= "../reviewer/cvContribution.jsp";
		promptMsg  = "There was an error processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return to the previous page";

	}
	
	if(msg.equals("ERR PRQ")) {
		currUrl = "../identitymanager/createIdentity.jsp";
		promptMsg = "<p align=\"center\">"+ "Sorry , Your registration could not be completed.</p>\n "
							 +" <p align=\"center\">" + "Kindly ensure that your pre-requisites to register for timescape are correctly recorded.</p>\n"
							 + "<hr bgcolor=\"#CCCCCC\">"
							 + "<span class=\"bold\">" + "Pre-requisities for Timescape Registration " +"</span><br><br>"
							 + "<li>&nbsp;&nbsp;8 digit or 4 digit Payroll Id e.g. 00001111, 4212."
							 + "<li>&nbsp;&nbsp;Timesgroup email address e.g. sanjeev.kumar@timesgroup.com."
							 + "<li>&nbsp;&nbsp;Timesgroup email address must be updated with the local Human <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Resource Dept system.<br><br>"
							 + "<span class=\"boldunderline\">" + "Note " +"</span><br>"
							 +"<p align=\"center\">" + "Kindly ensure that your timesgroup email id and your payroll id is correctly recorded with"
							 +" Central Authentication Server (LDAP) and HR Department.<br>Please get in touch with the email"
							 +" administrator and HR Department for the same</p><br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}
	
	if(msg.equals("ERR EID")) {
		currUrl = "../identitymanager/callCentre.jsp";
		promptMsg  = "Please Enter a valid users email id" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	}
	
	if(msg.equals("MSG NOA")) {
		currUrl = "../login/home.jsp";
		promptMsg  = "No Timescape Users pending to be activated." + "<br><br>";
		promptMsg += "<a href = \"" + currUrl + "\" class = \"boldunderline\">home</a>";
	}
	
	if(msg.equals("MSG NOS")) {
		currUrl = "../login/home.jsp";
		promptMsg  = "No Timescape Users pending to be suspended." + "<br><br>";
		promptMsg += "<a href = \"" + currUrl + "\" class = \"boldunderline\">home</a>";
	}
	
	if(msg.equals("SUC REV AUT")) {
		currUrl = "../accessmanager/purgeAccess.jsp";
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";
	}
	
	if(msg.equals("ERR REV AUT")) {
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	
	if(msg.equals("SUC UPD LEV")){
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "click <a href = \"javscript:history.back()\" class = \"boldunderline\">here</a> to return";
	}
	
	if(msg.equals("ERR UPD LEV")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	
	if(msg.equals("SUC PWD CHN")) {
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "click <a href = \"javascript:history.back()\" class = \"boldunderline\">here</a> to return";
	}
	
	if(msg.equals("ERR PWD CHN")) {
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	
	if(msg.equals("SUC CAN LEV")) {
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "click <a href = \"javascript:history.back()\" class = \"boldunderline\">here</a> to return";
	}
	
	if(msg.equals("ERR CAN LEV")) {
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	
	if(msg.equals("ERR EML MSG")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	
	if(msg.equals("SUC EML MSG")){
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "click <a href = \"../callmanager/callCentre.jsp\" class = \"boldunderline\">here</a> to return";	
	}

	if(msg.equals("SUC DEL USR")){
		currUrl = "../identitymanager/manageIdentity.jsp";
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";
	}

	if(msg.equals("ERR DEL USR")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}

	if(msg.equals("SUC ACT USR")){
		currUrl = "../identitymanager/manageIdentity.jsp";
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";
	}

	if(msg.equals("ERR ACT USR")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}

	if(msg.equals("SUC PUR USR")){
		currUrl = "../identitymanager/manageIdentity.jsp";
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";
	}

	if(msg.equals("ERR PUR USR")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}

	if(msg.equals("SUC DIR USR")){
		currUrl = "../identitymanager/createDirUser.jsp";
		promptMsg  = "Your request has been processed successfully" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";
	}

	if(msg.equals("ERR DIR USR")){
		currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";		
		promptMsg  = "There was an error while processing your request." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";
	}
	if(msg.equals("SUC GG REG")) {
		currUrl = "../identitymanager/activateUser.jsp";
		promptMsg  = "Your activation(s) have been successfully processed." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return";

	} 
	
	if(msg.equals("ERR GG ACT")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		//currUrl = "";
		promptMsg  = "There was an error processing your activation request(s)." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to view the exception log";

	}

if(msg.equals("SUC REC")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		currUrl= "../reviewer/cvContribution.jsp";
		currUrl1="../reviewer/updatedDetails.jsp";
		promptMsg  = "File has been moved successfully !" + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return to the previous page"+"<br>";
		 promptMsg += "Please click <a href = \"" + currUrl1 + "\" class = \"boldunderline\">here</a> to view updated details";

	}

	if(msg.equals("NO REC ADMIN")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		currUrl= "../reviewer/cvContribution.jsp";
		promptMsg  = "no records found ." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return to the previous page";

	}

	if(msg.equals("NO REC")) {
		//currUrl = "javascript:void window.open('../logmanager/portalAdminExcepLog.jsp','','menubar=no,scrollbars=yes,width=800,height=650, top=50,left=50')";
		currUrl= "../requestor/cvContribution.jsp";
		promptMsg  = "no records found ." + "<br>";
		promptMsg += "Please click <a href = \"" + currUrl + "\" class = \"boldunderline\">here</a> to return to the previous page";

	}
%>

<html>
<head>
	<title>B2E</title>
	<link rel="stylesheet" href="../style/global.css">
</head>

<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0">
	<form name="frmPrompt" method = "post">
	 <%//@ include file="../includes/dateLine.jsp"%>
		<%//@ include file="../includes/empHeader.jsp"%> 
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%">
			<tr>
				<td class = "normal">
					<%@ include file="../common/promptPageContainer.jsp"%>
				<td>
			</tr>
		</table>
		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>