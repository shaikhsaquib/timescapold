<%--
 -- @(#)searchRequestSubmit.jsp
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%-- Search Declaration Submit Page
 -- Comments
 -- @author Viraj Patil
 -- @version 1.00
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>
		<script Language="JavaScript" src="../jscripts/searchRequestSubmit.js">
        </script>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name  = "frmSearchRequestSubmit" method = "post">
<input type="hidden" name="txnId" value="">
<input type="hidden" name="compCode" value="">
<input type="hidden" name="payId" value="">
<input type="hidden" name="effectiveMonth" value="">
<input type="hidden" name="claimAmount" value="">

<%
	String role = (String)	session.getAttribute("topLink");
	ArrayList searchList = null;

	if(searchList == null){
			
		Hashtable searchHash = new Hashtable();

		// Get the selected search option
		String searchOpt = (String) request.getParameter("searchOpt");

		if(searchOpt.equals("company")){

			String reqCompanyCode = (String) request.getParameter("companyCode");
			//String reqPayId = (String) request.getParameter("payId");
			String sapNumber = (String) request.getParameter("sapNumber");
			
			searchHash.put("companyCode", reqCompanyCode);
			//searchHash.put("payId", reqPayId);
			searchHash.put("sapNumber", sapNumber);

		}else if(searchOpt.equals("emailId")){
			
			String reqEmailId = (String) request.getParameter("emailId");
			reqEmailId = reqEmailId.toLowerCase();

			searchHash.put("emailId", reqEmailId);

		}else if(searchOpt.equals("employeeName")){
			
			String reqEmployeeName = (String) request.getParameter("employeeName");
			int pos = reqEmployeeName.lastIndexOf(" ");

			String reqFirstName = "";
			String reqLastName = "";

			if(pos < 1){
				reqFirstName = reqEmployeeName;
				reqLastName = "";
			}else{
				reqFirstName = reqEmployeeName.substring(0, reqEmployeeName.lastIndexOf(" "));
				reqLastName  = reqEmployeeName.substring(reqEmployeeName.lastIndexOf(" ") + 1, reqEmployeeName.length());
			}

			searchHash.put("firstName", reqFirstName);
			searchHash.put("lastName", reqLastName);
        
        }else if(searchOpt.equals("txnId")){
        
        String reqTxnId = (String) request.getParameter("txnId");
        searchHash.put("txnId", reqTxnId);

		}else{
			// Do Nothing
		}
			
		String tmpStr = timescapeUserOId + "";
		searchHash.put("timescapeUserOID", tmpStr);
		searchHash.put("roleCode", role);
		searchList = vehicleClaimController.searchUser(searchHash);
		//session.setAttribute("results", searchList);
	}
%>
	<%@ include file="../includes/medicalClaimHeader.html" %>
	<%@ include file="../includes/medicalClaimMenu.jsp" %> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="10%" height="20">&nbsp;TXN ID</td>
			<td class="boldsmall" width="15%" height="20">NAME</td>
			<td class="boldsmall" width="10%" height="20">SAP ID</td>
			<td class="boldsmall" width="10%" height="20">DEPARTMENT</td>
			<td class="boldsmall" width="10%" height="20">DESIGNATION</td>
			<td class="boldsmall" width="10%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM AMT</td>
			<td class="boldsmall" width="10%" height="20">PROCESS/VIEW</td>
		</tr>
<%
	String tmpStr[] = null;

	if(searchList == null || searchList.size() == 0)
	{
          if(role.equalsIgnoreCase("2")){
%>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No results found matching the search criteria.<br><br> Please click <a href = "../processor/searchRequest.jsp" class = "boldunderline">here</a> to continue
			</td>
		</tr>
<%
          }else if(role.equalsIgnoreCase("3")){
%>        
        <tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No results found matching the search criteria.<br><br> Please click <a href = "../processor/searchRequest.jsp" class = "boldunderline">here</a> to continue
			</td>
		</tr>

<%      }
	} else {
%>


<!-- 	  <tr>
		 <td height="5" colspan="3"><%//@ include file="../common/pagenation.jsp" %></td>
	  </tr> -->

<%
		String txnIds = "";
		for(int kk=0; kk<searchList.size(); kk++)
		{		
			String[] arr = (String[])searchList.get(kk);
			//out.println("==="+arr[12]);
			txnIds+= arr[12]+",";
%>

		<tr>
			<td class="normal"  height="30">&nbsp;&nbsp;<%=arr[12]%></td>
			<td class="normal"  height="30"><%=arr[6]%></td>
			<td class="normal"  height="30"><%=arr[2]%></td>
			<td class="normal"  height="30"><%=arr[10]%></td>
			<td class="normal"  height="30"><%=arr[11]%></td>
			<td class="normal"  height="30"><%=arr[15]%></td>
			<td class="normal"  height="30">Rs.<%=arr[13]%></td>
<%
			if(arr[14].equals("L")&&(timescapeUserOId!=Long.parseLong(arr[0]))){
%>

			<td class="normal"  height="30">
			<a href="javascript:legacyData(<%=kk%>,'<%=arr[1]%>','<%=arr[2]%>','<%=arr[16]%>',<%=arr[13]%>)" class="normal"><u>process</u></a>
			</td>

<%
			}else{
%>
			<td class="normal" >
			<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="underline">
			<img src="../images/but_viewdetails.jpg" border="0"></a></td>
<%
			}
%>

		</tr>
<%
		}
		txnIds = txnIds.substring(0,txnIds.length()-1);
		session.setAttribute("VEH_IDS", txnIds);
	}
%>
	</table>
</form>
</html>