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

		
		String redirectURL	= "/timescape/includes/unauthorized.html";


		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
		//out.println("........userDetails="+userDetails);

		long timescapeUserOId		= Long.parseLong((String) userDetails.get("timescapeUserOID"));
		//out.println("........timescapeUserOId="+timescapeUserOId);

		if (userDetails == null) {

	     	//response.sendRedirect(redirectURL);
			return; 
		}


        //out.println("........roleList in");
        ArrayList roleList = roleMenuesWebController.listRoles(timescapeUserOId);

		String role = ((String[])roleList.get(0))[0];
		out.println("........role == "+role);
		

		// Check why this is required
		session.setAttribute("roleId", role);


		//Obtaining menus

		ArrayList menus = roleMenuesWebController.listMenu(role);
		//out.println("........menus="+menus.size());

		session.setAttribute("governanceCodeMenu", menus);


		//Redirecting user to the page respective to his role code.
		if(role != null && !role.trim().equals("")) {

			if(role.equals ("1")) {

				//redirectURL = "/timescape/sapep/collaboration/governancecode/requestor/governanceCode.jsp";
				redirectURL = "/timescape/sapep/collaboration/governancecode/requestor/landingPage.jsp";

			} else if (role.equals("2")) {

				redirectURL = "/timescape/sapep/collaboration/governancecode/approver/governanceAppr.jsp";

			} else if (role.equals("5")) {

				redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReport.jsp";
				//redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReport.jsp";

			} else if (role.equals("3")) {

				redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReport.jsp";
				//redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReport.jsp";

			}else if (role.equals("4")) {

				redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReportSubordinate.jsp";
				//redirectURL = "/timescape/sapep/collaboration/governancecode/reviewer/countReport.jsp";

			} 

		} 


		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
%>