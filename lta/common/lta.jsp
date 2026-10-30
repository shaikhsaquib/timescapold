<%--
 -- Interaction Center -- Common 
 -- @(#)lta.jsp	07-FEB-2012
 --
 -- Copyright 2012 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Yogesh Kadam
 -- @version 	1.00, 07-FEB-2012
 -- @version 	2.00, 30-09-15 Krishna Vishwakarma
 --%>


<%@ page import="java.util.Hashtable, java.util.ArrayList"%>

<jsp:useBean id="roleMenuesWebController" class="com.bccl.lta.web.controllerbeans.RoleMenuesWebController" />
 

<%
// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";
        String ltaFlag = (String) request.getParameter("flag");
		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
	    //System.out.println("........userDetails="+userDetails);
	    //System.out.println("........ltaFlag="+ltaFlag);

		long timescapeUserOId		= Long.parseLong((String) userDetails.get("timescapeUserOID"));
		//out.println("........timescapeUserOId="+timescapeUserOId);

		if (userDetails == null) {
     	
            response.sendRedirect(redirectURL);
		    return; 
        }
	// Obtaining roles
		ArrayList roleList = new ArrayList();
/*		roleList = (ArrayList)session.getAttribute("roleList");
	    out.println("........roleList out="+roleList);
*/
		if(roleList.size()==0) {
		
           // out.println("........roleList in");
			roleList = roleMenuesWebController.listRoles(timescapeUserOId,ltaFlag);
			//System.out.println("........roleList size="+roleList.size());
//			session.setAttribute("roleList", roleList);
        }
		String roleId = ((String[])roleList.get(0))[0];
		String role = roleId+"";
		
		session.setAttribute("ltaRoleId", role);
	    //out.println(" userHash " + session.getAttribute("roleId"));
        //out.println("........role == "+role);

	//Obtaining menus
        //ArrayList menus = roleMenuesWebController.listMenu(role);
		//out.println("........menus="+menus.size());
		//session.setAttribute("policyComplianceMenu", menus);
	//Redirecting user to the page respective to his role code.ltaRoleId
		if(role != null && !role.trim().equals("")) {
			
            if(role.equals("1")) {
                if(ltaFlag.equals("M")){
    				redirectURL = "/timescape/sapep/employeeselfservice/lta/common/checkstatus.jsp";
                }else if(ltaFlag.equals("A")){
                    redirectURL = "/timescape/sapep/employeeselfservice/lta/common/annualltaapply.jsp";
                }

			} else if(role.equals("2")) {
                if(ltaFlag.equals("M")){
				    redirectURL = "/timescape/sapep/employeeselfservice/lta/reviewer/viewallrequest.jsp";
                }else if(ltaFlag.equals("A")){
                    redirectURL = "/timescape/sapep/employeeselfservice/lta/reviewer/reviewerviewallrequest.jsp";
               
                }
			}else if(role.equals("3")) {
                if(ltaFlag.equals("A")){
                    redirectURL = "/timescape/sapep/employeeselfservice/lta/processor/pendingforapproval.jsp";
                }
			} 
		} 
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
%>