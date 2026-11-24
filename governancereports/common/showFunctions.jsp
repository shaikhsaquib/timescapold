
<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<%@ page import="java.text.*, java.util.Calendar, java.util.GregorianCalendar, java.util.Date" %>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController" /> 
	
 <%
	 int deptCode  = Integer.parseInt(request.getParameter("deptCode"));
	 

	ArrayList functionList = policyController.getFunctionName(deptCode);
	
%>
	
    <select name="selectedFunct" id="selectedFunct" class="normal">
        <option value="0">Select a Function</option>

<%
    for(int ii=0 ; ii < functionList.size( ); ii++) {

        String dept[ ] = (String[ ]) functionList.get(ii);
		
%>
	
        
        <option value="<%=dept[0]%>"><%=dept[0]%></option>
<%   
    }
%>       
	</select>