<%--
 -- @(#)governanceExcelReports1.jsp - 11-APR-2011
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Reports 1 Page of Governance.
 -- @author  -  Sachin Mehta
 -- @version -  1.0
 -- This page is used forr initial declaration by employee
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList" %>
<%@ page import = "com.bccl.util.Utility" %>
<%@ page import = "java.util.GregorianCalendar,java.util.Calendar" %>
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
<%@ page import = "jxl.write.biff.RowsExceededException" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
<%
System.out.println("DOWNLOAD JSP HIT");
    //String compCode = (String) request.getParameter("compCode");
    //int frequency = Integer.parseInt(request.getParameter("frequency"));
    //String createdDate = (String) request.getParameter("createdDate");
    
    
	//ArrayList  usersList = (ArrayList) session.getAttribute("naReportResult");
	ArrayList  usersList = new ArrayList();

    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "OCA Dashboard.csv";
	StringBuffer csvContent = new StringBuffer();

	
	String function         =   "";
	String totalfeedback    =   "";
	String yes              =   "";
	String no              =   "";
	String notapplicable            =   "";
	String nonacted         =   "";
	
    


                usersList = policyController.dashboardoca();


                for(int ii=0;ii<usersList.size();ii++)

                        {
                            String tempArr[] = (String[])usersList.get(ii);

                            function	        =   tempArr[0];   
							totalfeedback	        =   tempArr[1]; 
							yes                 =   tempArr[2];
							no                 =   tempArr[3];
							notapplicable                 =   tempArr[4]; 
						    nonacted              =   tempArr[5]; 
                           

    headerStr = "FUNCTION, TOTAL FEEDBACK,YES, NO, NON APPLICABLE, NON ACTED\n";
	

    String[] xlsArray = {function, totalfeedback,yes, no, notapplicable, nonacted};

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



