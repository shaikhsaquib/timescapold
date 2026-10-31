<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
	Hashtable detailsHash = new Hashtable();   
	String str = (String)request.getParameter("queryString");
	detailsHash.put("COMPANYCODE","1000");
	detailsHash.put("LOCATIONNAME",str);
    detailsHash.put("APPLICATION_NAME","wastesalesapprovals");
	ArrayList locList =  capexHeaderController.listLocations(detailsHash);
	int yy = locList.size();
	if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])locList.get(iit);		
				out.println("<ul onclick=\"fillLocation('"+tmpArr[5]+"');\" >"+tmpArr[5]+"</ul>");
			}
	}
	
%>