<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date" %>
<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%@ include file="../includes/empHeader.jsp" %>

<%		
	String requestId = (String) request.getParameter("requestId");
	String devno = (String) request.getParameter("devno");
	String userRemarks = (String) request.getParameter("userRemarks");
	String redirectURL			= "";

	Hashtable detailsHash = new Hashtable();
	ArrayList reqList = new ArrayList();
	Hashtable dataHash = new Hashtable();

	detailsHash.put("REQUESTID", requestId);     
	detailsHash.put("LIKEDBY", timescapeUserOId+"");  
	detailsHash.put("REMARKS", userRemarks);       
	detailsHash.put("CREATERREMARKS", "-");
	detailsHash.put("MODIFIEDBY",timescapeUserOId+"");    
	detailsHash.put("STATUS", "I");        

	boolean updateFlag = false;

	updateFlag = assetMgmt.markMyInterest(detailsHash);

	out.println(updateFlag);

	if(updateFlag){

		redirectURL="../common/miniPromptPage.jsp?msg=suc_rem";
		
	}else{

		redirectURL="../common/miniPromptPage.jsp?msg=err_rem";
	}

	response.sendRedirect(redirectURL);

	/*if(status){

		dataHash.put("STATUS", "'RA','CL'");
		dataHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
		dataHash.put("REQUESTID", requestId);     

		reqList = assetMgmt.getMyRequests(dataHash);
		String others = ((String[])reqList.get(0))[31];
		
		String showResponse = Integer.parseInt(others)==0 ? "You are Interested ": "You & "+others+" other(s) are Interested ";

		out.println(showResponse);

	}else{

		out.println("Failed to update!!!!");
	}
	*/
%>
		
