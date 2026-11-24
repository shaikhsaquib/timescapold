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
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
 

<%

	String listSize = (String)request.getParameter("listSize");
	
	
%>

<%
    ArrayList lstRquest = new ArrayList();

	for (int ii=0;ii<Integer.parseInt(listSize);ii++){

		String select = "select"+ii;
		String reqSelect = (String)request.getParameter(select);

		if(reqSelect!=null && !reqSelect.equals("null") && !reqSelect.trim().equals("")){


			String reqId = "reqId"+ii;
			String requestId = (String)request.getParameter(reqId);
			String reqChlNo = "chlNo"+ii;
			String challanNo = (String)request.getParameter(reqChlNo);
			String cardType = (String)request.getParameter("crdType"+ii);
			double cost = Double.parseDouble(request.getParameter("cost"+ii));
	        String costofcards =  Double.toString(cost);
			//System.out.println(costofcards);
			
//			String [] months = {"0", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};

//			String reqDay = "dd"+ii;
//			String day = (String)request.getParameter(reqDay);
//			String reqMonth = "mon"+ii;
//			String month = (String)request.getParameter(reqMonth);
//			String reqYear = "yy"+ii;
//			String year = (String)request.getParameter(reqYear);
			String reqDate = "date"+ii;
			String challanDate = (String)request.getParameter(reqDate);
//			String challanDate = day+"-"+months[Integer.parseInt(month)]+"-"+year;
		
			String remarks = "remarks" + ii;
			String vendorRemarks = (String)request.getParameter(remarks);

			String[] requestListArray = {requestId,challanNo,challanDate,vendorRemarks,reqSelect,cardType,costofcards};
			lstRquest.add(requestListArray);
		}
	}

	boolean status = true;
	status = businessCardUserWebController.updateVendor(lstRquest);

//Depending on the Status; display the message from prompt page

	if(status)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=REQ_VEN_UPDT");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_VEN_UPDT");
	}

%>