<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.HashMap, java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil,com.bccl.tsenvironment.EnvironmentProperties"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>


<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<script>
			function closeWindow() {

				var frmObj = document.frmRequestCardSubmit;

				self.opener.document.forms[0].mobileNumber.value = frmObj.mobileNumber.value;
				self.opener.document.forms[0].directPhoneNo.value = frmObj.directPhoneNo.value;
				self.opener.document.forms[0].userBoardNumber.value = frmObj.userBoardNumber.value;
				self.opener.document.forms[0].extensionNumber.value = frmObj.extensionNumber.value;
				self.opener.document.forms[0].fax.value = frmObj.fax.value;

				self.close();
				self.opener.focus();
			}
		</script>
   </head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

	<form name="frmRequestCardSubmit" method="post">

<%
	Hashtable updateHash = new Hashtable( );
	//String firstName = "";
	String lastName = "";
	String countryCode = "";
	String areaCode = "";
	String directPhoneNo = "";
	String directPhoneNo1 = "";
	String boardNumber = "";
	String extensionNumber = "";
	String hotline = "";
	String mobileNumber = "";
	String faxNumber = "";
	String residencePhoneNumber = "";
%>
<%
	profile = (Hashtable) session.getAttribute("userHash");
	companyCode = (String) profile.get("companyCode");
	payId = (String) profile.get("payId");
	branchCode = (String) profile.get("branchCode");
	locationCode = (String) profile.get("locationCode");

	// Get the details from the form
	String contactListSize = request.getParameter("contactListSize");

	firstName 				= request.getParameter("firstName");
	if(firstName != null) {
		updateHash.put("firstName",Utility.replaceQuoteOracle(firstName));
	}

	lastName 				= request.getParameter("lastName");
	if(lastName != null) {
		updateHash.put("lastName",Utility.replaceQuoteOracle(lastName));
	}

	directPhoneNo 			= (directPhoneNo == null ? directPhoneNo = "" : request.getParameter("directNumber"));
	if(directPhoneNo != null) {
		updateHash.put("directPhoneNo",Utility.replaceQuoteOracle(directPhoneNo));
	}

	directPhoneNo1 			= request.getParameter("directNumber2");
	if(directPhoneNo1 != null) {
		updateHash.put("directPhoneNo1",Utility.replaceQuoteOracle(directPhoneNo1));
	}

	boardNumber 			= request.getParameter("boardNumber");
	if(boardNumber != null) {
		updateHash.put("directPhoneNo2",Utility.replaceQuoteOracle(boardNumber));
	}

	extensionNumber 		= request.getParameter("extensionNumber");
	if(extensionNumber != null) {
		updateHash.put("extension",Utility.replaceQuoteOracle(extensionNumber));
	}

	hotline 				= request.getParameter("hotline");
	hotline = "";
	if(hotline != null) {

		updateHash.put("hotline",Utility.replaceQuoteOracle(hotline));
	}

	faxNumber 				= request.getParameter("faxNumber");
	if(faxNumber != null) {
		updateHash.put("fax",Utility.replaceQuoteOracle(faxNumber));
	}

	mobileNumber 			= request.getParameter("mobileNumber");
	if(mobileNumber != null) {
		updateHash.put("mobile",Utility.replaceQuoteOracle(mobileNumber));
	}

	residencePhoneNumber 	= request.getParameter("residenceNumber");
	if(residencePhoneNumber != null) {
		updateHash.put("residencePhoneNo",Utility.replaceQuoteOracle(residencePhoneNumber));
	}

	updateHash.put("payId",payId);
	updateHash.put("locationId",locationCode);
	updateHash.put("branchId",branchCode);
	updateHash.put("maintainedBy", payId);
	updateHash.put("contactListSize",contactListSize);
	updateHash.put("companyCode",companyCode);
	updateHash.put("branchCode",branchCode);
	updateHash.put("locationCode",locationCode);
	updateHash.put("activityCode",activityCode);
	//out.println(updateHash);

	boolean status = false;
		
	status = businessCardUserWebController.updateContact(updateHash);
		//status = businessCardUserWebController.insertContact(updateHash);

%>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
				UPDATE CONTACTS
			</td>
		</tr>

		<tr>
			<td colspan = "100%" align = "center">&nbsp;</td>
		</tr>

		<tr>
<%
	if(status)
	{
%>
			<td align="center" class="normal">
				Your contacts were successfully updated.<br>Click <a href="javascript:closeWindow()" class="underline">here</a> to close this window</br>
			</td>
<%
	}
	else
	{
%>
			<td align="center" class="normal">
				"Sorry, There was an error while processing your request.<br><a href="../utils/updateContact.jsp">Click here</a> to try again.
			</td>
<%
	}
 %>
		</tr>

		<input type = "hidden" name = "directPhoneNo" value = "<%=directPhoneNo%>"/>
		<input type = "hidden" name = "userBoardNumber" value = "<%=boardNumber%>"/>
		<input type = "hidden" name = "extensionNumber" value = "<%=extensionNumber%>"/>
		<input type = "hidden" name = "fax" value = "<%=faxNumber%>"/>
		<input type = "hidden" name = "mobileNumber" value = "<%=mobileNumber%>"/>

	</table>
	</form>
	</body>
</html>