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

	String userName				= "";
	String policy				= "";
	String currentYearNC		= "";
	String userRemarks			= "";
	String ApproverRemarks		= "";
	String overriddenRemarks	= "";
	String noncompliancetext	= "";

	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
	String headerStr = "";

	if (reportResult.size() > 0) {
	for (int i=0;i<reportResult.size();i++) {
							
			String tmpArr[] = (String[])reportResult.get(i+"");			
				
				userName			= (String)(tmpArr[0]);
				policy				= (String)tmpArr[1];
				currentYearNC		= (String)tmpArr[2];
				userRemarks			= (String)tmpArr[4];
                noncompliancetext   = (String)tmpArr[3];
				ApproverRemarks		= (String)(tmpArr[5]);
				overriddenRemarks	= (String)(tmpArr[6]);
	
				headerStr = "USER NAME,POLICY, CURRENT YEAR NON COMPLIED, USER REMARKS, APPROVER REMARKS, OVERRIDDEN REMARKS,NON COMPLIANCE TEXT \n";
	
				String[] xlsArray = {userName,policy,currentYearNC,userRemarks,ApproverRemarks,overriddenRemarks,noncompliancetext};

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
	}
	
		
%>	