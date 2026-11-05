<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.ArrayList"%>
<%@ page import="com.bccl.util.Utility" %>

<jsp:useBean id="governanceadministrationcode" class="com.bccl.governanceadministrationcode.web.controller.GovernanceAdministrationCodeWebController"/>

<%

    String str=request.getParameter("queryString");
    String index= request.getParameter("index");
    String what= request.getParameter("what");

	Hashtable detailsHash = new Hashtable();

	detailsHash.put("WHAT", what);
	detailsHash.put("QUERYSTRING", str);
	detailsHash.put("COMPANYCODE", companyCode);
	detailsHash.put("DEPTCODE", deptName);
	detailsHash.put("LOCATION", locationCode);
	detailsHash.put("STATUS", "A");

	ArrayList myManagerList = new ArrayList();

	myManagerList = governanceadministrationcode.getMyManager(detailsHash);


 if(myManagerList.size() > 0){

		for(int ii=0; ii< myManagerList.size(); ii++){
			
			String tmpArr[] = (String [])myManagerList.get(ii);
		    
			 out.println("<ul onclick=\"fill('"+tmpArr[0]+"', '"+index+"',"+tmpArr[1]+");\">"+tmpArr[0]+"</ul>");
	}
 }
 
%>
