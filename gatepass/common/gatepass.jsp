<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController" />

<%
		// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/sessionExpired.html";

		String workflowType = "10";

		ArrayList userRoleList = new ArrayList();

		Hashtable dataHash = new Hashtable();

		dataHash.put("WORKFLOWTYPE", workflowType);
		dataHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
		dataHash.put("STATUS","A");
		
		userRoleList = GatepassController.getUserRoles(dataHash);
		
		//out.println(userRoleList.size());

		String userRole = "1";

		if(userRoleList.size() > 0){

			userRole = ((String [])userRoleList.get(0))[2];
			if(userRoleList.size() > 1){
				userRole = ((String [])userRoleList.get(userRoleList.size()-1))[2];
			}
		}

		//out.println(userRole);


		session.setAttribute("userRole", userRole);
		session.setAttribute("workflowType",workflowType);

		//Redirecting user to the page respective to his role code.
		if(userRole != null && !userRole.trim().equals("")) {

			if(userRole.equals("1")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/user/viewRequests.jsp";
			} 
			else if(userRole.equals("2")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/reviewer/reviewRequests.jsp";
			}
			else if(userRole.equals("3")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/approver/approveRequests.jsp";
			}
			else if(userRole.equals("4")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/reviewer/reviewRequests.jsp";
			}
			else if(userRole.equals("5")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/processor/processRequests.jsp";
			}
			else if(userRole.equals("6")) {
				redirectURL = "/timescape/sapep/employeeselfservice/gatepass/processor/processRequests.jsp";
			}
		}

		//out.println("userRole="+userRole);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);

%>