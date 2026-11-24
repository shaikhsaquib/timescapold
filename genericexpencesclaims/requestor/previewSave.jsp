<%--
 -- @(#)medicalReimbursement.jsp	12/3/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 12/3/2008
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>


<%
	GregorianCalendar today = new GregorianCalendar();
	String applyDate		= "";
	String days				= "";
	String amountTotal		= "";
	String amountWords		= "";
	String total			= "";
	String [] billDate		= null;
	String [] billNo		= null;
	String [] billDesc		= null;
	String [] billAmount	= null;
	String [] billAttachment	= null;
	String noOfRows			= request.getParameter("noOfRows");
	int rows				= 0;
	int actualRows			= 0;
	String[] months = {"Month", "January" , "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>B2E</title>
	<link rel="stylesheet" href="../style/global.css">
	<link rel="stylesheet" href="../style/common.css">
	<script Language="JavaScript" src="../jscripts/util.js"></script>
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/previewRequest.js"></script>
</head>
<%
	if(noOfRows!=null){
	rows = Integer.parseInt(noOfRows);
	}
	
	billDate			= new String[rows+1];
	billNo			    = new String[rows+1];
	billDesc			= new String[rows+1];
	billAmount			= new String[rows+1];

	// Get fromDate in the 'YYYY-MM-DD' format
	String applyDay = (String) request.getParameter("applyDay");
	String applyMonth = (String) request.getParameter("applyMonth");
	String applyYear = (String) request.getParameter("applyYear");
	int day = Integer.parseInt(applyDay);
	int month = Integer.parseInt(applyMonth);
	int year = Integer.parseInt(applyYear);
	applyDate = Utility.returnDate(day, month, year);

	int monthNumber =Integer.parseInt(request.getParameter("forMonth"));
	String forMonth= months[monthNumber];
	String forYear = (String) request.getParameter("forYear");

	amountTotal= (String) request.getParameter("amountTotal");
	amountWords= (String) request.getParameter("amountWords");
	total= (String) request.getParameter("total");

	for(int ii=1;ii<=rows;ii++)
		{
		billDate[ii] = request.getParameter("billDate"+ii);
		billNo[ii] = request.getParameter("billNo"+ii);
		billDesc[ii] = request.getParameter("billDesc"+ii);
		billAmount[ii] = request.getParameter("billAmount"+ii);
		billAttachment[ii] = request.getParameter("billAttachment"+ii);
		}

%>
<body>
 <%@ include file="../includes/genericClaimHeader.html" %>
 <%@ include file="../includes/genericClaimMenu.jsp" %> 
	<table width="100%" border="0" cellpadding="2" cellspacing="2">
		<form name="frmPreviewSave" method="post">
		    
			<input type="hidden" name="total" value="<%=total%>">
			<input type="hidden" name="applyDay" value="<%=applyDay%>">
			<input type="hidden" name="applyMonth" value="<%=applyMonth%>">
			<input type="hidden" name="applyYear" value="<%=applyYear%>">
			<input type="hidden" name="forMonth" value="<%=forMonth%>">
			<input type="hidden" name="forYear" value="<%=forYear%>">

	<%		for(int ii=1; ii<=rows ;ii++)
			{if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
	%>		

	<%		}}
	%>
			<tr>
				<td class="whitesmall" bgcolor="#000000" align="center" colspan ="8" height="20" color="#ffffff"> REIMBURSEMENT CLAIM FORM PREVIEW</td>
			</tr>
<tr>
			<td width="16%" align="right" class="bold" height="20" >Name of Company :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=companyName%></td>
			<td width="16%" align="right" class="bold" height="20">Name of Requester :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=fullName%></td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20">PAY ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=payId%></td>
			<td width="16%" align="right" class="bold" height="20">SAP ID :</td>
			<td width="34%" align="left" class="normal" height="20" style="padding-left:10px"><%=sapId%></td>
		</tr>
		<tr>
			<td width="16%" align="right" class="bold" height="20">Designation :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=designation%></td>
			<td width="16%" align="right" class="bold" height="20">Department :</td>
			<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=deptName%></td>
		</tr>
			<tr>
				<td width="16%" align="right" class="bold" height="20"> Date:</td>
				<td width="34%" align="left" class="normal" height="20"style="padding-left:10px"><%=applyDate%></td>
				<td width="16%" align="right" class="bold" height="20">&nbsp;</td>
				<td width="34%" align="left" class="normal" height="20"style="padding-left:10px">&nbsp;</td>
			</tr>
			<tr>
				<td height="25"colspan="100%"><block type="spacer" height="25"></td>
			</tr>
			<tr>
				<td colspan="100%" class="normal">
					<p>Accounts Department<br><br>Please find attached  bills worth Rs.&nbsp;<span class="bold"><%=amountTotal%></span>&nbsp; for Reimbursement of Month&nbsp;<b><%=forMonth%></b>&nbsp;Year&nbsp;<b><%=forYear%></b>&nbsp;Salary
				</td>
			</tr>
			<tr>
				<td height="25"colspan="100%"><block type="spacer" height="25"></td>
			</tr>
			<tr>
				<td colspan="100%">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tr bgcolor="#000000">
							<td class="whitesmall" width="5%"style="border-bottom:1px solid #E8E8E8">SR. NO.</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DATE</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL NO.</td>
							<td class="whitesmall" width="20%"style="border-bottom:1px solid #E8E8E8">BILL DESCRIPTION</td>
							<td class="whitesmall"width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;&nbsp;AMOUNT</td>
							<td class="whitesmall"width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
						</tr>
<%				for(int ii=1;ii<=rows;ii++){
					if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		actualRows++;
%>
						<tr>
							<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8"><%=actualRows%>.</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDate[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billNo[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><%=billDesc[ii]%></td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">Rs.&nbsp;<%=billAmount[ii]%>&nbsp;</td>
							<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;<%=billAttachment[ii]%></td>
							<td class="normal"width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
						</tr>
			<input type="hidden" id="billDate" name="billDate<%=actualRows%>" value="<%=billDate[ii]%>">
			<input type="hidden" id="billNo" name="billNo<%=actualRows%>" value="<%=billNo[ii]%>">
			<input type="hidden" id="billDesc" name="billDesc<%=actualRows%>" value="<%=billDesc[ii]%>">
			<input type="hidden" id="billAmount" name="billAmount<%=actualRows%>" value="<%=billAmount[ii]%>">
			<input type="hidden" id="billAttachment" name="billAttachment<%=actualRows%>" value="<%=billAttachment[ii]%>">

<%
					}	
				}
%>
						 <tr>
							<td class="normal" width="5%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="normal"   width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
							<td class="bold" width="20%"style="border-bottom:1px solid #E8E8E8">TOTAL</td>
							<td class="normal" width="20%"style="border-bottom:1px solid #E8E8E8"><span class="bold">Rs.&nbsp;<%=total%></span></td>
							<td class="normal" width="15%"style="border-bottom:1px solid #E8E8E8">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%"align="center"colspan="7"><a href="javascript:add( )"><img src="../images/but_submit.gif"border="0"><a/>&nbsp;&nbsp;<a href="javascript:history.back()"><img src="../images/but_back.gif" border="0"></a></td>
			</tr>
			<input type="hidden" name="actualRows" value="<%=actualRows%>">
	</form>
	</table>
</body>
</html>