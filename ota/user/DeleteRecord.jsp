<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
<% 

	String transId = request.getParameter("transId");
	
	PrintWriter writer = null;
	response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    writer = response.getWriter();
    String message;
	boolean deletionSuccessful = OtaController.changeStatusToD(transId);
	
	message = deletionSuccessful?"Record deleted successfully":"Deletion unsuccessful";
	
	writer.print(message);
	writer.flush();
	writer.close();
%>