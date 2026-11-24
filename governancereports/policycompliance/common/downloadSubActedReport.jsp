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

    String compCode = (String) request.getParameter("compCode");
    int frequency = Integer.parseInt(request.getParameter("frequency"));
    String createdDate = (String) request.getParameter("createdDate");
    
    
	//ArrayList  usersList = (ArrayList) session.getAttribute("naReportResult");
	ArrayList  usersList = new ArrayList();

    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "Subordinates Acted Report.csv";
	StringBuffer csvContent = new StringBuffer();

	String companyname           =   "";
	String policyHead            =   "";
	String policySubHead         =   "";
	String vertical              =   "";
	String subVertical           =   "";
	String question              =   "";
	String userFeedback          =   "";
	String userRemarks           =   "";
	String userDepartment        =   "";
	String userAttachment        =   "";
	String userName              =   "";
	String userEmailid           =   "";
	String approverFeedback      =   "";
	String approverAttachment    =   "";
	String approverRemarks       =   "";
	String approverName          =   "";
	String approverEmailid       =   "";
	String createdOn             =   "";
	String userSapId             =   "";
	String userLocation          =   "";
	String approverSapId         =   "";
	String approverLocation      =   "";
    


                usersList = policyController.usersActedExcelReport(compCode, frequency, createdDate);


                for(int ii=0;ii<usersList.size();ii++)

                        {
                            String tempArr[] = (String[])usersList.get(ii);

                            companyname	        =   tempArr[0];             
                            policyHead	        =   tempArr[1]; 
                            policySubHead       =   tempArr[2]; 
                            question            =   tempArr[3];  
                            userFeedback        =   tempArr[4]; 
                            userRemarks         =   tempArr[5];
                            userAttachment      =   tempArr[6];
                            userName            =   tempArr[7];
                            userEmailid         =   tempArr[8];
                            userDepartment      =   tempArr[9];
                            approverFeedback    =   tempArr[10];
                            approverAttachment  =   tempArr[11];
                            approverRemarks     =   tempArr[12];
                            approverName        =   tempArr[13];
                            approverEmailid     =   tempArr[14];
                            createdOn           =   tempArr[15];
                            userSapId           =   tempArr[16];
                            userLocation        =   tempArr[17];
                            approverSapId       =   tempArr[18];
                            approverLocation    =   tempArr[19];

    headerStr = "COMPANY NAME,POLICY HEAD,POLICY SUB-HEAD, QUESTION, USER FEEDBACK, USER REMARKS,USER ATTACHMENT, USER NAME, USER EMAILID, USER SAPNUMBER, USER LOCATION, USER DEPARTMENT, APPROVER FEEDBACK, APPROVER ATTACHMENT, APPROVER REMARKS, APPROVER NAME, APPROVER EMAILID, APPROVER SAPNUMBER, APPROVER LOCATION \n";

    String[] xlsArray = {companyname, policyHead, policySubHead, question, userFeedback, userRemarks, userAttachment, userName, userEmailid, userSapId, userLocation, userDepartment, approverFeedback, approverAttachment, approverRemarks, approverName, approverEmailid, approverSapId, approverLocation};

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



