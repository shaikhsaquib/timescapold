<%-- 
 -- Business Card
 -- @(#)reviewRequestSubmit.jsp		15-NOV-2008
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
 -- @version 	1.00, 15-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
 

<%

	boolean status = false;

//Get the parameters from cancelInter5actionCenterRequest.jsp
	String reviewerId = (String)request.getParameter("reviewerId");
	String reviewerStatus = (String)request.getParameter("reviewerStatus");
	String reviewerRemark = (String)request.getParameter("reviewerRemark");
	if (reviewerRemark.equals("") || reviewerRemark==null || reviewerRemark=="")
	{
		reviewerRemark = "-";
	}

//Put data in cancelHash
	Hashtable updateHash = new Hashtable ();

	updateHash.put("requestId",reviewerId);
	updateHash.put("status",reviewerStatus);
	updateHash.put("reviewedBy",emailId);
	updateHash.put("reviewerRemark",reviewerRemark);


//call "create" method to insert request details into "SERVICEREQUEST" and "SERVICEATTACHMENT" tables
	status = businessCardUserWebController.update(updateHash);

		
//Depending on the Status; display the message from prompt page

	if(status)
	{
		response.sendRedirect("../common/promptPage.jsp?msg=success_pro");
	}
	else
	{
		response.sendRedirect("../common/promptPage.jsp?msg=error_pro");
	}

%>