<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
	Hashtable emailHash	= new Hashtable();
	String str = (String)request.getParameter("queryString");
	String Dispid = (String)request.getParameter("Dispid");
	String displayId = (String)request.getParameter("displayId");
	emailHash.put("QUERYSTRING",str);
	emailHash.put("COMPANYCODE", companyCode);
	emailHash.put("EMAILID", emailId);
	emailHash.put("APPLICATION_NAME","wastesalesapprovals");
	ArrayList emailList	= capexHeaderController.getEmailId(emailHash);

	int yy = emailList.size();
	if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])emailList.get(iit);			
				out.println("<ul onclick=\"fill('"+tmpArr[6]+"','"+Dispid+"','"+displayId+"');\" >"+tmpArr[6]+"</ul>");
			}
	}
	
%>