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

    //String compCode = (String) request.getParameter("compCode");
    //int frequency = Integer.parseInt(request.getParameter("frequency"));
    //String createdDate = (String) request.getParameter("createdDate");
    
    
	//ArrayList  usersList = (ArrayList) session.getAttribute("naReportResult");
	ArrayList  usersList = new ArrayList();

    ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "Consolidated OCA Report.csv";
	StringBuffer csvContent = new StringBuffer();

	String usercompanyname           =   "";
	String approvercompanyname           =   "";
	String function           =   "";
	String subFunction           =   "";
	String policyHead            =   "";
	String policySubHead         =   "";
	String question              =   "";
	String userFeedback          =   "";
	String approverFeedback      =   "";
	String userStatus            =   "";
	String approverStatus        =  "";
	String userName              =   "";
	String userEmailid           =   "";
	String userSapId         =   "";
	String approverName          =   "";
    String approverEmailid       =   "";
    String approverSapId         =   "";
	String userLocation          =   "";
	String approverLocation      =   "";
	String userDepartment        =   "";
	String approverDepartment    =   "";
	String userRemarks           =   "";
	String userAttachment        =   "";
	String approverRemarks       =   "";
	String approverAttachment    =   "";
	String frequency             =   "";
	String createdOn             =   "";
	
	
    


                usersList = policyController.consolidatedOCAExcelReport();


                for(int ii=0;ii<usersList.size();ii++)

                        {
                            String tempArr[] = (String[])usersList.get(ii);

                            usercompanyname	        =   tempArr[0];   
							approvercompanyname	        =   tempArr[1];   
							function                 =   tempArr[2]; 
						    subFunction              =   tempArr[3]; 
                            policyHead	        =   tempArr[4]; 
                            policySubHead       =   tempArr[5]; 
                            question            =   tempArr[6];  
                            userFeedback        =   tempArr[7]; 
							approverFeedback    =   tempArr[8];
							userStatus    =   tempArr[9];
							approverStatus    =   tempArr[10];
							userName            =   tempArr[11];
                            userEmailid         =   tempArr[12];
							userSapId            =   tempArr[13];
							approverName        =   tempArr[14];
                            approverEmailid     =   tempArr[15];
							approverSapId       =   tempArr[16];
							userLocation        =   tempArr[17];
                            approverLocation    =   tempArr[18];
                            userDepartment      =   tempArr[19];
							approverDepartment  =   tempArr[20];
							userRemarks         =   tempArr[21];
                            userAttachment      =   tempArr[22];
                            approverRemarks     =   tempArr[23];
                            approverAttachment  =   tempArr[24];
							frequency           =   tempArr[25];
							createdOn           =   tempArr[26];
                           
                            

    headerStr = "USERCOMPANY NAME,APPROVERCOMPANY NAME, FUNCTION, SUBFUNCTION, POLICY HEAD,POLICY SUB-HEAD, QUESTION, USER FEEDBACK, APPROVER FEEDBACK, USER STATUS, APPROVER STATUS, USER NAME, USER EMAILID, USER SAPNUMBER, APPROVER NAME, APPROVER EMAILID, APPROVER SAPNUMBER, USER LOCATION,  APPROVER LOCATION, USER DEPARTMENT, APPROVER DEPARTMENT, USER REMARKS, USER ATTACHMENT,  APPROVER REMARKS, APPROVER ATTACHMENT ,FREQUENCY,  CREATEDON \n";
	

    String[] xlsArray = {usercompanyname, approvercompanyname, function, subFunction, policyHead, policySubHead,  question, userFeedback, approverFeedback, userStatus, approverStatus, userName, userEmailid, userSapId, approverName, approverEmailid, approverSapId, userLocation, approverLocation, userDepartment, approverDepartment, userRemarks, userAttachment, approverRemarks, approverAttachment,frequency, createdOn};

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



