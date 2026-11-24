<%--
 -- @(#)nomineesAdded.jsp	12/3/2008
 --
 -- Copyleft 2004 BCCL. All lefts Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Manisha Wadhawane
 -- @version 	1.00, 12/3/2008
 -- @comment	Download List of Nominees added in select Month and Year
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.io.PrintWriter, java.util.*, java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.profile.web.util.Constants, com.bccl.util.Utility"%>

<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.util.GregorianCalendar,java.util.Calendar,java.text.DecimalFormat" %>
<%@ page import = "java.io.*,jxl.*,java.util.*,jxl.write.DateFormat" %>
<%@ page import = "java.text.SimpleDateFormat"%>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.util.Locale" %>
<%@ page import = "jxl.CellView" %>
<%@ page import = "jxl.Workbook" %>
<%@ page import = "jxl.WorkbookSettings" %>
<%@ page import = "jxl.format.UnderlineStyle" %>
<%@ page import = "jxl.write.Formula" %>
<%@ page import = "jxl.write.Label" %>
<%@ page import = "jxl.write.Number" %>
<%@ page import = "jxl.write.WritableCellFormat" %>
<%@ page import = "jxl.write.WritableFont" %>
<%@ page import = "jxl.write.WritableSheet" %>
<%@ page import = "jxl.write.WritableWorkbook" %>


<%@ page import = "jxl.write.WriteException" %>

<jsp:useBean id="mediclaimController" class="com.bccl.profile.web.controllerbeans.MediclaimController" />

<%
ArrayList resultList  = new ArrayList();
ArrayList numIndex = new ArrayList();
ArrayList lstXls = new ArrayList(); 
Hashtable detailsHash = new Hashtable();
String headerStr = "";

String compCode = (String)session.getAttribute("compCode");
//out.println("compCode-"+compCode);

String fileName = "TopUpAmountReport.csv";
 
	String testYear = (String)session.getAttribute("faYear");
	long timescapeUserOID = Long.parseLong(profile.get("timescapeUserOID") + "");
	
	detailsHash.put("timescapeUserOID",(timescapeUserOID+""));
	detailsHash.put("currYear",testYear);
	detailsHash.put("compCode",compCode);
	resultList = mediclaimController.viewReports(detailsHash); 
	//out.println(resultList.size());

	//Put the index of numbers in Hashtable
	
	numIndex.add(new Integer(0));
	//Convert details in StringBuffer to write through PrintWriter
	headerStr = "\"Existing Insured Amount\",\"Top-Up Amount\",\"Premium Amount\",\"Total Cover\",\"Financial Year\",\"Declared On\",\"SAP Id\",\"Declared By\"" + "\n";
	StringBuffer nominees = Utility.toStringBuffer(resultList, numIndex);
	StringBuffer csvContent = new StringBuffer();
	csvContent.append(headerStr).append(nominees);
	PrintWriter writer = null;
	response.setContentType("text/csv");
	response.setHeader("Content-disposition","attachment;filename="+fileName);

	writer = response.getWriter();
	writer.println(csvContent);

	writer.flush();
	writer.close();
%>
