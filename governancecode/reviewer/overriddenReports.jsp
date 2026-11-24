<%--
 -- Governance Code
 -- @(#)overriddenReports.jsp	11/05/2011
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
<jsp:useBean id="governanceReviewerController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController"/>

<%
	Hashtable overriddenResult = new Hashtable();

	ArrayList reviewerResult = new ArrayList(); 
	ArrayList prevYearResult = new ArrayList(); 

	GregorianCalendar thisDay = new GregorianCalendar( );

	// cuurYear should always be +1 so that query can get records for current and previous year
	String currYear = thisDay.get(Calendar.YEAR)+"";
	String prevYear = thisDay.get(Calendar.YEAR)-1+"";
	//out.println("currYear :" + currYear);
	//out.println("prevYear :" + prevYear);

	String criteria = "overridden";

    if (!companyCode.equals("1000")) {

        deptName = "%";

    }

    if(timescapeUserOId == 28163) {
		deptName = "1002";
	}

	reviewerResult = governanceReviewerController.viewReports(criteria, prevYear, currYear,  companyCode, deptName,timescapeUserOId);
	//out.println("reviewerResult :" + reviewerResult.size());
	// out.println(criteria);
	//String roleCode = "3";

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
						session.setAttribute("currLink", "POLICY OVERRIDDEN REPORT");
						session.setAttribute("leftLink", "2");
%>

							 <table width="100%" height="59" border="0" cellpadding="0" cellspacing="0" >
						<tr><td colspan="10">
							<%@ include file="../includes/governanceCodeMenu.jsp"%></td>
						</tr>
						<tr>
						<td width = "50%" height="10" align="left" valign="middle" class="style1"><div align="left"><span class="menu2"> <!-- From  01-01-2011 to 31-12-2011  --></span></div></td>
							<!-- <td width="72%" colspan="3" align="right" valign="middle" class="style1"><a href="#" onclick="downloadReportForReviewer(<%=2%>, '<%=criteria%>','<%=prevYear%>','<%=currYear%>')"	class="normal">Download All</a></td> -->
							<td width="100%" colspan="0" align="right" class="normal"><a href="#" onclick="downloadReportForReviewer(<%=2%>, '<%=criteria%>','<%=prevYear%>','<%=currYear%>')"><img src="../image/excel.png" border="0"  class="normal" align="right"></a>Download</td>
							</tr>
					</table>
							</td>
							</tr>

					</table>
					

					<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%

		if (reviewerResult.size() > 0) {
%>

                        <tr>      


							<td width="43%" align="left" valign="middle" class="travelMenuBG">POLICY</td>
							<td width="10%" align="left" valign="middle" class="travelMenuBG">CURRENT YEAR NON COMPLIED</td>
							<td width="10%" align="left" valign="middle" class="travelMenuBG">NON COM PLIANCE TEXT</td>
							<td width="15%" align="left" valign="middle" class="travelMenuBG">USER REMARKS</td>
							<td width="15%" align="left" valign="middle" class="travelMenuBG">APPROVER REMARKS</td>
							<td width="15%" align="left" valign="middle" class="travelMenuBG">OVERRIDDEN REMARKS</td>

						</tr>
	</table>
	<div style="height:180px; overflow:scroll">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%		
		int cnt = 0; 
		String userName = "";
		String emailid = "";
		String chklist = "";
		String fromDate ="";
		String toDate ="";
		String userRemarks ="";
		String approverRemarks ="";
		String overriddenRemarks ="";
		String isoverRidden ="";
		String userFeedback = "";
		String lstYearFdbk = "";
		String noncompliancetext = "";
		//String userComplianceStatus ="";
	//out.println(reviewerResult.size());
    for(int i=0;i<reviewerResult.size();i++) 
{	
		cnt = i;
		String[] tmpArr = (String [] )reviewerResult.get(i);

		emailid = (String)tmpArr[15];
		chklist = (String)tmpArr[1];
		fromDate = (String)tmpArr[5];
		toDate = (String)tmpArr[6];
		userRemarks = (String)tmpArr[3];
		userFeedback = (String)tmpArr[2];
		noncompliancetext = (String)tmpArr[15];

		approverRemarks = (String)tmpArr[20];
		overriddenRemarks = (String)tmpArr[21];
		isoverRidden = (String)tmpArr[23];

		//userComplianceStatus = (String)tmpArr[15];    
	
		currYear =  thisDay.get(Calendar.YEAR)-1+"";				
		prevYear =  thisDay.get(Calendar.YEAR)-2+"";

	if(!userName.equals(tmpArr[12])) {
		userName = tmpArr[12];
%>
            
				<tr>
					<td bgcolor="#C0C0C0" width="15%" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=tmpArr[12]%>&nbsp;&nbsp;/&nbsp;&nbsp;<%=tmpArr[17]%></b></td>
				</tr>
<%		

	}

%>	
				<tr <%if((i%2)==0){%>bgcolor="#f8f8f8"<%}%>>	
					<td  width="43%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
					<td  width="10%" align="left" valign="middle" class="style3"><%=tmpArr[2]%></td>
					<td  width="9%"  align="left" valign="middle" class="style3"><%=tmpArr[15]%></td>
					<td  width="16%" align="left" valign="middle" class="style3"><%=tmpArr[3]%></td>
					<td  width="16%" align="left" valign="middle" class="style3"><%=tmpArr[20]%></td>
					<td  width="7%" align="left" valign="middle" class="style3"><%=tmpArr[21]%></td>
                </tr>
            
<%		 
	
		String overriddenResultArr [] = {tmpArr[12], tmpArr[1], tmpArr[2],tmpArr[15], tmpArr[3], tmpArr[20], tmpArr[21]}; 

		overriddenResult.put(i+"",overriddenResultArr);

	
		session.setAttribute("overridden",overriddenResult);
	}
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

