<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
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
	boolean isValid = ERVMController.emailIdIsValid(userId);
	if(isValid){ // subordinate id is valid
		isValid = ERVMController.emailIdIsValid(supervisorId);
		if(isValid){ // supervisor id is valid
			boolean updateSuccessful = ERVMController.updateBA10730003(transId,userId,supervisorId,currentDepartment);
			//boolean updateSuccessful = ERVMController.updateba10730003(transId,userId,supervisorId,currentDepartment);
			
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