<%--
 -- Admin Services Requestor
 -- @(#)createRequest.jsp	14/7/2008
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
 -- @version 	1.00, 14/7/2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>
<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 

<%

	boolean status = false;
	String requestId = "";
	//String requestId = (String)request.getParameter("id");
	int id = Integer.parseInt((String)request.getParameter("id"));
	String txnIds = (String)session.getAttribute("VEH_IDS");

	String txnArr[] = txnIds.split(",");
requestId = txnArr[id];
//Put data in cancelHash
	Hashtable cancelHash = new Hashtable ();

	cancelHash.put("requestId",requestId);
	cancelHash.put("status","C");
	cancelHash.put("emailId",emailId);

	status = vehicleClaimController.cancelRequest(cancelHash);
	//status=true;
		
	//Depending on the Status; display the message from prompt page

	if(status)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=REQ_CNCL");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=REQ_ERR");
	}

%>