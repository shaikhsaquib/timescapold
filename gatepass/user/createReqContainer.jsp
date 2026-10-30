<%--
 -- gatepass
 -- @(#) checkStatus.jsp		23-JUN-2013
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Kavita Yadav
 -- @version 	1.00, 23-JUN-2013
 --%>
 
 <%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar, java.util.Date, java.util.StringTokenizer, java.io.*,java.text.SimpleDateFormat,java.text.ParseException"%>
<%@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="com.bccl.util.Utility,com.bccl.util.HtmlUtil"%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<jsp:useBean id="listDomainObjectsController" class="com.bccl.enterprise.web.controller.DomainObjectsWebController" />

<%
	
	String months[ ] ={"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};
	GregorianCalendar today = new GregorianCalendar();
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	//String  todayMon = String.valueOf(today.get(Calendar.MONTH)+1);
	String todayMon = months[today.get(Calendar.MONTH)+1];
	int  todayYear = today.get(Calendar.YEAR);

	String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;
   
   // out.println("aaaadayMonYear=="+dayMonYear);

	String gatepassVal = (String)request.getParameter("gatepassValue");
	String outWardNumber = (String)request.getParameter("outReferenceNum");

	ArrayList locationsList			= new ArrayList();
	ArrayList approversList			= new ArrayList();
	ArrayList reviewersList         = new ArrayList();
	ArrayList reviewersOptionalList = new ArrayList();
	ArrayList unitsList				= new ArrayList();
	Hashtable criteriaHash			= new Hashtable();

	Hashtable requestsHash			= new Hashtable();

	requestsHash.put("GATEPASSVAL", gatepassVal);
	requestsHash.put("OUTWARDNUMBER", outWardNumber);

	locationsList = listDomainObjectsController.listLocations(criteriaHash);
	unitsList = GatepassController.getUnits();

	criteriaHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	criteriaHash.put("ROLECODE", "2");
	criteriaHash.put("WORKFLOWTYPE", "10");
	criteriaHash.put("COMPANYCODE", companyCode);
	criteriaHash.put("BRANCHCODE", branchCode);
	criteriaHash.put("LOCATIONCODE", locationCode);
	criteriaHash.put("DEPARTMENT", deptName);
	criteriaHash.put("STATUS", "A");

	//out.println(criteriaHash);

	reviewersList = GatepassController.getReviewers(criteriaHash);
	
	criteriaHash.remove("ROLECODE");
	criteriaHash.put("ROLECODE", "3");
	//out.println(criteriaHash);

	approversList = GatepassController.getApprovers(criteriaHash);

	reviewersOptionalList = GatepassController.getReviewersOptionList(branchCode,locationCode);

	//requestsList = GatepassController.getGatepassRefRequests(requestsHash);

	String tmpOptList[] = (String[])reviewersOptionalList.get(0);

	
%>