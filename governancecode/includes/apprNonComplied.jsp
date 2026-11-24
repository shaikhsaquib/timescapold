<%--
 -- Governance Code
 -- @(#)apprNonComplied.jsp	11/05/2011
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
	String compCode = (String) request.getParameter("compCode");
	String function = (String) request.getParameter("Function");
	String prevYear = (String) request.getParameter("prevYear");
	String currYear = (String) request.getParameter("currYear");
	//String criteria = (String) request.getParameter("criteria");
	String criteria = "department";



	ArrayList reviewerResult = new ArrayList(); 

	int colorCnt = 0;
	String bgColor = "";
	
	reviewerResult = governanceReviewerController.viewReports("approver", prevYear, currYear);
	//out.println("reviewerResult :" + reviewerResult.size());

	String roleCode= "3";
%>

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Governance Code Report</title>
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


			<body>
			<form name="frmSaveChklist" method = "post" action = "">

				

					<%@ include file="../includes/headerMenu.jsp"%>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						
						<tr>
						<td width = "50%" height="10" align="left" valign="middle" class="style1" colspan="10"><div align="left"><span class="menu2"> From  01-01-2011 to 31-12-2011 </span></div></td>
							<td width="72%" colspan="3" align="right" valign="middle" class="style1"><a href="#" onclick="downloadReport(<%=1%>, '<%=criteria%>','<%=prevYear%>','<%=currYear%>')"	class="normal">Download All</a></td>
							</tr>
	 
							</td>
							</tr> 

					</table>
					

					<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%

		if (reviewerResult.size() > 0){
%>


				<tr>   


					<td width="45%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">POLICY</td>
					<td width="12%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER FEEDBACK</td>
					<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">USER REMARKS</td>
					<!-- <td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">APPROVER REMARKS</td> -->
					<td width="15%" align="left" valign="middle" bgcolor="#74CAD3" class="style1">OVERRIDDEN REMARKS</td>
					
					
				</tr>
<%		
		int cnt = 0; 
				String apprName = "";
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
//out.println(criteriaSel);	
//out.println(function);	
	for(int i=0;i<reviewerResult.size();i++) {	
		cnt = i;
		String[] tmpArr = (String [] )reviewerResult.get(i);

		userFeedback = (String)tmpArr[2];
		emailid = (String)tmpArr[15];
		chklist = (String)tmpArr[1];
		fromDate = (String)tmpArr[5];
		toDate = (String)tmpArr[6];
		userRemarks = (String)tmpArr[3];
		approverRemarks = (String)tmpArr[20];
		overriddenRemarks = (String)tmpArr[21];

		//userComplianceStatus = (String)tmpArr[15];
//out.println("<br>"+ tmpArr[2] + " "+ tmpArr[15]);
		
		if (!tmpArr[21].equals("-")  && function.equals(tmpArr[14].trim())){
//out.println("<br>"+ tmpArr[14] + " "+ tmpArr[22]);

			 if (colorCnt%2==0) {
			        
					bgColor="#F8F8F8";

             } else {

				   bgColor = "#E9F7F8";

			 }
					  
			colorCnt++;
			
				if (!apprName.equals(tmpArr[13])) {

			apprName = tmpArr[13];
%>
			<tr>
				<td bgcolor="#DAFIF3" height = "30" width="15%" align="left" valign="middle" class="name" colspan = "100%"> <b><%=apprName%></b></td>
			</tr>
<%
	}
			if(!userName.equals(tmpArr[12])) {
				userName = tmpArr[12];
%>
				<tr>
					<td bgcolor="#C0C0C0" height = "30" width="15%" align="left" valign="middle" class="style2" colspan = "100%"> <b><%=tmpArr[12]%>&nbsp;&nbsp;/&nbsp;&nbsp;<%=tmpArr[17]%></b></td>
				</tr>
<%		

			}

%>	
				<tr>	

			<!-- 	 <td bgcolor="#f8f8f8" width="45%" align="left" valign="middle" class="style3"><%=i+1%> </td>  -->
					<td  bgcolor="<%=bgColor%>" width="45%" align="left" valign="middle" class="style3"><%=tmpArr[1]%> </td>
					<td bgcolor="<%=bgColor%>" width="10%" align="left" valign="middle" class="style3"><%=userFeedback%></td>
					<!-- <td bgcolor="#f8f8f8" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[15]%></td> -->
					<td  bgcolor="<%=bgColor%>" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[3]%></td>
					<!-- <td  bgcolor="<%=bgColor%>" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[20]%></td> -->
					<td  bgcolor="<%=bgColor%>" width="10%" align="left" valign="middle" class="style3"><%=tmpArr[21]%></td>
					
				</tr>	
<%	
			}
		}
	}
%>

				<tr>
					   <td colspan="3" class="normal" height="30px">&nbsp;
					   </td>
					</tr>
					<tr bgcolor="#FFFFFF">
					   <td colspan="100" align="center" class="normal">&nbsp;
						  <input type="button" name="Return" value="Return" onclick="javascript:history.go(-1)">
					   </td>
					</tr>

				  <tr>
					<td colspan="100%" height="3px" ><block type="spacer" height="1px"></td>
				  </tr>

				</table>
			<p>&nbsp;</p>
	</body>
</html>

