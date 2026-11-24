<%--
 -- 
 -- @(#)downloadReportsVendor.jsp	06/16/2009
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
 -- @version 	1.00, 06/16/2009
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer, java.util.LinkedHashMap, java.util.*" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility,com.bccl.util.HtmlUtil,java.io.PrintWriter,java.io.FileWriter"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%

String compCode = companyCode;

%>

<%@ include file="../includes/cardTemplateCode.jsp" %>


<%

	String role = (String)request.getParameter("role");

	String status = (String)request.getParameter("sts");
	String cardType =(String)request.getParameter("cardType");

	out.println("cardType="+cardType);

	ArrayList requestList = new ArrayList();
	ArrayList lstXls = new ArrayList();
	ArrayList numIndex = new ArrayList();

	requestList = businessCardUserWebController.viewVendor(timescapeUserOId,role,status,emailId);

	if(requestList != null && requestList.size() != 0){

		String headerStr = "\"REQUESTORNAME\",\"DESIGNATION\",\"WORK AREA\",\"COMPANY NAME\",\"ADDRESS LINE1\",\"ADDRESS LINE2\",\"DIRECT NUMBER\",\"BOARD NUMBER\",\"EXTENSION NUMBER\",\"FAX NUMBER\",\"MOBILE\",\"EMAIL ID\",\"WEBSITE\",\"CARD TYPE\",\"COST OF CARDS\",\"QUANTITY\",\"CARD BRAND\",\"PROCESSORS REMARK\"" + "\n";


		for (int ii=0;ii<requestList.size();ii++){

			String[] arr = (String[])requestList.get(ii);

			String[] xlsArray = {arr[1],arr[2],arr[3],arr[30],arr[26],arr[27],arr[5],arr[4],arr[8],arr[6],arr[7],arr[28],arr[9],arr[31],arr[37],arr[11],(String)deptCode.get(arr[10]),arr[21]};


			lstXls.add(xlsArray);

			numIndex.add(new Integer(6));
			numIndex.add(new Integer(7));
			numIndex.add(new Integer(8));
			numIndex.add(new Integer(9));
			numIndex.add(new Integer(10));
			numIndex.add(new Integer(14));
		}

		StringBuffer nominees = Utility.toStringBuffer(lstXls, numIndex);
		StringBuffer csvContent = new StringBuffer();
		csvContent.append(headerStr).append(nominees);
		
		String fileName = "Business Card Details.csv";

		PrintWriter writer = null;
		response.setContentType("text/csv");
		response.setHeader("Content-disposition","attachment;filename="+fileName);

		writer = response.getWriter();
		writer.println(csvContent);

		writer.flush();
		writer.close();
	}else{
%>
<html>
	<head>
		<title> B2E </title>
		<link rel="stylesheet" href="../style/global.css">
		<link rel="stylesheet" href="../style/common.css">
		<script Language="JavaScript" src="../jscripts/util.js"></script>
	 </head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="20" align="center">
					PROCESS REQUESTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../includes/downloadReportsVendor.jsp?role=5&sts=P" class="whitesmall"><u>Download</u></a>
				</td>
			</tr>
			<tr>
				<td height="40"><img src="../images/spacer.gif"/></td>
			</tr>
			<tr>
				<td colspan="100%" class="normal" height="20" align="center">
					No data to Download !!
				</td>
			</tr>
		</table>
	</body>
</html>

<%
	}
%>