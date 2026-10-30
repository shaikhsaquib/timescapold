<%@ page import="java.util.Hashtable,java.util.ArrayList, java.util.*"%>
<%@ page import="java.util.regex.Matcher, java.util.regex.Pattern" %>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<%
	String nprString = (String)request.getParameter("inputString");
	//System.out.println("QQQQQQQQQQ"+nprString);
	ArrayList parList =  priceApprovalWebController.listParNumber(nprString);

	int yy = parList.size();
	if( yy> 0){
			for( int iit=0; iit< yy;iit++){
				String tmpArr[] = (String[])parList.get(iit);			
		
				out.println("<ul onclick=\"fillLocation('"+tmpArr[0]+"');\" >"+tmpArr[0]+"</ul>");
			}
	}
	
%>