<%--
 -- Business Card Requestor
 -- @(#) requestCards.jsp	12-NOV-2008
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
 -- @version 	1.00, 12-NOV-2008
 --%>


<%@ page language="java" %>  
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
<jsp:useBean id="roleMenuesWebController" class="com.bccl.businesscards.web.controllerbeans.RoleMenuesWebController" />

<%
//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/requestCards.jsp");
	session.setAttribute("topLink", "1");

%>

<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
		<script Language="JavaScript" src="../jscripts/requestCards.js"></script>
		<script Language="JavaScript" src="../jscripts/characterCount.js"></script>
	 </head>
 
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="showAddress(<%=companyCode%>)">
		<form name="frmRequestCards" method="post">
		

<!-- include menu file -->
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>
		<%@ include file="../../../common/adirData.jsp"%>

<%			//out.println(sapId);
			if (companyCode.equals("1000") && (!(deptGroup.equals("1296") || deptGroup.equals("1297") || deptGroup.equals("1298") || deptGroup.equals("1299") || deptGroup.equals("1300") || deptGroup.equals("1498") || deptGroup.equals("1499") || deptGroup.equals("1500") || deptGroup.equals("1501") || deptGroup.equals("1559") || deptGroup.equals("1560") || deptGroup.equals("1581") || deptGroup.equals("1582") || deptGroup.equals("1739") || deptGroup.equals("1740") || deptGroup.equals("1741") || deptGroup.equals("1742") || deptGroup.equals("1743") || deptGroup.equals("1744") || deptGroup.equals("1745") || deptGroup.equals("1746") || deptGroup.equals("1747") || deptGroup.equals("1748") || deptGroup.equals("1749") || deptGroup.equals("1750") || deptGroup.equals("1751") || deptGroup.equals("1752") || deptGroup.equals("1753") || deptGroup.equals("1754") || deptGroup.equals("1755") || deptGroup.equals("1756") || deptGroup.equals("1757") || deptGroup.equals("1758") || deptGroup.equals("1759") || deptGroup.equals("1760") || deptGroup.equals("1761") || deptGroup.equals("1762") || deptGroup.equals("1763") || deptGroup.equals("1764") || deptGroup.equals("1765") || deptGroup.equals("1766") || deptGroup.equals("1767") || deptGroup.equals("1784") || deptGroup.equals("1785") || deptGroup.equals("1786") || deptGroup.equals("1787") || deptGroup.equals("1859") || usersList.contains(sapId) ))){

				String redirectURL	= "../common/businessCardMaintenance.html";
				response.sendRedirect(redirectURL);

%>				
					
<%			}else{
%>
<%

if (!userType.equalsIgnoreCase("VDR")){
		ArrayList locationDetails = new ArrayList();

		locationDetails = businessCardUserWebController.viewLocation(companyCode);


		ArrayList approverList = new ArrayList();
		Hashtable authorityHash = new Hashtable();

		authorityHash.put("roleCode","2");
		authorityHash.put("companyCode",companyCode);
		authorityHash.put("branchCode",branchCode);
		authorityHash.put("locationCode",locationCode);
		authorityHash.put("deptGroup",deptGroup);

		approverList = roleMenuesWebController.selectAuthority(authorityHash);


		Hashtable searchContactHash = new Hashtable();
		searchContactHash.put("emailId", emailId);
		searchContactHash.put("locationCode", locationCode);


		ArrayList contactList = new ArrayList();
		contactList = businessCardUserWebController.view(searchContactHash);

		
		String contactArr[]	= (String[])contactList.get(0);

		String directPhoneNo		= contactArr[4];
		if (directPhoneNo==null || directPhoneNo.equals("null") || directPhoneNo.trim().equals(""))
		{
			directPhoneNo = "-";
		}

		String userBoardNumber		= contactArr[6];
		if (userBoardNumber==null || userBoardNumber.equals("null") || userBoardNumber.trim().equals(""))
		{
			userBoardNumber = "-";
		}

		String extensionNumber		= contactArr[7];
		if (extensionNumber==null || extensionNumber.equals("null") || extensionNumber.trim().equals(""))
		{
			extensionNumber = "-";
		}

		String mobileNumber			= (String)contactArr[9];
		if (mobileNumber==null || mobileNumber.equals("null") || mobileNumber.trim().equals(""))
		{
			mobileNumber = "-";
		}

		String fax					= contactArr[10];
		if (fax==null || fax.equals("null") || fax.trim().equals(""))
		{
			fax = "-";
		}

%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					CREATE REQUEST
				</td>
			</tr>

			<%@ include file="../requestor/requestCardsContainer.jsp" %>

		</table>
		<input type="hidden" name="deptName" value="<%=deptName%>"/>
		
<%
	}else{
			response.sendRedirect("/timescape/includes/unauthorized.html");
	}
%>
		</form>
	</body>
		<%}%>

</html>