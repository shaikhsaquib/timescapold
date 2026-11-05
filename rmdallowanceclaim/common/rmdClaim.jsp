<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar,java.util.Date, java.text.*,java.util.StringTokenizer" %>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<%@ include file="../../../../../common/FSAsapConDetails.jsp" %>
<%@ page import="com.bccl.util.JcoGetDataFromSAP"%>

<%
		// Get the Role Details of an employee
		//String redirectURL	= "/timescape/includes/unauthorized.html";
		String redirectURL	= "";
		Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
		Hashtable rolesHash = (Hashtable)session.getAttribute("rolesHash");
		//out.println(userDetails);

		if (userDetails == null){
			response.sendRedirect(redirectURL);
			return;
		}

		String workflowType		= "12";
		
		String timescapeUserOId = (String) userDetails.get("timescapeUserOID");
		String sapId 		    = (String) userDetails.get("sapNumber");

		String deptGroup		= (String) userDetails.get("deptGroup");

		if(rolesHash==null)
		{
			rolesHash = rmdAllowanceClaimDetails.listRoles(Long.parseLong(timescapeUserOId));

			session.setAttribute("rolesHash", rolesHash);
		}

		String roleCode = (String) rolesHash.get(workflowType);
		if(roleCode != null && !roleCode.trim().equals("")) {
		roleCode = roleCode.substring(0, roleCode.indexOf("|"));

		//Obtaining menus for technical reimbursement
		ArrayList menus = rmdAllowanceClaimDetails.listMenu(Integer.parseInt(workflowType), Long.parseLong(timescapeUserOId));

		session.setAttribute("rmdClaimRole", roleCode);  
		
		session.setAttribute("rmdClaimMenu", menus);

		session.setAttribute("workflowType",workflowType);

		GregorianCalendar today = new GregorianCalendar();

        int todayDay = today.get(Calendar.DAY_OF_MONTH);

		String months[ ] ={"0","1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"};

		String todayMon = months[today.get(Calendar.MONTH)+1];

		int todayMonInt =  Integer.parseInt(todayMon);

		int  todayYear = today.get(Calendar.YEAR);

		String dayMonYear			= todayDay +"-"+todayMon+"-"+todayYear;

		out.println(menus.size());
	
		if(menus.size() < 1)
		{
			redirectURL	= "/timescape/includes/unauthorized.html";
			//response.sendRedirect(redirectURL);
		}		
	
		else
		{	
			if(roleCode != null && !roleCode.trim().equals("")) 
			{
				if(roleCode.equals("1")) {
					redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/requestor/createClaimrequest.jsp";
				} else 
					if(roleCode.equals("2")) {
					redirectURL = "/timescape/sapep/employeeselfservice/rmdallowanceclaim/processor/processRequest.jsp";
					//redirectURL = "/timescape/common/maintenance.html";
				}
			
			out.println("roleCode="+roleCode);
			//out.println(redirectURL);
			//response.sendRedirect(redirectURL);
			}
		}
		}else{
			redirectURL	= "/timescape/includes/unauthorized.html";
		}
		response.sendRedirect(redirectURL);

		//out.println("redirectURL---"+redirectURL);


%>