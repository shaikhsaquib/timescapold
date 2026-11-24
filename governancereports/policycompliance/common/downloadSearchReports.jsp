<%--
 -- 
 -- @(#)downloadReports.jsp	23/04/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		 Yogesh Kadam/Sachin Kale
 -- @version 	1.00, 23/04/2011
 --%>

<%@ page language="java" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList,java.util.GregorianCalendar,java.util.Calendar,java.io.PrintWriter, java.io.FileWriter" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%//@ include file="../includes/empHeader.jsp" %>
<%//@ include file="../includes/sessionCheck.jsp" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController"/> 
<%	

	String fromDate              = (String)request.getParameter("fromDate");
	String toDate                 = (String)request.getParameter("toDate");
	String frequency             = (String)request.getParameter("frequency");
	String riskCat                 = (String)request.getParameter("riskCat");
	String function               = (String)request.getParameter("Function");

	ArrayList policyResult = new ArrayList();
	policyResult = policyController.viewReviewerPolicies(frequency, riskCat, function, fromDate, toDate);
	out.println("Size: "+ policyResult.size());

	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();

	if(policyResult.size()>0){
	
			String headerStr = "\"Header\",\"Sub Header\",\"Control\",\"Risk Category\",\"Sample Size\",\"Team Member Name\",\"Team Member Feedback \",\"Team Member Remark\",\"Supervisor Name\",\"Supervisor Feedback\",\"Supervisor Remarks\"" + "\n";

			ArrayList numIndex = new ArrayList();
			ArrayList lstXls = new ArrayList();
			String[] listArray = null;

			for(int kk=0; kk<policyResult.size(); kk++){

				listArray = (String[])policyResult.get(kk);
				/*requestId = Long.parseLong((String)listArray[12]);

				requestDetails = interactionCenterWebController.viewRequest(requestId,tags);

				header = (Hashtable)(((ArrayList)requestDetails.get(tags[0])).get(0));

				courier = (Hashtable)(((ArrayList)requestDetails.get(tags[1])).get(0));

				reviewer = (ArrayList)requestDetails.get(tags[2]);
				*/
				
				String[] xlsArray = {(String)listArray[19],(String)listArray[20],(String)listArray[2],(String)listArray[3],(String)listArray[24],(String)listArray[17],(String)listArray[4],(String)listArray[6],(String)listArray[18],(String)listArray[8],(String)listArray[9],};

				lstXls.add(xlsArray);

				numIndex.add(new Integer(0));
				/*numIndex.add(new Integer(3));
				numIndex.add(new Integer(12));
				numIndex.add(new Integer(13));*/
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

	}else{
%>
<script language="javascript">

	alert("No Data Available");
	window.close();
</script>

<%		
	}

%>