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
 -- @version 	1.00, 31/06/2011
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList,java.util.GregorianCalendar,java.util.Calendar,java.io.PrintWriter, java.io.FileWriter" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%	

	String compCode      = request.getParameter("compCode");
    int frequency           = Integer.parseInt(request.getParameter("frequency"));
    String createdDate   = request.getParameter("createdDate");
    String criteria          = request.getParameter("criteria");
    String orderBy          = "txnReport";
	String dept				= "all";
   
    ArrayList reportResult   = new ArrayList();
    ArrayList criteriaSel      = new ArrayList();


	if(criteria.equals("apprAll")){
				criteriaSel = (ArrayList) session.getAttribute("apprAllOid");
		}else if(criteria.equals("apprPart")){
			criteriaSel = (ArrayList) session.getAttribute("apprPartOid");

	   }else{
		   criteriaSel = (ArrayList) session.getAttribute("apprNtActOid");
		 }

    reportResult   = policyController.dashBoardReport(compCode, frequency, createdDate,  orderBy,dept);
	out.println("Size: "+ reportResult.size());

	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();

	if(reportResult.size()>0){
	
			String headerStr = "\"Header\",\"Sub Header\",\"Control\",\"Risk Category\",\"Sample Size\",\"Team Member Name\",\"Team Member Feedback \",\"Team Member Remark\",\"Supervisor Name\",\"Supervisor Feedback\",\"Supervisor Remarks\"" + "\n";

			ArrayList numIndex = new ArrayList();
			ArrayList lstXls = new ArrayList();
			String[] listArray = null;

			for(int kk=0; kk<reportResult.size(); kk++){

				listArray = (String[])reportResult.get(kk);

				if(criteriaSel.contains(listArray[22])){ 
				/*requestId = Long.parseLong((String)listArray[12]);

				

				requestDetails = interactionCenterWebController.viewRequest(requestId,tags);

				header = (Hashtable)(((ArrayList)requestDetails.get(tags[0])).get(0));

				courier = (Hashtable)(((ArrayList)requestDetails.get(tags[1])).get(0));

				reviewer = (ArrayList)requestDetails.get(tags[2]);
				*/
				
				String[] xlsArray = {(String)listArray[3],(String)listArray[4],(String)listArray[8],(String)listArray[9],(String)listArray[10],(String)listArray[17],(String)listArray[11],(String)listArray[12],(String)listArray[23],(String)listArray[19],(String)listArray[21],};

				lstXls.add(xlsArray);

				numIndex.add(new Integer(0));
				/*numIndex.add(new Integer(3));
				numIndex.add(new Integer(12));
				numIndex.add(new Integer(13));*/
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

	}else{
%>
<script language="javascript">

	alert("No Data Available");
	window.close();
</script>

<%		
	}

%>