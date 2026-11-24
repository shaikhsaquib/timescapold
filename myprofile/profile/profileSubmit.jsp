<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>


<%@ page import="java.util.Hashtable, java.util.ArrayList,com.bccl.util.Utility" %>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
%>

<%

    Hashtable personalDetailHash = new Hashtable();
    Hashtable profile = (Hashtable) session.getValue("profile");

	String tempStr = "";

    personalDetailHash.put("timescapeUserOID", profile.get("timescapeUserOID")+"");
    personalDetailHash.put("title", request.getParameter("title"));
    personalDetailHash.put("firstName", Utility.replaceQuoteOracle(request.getParameter("firstName")));

	tempStr = Utility.replaceQuoteOracle(request.getParameter("middleName"));

	if(tempStr != null){
		personalDetailHash.put("middleName", tempStr);
	}

    personalDetailHash.put("lastName", Utility.replaceQuoteOracle(request.getParameter("lastName")));

	tempStr = request.getParameter("day") + "-" + monthArr[Integer.parseInt(request.getParameter("month"))-1] + "-" + request.getParameter("year");
    personalDetailHash.put("dateOfBirth", tempStr);


    personalDetailHash.put("gender", request.getParameter("gender"));

    personalDetailHash.put("maritalStatus", request.getParameter("maritalStatus"));


	tempStr = request.getParameter("noOfFamilyMembers");

	if(tempStr == null || tempStr.equals("")){
		tempStr = "0";
	}


	personalDetailHash.put("noOfFamilyMembers", tempStr);

    personalDetailHash.put("religion", request.getParameter("religion"));


	tempStr = request.getParameter("language");

	if(tempStr != null && !"0".equals(tempStr)){
		personalDetailHash.put("motherTongue", tempStr);
	}

	/*
	tempStr = request.getParameter("birthMark");

	if(tempStr != null){
		personalDetailHash.put("birthMark", tempStr);
	}

	tempStr = request.getParameter("isHandicapped");

	if(tempStr != null){
		personalDetailHash.put("isHandicapped", tempStr);
	}
	*/

	tempStr = request.getParameter("bloodGroup");

	if(tempStr != null && !"0".equals(tempStr)){
		personalDetailHash.put("bloodGroup", tempStr);
	}

	tempStr = request.getParameter("panNumber");

	if(tempStr != null){
		personalDetailHash.put("panNumber", tempStr);
	}

	tempStr = request.getParameter("passportNumber");

	if(tempStr != null){
		personalDetailHash.put("passportNumber", tempStr);
	}

	tempStr = request.getParameter("pfAccountNumber");

	if(tempStr != null){
		personalDetailHash.put("pfAccountNumber", tempStr);
	}

	tempStr = request.getParameter("alternateEmailId");

	if(tempStr != null){
		personalDetailHash.put("alternateEmailId", tempStr);
	}

    personalDetailHash.put("detailAction", request.getParameter("detailAction"));

    //update the updatedDate in the database. If passing explicit date pass with single quotes.
    // for e.g. '20-DEC-04' or else just sysdate.
    personalDetailHash.put("updatedOn", "sysdate");


    boolean status = profileController.setPersonalDetail(personalDetailHash);

	//System.out.println("Status: " + status);

    if(status){
        response.sendRedirect("../common/promptPage.jsp?msg=1");
        return;
    }else{
        response.sendRedirect("../common/promptPage.jsp?msg=6");
        return;
    }

%>