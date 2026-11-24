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
<jsp:useBean id="GovernancequizApproverWebController" class="com.bccl.governancequiz.web.controllerbeans.GovernancequizApproverWebController" />

<%

    String compCode = (String) request.getParameter("compCode");
    
	ArrayList usersList  = new ArrayList();

    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "Total Not Attempted Users Report.csv";
	StringBuffer csvContent = new StringBuffer();

	String userPortalid             =   "";
	String userEmailid              =   "";	
	String userLocation             =   "";	
	String department               =   "";
    String userSapId                =   "";
	String userScore                =   "";
	String userbranch               =   "";
	String attemptedDate            =   "";
	String newScore                 =   "";
    String newAttemptedDate         =   "";
    


                //usersList = GovernancequizApproverWebController.getFailHistoryReport(compCode);
                usersList = GovernancequizApproverWebController.getFailHistoryReport(compCode);


                for(int ii=0;ii<usersList.size();ii++)

                        {
                            String tempArr[] = (String[])usersList.get(ii);

                            userEmailid        =   tempArr[0];
                            userPortalid       =   tempArr[1];
                            userSapId          =   tempArr[2];
                            userbranch         =   tempArr[3];
                            userLocation       =   tempArr[4];
                            department         =   tempArr[5];
                            userScore          =   tempArr[6];
                            attemptedDate      =   tempArr[7];
                            newScore           =   tempArr[8];
                            newAttemptedDate   =   tempArr[9];


    headerStr = "USER EMAILID, USER PORTALID, USER SAPNUMBER, USER BRANCH, USER LOCATION, DEPARTMENT NAME, SCORE, ATTEMPTED DATE, NEW SCORE, LATEST ATTEMPTED DATE \n";

    String[] xlsArray = {userEmailid, userPortalid, userSapId, userbranch, userLocation, department, userScore, attemptedDate, newScore, newAttemptedDate};

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