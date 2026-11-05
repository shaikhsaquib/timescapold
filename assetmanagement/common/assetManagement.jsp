<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="assetMgmt" class="com.bccl.assetmanagement.web.controllerbeans.AssetManagementWebController"/>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>


<%
	// Get the Role Details of an employee
	String redirectURL	= "/timescape/includes/sessionExpired.html";
	//Hashtable userDetails =  (Hashtable)session.getAttribute("userHash");
	//Hashtable rolesHash = (Hashtable)session.getAttribute("rolesHash");
	//out.println(!profile.isEmpty());

	ArrayList myRole = new ArrayList();
	ArrayList myNewRole = new ArrayList();

	Hashtable detailsHash = new Hashtable();

	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("REVIEWEDBY", timescapeUserOId+"");

	 myRole = assetMgmt.getMyRequests(detailsHash);

	 myNewRole = assetMgmt.getCountForRole(detailsHash);

	//out.println(myRole.size());
	//out.println(myNewRole.size());

	String newRole = ((String[])myNewRole.get(0))[0];
	int newRoleCount = 0;
	

	//out.println(newRole);

	if(newRole==null){

		newRoleCount = 0;

	}else{

		newRoleCount = Integer.parseInt(newRole);
	}


	String roleCode = "1";
	// roleCode = 1 is for User & 2 for Reviewer

	if(myRole.size() > 0 && newRoleCount==0){

		roleCode = "2";
	
	}else if (myRole.size() == 0 && newRoleCount > 0 ){
	
		roleCode = "3";
	
	}else if (myRole.size() > 0 && newRoleCount > 0 ){
		
		roleCode = "4";
	}

	//out.println(roleCode);


	session.setAttribute("roleCode", roleCode);
	
	if("1".equals(roleCode)){
		
		redirectURL="/timescape/sapep/collaboration/assetmanagement/user/viewAssets.jsp";

	}else if("2".equals(roleCode)){

		redirectURL="/timescape/sapep/collaboration/assetmanagement/reviewer/reviewRequests.jsp";
	
	}else if("3".equals(roleCode)){

		redirectURL="/timescape/sapep/collaboration/assetmanagement/processor/processRequests.jsp";
	
	}else if("4".equals(roleCode)){

		redirectURL="/timescape/sapep/collaboration/assetmanagement/processor/processRequests.jsp";
	
	}

	//out.println(redirectURL);
	response.sendRedirect(redirectURL);
	
	
%>