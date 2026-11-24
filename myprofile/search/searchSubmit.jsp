<%@ page import="java.util.Hashtable, java.util.ArrayList" %>

<jsp:useBean id="profileSearchController" class="com.bccl.profile.web.controllerbeans.ProfileSearchController" scope="page"/>

<%
	String payId		= "";
	String companyCode	= "";
	String emailId		= "";
	String employeeName	= "";

	Hashtable searchDetails = new Hashtable();

	if(!request.getParameter("companies").equals("0")) {

		searchDetails.put("companyCode",request.getParameter("companies"));
	}

	if(!request.getParameter("payId").equals(null) && !(request.getParameter("payId").trim().equals(""))) {

		searchDetails.put("payId",request.getParameter("payId").trim());
	}


	if(!request.getParameter("employeeName").equals(null) && !(request.getParameter("employeeName").trim().equals(""))) {

		searchDetails.put("name",request.getParameter("employeeName").toUpperCase().trim());
	}
	ArrayList searchResults = profileSearchController.search(searchDetails);

	if(searchResults == null || searchResults.size() == 0) {
		response.sendRedirect("../common/promptPage.jsp?msg=7");
		return;
	} else if(searchResults.size() == 1){

		String strArr[] = (String[])searchResults.get(0);
		String url = "displayProfilePopup.jsp?companyCode=" + strArr[3] + "&payId=" + strArr[4] + "&timescapeUserOID=" + strArr[12];
		out.println("<script>");
		out.println("window.open(\""+url+"\",\"Profile\",\"width=800,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes,resizable=yes\");");
		out.println("window.location.href=\"/timescape/sapep/myprofile/search/search.jsp\"");
		out.println("</script>");

	} else {
		session.setAttribute("searchResults",searchResults);
		RequestDispatcher rd = request.getRequestDispatcher("../search/searchResults.jsp");
		rd.forward(request,response);
	}
%>
