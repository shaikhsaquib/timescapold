<%
	String litecolor = "#d0e0f0";
	String darkcolor = "#406890";
	String bgColor = "#406890";

	String header = "";
	String normalStyle = "normal";
	String boldStyle = "bold";
	String underlineStyle = "underline";
	String boldUnderlineStyle = "boldunderline";
	String height = "25";
	String align = "left";
	String date = "";
	String headerStyle = "";


String __payId = (String) session.getAttribute("payId");

if(__payId == null){
    response.sendRedirect("/timescape/login/index.jsp?msg=1");
    return;
}
%>

<%
	Hashtable profile =  (Hashtable)session.getAttribute("profile");

	if(profile == null){
		 response.sendRedirect("/timescape/login/index.jsp");
		 return;
	}

	String employeeName 		= (String) profile.get("fullName");
	String emailId 				        = (String) profile.get("emailId");
	String activityCode			    = (String) profile.get("activityCode");
	String locationCode			= (String) profile.get("locationCode");
	String locationName  		= (String) profile.get("locationName");
    String companyCode 	    = (String) profile.get("companyCode");
	String payId 				            = (String) profile.get("payId");
	String deptName 	    	    = (String) profile.get("deptGroup");
	String empCode 		    	    = (String) profile.get("employeeId");

%>
