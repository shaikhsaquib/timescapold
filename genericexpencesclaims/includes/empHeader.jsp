<%
// Get profile of the logged in user
Hashtable profile =  (Hashtable)session.getAttribute("userHash");

long timescapeUserOId		= Long.parseLong((String) profile.get("timescapeUserOID"));
String payId 				= (String) profile.get("payId");
String sapId 		    	= (String) profile.get("sapNumber");

String title                = (String) profile.get("title");
String fullName             = (String) profile.get("fullName");
String firstName            = (String) profile.get("firstName");
String surName              = (String) profile.get("surname");
String emailId 				= (String) profile.get("emailId");

String companyCode 		    = (String) profile.get("companyCode");
String companyName 		    = (String) profile.get("companyName");

String branchCode           = (String) profile.get("branchCode");
String branchName           = (String) profile.get("branchName");

String locationCode			= (String) profile.get("locationCode");
String locationName  		= (String) profile.get("locationName");

String activityCode			= (String) profile.get("activityCode");
String activityName         = (String) profile.get("activityName"); 

String payrollType          = (String) profile.get("payrollType");
String userType	            = (String) profile.get("userType");
String designation          = (String) profile.get("designation");
String birthdate            = (String) profile.get("birthdate");
String joiningdate          = (String) profile.get("joiningdate");

String deptGroup 	    	= (String) profile.get("deptGroup");	
String deptName 	    	= (String) profile.get("deptGroupName");

String displayName			= title + " " + firstName + " " + surName;


/*
compCompany.put("1000", "01");
compCompany.put("1001", "25");
compCompany.put("1002", "44");
compCompany.put("1003", "20");
compCompany.put("1004", "40");
compCompany.put("1005", "27");
compCompany.put("1006", "42");
compCompany.put("1007", "35");
compCompany.put("1008", "37");
compCompany.put("1009", "29");
compCompany.put("1010", "96");
compCompany.put("1011", "83");
compCompany.put("1012", "30");
compCompany.put("1013", "02");
compCompany.put("1014", "04");
compCompany.put("1015", "05");
compCompany.put("1016", "26");
compCompany.put("1017", "31");
//compCompany.put("1018", "32");
//compCompany.put("1019", "33");
compCompany.put("1019", "32");
compCompany.put("1018", "33");
compCompany.put("1019", "39");
compCompany.put("1020", "94");
compCompany.put("1021", "46");
compCompany.put("1024", "12");
compCompany.put("1025", "13");
compCompany.put("1026", "14");
compCompany.put("1027", "48");

String legacyCompanyCode = compCompany.get(companyCode)+"";

// Get details of the current workflow
/*Hashtable workflow =  (Hashtable)session.getAttribute("workflowHash");
int noOfStages 				= Integer.parseInt((String) workflow.get("noOfStages"));
String shortDesc            = (String) workflow.get("shortDesc");
String desc					= (String) workflow.get("desc");
String actionPage           = (String) workflow.get("actionPage");
*/
String legacyCompanyCode	= "";
int workflowType 			= Integer.parseInt((String)session.getAttribute("workflowType"));
//out.println("workflowType in empHeader="+workflowType);

%>