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
	ArrayList detailsArray = new ArrayList();
	
	String acceptStr    = request.getParameter("acounter");
	String rejectStr = request.getParameter("rcounter");
	String remStr = request.getParameter("remarr");
	String counter	= (String)request.getParameter("counter");
	String Accept = request.getParameter("accept");
	Hashtable resultHash = new Hashtable();

	 String[] acceptArr = acceptStr.split(",");
	 String[] rejectArr = rejectStr.split(",");
	 String[] remArr = remStr.split(",");
	 
	 boolean updateFlag = false;
 
	 if(acceptStr!="")
		{		
			String[] str = null;
	   
	      for(int i=0; i<acceptArr.length; i++)
			{
			 resultHash.put("REQUESTID", acceptArr[i] );
			 resultHash.put("STATUS", "RA");
			 resultHash.put("REVIEWEDBY", timescapeUserOId+"");
			 resultHash.put("MODIFIEDBY", timescapeUserOId+"");
			 resultHash.put("REVIEWERREMARKS", " - ");
		
			updateFlag = assetMgmt.modifySurplusAsset(resultHash);
			 
			 }
	 
		}

		 if(rejectStr!="")
		{		
			String[] str = null;
	   
	      for(int i=0; i<rejectArr.length; i++)
			{
			  
			 resultHash.put("REQUESTID", rejectArr[i] );
			 resultHash.put("STATUS", "RR");
			 resultHash.put("REVIEWEDBY", timescapeUserOId+"");
			 resultHash.put("MODIFIEDBY", timescapeUserOId+"");
			 resultHash.put("REVIEWERREMARKS", remArr[i]);
			
			updateFlag = assetMgmt.modifySurplusAsset(resultHash);
			 
			 }
	 
		}

	String redirectURL			= "";
	
	if(updateFlag){

		redirectURL="../common/promptPage.jsp?msg=suc_pro";
		
	}else{

		redirectURL="../common/promptPage.jsp?msg=err_pro";
	} 

	response.sendRedirect(redirectURL);

%>