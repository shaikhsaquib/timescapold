<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<jsp:useBean id="capexHeaderController" class="com.bccl.workflows.web.controller.DocumentHeaderController"/>

<%
	Hashtable detailsHash = new Hashtable();   
	String str = (String)request.getParameter("queryString");
	detailsHash.put("COMPANYCODE","1000");
	detailsHash.put("DEPARTMENTTEXT",str);
    detailsHash.put("APPLICATION_NAME","capex");
	ArrayList deptList = capexHeaderController.listDepartments(detailsHash);
	int yy = deptList.size();
	if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])deptList.get(iit);			
		
				out.println("<ul onclick=\"fillDepartment('"+tmpArr[3]+"');\" >"+tmpArr[3]+"</ul>");
			}
	}
	
%>