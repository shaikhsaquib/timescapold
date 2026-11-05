<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController" />

<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%		
	String requestId = (String) request.getParameter("requestId");
	String likeId = (String) request.getParameter("likeId");
	String status = (String) request.getParameter("status");
	String pageName = (String) request.getParameter("page");
	String divno = (String) request.getParameter("divno");

	

	Hashtable detailsHash = new Hashtable();

	detailsHash.put("REQUESTID", requestId);     
	detailsHash.put("LIKEID", likeId);  
	detailsHash.put("CREATERREMARKS", "OK");
	detailsHash.put("MODIFIEDBY",timescapeUserOId+"");    
	detailsHash.put("STATUS", status); 
	
	//String select ="";
	String select = "<select align=\"left\"	name=\"assetType\" id=\"assetType\" valign=\"absmiddle\" class=\"normal\" onchange=\"updateInterest("+divno+", "+likeId+", "+requestId+", '"+pageName+"')\">";

	//onchange=updateInterest(1, "+likeId+", "+requestId+", "+pageName+")
		
	select+="<option value=\"0\">Select </option>"
				+"<option value=\"ATN\">ATN</option>"
				+"<option value=\"FAD\">FAD</option>"
				+"</select>";

	
	String showResponse = "";

	boolean flag = false;
	
	if(pageName.equals("showUser")){

		showResponse = status.equals("IA")? "Request Accepted ": "Request Rejcted";

		flag = assetMgmt.updateResponseStatus(detailsHash);

	}else if(pageName.equals("request")){

		//showResponse = status.equals("UR")? "Request Retained" : "Request Deleted";

		showResponse +="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="+statusImg.get(status)+" border=0>";


		flag = assetMgmt.modifySurplusAsset(detailsHash);

	}

	//out.println(detailsHash);
	//out.println(flag);

	if(flag){

		out.println(showResponse);

	}else{

		out.println("Failed to update!!!!");
	}
%>
		
