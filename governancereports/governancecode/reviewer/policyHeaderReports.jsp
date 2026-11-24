<%--
 -- Governance Code
 -- @(#)policyHeaderReports.jsp	11/05/2011
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
	Hashtable headerResult = new Hashtable();

	ArrayList reviewerResult = new ArrayList(); 
	ArrayList prevYearResult = new ArrayList();
	String criteria = "policyHeader";

	GregorianCalendar thisDay = new GregorianCalendar( );

	// cuurYear should always be +1 so that query can get records for current and previous year
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";


	timescapeUserOId = 0;
	reviewerResult = governanceReviewerController.viewReports(criteria, prevYear, currYear, companyCode, deptName);
	//out.println("reviewerResult :" + reviewerResult.size());

	

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
		
							session.setAttribute("currLink","REPORT");
							session.setAttribute("leftLink","1");
	%>
<!-- 							<%@ include file="../includes/reportTabs.jsp"%> </td>
 -->						</tr>
							<tr>
							<td colspan="20">
<%
						session.setAttribute("currLink", "POLICY HEADER REPORT");
						session.setAttribute("leftLink", "3");
%>

							 <table width="100%" height="59" border="0" cellpadding="0" cellspacing="0" >
						<tr><td colspan="10">
							<%@ include file="../includes/governanceCodeMenu.jsp"%></td>
						</tr>
						<tr>
						<td width = "50%" height="10" align="left" valign="middle" class="style1"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
							<td width="72%" colspan="3" align="right" valign="middle" class="style1"><a href="#" onclick="downloadReport(<%=1%>, '<%=criteria%>','<%=prevYear%>','<%=currYear%>')"	class="normal">Download All</a></td>
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


					<td width="45%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
					<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">CURRENT YEAR NON COMPLIED</td>
					<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER REMARKS</td>
					<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">APPROVER REMARKS</td>
					<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">OVERRIDDEN REMARKS</td>
					
					<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">LAST YEAR FEEDBACK</td>

				</tr>
<%  
		String policyHeader = "";
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
		//String userComplianceStatus ="";



		for(int i=0;i<reviewerResult.size();i++) 
{
		String[] tmpArr = (String [] )reviewerResult.get(i);
		userRemarks = (String)tmpArr[3];
		userFeedback = (String)tmpArr[2];
		emailid = (String)tmpArr[15];
		chklist = (String)tmpArr[1];
		fromDate = (String)tmpArr[5];
		toDate = (String)tmpArr[6];
		approverRemarks = (String)tmpArr[20];
		overriddenRemarks = (String)tmpArr[21];

	if (tmpArr[2].equals(tmpArr[15]) ) {


			currYear =  thisDay.get(Calendar.YEAR)-1+"";				
			prevYear =  thisDay.get(Calendar.YEAR)-2+"";

			prevYearResult = governanceReviewerController.viewPrevYearFdbk(tmpArr[22], tmpArr[0],  prevYear, currYear);


	if (!policyHeader.equals(tmpArr[16])) {

			policyHeader = tmpArr[16];
%>
				<tr>
					<td bgcolor="#COCOCO" height = "30" width="15%" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=tmpArr[16]%></b></td>
				</tr>
<%
	}

	if(!userName.equals(tmpArr[12])) {
		userName = tmpArr[12];
%>

				<tr>
					<td bgcolor="" height = "30" width="15%" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=tmpArr[12]%>&nbsp;&nbsp;/&nbsp;&nbsp;<%=tmpArr[17]%></b></td>
				</tr>
<%  }

%>
				<tr>			

					<td bgcolor="#f8f8f8" width="45%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[2]%></td>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[3]%></td>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[20]%></td>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[21]%></td>

<%		 
		if (prevYearResult.size()>0) {

			String prevYearResultArr [] = (String [])prevYearResult.get(0);
			lstYearFdbk = prevYearResultArr[0];


%>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=lstYearFdbk%></td>	

<%
} else {
				lstYearFdbk = "-";

%>
					<td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=lstYearFdbk%></td>	
				</tr>


<%	}
	}
		String headerResultArr [] = {chklist, tmpArr[12], userRemarks, approverRemarks, overriddenRemarks, userFeedback, lstYearFdbk}; 

		headerResult.put(i+"",headerResultArr);
	}
		session.setAttribute("header",headerResult);
	}

%>

				</table>
		<p>&nbsp;</p>
	</body>
</html>
