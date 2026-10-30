<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
<% 

	String transId = request.getParameter("transId");
	String userId = request.getParameter("userId");
	String supervisorId = request.getParameter("supervisorId");
	String currentDepartment = request.getParameter("currentDepartment");
	
	PrintWriter writer = null;
	response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    writer = response.getWriter();
    String message;
	boolean isValid = OtaController.emailIdIsValid(userId);
	if(isValid){ // subordinate id is valid
		isValid = OtaController.emailIdIsValid(supervisorId);
		if(isValid){ // supervisor id is valid
			boolean updateSuccessful = OtaController.updateBA1070003(transId,userId,supervisorId,currentDepartment);
			if(updateSuccessful)
		    	message = "Updation successful";
		    else
		    	message = "Updation Unsuccessful";
		}else
			message = "Invalid Supervisor EmailId OR EmailId doesn't exist";
	}else
		message = "Invalid Subordinate EmailId OR EmailId doesn't exist";
	
	writer.print(message);
	writer.flush();
	writer.close();
%>