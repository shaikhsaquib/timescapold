<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<%
		// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";
		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
		Hashtable rolesHash = (Hashtable)session.getAttribute("rolesHash");
		//out.println(userDetails);

		if (userDetails == null){
			response.sendRedirect(redirectURL);
			return;
		}

		String workflowType = "12";
		
		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");
		if(rolesHash==null){
			rolesHash = rmdAllowanceClaimDetails.listRoles(Long.parseLong(timescapeUserOId));
			session.setAttribute("rolesHash", rolesHash);
		}

		String roleCode = (String) rolesHash.get(workflowType);
		roleCode = roleCode.substring(0, roleCode.indexOf("|"));

		//Obtaining menus for technical reimbursement
		ArrayList menus = rmdAllowanceClaimDetails.listMenu(Integer.parseInt(workflowType), Long.parseLong(timescapeUserOId));

		if(menus.size()< 1){
			redirectURL	= "/timescape/includes/unauthorized.html";
			response.sendRedirect(redirectURL);
		}

		session.setAttribute("rmdClaimRole", roleCode);  
		session.setAttribute("rmdClaimMenu", menus);

		//Obtaining workflow details
//		Hashtable workflowDetails = medicalClaimController.getWorkflowDetails(Integer.parseInt(workflowType));
//		session.setAttribute("workflowHash", workflowDetails);
		session.setAttribute("workflowType",workflowType);

		//Redirecting user to the page respective to his role code.
		if(roleCode != null && !roleCode.trim().equals("")) {
			if(roleCode.equals("1")) {
				redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/requestor/createClaimrequest.jsp";
			} else 
				if(roleCode.equals("2")) {
				redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/processor/processRequest.jsp";
				//redirectURL = "/timescape/common/maintenance.html";
			}/*else if(roleCode.equals("3")) {
				redirectURL = "/timescape/sapep/employeeselfservice/claim/conveyanceclaim/processor/processRequest.jsp";
				//redirectURL = "/timescape/common/maintenance.html";
			}*/
		}

		//out.println("roleCode="+roleCode);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
%>