<%--
 -- Interaction Center -- Common 
 -- @(#)businessCards.jsp	10-NOV-2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 10-NOV-2008
 --%>


<%@ page import="java.util.Hashtable, java.util.ArrayList"%>

<jsp:useBean id="roleMenuesWebController" class="com.bccl.businesscards.web.controllerbeans.RoleMenuesWebController" />
 

<%
// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";

		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
out.println("........userDetails="+userDetails);

		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");
out.println("........timescapeUserOId="+timescapeUserOId);

		if (userDetails == null){
			response.sendRedirect(redirectURL);
			return;
		}

// Obtaining roles
		ArrayList roleList = new ArrayList();
		roleList = (ArrayList)session.getAttribute("roleList");
//out.println("........roleList out="+roleList);

		if(roleList==null){

			roleList = roleMenuesWebController.listRoles(timescapeUserOId);
//out.println("........roleList in="+roleList);


			session.setAttribute("roleList", roleList);
		}

		String roleId = ((String[])roleList.get(0))[0];
		String role = roleId+"";
out.println("........role="+role);
		
		session.setAttribute("businessCardRole", role);

//Obtaining menus
		ArrayList menus = roleMenuesWebController.listMenu(role);
//out.println("........menus="+menus.size());

		session.setAttribute("businessCardMenu", menus);

//Redirecting user to the page respective to his role code.
		if(role != null && !role.trim().equals("")) {
			if(role.equals("1")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/requestor/checkRequestStatus.jsp";
			} else if(role.equals("2")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/approver/approveRequest.jsp";
			} else if(role.equals("3")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/reviewer/reviewRequest.jsp"; 
			} else if(role.equals("4")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/processor/processRequest.jsp"; 
			} else if(role.equals("5")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/vendor/processRequest.jsp"; 
			}else if(role.equals("7")) {
				redirectURL = "/timescape/sapep/employeeselfservice/businesscards/pbchecker/reviewRequest.jsp"; 
			}
		}
	response.sendRedirect(redirectURL);

	//out.println(redirectURL);
%>