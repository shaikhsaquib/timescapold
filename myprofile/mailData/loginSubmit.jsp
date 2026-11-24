<%@ page import="java.util.Hashtable" %>

<jsp:useBean id="tActiveDirectory" class="com.bccl.util.TActiveDirectory" />

<%
    String loginId  = (String) request.getParameter("userName");
	String password = (String) request.getParameter("userPassword");
	session.setAttribute("setEmailId", loginId);
	
	//out.println(session.getAttribute("setEmailId"));
	//out.println("testtesttest"+loginId+" "+password);
	
	boolean status = false;
	Hashtable userAppDetails = new Hashtable();
	userAppDetails.put("emailId", loginId);
	userAppDetails.put("userPassword", password);
	
	status = tActiveDirectory.authenticate(userAppDetails);
	//out.println("ddddd"+status);
	//out.println("fff"+loginId);
	if(status){
		
		String setEmailId = loginId;//(String) request.getParameter("emailId");
		
		
		Cookie theCookie = new Cookie("email_Id", setEmailId);
			
		theCookie.setMaxAge(60*60*24*365);

		//out.println("theCookie---"+theCookie);
		
		response.addCookie(theCookie);

		//out.println("response---"+response);
		
		out.println("Authentication Successful");
		
	}else{
		out.println("Authentication Failed");
	}
%>