<%--
 -- @(#)governanceExcelReports1.jsp - 11-APR-2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
<%--
 -- Comments -  This page is called from the Reports 1 Page of Governance.
 -- @author  -  Sachin Mehta
 -- @version -  1.0
 -- This page is used forr initial declaration by employee
 --%>
<%@ page import="java.util.Hashtable,java.util.ArrayList, java.io.PrintWriter,java.util.HashMap"%>
<%@ page import="com.bccl.util.Utility"%>

<%@ include file="../includes/empHeader.jsp"%>

<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController" />
<%
	
	

	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
    String headerStr = "";
	String fileName = "Users Report.csv";
	StringBuffer csvContent = new StringBuffer();
	
	ArrayList<HashMap> completeDashboardData = (ArrayList)session.getAttribute("completeDashboardData");
	HashMap<String,String> dataMap;
	
	String[] xlsDataArray;
	for(int i=0;i<completeDashboardData.size();i++){
		dataMap = (HashMap)completeDashboardData.get(i);
		String[] xlsArray = {dataMap.get("userFullName"),dataMap.get("recommendation"),dataMap.get("implemented"),dataMap.get("notImplemented"),dataMap.get("inProgress"),dataMap.get("noMoreApplicable"),dataMap.get("PercentImplemented")};
		lstXls.add(xlsArray);
	} 
	
	headerStr = "USERFULLNAME, RECOMMENDATION,IMPLEMENTED,NOT IMPLEMENTED,IN PROGRESS,NO MORE APPLICABLE, % IMPLEMENTED \n";
	StringBuffer requests = Utility.toStringBuffer(lstXls, numIndex);
	csvContent.append(headerStr).append(requests);

	PrintWriter writer = null;
	response.setContentType("text/csv");
	response.setHeader("Content-disposition","attachment;filename="+fileName);
	writer = response.getWriter();
	writer.println(csvContent);
	writer.flush();
	writer.close();
			

%>