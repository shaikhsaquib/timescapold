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
    Hashtable userResult = new Hashtable();

	String compCode = (String) request.getParameter("compCode");
	String function = (String) request.getParameter("Function");

	String prevYear = (String) request.getParameter("prevYear");
	long apprOId    = Long.parseLong((String) request.getParameter("apprOId"));
	String criteria = (String) request.getParameter("criteria");
	String reportTitle = "";
	int colorCnt = 0;
	String bgColor = "";
	String currYear = "2011";

	ArrayList reviewerResult = new ArrayList(); 
	ArrayList criteriaSel = new ArrayList();
	ArrayList prevYearResult = new ArrayList(); 

	reviewerResult = governanceReviewerController.getSignedOffReport(criteria, prevYear, apprOId, compCode, function);

	String roleCode= "3";

	String userName = "";
	String userEmailID = "";
	String userNameForNotSignedOff = "";
	String policyHead = "";
	String policy = "";
	String userFeedback = "";
	String noncompliancetext = "";
	String userRemarks ="";
	
	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
	String headerStr = "";


	
		for(int i=0;i<reviewerResult.size();i++) {	


				
			String[] tmpArr = (String [] )reviewerResult.get(i);
				
				userName			= (String)tmpArr[1];
				userEmailID			= (String)tmpArr[5];
				policyHead			= (String)tmpArr[0];
				policy				= (String)(tmpArr[2]);
				userFeedback	    = (String)tmpArr[3];
				noncompliancetext	= (String)tmpArr[6];
				userRemarks			= (String)tmpArr[4];	
				
					
				
				if ("C".equals(criteria))
				{
					headerStr = "USER NAME, USER EMAILID, POLICY HEAD, POLICY, USER FEEDBACK, NON COMPLIANCE TEXT, USER REMARKS \n";
		
					String[] xlsArray = {userName,userEmailID,policyHead,policy,userFeedback,noncompliancetext,userRemarks};

					lstXls.add(xlsArray);
				}
				else if ("I".equals(criteria))
				{
					if(!userEmailID.equals(userNameForNotSignedOff) ) {

					userNameForNotSignedOff = userEmailID;

					headerStr = "USER NAME,USER EMAIID \n";
		
					String[] xlsArray = {userName, userNameForNotSignedOff};

					lstXls.add(xlsArray);
					}
				}
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