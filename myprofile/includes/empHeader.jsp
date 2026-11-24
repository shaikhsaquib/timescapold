<%

Hashtable profile =  (Hashtable)session.getAttribute("profile");
//out.println("profile-"+profile);
String sapId 				= (String) profile.get("sapNumber");
String payId 				= (String) profile.get("payId");
String empCode 		    	= (String) profile.get("employeeId");

String title                = (String) profile.get("title");
String fullName             = (String) profile.get("fullName");
String surName              = (String) profile.get("surName");
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
String designation          = (String) profile.get("designation");
String birthdate            = (String) profile.get("birthdate");

String deptName 	    	= (String) profile.get("deptGroup");	
String deptNameDesc 	    = (String) profile.get("deptGroupDesc");
String joiningdate          = (String) profile.get("joiningdate");

String userGender 				= (String) profile.get("gender");

Hashtable compCompany = new Hashtable ();
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
compCompany.put("1018", "32");
compCompany.put("1019", "33");
compCompany.put("1020", "94");
compCompany.put("1024", "12");
compCompany.put("1025", "13");
compCompany.put("1026", "14");



String legacyCompanyCode = compCompany.get(companyCode)+"";


%>

  <%
	String litecolor = "#8FB0D0";
	String darkcolor = "#336699";

	String bgColor = "#43B3B3";
	bgColor = darkcolor;


	String header = "";
	String normalStyle = "normal";
	String boldStyle = "bold";
	String underlineStyle = "underline";
	String boldUnderlineStyle = "boldunderline";
	String height = "25";
	String align = "left";
	String date = "";
%>
