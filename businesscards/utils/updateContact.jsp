<%--
 -- Businee Card
 -- @(#)updateContacts.jsp	04-DEC-2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 04-DEC-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/updateContact.js"></script>
   </head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

        <form name  = "frmUpdateContact" method = "post">
<%
		// Get the Telephone Directory Data
		Hashtable searchHash = new Hashtable( );
		searchHash.put("companyCode", companyCode);
		searchHash.put("payId", payId);
//		searchHash.put("emailId", emailId);
		searchHash.put("locationCode", locationCode);
		ArrayList contactList = businessCardUserWebController.view(searchHash);


		String fstName = "";
		String lstName = "";
		String directPhoneNo = "";
		String directPhoneNo1 = "";
		String boardNumber = "";
		String extensionNumber = "";
		String hotline = "";
		String mobileNumber = "";
		String faxNumber = "";
		String residencePhoneNumber = "";
		int contactListSize = contactList.size();

  if(contactListSize > 0){
		String contactArr[] = (String[])contactList.get(0);

		//fstName = contactArr[2];
		fstName = firstName;
		if(fstName == null){
			fstName = "";
		}

		//lstName  = contactArr[3];
		lstName  = surName;
		if(lstName == null){
			lstName = "";
		}

		directPhoneNo = contactArr[4];
		if(directPhoneNo == null){
			directPhoneNo = "";
		}

		directPhoneNo1 = contactArr[5];
		if(directPhoneNo1 == null){
			directPhoneNo1 = "";
		}


		boardNumber = contactArr[6];
		if(boardNumber == null){
			boardNumber = "";
		}

		extensionNumber = contactArr[7];
		if(extensionNumber == null){
			extensionNumber = "";
		}

		hotline = contactArr[8];
		if(hotline == null){
			hotline = "";
		}

		mobileNumber = contactArr[9];
		if(mobileNumber == null){
			mobileNumber = "";
		}

		faxNumber = contactArr[10];
		if(faxNumber == null){
			faxNumber = "";
		}

		residencePhoneNumber = contactArr[11];
		if(residencePhoneNumber == null){
			residencePhoneNumber = "";
		}

  }

%>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
<input type="hidden" name="contactListSize" value="<%=contactListSize%>"/>
			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					UPDATE CONTACTS
				</td>
			</tr>
			
			<%@ include file="../utils/updateContactContainer.jsp" %>
			
		</table>

		</form>
	</body>
</html>