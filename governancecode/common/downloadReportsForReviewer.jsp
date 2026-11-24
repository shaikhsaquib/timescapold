<%--
 -- 
 -- @(#)downloadReports.jsp	14/01/2009
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		 Nitin Sharma
 -- @version 	1.00, 22/04/2011
 --%>

<%@ page language="java" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList,java.util.GregorianCalendar,java.util.Calendar,java.io.PrintWriter, java.io.FileWriter" %>
<%//@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%//@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.SQLUtility"%>
<jsp:useBean id="governanceReviewerController" class="com.bccl.governancecode.web.controllerbeans.GovernanceReviewerWebController" /> 
<%	
 
	String currYear = (String)request.getParameter("currYear");
	//String frequency = (String)request.getParameter("frequency");
	String prevYear = (String)request.getParameter("prevYear");
	String criteria = (String)request.getParameter("criteria");
	
	Hashtable reportResult = new Hashtable();
	

		if(criteria.equals("nonCompliance")){
		reportResult = (Hashtable)session.getAttribute("nonCompliance");
	} else if(criteria.equals("department")){
    
		reportResult = (Hashtable)session.getAttribute("department");
	//out.println(reportResult);
    } else if(criteria.equals("overridden")){
    
		reportResult = (Hashtable)session.getAttribute("overridden");
	} else if(criteria.equals("policyWise")){
        
      	reportResult = (Hashtable)session.getAttribute("policy");
		//out.println(reportResult);
	} else if(criteria.equals("policyHeader")){

        reportResult = (Hashtable)session.getAttribute("header");
	}
	else if(criteria.equals("usersAll")){
    
		reportResult = (Hashtable)session.getAttribute("usersAll");
	}

    String policyHead = "";
	String controls = "";
	String userName = "";
	String function = "";
	String functionHead ="";
	String policyOverridden ="";
	String overriddenRemarks ="";
	String userFeedback ="";
	String noncompliancetext ="";
	String userRemarks ="";

	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
	String headerStr = "";


	for (int i=0;i<reportResult.size();i++) {
							
			String tmpArr[] = (String[])reportResult.get(i+"");
				
				policyHead			= (String)tmpArr[0];
				controls			= (String)tmpArr[1];
				userName			= (String)(tmpArr[2]);
				function			= (String)tmpArr[3];
				functionHead		= (String)tmpArr[4];
				policyOverridden	= (String)(tmpArr[5]);
				overriddenRemarks	= (String)(tmpArr[6]);
				userFeedback	    = (String)(tmpArr[7]);
				noncompliancetext   = (String)(tmpArr[8]);
				userRemarks         = (String)(tmpArr[9]);
//				lstYearFdbk			= (String)((tmpArr[6].equals("")||tmpArr[6]==null)?"-":tmpArr[6]);

	
				/*headerStr = "POLICY, USER NAME, USER REMARKS, APPROVER REMARKS, OVERRIDDEN REMARKS,CURRENT YEAR NON COMPLIED, LAST YEAR FEEDBACK \n";*/
				headerStr = "POLICY HEAD, CONTROLS, USER NAME, FUNCTION, FUNCTION HEAD, POLICY OVERRIDDEN(Y/N), OVERRIDDEN REMARKS, USER FEEDBACK, NON COMPLIANCE TEXT, USER REMARKS  \n";
		
				/*String[] xlsArray = {chklist,userName,userRemarks,approverRemarks,overriddenRemarks,userFeedback,lstYearFdbk};*/
				String[] xlsArray = {policyHead,controls,userName,function,functionHead,policyOverridden,overriddenRemarks,userFeedback,noncompliancetext,userRemarks};

				lstXls.add(xlsArray);
				
			}
	
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