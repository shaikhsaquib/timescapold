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
<%@ include file="../includes/empHeader.jsp" %>

<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%
	
	

	
	ArrayList numIndex = new ArrayList();
	ArrayList lstXls = new ArrayList();
	String[] listArray = null;
    String headerStr = "";
	String fileName = "Users Report.csv";
	StringBuffer csvContent = new StringBuffer();

	
	
	String deptId = (String)session.getAttribute("myDeptCode");
	

	Hashtable reportUserNameHash = new Hashtable();
	ArrayList reportNameList = new ArrayList();
	ArrayList Plist = new ArrayList();
	ArrayList fullNameList = new ArrayList();
	
	String userId ="";
	String userName = "";
	String userArray="";
	String subordinateId="";
	String deptCode="";

	String department = "";
	String userStatus = "";
	String questions = "";
	String timescapeuseroid = "";
	String [] fullArr = null;
	String userFullName = "";
	int count = 0;
	int countI = 0;
	int countIP =0;
	int countNI = 0;
	int countNMA = 0;

//		out.println(userId+"--------------------------"+deptCode+"=="+timescapeUserOId+"=="+deptId+"=="+emailId );	
	session.setAttribute("myDeptCode",deptCode);
	reportUserNameHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	reportUserNameHash.put("DEPTCODE",deptId);
	reportUserNameHash.put("EMAILID",emailId);

	//reportNameList =  ERVMController.reportUserName(reportUserNameHash);
	reportNameList =  ERVMController.mainReportUserName(reportUserNameHash);
	
	String arrUserList [] =null;
	Hashtable fullNameHash = new Hashtable();
	for(int ii =0 ;ii< reportNameList.size();ii++){
		String [] tmpArr = (String[])reportNameList.get(ii);
		userId = tmpArr[0];
//		out.println(userId+"--------------------------");
		userArray += userId+",";
	} 
		if(userArray.length()>0){
			userArray = userArray.substring(0,userArray.length()-1);
			arrUserList = userArray.split(",");
		}

		Hashtable reportHash = new Hashtable();
		ArrayList rList = new ArrayList();
		reportHash.put("DEPTCODE",deptId);
		reportHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
		reportHash.put("EMAILID",emailId);

		rList = ERVMController.mainReportdataDisplay(reportHash);
		

		for(int kk =0; kk< arrUserList.length;kk++){
			userName = arrUserList[kk];
			count = 0;
			countI = 0;
			countIP =0;
			countNI = 0;
			countNMA = 0;
			double  noPercentI = 0.0;
			double  noPercent = 0.0;

			String bgColor        = "";
			int colorCnt = 0;
			fullNameHash.put("USERID",userName);
			fullNameList =  ERVMController.fullNameDisplay(fullNameHash);

			userFullName = "";
			for(int nn =0; nn< fullNameList.size();nn++){
				String userFull[] = (String[]) fullNameList.get(0);
				userFullName = userFull[0];
			}
			for(int mm =0; mm< rList.size();mm++){

				String tmpArr[] = (String [])rList.get(mm);
				
				timescapeuseroid= "";
				questions= "";
				userStatus="";
				questions =	 tmpArr[1];
				userStatus = tmpArr[2];
				timescapeuseroid = tmpArr[0];
				if(userName.contains(timescapeuseroid)){
				
					if(questions != "" ){
							 count++;
					}
					if("I".equals(userStatus)){
							 countI++;
							
					}else if("IP".equals(userStatus) ){
							 countIP++;
					}else if("NI".equals(userStatus) ){
							 countNI++;
					}else if("NMA".equals(userStatus) ){
							 countNMA++;
					}
					//out.println(mm+"**"+count+ "=="+countI+ "=="+countIP+ "=="+countNMA+ "||");

					double countduble = count;
					double countIduble = countI;
					double countNMAduble = countNMA;
					noPercentI=((countIduble/(countduble-countNMAduble)))*100;			
					
				}
			}						


    headerStr = "USERFULLNAME, RECOMMENDATION,IMPLEMENTED,NOT IMPLEMENTED,IN PROGRESS,NO MORE APPLICABLE, % IMPLEMENTED \n";

	String myCount = Integer.toString(count);
	String myCountI = Integer.toString(countI);
	String myCountNI = Integer.toString(countNI);
	String myCountIP = Integer.toString(countIP);
	String myNoPercentI = Double.toString(noPercentI);
	String myNoPercentNMA = Double.toString(countNMA);

	//System.out.println(myCount+"**"+myCountI+ "=="+myCountNI+ "=="+myCountIP+ "=="+myNoPercentI+ "||");
	if("0".equals(myCount) && "0".equals(myCountI) && "0".equals(myCountNI) && "0".equals(myCountIP) && "0".equals(myNoPercentNMA)){		
	}else{
		String[] xlsArray = {userFullName,myCount,myCountI,myCountNI,myCountIP,myNoPercentNMA,myNoPercentI};
		lstXls.add(xlsArray);
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