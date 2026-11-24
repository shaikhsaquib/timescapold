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
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer, java.util.LinkedHashMap, java.util.*" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility,com.bccl.util.HtmlUtil,java.io.PrintWriter,java.io.FileWriter"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>


<%

//String compCode = companyCode;

%>

<%//@ include file="../includes/cardTemplateCode.jsp" %>


<%
	String emailId = (String)request.getParameter("id");
	String searchOpt = (String)request.getParameter("schOpt");

	String frmDate = (String)request.getParameter("frmDD");
	String toDate = (String)request.getParameter("toDD");
	String location = (String)request.getParameter("location");

	Hashtable searchHash = new Hashtable();
	ArrayList searchList = null;
	ArrayList lstXls = new ArrayList();
	ArrayList numIndex = new ArrayList();


	if(searchOpt.equals("date")){

		searchHash.put("frmDate", frmDate);
		searchHash.put("toDate", toDate);
		searchHash.put("location", location);
		searchHash.put("emailId", emailId);
	}
     if(location.equals("ALL")){
		 
		 searchList = businessCardUserWebController.searchProcessor(searchHash,location);
		 session.setAttribute("searchResult", searchList);
		
		}else{
            
		  searchList = businessCardUserWebController.searchProcessor(searchHash);
          session.setAttribute("searchResult", searchList);
		}
	

	if(searchList != null && searchList.size() != 0){

		String headerStr = "\"PROCESSED DATE\",\"DELIVERY CHALLAN NUMBER\",\"CARD TEMPLATE\",\"VENDOR ID\",\"REQUESTED QUANTITY\",\"REQUESTOR DEPARTMENT\",\"REQUESTOR ACTIVITY\",\"REQUEST ID\",\"REQUESTOR NAME\",\"CARD TYPE\",\"COST OF CARDS\",\"VENDOR REMARKS\",\"PROCESSOR REMARKS\",\"DELIVERY CHALLAN DATE\",\"REQUESTOR LOCATION\",\"PERSONALBELIEF\",\"COST CENTER CODE\"" + "\n";

		for (int ii=0;ii<searchList.size();ii++){

			String[] arr = (String[])searchList.get(ii);

			if (! arr[38].equals("0")){

				arr[38] = arr[13];

			}

			//String[] xlsArray = {arr[25],arr[16],arr[10],arr[27],arr[14],arr[37],arr[32],arr[0],arr[1],arr[11],arr[12],arr[29],arr[26],arr[15],arr[37],arr[38]};
			String[] xlsArray = {arr[24],arr[15],arr[10],arr[26],arr[13],arr[36],arr[31],arr[0],arr[1],arr[11],arr[39],arr[28],arr[25],arr[14],arr[37],arr[38],arr[40]};

			lstXls.add(xlsArray);

			numIndex.add(new Integer(0));
			numIndex.add(new Integer(1));
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
			<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="right">
				SEARCH RESULTS OF LOCATION&nbsp;&nbsp;'<%=location%>'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="../includes/downloadReportsProcessor.jsp?id=<%=emailId%>&schOpt=<%=searchOpt%>&frmDD=<%=frmDate%>&toDD=<%=toDate%>&location=<%=location%>" class="whitesmall"><u>Download</u>&nbsp;&nbsp;</a>
			</td>
		</tr>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No data to Download !!<br><br> Please <a href = "../processor/searchRequestProcessor.jsp" class = "boldunderline">Click here</a> to continue
			</td>
		</tr>

		</table>
	</body>
</html>

<%
	}
%>