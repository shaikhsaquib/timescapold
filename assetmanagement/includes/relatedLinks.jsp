<%
    ArrayList usersList = new ArrayList(); 
	usersList.add("10023369");
	usersList.add("10022103");
	usersList.add("10000051");
	usersList.add("10004497");
	usersList.add("10000527");
	usersList.add("10020598");
	usersList.add("10022682");
	usersList.add("10000445");
	usersList.add("10025940");
	usersList.add("10015857");
	usersList.add("10000176");
	usersList.add("10001241");
	usersList.add("10000278");
	usersList.add("10004129");
	usersList.add("10000426");
	usersList.add("10000314");
	usersList.add("10022680");
	usersList.add("10023098");
	usersList.add("10028178");
	usersList.add("10022415");
	usersList.add("10021578");
	usersList.add("10012576");
	usersList.add("10027927");

%>
	<ul id="nav">
		<li><img src="../images/related_links.png" border="0"><span class="bold">Related links</span><br>
			<ul>
				<li><a href="../user/createAsset.jsp" class="normal">Create Surplus Asset</a></li>
				<li><a href="../user/viewMyRequests.jsp" class="normal">View My Requests</a></li>
				<li><a href="../user/viewAssets.jsp" class="normal">View Assets</a></li>
<%
		 if("2".equals(roleCode)){
%>
				<li><a href="../reviewer/reviewRequests.jsp" class="normal">Review Requests</a></li>
				<li><a href="../reviewer/viewReviewedRequests.jsp" class="normal">View Reviewed Requests</a></li>
<%
		}
%>
<%
		 if("3".equals(roleCode)){
%>
				<li><a href="../processor/processRequests.jsp" class="normal">Approve Notes</a></li>				<li><a href="../processor/viewProcessedRequests.jsp" class="normal">View Approved Notes</a></li>	
<%
		}
%>
<%
		 if("4".equals(roleCode)){
%>
				<li><a href="../reviewer/reviewRequests.jsp" class="normal">Review Requests</a></li>
				<li><a href="../reviewer/viewReviewedRequests.jsp" class="normal">View Reviewed Requests</a></li>	
				<li><a href="../processor/processRequests.jsp" class="normal">Approve Notes</a></li>
				<li><a href="../processor/viewProcessedRequests.jsp" class="normal">View Approved Notes</a></li>	
<%
		}
%>
<%
		if(usersList.contains(sapId))
		{
%>
			<li><a href="../admin/viewAllRequests.jsp" class="normal">View All Requests</a></li>
<%
		}
%>	
			<li><a href="#" onclick="window.open('/timescape_root/assetmanagementuploads/SAM2.pdf','User_Manual','resizable=yes,status=no,toolbar=no')" class="normal">User Manual</a></li>
	</ul>
	</li>
</ul>
