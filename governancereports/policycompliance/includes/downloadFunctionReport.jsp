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
    String function         = request.getParameter("Function");
  String createdDate        = request.getParameter("createdDate");
   // String fromDate        = request.getParameter("fromDate");
   // String toDate           = request.getParameter("toDate");
    String criteria           = request.getParameter("criteria");
    System.out.println("criteria==="+criteria);
    String orderBy          = "txnReport";
    String dept = "all";

    int frequency           = Integer.parseInt(request.getParameter("frequency"));
   
    //ArrayList reportResult   = new ArrayList();
    //ArrayList criteriaSel      = new ArrayList();
    ArrayList reportResult = new ArrayList();
    ArrayList criteriaSel    = new ArrayList();
    ArrayList criteriaAppSel    = new ArrayList();

     /*if (criteria .equals("1")) {
	       
           criteriaSel.add("Yes");
	       criteriaSel.add("No");
	       criteriaSel.add("Not Applicable");
        
        } else {
       
        criteriaSel.add(criteria);
        
        }*/

        if (criteria .equals("1")) {
	       
           criteriaSel.add("Yes");
	       criteriaSel.add("No");
	       criteriaSel.add("Not Applicable");
        
        }else  if (criteria .equals("2")) {
	       
           criteriaAppSel.add("Yes");
	       criteriaAppSel.add("No");
	       criteriaAppSel.add("Not Applicable");
           criteriaAppSel.add("No Action Required");
        }else  if (criteria .equals("3")) {
        criteriaSel.add("Not Acted");
        }
        else  if (criteria .equals("4")) {
        criteriaSel.add("No");
        }
        else  if (criteria .equals("5")) {
        criteriaSel.add("Yes");
        }
        else  if (criteria .equals("6")) {
        criteriaSel.add("Not Applicable");

        }else  if (criteria .equals("7")) {
        criteriaAppSel.add("Not Acted");
        }
        else  if (criteria .equals("8")) {
        criteriaAppSel.add("No");
        }
        else  if (criteria .equals("9")) {
        criteriaAppSel.add("Yes");
        }
        else  if (criteria .equals("10")) {
        criteriaAppSel.add("Not Applicable");
        }

     reportResult = policyController.dashBoardReport(compCode, frequency, createdDate, orderBy, dept);
	
	String fileName = "Report.csv";
	StringBuffer csvContent = new StringBuffer();
    System.out.println("reportResult Size==="+reportResult.size());
	if(reportResult.size()>0){
	
			String headerStr = "\"Header\",\"Sub Header\",\"Control\",\"Risk Category\",\"Sample Size\",\"Team Member Name\",\"Team Member Feedback \",\"Team Member Remark\",\"Supervisor Name\",\"Supervisor Feedback\",\"Supervisor Remarks\"" + "\n";

			ArrayList numIndex = new ArrayList();
			ArrayList lstXls = new ArrayList();
			String[] listArray = null;

			for(int kk=0; kk<reportResult.size(); kk++){

				listArray = (String[])reportResult.get(kk);

                System.out.println("######"+criteriaSel);

               	if (function.equals(listArray[5]) && criteriaSel.contains(listArray [11])) { 

                String[] xlsArray = {(String)listArray[3],(String)listArray[4],(String)listArray[8],(String)listArray[9],(String)listArray[10],(String)listArray[17],(String)listArray[11],(String)listArray[12],(String)listArray[23],(String)listArray[19],(String)listArray[21],};

                lstXls.add(xlsArray);

                }else if (function.equals(listArray[5]) && criteriaAppSel.contains(listArray [19])) {

                String[] xlsArray1 = {(String)listArray[3],(String)listArray[4],(String)listArray[8],(String)listArray[9],(String)listArray[10],(String)listArray[17],(String)listArray[11],(String)listArray[12],(String)listArray[23],(String)listArray[19],(String)listArray[21],};

                lstXls.add(xlsArray1);

                }

				numIndex.add(new Integer(0));
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