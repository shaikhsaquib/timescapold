<%--
 -- 
 -- @(#)searchRequest.jsp	10/Sept/2009
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
 -- @version 	1.00, 10/Sept/2009
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.Date" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility , com.bccl.util.HtmlUtil"%>

 
<%
// Set session attribute for the link of current page
	session.setAttribute("currLink", "../processor/searchRequestProcessor.jsp");
//	session.setAttribute("topLink", "5");
%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
<jsp:useBean id="domainObj" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />

<%
    //String location = "ALL";
    Hashtable criteriaHash = new Hashtable();
	criteriaHash.put("COMPANYCODE", companyCode);
	ArrayList locationList = new ArrayList();
	locationList = domainObj.listLocations(criteriaHash);

%>

<html>
	<head>
		<title>B2E--Search Request</title>
		<link rel="stylesheet" href="../style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>
        <script Language="JavaScript" src="../jscripts/searchRequestProcessor.js"></script>
		<script src="../jscripts/calendarControl.js"language="javascript"></script>
		<link href="../style/calendarControl.css"rel="stylesheet">
	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	
	<form name  = "frmSearchRequest" method = "post">
	
		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<!-- Set hidden field -->
	<input type="hidden" name="searchOpt" value=""/>

<!------------------------------------------------------ Search Table Begins -------------------------------------------------------->

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="center">
				SEARCH
			</td>
		</tr>

		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

        <tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">Search By Challan Date</td>
		</tr>

		<tr>
			<td height="5"colspan="100%"><block type="spacer" height="25"></td>
		</tr>
<%
	Date cal = new Date();
	String todaysDate	= cal.getDate()+"";
	String todaysMonth	= cal.getMonth()+"";
	int todaysYear		= cal.getYear()+1900;
	
%>
	     <tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Select From Challan Date</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type="text" size="40px" class="normal" id="frmDate" name="frmDate" onfocus="showCalendarControl(this);" readOnly></td>

		</tr>

		<tr>
			<td height="10"colspan="100%"><block type="spacer" height="25"></td>
		</tr>

	     <tr>
			<td class = "normal" height = "20" width = "30%" align = "right">Select To Challan Date</td>
			<td class = "bold"  height = "20" width = "5%" align = "center">:</td>
			<td class = "normal" height = "20" width = "65%" align = "left"><input type="text" size="40px" class="normal" id="toDate" name="toDate" onfocus="showCalendarControl(this);" readOnly></td>
		</tr>

		 <tr>
	
     <td class = "normal" height = "20" width = "30%" align = "right">Location</td>
	 <td class = "bold"  height = "20" width = "5%" align = "center">:</td>
     <td height="30" colspan="4" align="left" valign="middle" class="normal"><select name="location" class="small" id="location">
       <option value="0">Select Locations</option>
	    <option value="ALL" selected>ALL</option>
<%
	for(int ii=0; ii<locationList.size();ii++){
		String tmpArr[] = (String[])locationList.get(ii);
%>
       <option value="<%=tmpArr[5]%>"><%=tmpArr[8]%></option>

<%
	 }
%>
</select></td>
   </tr>

		
		<tr>
			<td class = "bold" height = "30" colspan = "3" align = "left">&nbsp;</td>
		</tr>

		<tr>
			<td colspan = "3" align = "center" height="40" valign = "absbottom">
				<a href="javascript:validate()"><img src="../images/but_submit.gif" alt="submit" border="0"><a/>&nbsp;&nbsp;
				<a href="javascript:clear()"><img src="../images/but_reset.gif" alt="reset" border="0"></a>
			</td>
		</tr>


	</table>

<!------------------------------------------------------ Search Table Ends ---------------------------------------------------------->

	</form>
</html>