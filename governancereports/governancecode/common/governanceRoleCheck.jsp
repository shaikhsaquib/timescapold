<%--
 -- Governance Code
 -- @(#)governanceRoleCheck.jsp	11/04/2011
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Nitin Sharma
 -- @version 	1.00, 11-APR-2011
 --%>


<%@ page import="java.util.Hashtable, java.util.ArrayList"%>

<jsp:useBean id="roleMenuesWebController" class="com.bccl.governancecode.web.controllerbeans.RoleMenuesWebController" />
 

<%
// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";

		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
	out.println("........userDetails="+userDetails);

		long timescapeUserOId		= Long.parseLong((String) userDetails.get("timescapeUserOID"));
		//out.println("........timescapeUserOId="+timescapeUserOId);

		if (userDetails == null){
     	response.sendRedirect(redirectURL);
			return; 
		}
// Obtaining roles
		ArrayList roleList = new ArrayList();
		roleList = (ArrayList)session.getAttribute("roleList");
	    //out.println("........roleList out="+roleList.size());


			if(roleList.size() ==0){
			//out.println("........roleList in");
			roleList = roleMenuesWebController.listRoles(timescapeUserOId);
		//	out.println("........roleList size="+roleList.size());
//			session.setAttribute("roleList", roleList);
		}

		//String roleId = ((String[])roleList.get(0))[0];
		//String role = roleId+"";
		String role = "4";
		
		//session.setAttribute("roleId", role);
		out.println("........role == "+role);

	//Obtaining menus
		//ArrayList menus = roleMenuesWebController.listMenu(role);
		//out.println("........menus="+menus.size());

		//session.setAttribute("governanceCodeMenu", menus);

	//Redirecting user to the page respective to his role code.
		if(role != null && !role.trim().equals("")) {
			if(role.equals("1")) {
				redirectURL = "/timescape/sapep/collaboration/governancecode/requestor/governanceCode.jsp";
			
            } else if(role.equals("2")) {
				redirectURL = "/timescape/sapep/collaboration/governancecode/approver/governanceAppr.jsp";
			
            } else if(role.equals("3")) {
				redirectURL = "/timescape/sapep/collaboration/governancecode/common/reportMainPage.jsp";
			
            } else if(role.equals("4")) {
				redirectURL = "/timescape/sapep/governancereports/governancecode/reports/allReportsPage.jsp";
			}
		} 


		//out.println(redirectURL);
		//response.sendRedirect(redirectURL);
%>