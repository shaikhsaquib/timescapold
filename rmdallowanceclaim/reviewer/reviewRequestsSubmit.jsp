<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%
	String counter				= (String)request.getParameter("counter");
	//out.println(counter);
	String requestId			= (String)request.getParameter("requestId"+counter);
	String updateStatus			= (String)request.getParameter("updateStatus"+counter);
	String remarks				= (String)request.getParameter("remarks"+counter);
	String redirectURL			= "";

	boolean updateFlag = false;
	Hashtable detailsHash = new Hashtable();

	detailsHash.put("REQUESTID", requestId);
	detailsHash.put("STATUS", updateStatus);
	detailsHash.put("REVIEWEDBY", timescapeUserOId+"");
	detailsHash.put("MODIFIEDBY", timescapeUserOId+"");
	detailsHash.put("REVIEWERREMARKS", remarks);

	//out.println(detailsHash);

	updateFlag = assetMgmt.modifySurplusAsset(detailsHash);

	if(updateFlag){

		redirectURL="../common/promptPage.jsp?msg=suc_pro";
		
	}else{

		redirectURL="../common/promptPage.jsp?msg=err_pro";
	}

	response.sendRedirect(redirectURL);

%>