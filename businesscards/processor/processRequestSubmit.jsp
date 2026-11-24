<%--
 -- Business Card
 -- @(#)processRequestSubmit.jsp	15-NOV-2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 1-DEC-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
 
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.Date, java.io.FileWriter,java.util.LinkedHashMap, java.util.*" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility,java.io.PrintWriter,com.bccl.util.SendImapMessage"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
 
<%
	String compCode = companyCode;
%>

<%@ include file="../includes/cardTemplateCode.jsp" %>

<%

	ArrayList lstXls = new ArrayList();
	ArrayList lstRquest = new ArrayList();

	String listSize = (String)request.getParameter("listSize");
	String vendorEmail = "";

	for (int ii=0;ii<Integer.parseInt(listSize);ii++){

		String select = "select"+ii;
		String reqSelect = (String)request.getParameter(select);

		if(reqSelect!=null && !reqSelect.equals("null") && !reqSelect.trim().equals("")){

			String name = "name"+ii;
			String requestorName = (String)request.getParameter(name);

			String reqQty = "reqQty"+ii;
			String quantity = (String)request.getParameter(reqQty);

			String type = "type"+ii;
			String cardType = (String)request.getParameter(type);

			String remarks = "remarks" + ii;
			String processorRemarks = (String)request.getParameter(remarks);

			String reqProcess = "P";

			String reqId = "reqId"+ii;
			String requestId = (String)request.getParameter(reqId);

			vendorEmail = (String)request.getParameter("vendorEmail");

			String[] requestListArray = {requestId,reqProcess,quantity,processorRemarks,cardType,vendorEmail};
			lstRquest.add(requestListArray);




			String changedName				= "changedName"+ii;
			String reqName					= (String)request.getParameter(changedName);
			String reqDsgn					= "reqDsgn"+ii;
			String requestorDesignation		= (String)request.getParameter(reqDsgn);
			String reqWorkArea				= "reqWorkArea"+ii;
			String requestorWorkarea		= (String)request.getParameter(reqWorkArea);
			String compName					= "compName"+ii;
			String companyNa				= (String)request.getParameter(compName);
			String addLine1					= "addLine1"+ii;
			String addressLine1				= (String)request.getParameter(addLine1);
			String addLine2					= "addLine2"+ii;
			String addressLine2				= (String)request.getParameter(addLine2);
			String reqDirectNo				= "reqDirectNo"+ii;
			String requestorDirectNumber	= (String)request.getParameter(reqDirectNo);
			String reqFaxNo					= "reqFaxNo"+ii;
			String requestorFaxNumber		= (String)request.getParameter(reqFaxNo);
			String reqMobileNo				= "reqMobileNo"+ii;
			String requestorMobileNumber	= (String)request.getParameter(reqMobileNo);
			String reqEmailId				= "reqEmailId"+ii;
			String requestorEmailId			= (String)request.getParameter(reqEmailId);
			String reqWebsite				= "reqWebsite"+ii;
			String website					= (String)request.getParameter(reqWebsite);
			String reqTemp					= "reqTemp"+ii;
			String cardTemplate				= (String)request.getParameter(reqTemp);

			String[] xlsArray = {reqName,requestorDesignation,requestorWorkarea,companyNa,addressLine1,addressLine2,requestorDirectNumber,requestorFaxNumber,requestorMobileNumber,requestorEmailId,website,cardType,quantity,(String)deptCode.get(cardTemplate)};
			lstXls.add(xlsArray);

		}
	}

	boolean status = true;
	status = businessCardUserWebController.updateProcessor(emailId,lstRquest);
		
//create xls sheet

	if(status)
	{
/*		Date today = new Date();	

		String date = today.getDate()+"-"+today.getMonth()+"-"+(today.getYear()+1900);
		String time = today.getHours()+"-"+today.getMinutes();

//		String filePath = EnvironmentProperties.getValue("businesscards", "uploadPath");
		String filePath = "E:/programs/IBMHttpServer1.3.26/htdocs/en_US/timescape_root/businesscarduploads/DetailForBusinessCard_"+date+"_"+time+".csv";

//Convert details in StringBuffer to write through PrintWriter
		String headerStr = "\"REQUESTORNAME\",\"DESIGNATION\",\"ACTIVITY\",\"COMPANY NAME\",\"ADDRESS LINE1\",\"ADDRESS LINE2\",\"DIRECT NUMBER\",\"FAX NUMBER\",\"MOBILE\",\"EMAIL ID\",\"WEBSITE\",\"CARD TYPE\",\"QUANTITY\",\"CARD BRAND\"" + "\n";

		ArrayList numIndex = new ArrayList();
		numIndex.add(new Integer(6));
		numIndex.add(new Integer(7));
		numIndex.add(new Integer(8));
		numIndex.add(new Integer(11));

		StringBuffer nominees = Utility.toStringBuffer(lstXls, numIndex);
		StringBuffer csvContent = new StringBuffer();
		csvContent.append(headerStr).append(nominees);
		
		PrintWriter writer = new PrintWriter(new FileWriter(filePath, false));
		if (csvContent != null) {
		writer.println(csvContent.toString());
		}
		writer.flush();
		writer.close();

		SendImapMessage postMan = new SendImapMessage( );

		Hashtable details =  new Hashtable();
		String fromAddr   =  emailId;
		String toAddr     =  vendorEmail.trim();
		String subject    =  "Details to print Business Card";
		String content    =  "Kindly find the attachment and arrange to print Business cards as per given details.";

		details.put("fromAddr", fromAddr);
		details.put("toAddr", toAddr);
		details.put("subject", subject);
		details.put("content", content);

		postMan.sendMail(details,filePath);
*/
		response.sendRedirect("../common/promptPage.jsp?msg=REQ_PRO_UPDT");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_PRO_UPDT");
	}
%>