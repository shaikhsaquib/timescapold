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
 -- @author		Kavita Yadav
 -- @version 	1.00, 10/08/2013
 --%>
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<form name="frmCancelDetails" method="post">

<%
	boolean status = false;

	//String txnId = (String)request.getParameter("id");
	int id = Integer.parseInt((String)request.getParameter("id"));
	String txnIds = (String)session.getAttribute("RMD_IDS");
	String txnId =  null;
	String txnArr[] = txnIds.split(",");
	
	if(txnArr.length > id){
		txnId = txnArr[id];
	}else{
		response.sendRedirect("/timescape/includes/unauthorized.html");
	}
	Hashtable cancelHash = new Hashtable ();

	cancelHash.put("txnId",txnId);
	cancelHash.put("status","C");
	cancelHash.put("emailId",emailId);

	status = rmdAllowanceClaimDetails.cancelRequest(cancelHash);


	if(status)
	{
		response.sendRedirect("../requestor/cancelRequest.jsp");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REQ");
	}

%>