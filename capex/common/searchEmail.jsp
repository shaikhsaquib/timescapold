<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
	Hashtable detailsHash = new Hashtable();   
	String str = (String)request.getParameter("queryString");
	detailsHash.put("COMPANYCODE","1000");
	detailsHash.put("QUERYSTRING",str);
	detailsHash.put("APPLICATION_NAME","capex");
	ArrayList emailList	= capexHeaderController.getEmailId(detailsHash);
	//String formName = (String)request.getParameter("name");
//String fieldName = (String)request.getParameter("field");
	int yy = emailList.size();
	if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])emailList.get(iit);			
		
				out.println("<ul onclick=\"fill('"+tmpArr[6]+"');\" >"+tmpArr[6]+"</ul>");
			}
	}
	
%>