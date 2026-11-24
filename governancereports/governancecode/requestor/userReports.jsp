<%--
 -- Governance Code
 -- @(#)functionReport.jsp 07/11/2010
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 07-NOV-2010
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceController" class="com.bccl.governancecode.web.controllerbeans.GovernanceWebController" />

 <%

	GregorianCalendar thisDay = new GregorianCalendar( );
	
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";

	ArrayList governanceReport = new ArrayList(); 
	//String criteria = "nonCompliance";

	governanceReport = governanceController.viewuserReport(timescapeUserOId, prevYear, currYear);
	//out.println("governanceResult :" + governanceReport.size());
	//out.println(timescapeUserOId);

	session.setAttribute("currLink", "../requestor/governanceCode.jsp");
	session.setAttribute("topLink", "2");
    session.setAttribute("leftLink", "1");

	String roleCode = "1";
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../style/governance.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../jscripts/savechklist.js"></script>

</head>

<!-- <%
	 String roleIds = "";
	 String isAttach="";
	 String flag ="";
%> 
 -->
<body>
<form name="frmSaveChklist" method = "post" action = "">

<input type="hidden" name="size" value="<%=governanceReport.size()%>">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <%@ include file="../includes/headerMenu.jsp"%> 

  <tr>
    <td colspan="20">
		<%@ include file="../includes/governanceCodeMenu.jsp"%>
	</td>
  </tr>
  <tr>
    <td height="17" colspan="3" align="center" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
    <td width="72%" colspan="3" align="center" valign="middle" class="style1"><div align="right"></div></td>
  </tr>


<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
 <%
	if (governanceReport.size() > 0){


%>

 <tr>
<!--     <td width="6%" height="26" align="left" valign="middle" bgcolor="#74CAD3" class="style1">No.</td>
 -->    <td width="60%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
    <td width="6%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">COMPLIANCE ASSURED </td>
     <td width="28%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">Remarks (iF ANY) </td>
    </tr>

<%
		String policyHeader = "";
		for(int i = 0; i< governanceReport.size(); i++) {
	
			String[] tmpArr = (String [] )governanceReport.get(i);
			


			if (!policyHeader.equals(tmpArr[6].trim())) {
				
				policyHeader = tmpArr[6].trim();

				//out.println(policyHeader);
%>
				<tr>
					<td bgcolor="#C0C0C0" width="15%" height = "30" align="left" valign="middle" class="style3" colspan = "100%"> <b><%=policyHeader%></b></td>
				</tr>
<%
			}
			 
					
%>	
  
<tr>
<!-- 			 <td bgcolor="#f8f8f8" width="6%" align="left" valign="middle" class="style3"><%=i+1%> </td>
 -->			<td bgcolor="#f8f8f8" width="60%" align="left" valign="middle" class="style3"><%=tmpArr[2]%> </td>	
			<td bgcolor="#f8f8f8" width="6%" align="left" valign="middle" class="style3"><%=tmpArr[3]%> </td> 
			 <td bgcolor="#f8f8f8" width="28%" align="left" valign="middle" class="style3"><%=tmpArr[4]%> </td> 
			 
		</tr>
	<%
				}			

			}else{
%>
			<tr>
					<td bgcolor="#C0C0C0" width="15%" height = "30" align="middle" valign="middle" class="style3" colspan = "100%"> <b>You haven't give feedback to any of the governance compliance</b></td>
				</tr>
<%
			}

%>
	
 
</table>
</table>
<p>&nbsp;</p>
</body>
</html>
