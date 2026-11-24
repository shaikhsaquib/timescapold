<%--
 -- 
 -- @(#)searchRequestSubmit.jsp	04/06/2009
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
 -- @version 	1.00, 04/06/2009
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility,com.bccl.util.HtmlUtil,java.io.PrintWriter,java.io.FileWriter"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<%
	String role = (String)session.getAttribute("businessCardRole");

	Hashtable profile =  (Hashtable)session.getAttribute("userHash");

	String companyCode 		    = (String) profile.get("companyCode");
	//out.println(companyCode);
	String compCode = companyCode;

	if(compCode.equals("BCCL")){
		compCode = "01";
	}
%>

<%@ include file="../includes/cardTemplateCode.jsp" %>


<%
	String emailId = (String)request.getParameter("id");
	String searchOpt = (String)request.getParameter("schOpt");
	String challanNo = (String)request.getParameter("chNo");
//	String frmDay = (String)request.getParameter("frmDD");
//	String frmMonth = (String)request.getParameter("frmMM");
//	String frmYear = (String)request.getParameter("frmYY");
//	String toDay = (String)request.getParameter("toDD");
//	String toMonth = (String)request.getParameter("toMM");
//	String toYear = (String)request.getParameter("toYY");

	String frmDate = (String)request.getParameter("frmDD");
	String toDate = (String)request.getParameter("toDD");

	Hashtable searchHash = new Hashtable();
	ArrayList searchList = null;
	ArrayList lstXls = new ArrayList();
	ArrayList numIndex = new ArrayList();

	if(searchOpt.equals("challanNo")){

		searchHash.put("challanNo", challanNo);
		searchHash.put("emailId", emailId);

	}else if(searchOpt.equals("date")){

//		String frmDate = frmMonth+"/"+frmDay+"/"+frmYear;
//		String toDate = toMonth+"/"+toDay+"/"+toYear;

		searchHash.put("frmDate", frmDate);
		searchHash.put("toDate", toDate);
		searchHash.put("emailId", emailId);
	}

	searchList = businessCardUserWebController.searchUser(searchHash);

	if(searchList != null && searchList.size() != 0){

		String headerStr = "\"REQUESTORNAME\",\"DESIGNATION\",\"WORK AREA\",\"COMPANY NAME\",\"ADDRESS LINE1\",\"ADDRESS LINE2\",\"DIRECT NUMBER\",\"BOARD NUMBER\",\"EXTENSION NUMBER\",\"FAX NUMBER\",\"MOBILE\",\"EMAIL ID\",\"WEBSITE\",\"CARD TYPE\",\"QUANTITY\",\"COST OF CARDS\",\"CARD BRAND\",\"CHALLAN DATE\",\"CHALLAN NUMBER\",\"PROCESSORS REMARK\",\"VENDOR REMARK\"" + "\n";


		for (int ii=0;ii<searchList.size();ii++){

			String[] arr = (String[])searchList.get(ii);

			String[] xlsArray = {arr[1],arr[2],arr[3],arr[33],arr[34],arr[35],arr[5],arr[4],arr[8],arr[6],arr[7],arr[36],arr[9],arr[11],arr[14],arr[12],(String)deptCode.get(arr[10]),arr[15],arr[16],arr[26],arr[29]};

			lstXls.add(xlsArray);

			numIndex.add(new Integer(6));
			numIndex.add(new Integer(7));
			numIndex.add(new Integer(8));
			numIndex.add(new Integer(12));
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
		<tr >
			<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="center">
				SEARCH RESULTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../includes/downloadReports.jsp?id=<%=emailId%>&schOpt=<%=searchOpt%>&chNo=<%=challanNo%>&frmDD=<%=frmDate%>&toDD=<%=toDate%>" class="whitesmall"><u>Download</u></a>
				<!-- <a href="../includes/downloadReports.jsp?id=<%//=emailId%>&schOpt=<%//=searchOpt%>&chNo=<%//=challanNo%>&frmDD=<%//=frmDay%>&frmMM=<%//=frmMonth%>&frmYY=<%//=frmYear%>&toDD=<%//=toDay%>&toMM=<%//=toMonth%>&toYY=<%//=toYear%>">Download</a> -->
			</td>
		</tr>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No data to Download !!<br><br> Please <a href = "../utils/searchRequest.jsp" class = "boldunderline">Click here</a> to continue
			</td>
		</tr>

		</table>
	</body>
</html>

<%
	}
%>