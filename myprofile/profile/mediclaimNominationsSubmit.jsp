<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@page errorPage="../common/errorPage.jsp"%>


<%@ page import="java.util.Hashtable, java.util.ArrayList,com.bccl.util.Utility" %>
<jsp:useBean id="profileController" class="com.bccl.profile.web.controllerbeans.ProfileController" scope="session"/>

<%!
String monthArr[] = {"JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"};
%>

<%

    Hashtable mediclaimNomineeDetailHash = new Hashtable();
    Hashtable profile = (Hashtable) session.getValue("profile");

	String tempStr = "";

    mediclaimNomineeDetailHash.put("timescapeUserOID", profile.get("timescapeUserOID")+"");
    mediclaimNomineeDetailHash.put("title", request.getParameter("title"));
    mediclaimNomineeDetailHash.put("firstName", Utility.replaceQuoteOracle(request.getParameter("firstName")));

	tempStr = Utility.replaceQuoteOracle(request.getParameter("middleName"));

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("middleName", tempStr);
	}

    mediclaimNomineeDetailHash.put("lastName", Utility.replaceQuoteOracle(request.getParameter("lastName")));

	tempStr = request.getParameter("day") + "-" + monthArr[Integer.parseInt(request.getParameter("month"))-1] + "-" + request.getParameter("year");
    mediclaimNomineeDetailHash.put("dateOfBirth", tempStr);


    mediclaimNomineeDetailHash.put("gender", request.getParameter("gender"));

    mediclaimNomineeDetailHash.put("maritalStatus", request.getParameter("maritalStatus"));


	tempStr = request.getParameter("noOfFamilyMembers");

	if(tempStr == null || tempStr.equals("")){
		tempStr = "0";
	}


	mediclaimNomineeDetailHash.put("noOfFamilyMembers", tempStr);

    mediclaimNomineeDetailHash.put("religion", request.getParameter("religion"));


	tempStr = request.getParameter("language");

	if(tempStr != null && !"0".equals(tempStr)){
		mediclaimNomineeDetailHash.put("motherTongue", tempStr);
	}

	/*
	tempStr = request.getParameter("birthMark");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("birthMark", tempStr);
	}

	tempStr = request.getParameter("isHandicapped");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("isHandicapped", tempStr);
	}
	*/

	tempStr = request.getParameter("bloodGroup");

	if(tempStr != null && !"0".equals(tempStr)){
		mediclaimNomineeDetailHash.put("bloodGroup", tempStr);
	}

	tempStr = request.getParameter("panNumber");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("panNumber", tempStr);
	}

	tempStr = request.getParameter("passportNumber");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("passportNumber", tempStr);
	}

	tempStr = request.getParameter("pfAccountNumber");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("pfAccountNumber", tempStr);
	}

	tempStr = request.getParameter("alternateEmailId");

	if(tempStr != null){
		mediclaimNomineeDetailHash.put("alternateEmailId", tempStr);
	}

    mediclaimNomineeDetailHash.put("detailAction", request.getParameter("detailAction"));

    //update the updatedDate in the database. If passing explicit date pass with single quotes.
    // for e.g. '20-DEC-04' or else just sysdate.
    mediclaimNomineeDetailHash.put("updatedOn", "sysdate");


    boolean status = profileController.setPersonalDetail(mediclaimNomineeDetailHash);

	//System.out.println("Status: " + status);

    if(status){
        response.sendRedirect("../common/promptPage.jsp?msg=1");
        return;
    }else{
        response.sendRedirect("../common/promptPage.jsp?msg=6");
        return;
    }

%>