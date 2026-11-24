<%--
 -- @(#)searchRequest.jsp
 --
 -- Copyright 2002 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%-- Search MEDICAL REIMBURSEMENT Requests (For Finance)
 -- Comments
 -- @author Viraj Patil
 -- @version 1.00, 4/04/2008
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="medicalClaimController" class="com.bccl.claim.web.controllerbeans.MedicalClaimController" /> 
<jsp:useBean id="listDomainObjectsController" class="com.bccl.domain.web.controllerbeans.ListDomainObjectsController" />
<%
    String role     = (String)	session.getAttribute("medicalClaimRole");

	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/searchRequest.jsp");
	session.setAttribute("topLink", role);
    String compCode="";
    ArrayList companyList  = new ArrayList( );
%>
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>
		 <script Language="JavaScript" src="../jscripts/common.js">
        </script>
        <script Language="JavaScript" src="../jscripts/searchRequest.js">
        </script>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name  = "frmSearchRequest" method = "post">
<input type="hidden" name="searchOpt">

<!-- Search Table -->

	<%@ include file="../includes/genericClaimHeader.html" %>
	<%@ include file="../includes/genericClaimMenu.jsp" %> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="100%" class="bold" align="left" height="30">SEARCH  REIMBURSEMENT REQUEST(S)</td>
		</tr>

		<tr>
			<td colspan="100%" class="normal" align="left" bgcolor="#000000"><img src="../images/spacer.gif" border="0"></td>
		</tr>		
        <tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">Search By Transaction Id </td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Enter Transaction Id</td>
			<td class = "bold" height = "30"   width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width="65%" align="left"><input type = "text" name = "txnId" class = "normal" maxlength = "20"></td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "bold" height = "30" width = "70%" align = "left" colspan = "2">OR</td>
		</tr>
		<tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">Search By Company Code & Pay Id Combination</td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Select Company</td>
			<td class = "bold" height = "30"   width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width="65%" align="left">
<%
    if(role.equals("2")){
        companyList = medicalClaimController.listCompanies(timescapeUserOId);
    }else if(role.equals("3")){
       companyList  = listDomainObjectsController.getCompanyList( );
    }
%>
               <%@ include file="../utils/searchCompanies.jsp"%></td>
		</tr>


		<tr>
			<td class = "normal" height = "30" width = "30%" align = "right">Enter Sap Id</td>
			<td class = "bold" height = "30" width = "5%" align = "center">:</td>
			<td class = "normal" height = "30" width = "65%" align = "left"><input type = "text" name = "sapNumber" class = "normal" maxlength = "8"></td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "bold" height = "30" width = "70%" align = "left" colspan = "2">OR</td>
		</tr>

		<tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">Search By EmailId</td>
		</tr>

		<tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Enter EmailId</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type = "text" name = "emailId" class = "normal" value = "">e.g. timescape.admin@timesgroup.com</td>
		</tr>

		<tr>
			<td class = "normal" height = "30" width = "30%" align = "center">&nbsp;</td>
			<td class = "bold" height = "30" width = "70%" align = "left" colspan = "2">OR</td>
		</tr>

		<tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">Search By Employee Name</td>
		</tr>

		<tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Enter Employee Name</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type = "text" name = "employeeName" class = "normal" value = ""></td>
		</tr>

		<tr>
			<td colspan="3" align="center" height="10"><block type="spacer" height="10"></td>
			<td colspan="3" align="center" height="10"><block type="spacer" height="10"></td>
			<td colspan = "3" align = "center" height="40" valign = "absbottom">&nbsp;</td>
		</tr>

		<tr>
			<td colspan = "3" align = "center" height="40" valign = "absbottom">
				<a href="javascript:validate()"><img src="../images/but_submit.gif" alt="submit" border="0"><a/>&nbsp;&nbsp;
				<a href="javascript:clear()"><img src="../images/but_reset.gif" alt="reset" border="0"></a>
			</td>
		</tr>

		<td colspan="3" align="center" height="10"><block type="spacer" height="10"></td>

	</table>

<!-- Search Table ends-->

</form>
</html>