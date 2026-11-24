<%--
 -- Governance Code
 -- @(#)policyReports.jsp	11/05/2011
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
 -- @version 	1.00, 11-MAY-2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceReviewerController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" />

<%
	Hashtable policyResult = new Hashtable();

	ArrayList reviewerResult = new ArrayList(); 
	ArrayList prevYearResult = new ArrayList();

	GregorianCalendar thisDay = new GregorianCalendar( );

	// cuurYear should always be +1 so that query can get records for current and previous year
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";


	String criteria = "policyWise";
    
    if(timescapeUserOId == 28163) {

		companyCode = "1004";
	
	}
	reviewerResult = governanceReviewerController.viewReports(criteria, prevYear, currYear, companyCode, deptName);
	
	String roleCode = "3";

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
		<script Language="JavaScript" src="../jscripts/report.js"></script>
		<script Language="JavaScript" src="../jscripts/common.js"></script>

	</head>

<% 
	String roleIds = "";
	String isAttach="";
	String flag ="";
%> 

		<body>
			<form name="frmSaveChklist" method = "post" action = "">

				<input type="hidden" name="size" value="<%=reviewerResult.size()%>">
				<%@ include file="../includes/headerMenu.jsp"%>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
<%
						session.setAttribute("currLink", "POLICY WISE NON COMPLIANCE REPORT");
						session.setAttribute("leftLink", "1");
%>

							 <table width="100%" height="59" border="0" cellpadding="0" cellspacing="0" >
						<tr><td colspan="10">
							<%@ include file="../includes/governanceCodeMenu.jsp"%></td>
						</tr>
						<tr>
						 <td width = "50%" height="10" align="left" valign="middle" class="style1"><div align="left"><span class="menu2"> <!-- From  01-01-2011 to 31-12-2011 --> </span></div></td> 
							<td width="98%" colspan="3" align="right" valign="middle" class="style1"><a href="#" onclick="downloadReportForReviewer(<%=1%>, '<%=criteria%>','<%=prevYear%>','<%=currYear%>')"	class="normal">Download All</a></td>
							</tr>
					</table>
							</td>
							</tr>

					</table> 
					

					<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%

	if (reviewerResult.size() > 0){
%>


			<tr>   
				<td width="20%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY HEAD</td>
				<td width="27%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">CONTROLS</td>
				<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER NAME</td>
				<td width="16%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">FUNCTION</td>
				<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">FUNCTION HEAD</td>                  
				<td width="3%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY OVERRIDDEN (Y/N)</td>
				<td width="5%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">OVERRIDDEN REMARKS</td>
			</tr>

	</table>
	<div style="height:180px; overflow:scroll">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
				
<%  
	String policyHeader = "";
	String policy = "";
	String departmentCode = "";
	String userName = "";
	String userFeedback = "";
	String lstYearFdbk = "";
	String emailid = "";
	String chklist = "";
	String fromDate ="";
	String toDate ="";
	String userRemarks ="";
	String approverRemarks ="";
	String overriddenRemarks ="";
	String isOverridden = "";
	long chkRow = 0;
	//String userComplianceStatus ="";
  
    
	for(int i=0;i<reviewerResult.size();i++) 
    {
	String[] tmpArr = (String [] )reviewerResult.get(i);
	userRemarks = (String)tmpArr[3];
	approverRemarks = (String)tmpArr[20];
	overriddenRemarks = (String)tmpArr[21];
	userFeedback = (String)tmpArr[2];
	chklist = (String)tmpArr[1];
	
	//out.println("policy----"+policy);
	//out.println("chkRow----"+chkRow);
     
				if ( !policy.equals(tmpArr[1]) && chkRow > 0 ) {
					
					chkRow = 0;
%>
				<tr>
						<td colspan="8" align="left" valign="middle" bgcolor="#999999"class="style3"><img src="../images/spacer.gif" width="1" height="0.5"></td>
				</tr>
<%				
				}
%>
				<tr>
					
<%
				if ( !policy.equals(tmpArr[1]) ) {

				    policy = tmpArr[1];
					
					chkRow = 1;
					//out.println("chkRow----"+chkRow);
     
%>
					  <td width="19%" align="left" valign="middle" bgcolor="#f8f8f8" class="style3"><%=tmpArr[16]%></td>
					  <td bgcolor="#f8f8f8" width="26%" align="left" valign="middle" class="style3"><%=tmpArr[1]%></td>
<%
				}else if (policy.equals(tmpArr[1])) {
%>
					<td width="19%" align="left" valign="middle" bgcolor="#f8f8f8" class="style3"></td>
					<td bgcolor="#f8f8f8" width="25%" align="left" valign="middle" class="style3"></td>
<%					
				}
%>					
					<td width="15%" align="left" valign="middle" bgcolor="#f8f8f8" class="style3"><%=tmpArr[12]%></td>
					<td width="15%" align="left" valign="middle" bgcolor="#f8f8f8" class="style3"><%=tmpArr[14]%></td>
					<td width="12%" bgcolor="#f8f8f8"  align="left" valign="middle" class="style3"><%=tmpArr[13]%></td>
<%
					if ("NA".equals(tmpArr[23])) {
						
						isOverridden = "No";

					} else {

						isOverridden = tmpArr[23];
					}
%>
					<td width="8%" align="left" valign="middle" bgcolor="#f8f8f8" class="style3"><%=isOverridden%></td>

					<td width="5%" bgcolor="#f8f8f8"  align="left" valign="middle" class="style3"><%=tmpArr[21]%></td>
					
<%	
					
		String policyResultArr [] = {tmpArr[16], tmpArr[1], tmpArr[12], tmpArr[14], tmpArr[13], isOverridden,tmpArr[21]}; 

		policyResult.put(i+"",policyResultArr);
	}
		//out.println("policyResult="+policyResult);
		session.setAttribute("policy",policyResult);

	}
	else{

%>

			<table width="100%" >
				<tr>
					<td bgcolor="#f8f8f8" width="46%" align="center" valign="middle" class="style3">There are no records available for the selected criteria!!!</td>
				</tr>
			</table>
<%
	}
%>
			</table>
		</div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
					   <td colspan="3" class="normal" height="30px">&nbsp;
					   </td>
					</tr>
					<tr bgcolor="#FFFFFF">
					   <td colspan="100" align="center" class="normal">&nbsp;
						  <input type="button" name="Return" value="Return" onclick="javascript:history.back()">
					   </td>
					</tr>

				  <tr>
					<td colspan="100%" height="3px" ><block type="spacer" height="1px"></td>
				  </tr>

					</table>
			<p>&nbsp;</p>
		
		</body>
	</html>
