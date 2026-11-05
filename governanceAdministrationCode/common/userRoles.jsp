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

<jsp:useBean id="roleMenuesWebController" class="com.bccl.governanceadministrationcode.web.controllerbeans.RoleMenuesWebController" />

 

<%
// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";

		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
	    System.out.println("........userDetails="+userDetails);

		long timescapeUserOId		= Long.parseLong((String) userDetails.get("timescapeUserOID"));
		System.out.println("........timescapeUserOId="+timescapeUserOId);

		if (userDetails == null){
     	response.sendRedirect(redirectURL);
			return; 
		}

	// Obtaining roles
		ArrayList roleList = new ArrayList();
/*		roleList = (ArrayList)session.getAttribute("roleList");
	    out.println("........roleList out="+roleList);
*/

			if(roleList.size()==0){
			System.out.println("........roleList in");
			roleList = roleMenuesWebController.listRoles(timescapeUserOId);
			System.out.println("........roleList size="+roleList.size());
//			session.setAttribute("roleList", roleList);
		}

		String roleId = ((String[])roleList.get(0))[0];
		String role = roleId+"";
		System.out.println("........role="+role);
		session.setAttribute("roleId", role);
	//		out.println("........role == "+role);

	//Obtaining menus
		ArrayList menus = roleMenuesWebController.listMenu(role);
		System.out.println("........menus="+menus.size());

		session.setAttribute("policyComplianceMenu", menus);

	//Redirecting user to the page respective to his role code.
		if(role != null && !role.trim().equals("")) {
			if(role.equals("1")) {
				redirectURL = "/timescape/sapep/collaboration/governanceAdministrationCode/user/allRequestChangeManeger.jsp";
			} else if(role.equals("2")) {
				redirectURL = "/timescape/sapep/collaboration/governanceAdministrationCode/approver/approverRequest.jsp";
			} else if(role.equals("3")) {
				redirectURL = "/timescape/sapep/collaboration/governanceAdministrationCode/admin/adminRequest.jsp";
			}
			else if(role.equals("4")) {
				redirectURL = "/timescape/sapep/collaboration/governanceAdministrationCode/mas/masRequest.jsp";
			}
		} 


		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
%>