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
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<%
	ArrayList requestsList = new ArrayList();
	Hashtable requestsHash = new Hashtable();

	requestsHash.put("PRINTEDBY", timescapeUserOId+"");
	requestsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	requestsHash.put("WORKFLOWTYPE", "10");
	requestsHash.put("ROLECODE", "5");

	String location = (String)request.getParameter("locnCode");

	requestsHash.put("LOCATION", location);

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

		if(reqStatus!=null&& !reqStatus.equals("0") && reqStatus!=""){

			requestsHash.remove("STATUS");		
			requestsHash.put("STATUS", reqStatus);

		}else{

			requestsHash.remove("STATUS");		
		}
	
	//out.println(requestsHash);

   ArrayList usersList  = new ArrayList();

	ArrayList numIndex = new ArrayList();

	ArrayList lstXls = new ArrayList(); 

	String[] listArray = null;

    String headerStr = "";

	String fileName = "Users Report.csv";

	StringBuffer csvContent = new StringBuffer();

	String inwardgatepassid         =   "";
	String inwardtype			    =   "";
	String vmsrefno					=   "";
	String outwardrefno				=   "";
	String partyname				=   "";
	String mobileno					=   "";
	String address					=   "";
	String dateofreturn				=   "";
	String companycode				=   "";
	String locationid				=   "";
	String department				=   "";
	String usertimecapeuseroid		=   "";
	String createdby				=   "";
	String createdon				=   "";
	String receivedby				=   "";
	String receivedon				=   "";
	String modifiedby				=   "";
	String modifiedon				=   "";
	String acceptedby				=   "";
	String acceptedon				=   "";
	String approvedby				=   "";
	String approvedon				=   "";
	String status					=   "";
	String totalpendingquantity		=   "";
	String inwarditemsrno			=   "";
	String inwardpurchaseorderno	=   "";
	String inwarddcinvoice			=   "";
	String inwardmaterial			=   "";
	String inwarduom				=   "";
	String inwardquantity			=   "";
	String inwardremarks			=   "";
	String inwardrejectedquantity	=   "";
	String inwardreceivedquantity	=   "";
	String inwardsendingquantity	=   "";
	String inwardpendingquantity	=   "";
	String vehicleno				=   "";
	String userName				    =   "";
	String userCompanyName			=   "";
	String userLocationName			=   "";
	String userDepartmentName		=   "";
	

	usersList = GatepassController.getInwardReport(requestsHash);
	
     for(int ii=0;ii<usersList.size();ii++)
	  {
			String tempArr[] = (String[])usersList.get(ii);

			 inwardgatepassid		    =   tempArr[0];
			 inwardtype					=   tempArr[1];
			 vmsrefno					=   tempArr[2];
			 outwardrefno				=   tempArr[3];
			 partyname					=   tempArr[4];
			 mobileno					=   tempArr[5];
			 address					=   tempArr[6];
			 dateofreturn				=   tempArr[7];
			 companycode				=   tempArr[8];
			 locationid					=   tempArr[9];
			 department					=   tempArr[10];
			 usertimecapeuseroid		=   tempArr[11];
			 createdby					=   tempArr[12];
			 createdon					=   tempArr[13];
			 receivedby					=   tempArr[14];
			 receivedon					=   tempArr[15];
			 modifiedby					=   tempArr[16];
	         modifiedon					=   tempArr[17];
	         acceptedby					=   tempArr[18];
	         acceptedon					=   tempArr[19];
			 approvedby					=   tempArr[20];
			 approvedon					=   tempArr[21];
			 status						=   tempArr[22];
			 totalpendingquantity		=   tempArr[23];
			 inwarditemsrno				=   tempArr[24];
			 inwardpurchaseorderno		=   tempArr[25];
			 inwarddcinvoice			=   tempArr[26];
			 inwardmaterial				=   tempArr[27];
			 inwarduom					=   tempArr[28];
			 inwardquantity				=   tempArr[29];
			 inwardremarks				=   tempArr[30];
			 inwardrejectedquantity		=   tempArr[31];
			 inwardreceivedquantity	    =   tempArr[32];
			 inwardsendingquantity		=   tempArr[33];
			 inwardpendingquantity		=   tempArr[34];
			 vehicleno					=   tempArr[35];
			 userName					=   tempArr[36];
			 userCompanyName			=   tempArr[37];
			 userLocationName			=   tempArr[38];
			 userDepartmentName			=   tempArr[39];




		 headerStr = " INWARDGATEPASSID, INWARDTYPE, VMSREFNO, OUTWARDREFNO, PARTYNAME, MOBILENO, ADDRESS, DOR, COMPANYCODE, LOCATIONID, DEPARTMENT, USERTIMECAPEUSEROID, CREATEDBY, CREATEDON, RECEIVEDBY, RECEIVEDON, MODIFIEDBY,MODIFIEDON, ACCEPTEDBY, ACCEPTEDON, APPROVEDBY, APPROVEDON, STATUS, TOTALPENDINGQUANTITY, INWARDITEMSRNO, INWARDPURCHASEORDERNO, INWARDDCINVOICE, INWARDMATERIAL, INWARDUOM, INWARDQUANTITY, INWARDREMARKS, INWARDREJECTEDQUANTITY, INWARDRECEIVEDQUANTITY, INWARDSENDINGQUANTITY,  INWARDPENDINGQUANTITY, VEHICLENO, USERNAME, USERCOMPANYNAME, USERLOCATIONNAME, USERDEPARTMENTNAME \n ";

	      String[] xlsArray = {"'"+inwardgatepassid, inwardtype, vmsrefno, outwardrefno, partyname, mobileno, 		address, dateofreturn, companycode, locationid, department, usertimecapeuseroid, createdby, createdon, receivedby, receivedon, modifiedby,modifiedon, acceptedby, acceptedon, approvedby, approvedon, status, totalpendingquantity, inwarditemsrno, inwardpurchaseorderno, inwarddcinvoice, inwardmaterial, inwarduom, inwardquantity,  inwardremarks, inwardrejectedquantity, inwardreceivedquantity,inwardsendingquantity,       inwardpendingquantity, vehicleno, userName, userCompanyName, userLocationName, userDepartmentName};

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
 