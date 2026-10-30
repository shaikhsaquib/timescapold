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
<%@ include file="../includes/statusHash.jsp" %>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<%
	ArrayList requestsList = new ArrayList();
	Hashtable requestsHash = new Hashtable();

	requestsHash.put("PRINTEDBY", timescapeUserOId+"");
	requestsHash.put("WORKFLOWTYPE", "10");
	requestsHash.put("ROLECODE", "5");

	String fromDate = (String)request.getParameter("fromDate");

		if(fromDate!=null && fromDate!=""){

			requestsHash.put("FROMDATE", fromDate);
		
		}

		String toDate = (String)request.getParameter("toDate");

		if(toDate!=null && toDate!=""){

			requestsHash.put("TODATE", toDate);
		
		}else if(fromDate!=null && fromDate!=""){

			requestsHash.put("FROMDATE", fromDate);
		
		}

		String type = (String)request.getParameter("type");

	

		if(type!=null && !type.equals("0") && type!=""){

			requestsHash.put("TYPE", type);
		
		}

		String reqStatus = (String)request.getParameter("reqStatus");

			if(reqStatus.equals("UC"))
			{
			    reqStatus = "'UC'";
				
			}else if(reqStatus.equals("RA"))
			{
			    reqStatus = "'RA','UC'";
				
			}else if(reqStatus.equals("AA"))
			{
			    reqStatus = "'AA'";
				
			}else if(reqStatus.equals("CL"))
			{
				reqStatus = "'CL','RA','PA','AA'";	

			}else if(reqStatus.equals("PA"))
			{
			    reqStatus = "'PA'";
				
			}else if(reqStatus.equals("UR"))
			{
				reqStatus = "'UR','AR','RR','PR'";	
			}
			//out.println("reqStatus"+reqStatus);

		if(reqStatus!=null&& !reqStatus.equals("0") && reqStatus!=""){

			requestsHash.remove("STATUS");		
			requestsHash.put("STATUS", reqStatus);

		}else{

			requestsHash.remove("STATUS");		
		}
	
		String locnCode = (String)request.getParameter("locnCode");

		if(locnCode!=null && !locnCode.equals("0")){

			requestsHash.put("LOCNCODE", locnCode);
		
		}

	//out.println(requestsHash);



	ArrayList usersList  = new ArrayList();

	ArrayList numIndex = new ArrayList();

	ArrayList lstXls = new ArrayList(); 

	String[] listArray = null;

    String headerStr = "";

	String fileName = "Users Report.csv";

	StringBuffer csvContent = new StringBuffer();

	String gatepassid            =   "";
	       type					 =   "";
	String partyname             =   "";
	String address				 =   "";
	String representedby         =   "";
	String materialowner         =   "";
	String materialcategory      =   "";
	String dateofreturn          =   "";
	String pono				     =   "";
	String createdby             =   "";
	String createdon             =   "";
	String authorisedby          =   "";
	//String authorisedon          =   "";
	String reviewedby            =   "";
	//String reviewedon            =   "";
	//String printedby             =   "";
	//String printedon			 =   "";
	String modifiedby            =   "";
	String modifiedon            =   "";
	String status                =   "";
	String rejectedremarks       =   "";
	String srno                  =   "";
	String locationid            =   "";
	String materialdesc          =   "";
	String quantity              =   "";
	String unitid                =   "";
	//String assettransfernoteno   =   "";
	//String assettransferdate     =   "";
	String remarks               =   "";
	String returnedquantity      =   "";
	String pendingquantity       =   "";
	String serialno              =   "";
	String deptname              =   "";
	String locationNames          =   "";

	usersList = GatepassController.getUserReport(requestsHash);

     for(int ii=0;ii<usersList.size();ii++)
	  {
			String tempArr[] = (String[])usersList.get(ii);

			 gatepassid            =   tempArr[0];
		     type				   =   tempArr[1];
			 partyname             =   tempArr[2];
			 address			   =   tempArr[3];
			 representedby         =   tempArr[4];
			 materialowner         =   tempArr[5];
			 materialcategory      =   tempArr[6];
			 dateofreturn          =   tempArr[7];
			 pono				   =   tempArr[8];
			 createdby             =   tempArr[11];			 
			 createdon             =   tempArr[12];
			 authorisedby          =   tempArr[14];			 
			// authorisedon          =   tempArr[15];
			 reviewedby            =   tempArr[17];			 
			// reviewedon            =   tempArr[18];
			// printedby             =   tempArr[20];			
			// printedon			   =   tempArr[21];
			 modifiedby            =   tempArr[23];			 
			 modifiedon            =   tempArr[24];
			 status                =   tempArr[25];
			 rejectedremarks       =   tempArr[26];
			 srno                  =   tempArr[27];
			 locationid            =   tempArr[28];
			 materialdesc          =   tempArr[29];
			 quantity              =   tempArr[30];
			 unitid                =   tempArr[31];
			// assettransfernoteno   =   tempArr[32];
			// assettransferdate     =   tempArr[33];
			 remarks               =   tempArr[34];
			 returnedquantity      =   tempArr[35];
			 pendingquantity       =   tempArr[36];
			 serialno              =   tempArr[37];
			 deptname              =   tempArr[38];
			 locationNames         =   tempArr[39];



		 headerStr = " GATEPASSID, TYPE, PARTYNAME, ADDRESS, REPRESENTEDBY, MATERIALOWNER, MATERIALCATEGORY, RETURN DT, PONO, CREATEDBY, CREATEDON, DEPARTMENTNAME, AUTHORISEDBY, REVIEWEDBY, MODIFIEDBY, MODIFIEDON, STATUS, REJECTEDREMARKS, SRNO, LOCATIONID, MATERIALDESC, QUANTITY, UNITID, REMARKS, RETURNEDQUANTITY,  PENDINGQUANTITY, SERIALNO, LOCATIONNAMES \n";

	      String[] xlsArray = {"'"+gatepassid, type, partyname, address, representedby, materialowner, materialcategory, dateofreturn , pono, createdby, createdon, deptname, authorisedby, reviewedby, modifiedby, modifiedon, status, rejectedremarks, srno, locationid, materialdesc, quantity, unitid, remarks, returnedquantity, pendingquantity, serialno, locationNames};

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
  