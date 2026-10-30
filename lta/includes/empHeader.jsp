<%

Hashtable profile =  (Hashtable)session.getAttribute("userHash");

long timescapeUserOId		= Long.parseLong((String) profile.get("timescapeUserOID"));

String payId 				= (String) profile.get("payId");
String sapId 		    	= (String) profile.get("sapNumber");
String empCode 		    	= (String) profile.get("employeeId");

String title                = (String) profile.get("title");
String fullName             = (String) profile.get("fullName");
String firstName            = (String) profile.get("firstName");
String surName              = (String) profile.get("surname");
String emailId 				= (String) profile.get("emailId");

String companyCode 		    = (String) profile.get("companyCode");
String companyName 		    = (String) profile.get("companyName");

if (companyName.indexOf("Bennett, Coleman ") > -1) {
    companyName = "Bennett, Coleman & Co. Ltd.";
}

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
String deptname 	    	= (String) profile.get("deptGroupName");

String displayName			= title + " " + firstName + " " + surName;

//out.println(profile);

%>