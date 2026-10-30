<%
	String roleCode = (String) session.getAttribute("roleCode");
%>
<div class="RelatedLinks">
	<ul>
	<li class="RelLinks"><a href="#">Related Links</a>
	<ul class="dropdownmenu">
<%
    if(roleCode.equals("1")){
%>
	<li><a href="create.jsp">Enter Actual Timings</a></li>	
	<li><a href="view.jsp">View History</a></li>	
<%
    }else if(roleCode.equals("2")){
%>
	<li><a href="reviewerView.jsp">Review Actual Timings</a></li>	
	<li><a href="createDummy.jsp">Create New Releases</a></li>	
	<li><a href="viewDummy.jsp">View Releases</a></li>	
<%
    }else if(roleCode.equals("3")){
%>
	<li><a href="createUserRole.jsp">Create Users</a></li>	
	<li><a href="viewUserRole.jsp">View Users</a></li>	
	<li><a href="createAdminUser.jsp">Create Admin User</a></li>	
<%
    }
%>
</ul>
</li>
</ul>
</div>
