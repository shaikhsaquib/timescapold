<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>
<%@ page import="com.bccl.util.Utility" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>
<%@ page import="java.util.Hashtable,java.util.ArrayList" %>
<link href="../style/global.css" rel="stylesheet" type="text/css" />

<%		
	String gatepassId		= (String) request.getParameter("gatepassId");

	String authorisedBy = (String)request.getParameter("authorisedBy");
	authorisedBy = Utility.replaceQuoteOracle(authorisedBy);
	
	Hashtable detailsHash = new Hashtable();
	ArrayList detailsList = new ArrayList();
	
	detailsHash.put("GATEPASSID", gatepassId);     
	detailsHash.put("AUTHORISEDBY", authorisedBy); 
	
	String showResponse = "Your request has been updated successfully.!!";
	boolean flag = false;
	//Hashtable modify = new Hashtable();
	
	flag = GatepassController.modifyEmail(detailsHash, detailsList);



	if(flag){
		
		response.sendRedirect("../common/promptPage.jsp?msg=SUC_REVIEWREQ");
	
	}else{

		response.sendRedirect("../common/promptPage.jsp?msg=ERR_REVIEWREQ");

	}


%>