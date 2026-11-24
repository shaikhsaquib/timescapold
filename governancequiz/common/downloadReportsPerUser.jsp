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
<jsp:useBean id="GovernancequizApproverWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizApproverWebController" />
<%	
    Hashtable userResult = new Hashtable();

	String userId = (String) request.getParameter("userId");
	
	ArrayList reviewerResult = new ArrayList(); 
	
	reviewerResult = GovernancequizApproverWebController.viewFailQuestions(userId);

	//out.println("reviewerResult---"+reviewerResult.size());
    String userName = "";
	String deptName = "";
	String question = "";
	String selectedOption = "";
	String correctOption = "";
	
    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
	String headerStr = "";

    for(int i=0;i<reviewerResult.size();i++) {	


				
			String[] tmpArr = (String [] )reviewerResult.get(i);
				
				userName		= (String)tmpArr[1];
				deptName		= (String)tmpArr[2];
				question		= (String)tmpArr[5];
				correctOption	= (String)tmpArr[6];
				selectedOption	= (String)tmpArr[7];
								
			
					headerStr = "USER NAME, DEPARTMENT, QUESTION, SELECTED OPTION, CORRECT OPTION\n";
		
					String[] xlsArray = {userName,deptName,question,selectedOption,correctOption};

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