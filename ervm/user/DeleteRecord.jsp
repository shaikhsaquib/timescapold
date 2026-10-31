<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<% 

	String transId = request.getParameter("transId");
	
	PrintWriter writer = null;
	response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    writer = response.getWriter();
    String message;
	boolean deletionSuccessful = ERVMController.changeStatusToD(transId);
	
	message = deletionSuccessful?"Record deleted successfully":"Deletion unsuccessful";
	
	writer.print(message);
	writer.flush();
	writer.close();
%>