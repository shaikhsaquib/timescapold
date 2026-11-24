<%

Hashtable profile =  (Hashtable)session.getAttribute("profileHash");

String timescapeUserOId    	= (String) profile.get("timescapeUserOId");
String portalId    			= (String) profile.get("portalId");

String companyCode 		    = (String) profile.get("companyCode");
String companyName 		    = (String) profile.get("companyName");
String legacyId				= (String) profile.get("legacyId");
String sapNumber			= (String) profile.get("sapNumber");

String title                = (String) profile.get("title");
String firstName            = (String) profile.get("firstName");
String lastName             = (String) profile.get("lastName");
String displayName          = (String) profile.get("displayName");

String emailId 				= (String) profile.get("emailId");

String branch		        = (String) profile.get("branchCode");
String branchName           = (String) profile.get("branchName");

String location				= (String) profile.get("locationCode");
String locationName  		= (String) profile.get("locationName");

String deptCode 	    	= (String) profile.get("deptCode");
String deptName 	    	= (String) profile.get("deptName");

String activityCode			= (String) profile.get("activityCode");
String activityName         = (String) profile.get("activityName"); 

String designation          = (String) profile.get("designation");
String payrollType          = (String) profile.get("payrollType");
String dateOfBirth          = (String) profile.get("dateOfBirth");
String joiningDate	    	= (String) profile.get("joiningDate");	
String userType		    	= (String) profile.get("userType");

%>