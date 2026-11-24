<%--
 -- Governance Code
 -- @(#)userReport.jsp	11/05/2011
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
    Hashtable userResult = new Hashtable();

	String compCode = (String) request.getParameter("compCode");
	String function = (String) request.getParameter("Function");

	//out.println("function----"+function);

	String prevYear = (String) request.getParameter("prevYear");
	long apprOId    = Long.parseLong((String) request.getParameter("apprOId"));
	String criteria = (String) request.getParameter("criteria");
	//out.println("function=="+function);
	String reportTitle = "";
	int colorCnt = 0;
	String bgColor = "";
	String currYear = "2011";
	String userName = "";

	//String userResultArr [] = new String[];


	ArrayList reviewerResult = new ArrayList(); 
	ArrayList criteriaSel = new ArrayList();
	ArrayList prevYearResult = new ArrayList(); 

	reviewerResult = governanceReviewerController.getSignedOffReport(criteria, prevYear, apprOId, compCode, function);
	//out.println("reviewerResult :" + reviewerResult.size());

	String roleCode= "3";

	if ("C".equals(criteria))
	{
		reportTitle = "Signed Off Report";
	}else if ("I".equals(criteria))
	{
		reportTitle = "Not Signed Off Report";
	}
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
							<td align = "left" class = "style2"><%=reportTitle%></td>
						</tr>
						
						<tr><td align = "right">
						<tr>
						<td width = "50%" height="10" align="left" valign="middle" class="style1" colspan="10"><div align="left"><span class="menu2"> <!-- From  01-01-2011 to 31-12-2011 --> </span></div></td>
						<td width="100%" colspan="0" align="right" class="normal"><a href="#" onclick="downloadReportAll('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=apprOId%>','<%=criteria%>')"><img src="../image/excel.png" border="0"  class="normal" align="right"></a>Download</td>
							<!-- <td width="72%" colspan="3" align="right" valign="middle" class="style1"><a href="#" onclick="downloadReportAll('<%=compCode%>', '<%=function%>','<%=prevYear%>','<%=apprOId%>','<%=criteria%>')"	class="normal">Download All</a></td> -->
							</tr>
	 
							</td>
							</tr> 

					</table>
					

		<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%

		if (reviewerResult.size() > 0){

			if ("C".equals(criteria)) {
						
%>
				<tr> 
					<td width="30%" align="left" valign="middle" class="travelMenuBG">POLICY HEAD</td>
					<td width="30%" align="left" valign="middle" class="travelMenuBG">POLICY</td>
					<td width="15%" align="left" valign="middle" class="travelMenuBG">USER FEEDBACK</td>
					<td width="10%" align="left" valign="middle" class="travelMenuBG">NON COMPLIANCE TEXT</td>
					<td width="15%" align="left" valign="middle" class="travelMenuBG">USER REMARKS</td>
				</tr>

	</table>
	<div style="height:180px; overflow:scroll">
	<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%		
		
		
				for(int i=0;i<reviewerResult.size();i++) {	
				String[] tmpArr = (String [] )reviewerResult.get(i);

					if(!userName.equals(tmpArr[5])) {
						userName = tmpArr[5];
%>
						<tr>
							<td bgcolor="#C0C0C0" height = "30" width="15%" align="left" valign="middle" class="style2" colspan = "100%"><b><%=tmpArr[1]%> / <%=tmpArr[5]%></b></td>
						</tr>
<%		
					}

%>	
				    <tr <%if((i%2)==0){%>bgcolor="#f6f6f6"<%}%>>	

					<td  width="30%" align="left" valign="middle" class="normal"><%=tmpArr[0]%> </td>
					<td  width="32%" align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
					<td  width="16%" align="left" valign="middle" class="normal"><%=tmpArr[3]%></td>
					<td  width="14%" align="left" valign="middle" class="normal"><%=tmpArr[6]%></td>
					<td  width="13%" align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>

					</tr>

<%							
				}
			}
			else if ("I".equals(criteria))
			{
%>

			
				<tr> 
					<td width="100%" align="left" valign="middle"  class="travelMenuBG">User Name / Email Id</td>
				</tr>
			</table>
			<div style="height:180px; overflow:scroll">
			<table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF">
<%int j =0;
				for(int i=0;i<reviewerResult.size();i++) {	
					
				String[] tmpArr1 = (String [] )reviewerResult.get(i);

					if(!userName.equals(tmpArr1[5])) {
						userName = tmpArr1[5];
%>    
						<tr <%if(j%2==0){%>bgcolor="#f6f6f6"<%}%>>
							<td width="15%" align="left" valign="middle" class="normal" colspan = "100%"><b><%=tmpArr1[1]%> / <%=tmpArr1[5]%></b></td>
						</tr>
					
<%		
					j++;} //End of IF..
				
				}	 //End of For..

			} //End of Else ..IF....

		} // End of Main IF....
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
						  <input type="button" name="Return" value="Return" onclick="javascript:history.back();">
					   </td>
					</tr>

				  <tr>
					<td colspan="100%" height="3px" ><block type="spacer" height="1px"></td>
				  </tr>

				</table>
			<p>&nbsp;</p>
		
	</body>
</html>


	