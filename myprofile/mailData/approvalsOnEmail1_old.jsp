<%@page import="java.util.Hashtable, java.util.ArrayList"%>

<jsp:useBean id="tActiveDirectory" class="com.bccl.util.TActiveDirectory" />
<jsp:useBean id="responseIdolAlert" class="com.bccl.responseidol.domain.ResponseIdolAlert"/>

<%
	String getEmailId = "Not";
	
	Cookie[] theCookies = request.getCookies();
	
	if(theCookies != null) {
		for(Cookie tempCookie : theCookies) {
			if("email_Id".equals(tempCookie.getName())) {
				getEmailId = tempCookie.getValue();
			}
		}
	} 
%>

<%
	Hashtable userDetails = new Hashtable();
	userDetails = (Hashtable) session.getAttribute("approverDetailsHash");
	
	String emailId = (String) userDetails.get("emailId");
	String amount = (String) userDetails.get("amount");
	String createdby = (String) userDetails.get("createdby");
	String premiumamt = (String) userDetails.get("premiumamt");

	ArrayList selectNominationAlertReviewerDetails = new ArrayList();
	//selectNominationAlertReviewerDetails = responseIdolAlert.selectResponseidolNominationAlert(userDetails);
	
	/*if(selectNominationAlertReviewerDetails.size() > 0){
		session.setAttribute("checkStatus", "true");
	} else {
		session.setAttribute("checkStatus", "false");
	}*/
	
	/*if(session.getAttribute("checkStatus").equals("true")){
		response.sendRedirect("approvalsUpdated.jsp");
	}*/
%>
		
<%	
	if( emailId != null || emailId != ""){
%>

		<!DOCTYPE html>
		<head>
			<link rel="stylesheet" href="../style/global.css">
			<script src="../jscripts/login.js"></script>
			<script src="../jscripts/jquery.js"></script>
			<script src="../jscripts/common.js"></script>
			<script>
				$(document).ready(function(){
					$("#txtEmailId").attr("disabled",true);
				    $("#divAuthMessage").hide();

				    
					<% 
						if(getEmailId.equals(emailId)){
					%>
							alert("hhh");
							$("#trPassword").hide();
							$("#btnSubmit").val("Submit");
							$("#btnReset").show();
					<%
						} else {
					%>
							alert("ffff");
							$("#trPassword").show();
							$("#btnSubmit").val("Validate");
							$("#btnReset").show();
					<%		
						}
					%>	    
				});
			</script>
			</head>
		<body>
			<form method="post" name="frmApprovals">
				<table align="center" style="text-align:center;" width="100%" cellspacing="5" cellpadding="2">
					<tr>
						<td colspan="2" align="center" valign="middle" ><img src="../images/reponseAwards.jpg" /></td>
					</tr>
					<tr>
						<td colspan="2" >&nbsp;</td>
					</tr>			
					<tr>
						<td width="40%" style="text-align:right;" class="bold">Email Id:</td>
						<td style="text-align:left;"><input class="normal" type="text" name="txtEmailId" id="txtEmailId" value="<%=emailId %>" size="39" disabled></td>
					</tr>
					<tr id="trPassword">
						<td style="text-align:right;" valign="top" class="bold">Password:</td>
						<td style="text-align:left;">
							<input type="password" name="txtPassword" id="txtPassword" class="normal" autocomplete="off" size="39">
							<br><span id="divAuthMessage"></span>							
						</td>
						
					</tr>
					<tr>
						<td colspan="2" align="center" valign="middle" >
							<input type="button" name="btnSubmit" id="btnSubmit" value="Validate" onClick="javascript:fnFormAction()">
							<input type="reset" name="btnReset" id="btnReset" value="Reset" onClick="javascript:fnFormReset()">
						</td>
					</tr>
				</table>
			</form>
		</body>
		</html>
<%
	}
%>