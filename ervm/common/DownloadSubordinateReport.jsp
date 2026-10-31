
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
		String[] xlsArray = {dataMap.get("COMPANY_NAME"),dataMap.get("DEPARTMENT_NAME"),dataMap.get("PERCENT_IMPLEMENTED"),dataMap.get("TERVML_RECOMMENDATIONS"),dataMap.get("TERVML_RECOMMENDATIONS_DUE"),dataMap.get("TERVML_IMPLEMENTED"),dataMap.get("TERVML_NOT_IMPLEMENTED"),dataMap.get("TERVML_IN_PROGRESS"),dataMap.get("TERVML_NO_MORE_APPLICABLE")};
		lstXls.add(xlsArray);
	} 
	
	headerStr = "COMPANY_NAME, DEPARTMENT_NAME,PERCENT_IMPLEMENTED,TERVML_RECOMMENDATIONS,TERVML_RECOMMENDATIONS_DUE,TERVML_IMPLEMENTED,TERVML_NOT_IMPLEMENTED,TERVML_IN_PROGRESS,TERVML_NO_MORE_APPLICABLE \n";
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