<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="projectapprovalsController" class="com.bccl.projectapprovals.web.controller.ProjectApprovalsWebController"/>

<%
		// Get the Role Details of an employee
		String redirectURL	= "/timescape/includes/unauthorized.html";
		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");


		if (userDetails == null){
			response.sendRedirect(redirectURL);
			return;
		}

		
		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");

		//out.println(timescapeUserOId);

	
		//Obtaining user menu to be painted and all the requests
		Hashtable dataHash = projectapprovalsController.getDataList(Long.parseLong(timescapeUserOId));

		/*if(dataHash.size()== 0)
		{
			session.setAttribute("dataHash", dataHash);

		}*/
		
		session.setAttribute("dataHash", dataHash);

		//Redirecting user to the page respective to his role code.
		if(dataHash.size()> 0)
		{
			if(dataHash.containsKey("approvedByList"))
			{
				redirectURL = "/timescape/sapep/employeeselfservice/projectapprovals/approver/approveRequest.jsp?linkId=4";

			}
			else if(dataHash.containsKey("recommendedByList"))
			{

				redirectURL = "/timescape/sapep/employeeselfservice/projectapprovals/reviewer/recommendRequest.jsp?linkId=3";
			}
			else if(dataHash.containsKey("preparedByList"))
			{
				redirectURL = "/timescape/sapep/employeeselfservice/projectapprovals/user/viewProjectApprovals.jsp?linkId=2";
			}
    	}
		else 
		{
				redirectURL = "/timescape/sapep/employeeselfservice/projectapprovals/user/viewProjectApprovals.jsp?linkId=2";
		}

		//out.println("roleCode="+roleCode);
		//out.println(redirectURL);
		response.sendRedirect(redirectURL);
%>