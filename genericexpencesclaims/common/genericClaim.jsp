<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="genericclaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController"/>

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

		String workflowType = "15";
		
		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");
		//out.println("timescapeUserOId---"+timescapeUserOId);
		
		//out.println(timescapeUserOId);
		
		if(rolesHash==null){
			rolesHash = genericclaimController.listRoles(Long.parseLong(timescapeUserOId));
			session.setAttribute("rolesHash", rolesHash);
		}
		//out.println("============"+rolesHash);
		
		String roleCode = (String) rolesHash.get(workflowType);

		//out.println("============"+roleCode);

		if (roleCode == null){
			
			redirectURL	= "/timescape/includes/unauthorized.html";
			response.sendRedirect(redirectURL);

		}
		else{		
		roleCode = roleCode.substring(0, roleCode.indexOf("|"));

		//out.println("============"+roleCode);

		//Obtaining menus for guest house booking
		ArrayList menus = genericclaimController.listMenu(Integer.parseInt(workflowType), Long.parseLong(timescapeUserOId));
		//System.out.println("workflowType--"+workflowType);
		//out.println("------"+menus.size());
		if(menus.size()< 1){
			redirectURL	= "/timescape/includes/unauthorized.html";
			response.sendRedirect(redirectURL);
		}

		session.setAttribute("medicalClaimRole", roleCode);
		session.setAttribute("medicalClaimMenu", menus);

		//Obtaining workflow details
//		Hashtable workflowDetails = medicalClaimController.getWorkflowDetails(Integer.parseInt(workflowType));
//		session.setAttribute("workflowHash", workflowDetails);
		session.setAttribute("workflowType",workflowType);
			//out.println("rolecode--"+roleCode);
		//Redirecting user to the page respective to his role code.
		if(roleCode != null && !roleCode.trim().equals("")) {
			if(roleCode.equals("1")) {
				redirectURL = "/timescape/sapep/employeeselfservice/claim/genericexpencesclaims/requestor/checkRequest.jsp";
			} else if(roleCode.equals("2")) {
				redirectURL = "/timescape/sapep/employeeselfservice/claim/genericexpencesclaims/processor/processRequest.jsp";
				//redirectURL = "/timescape/common/maintenance.html";
			} else if(roleCode.equals("3")) {
				redirectURL = "/timescape/sapep/employeeselfservice/claim/genericexpencesclaims/processor/processRequest.jsp";
				//redirectURL = "/timescape/common/maintenance.html";
			}
		}
		//out.println("roleCode="+roleCode);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
	
		}
		
		
%>