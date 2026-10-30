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
<jsp:useBean id="ltaController" class="com.bccl.lta.web.controllerbeans.LtaWebController" /> 

<%	
	
    String month	    = (String) request.getParameter("month");
    String faYear       = (String) request.getParameter("faYear");
	String status		= (String) request.getParameter("criteria");
	
	String faDate	= month + "-" + faYear;

    ArrayList reportResult   = new ArrayList();

    reportResult   = ltaController.viewLtaRecord(faDate, status, timescapeUserOId );

	Hashtable requestStatus	=	new Hashtable();

	requestStatus.put("L",	"In Process");
	requestStatus.put("A",	"Processed");
	requestStatus.put("R",	"Rejected");

	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
	
	if(reportResult.size()>0){
	
			String headerStr = "\"Transaction ID\",\"Employee Name\",\"SAP Number\",\"Department\",\"Designation\",\"Branch\",\"Remarks \",\"Date Of Joining \",\"Requested On\",\"Processed On\",\"Satus\"" + "\n";

			ArrayList numIndex = new ArrayList();
			ArrayList lstXls = new ArrayList();
			String[] listArray = null;

			for(int kk=0; kk<reportResult.size(); kk++){

				listArray = (String[])reportResult.get(kk);

				String recordStatus	= (String) requestStatus.get(listArray[8]);


				String[] xlsArray = {(String)listArray[0],(String)listArray[3],(String)listArray[5],(String)listArray[6],(String)listArray[7],(String)listArray[12],(String)listArray[9], (String)listArray[13], (String)listArray[10],(String)listArray[11], recordStatus,};

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