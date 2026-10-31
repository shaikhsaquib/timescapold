<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="43%"><img src="../images/gatePass.jpg" width="365" height="50" /></td>
    <td width="20%" valign="bottom">&nbsp;</td>
    <td width="37%" valign="bottom">
	
	<ul id="nav">
		<li><img src="../images/related_links.png" border="0"><span class="bold">Related links</span><br>
			<ul>
				<li><a href="../user/createRequest.jsp" class="normal">Create Request</a></li>					
				<li><a href="../user/viewRequests.jsp" class="normal">View My Requests</a></li>					
<%
	String roleCode = (String)session.getAttribute("userRole");

		 if("2".equals(roleCode)){
%>
				<li><a href="../reviewer/reviewRequests.jsp" class="normal">Review Requests</a></li>					
				<!-- <li><a href="../reviewer/viewReviewedRequests.jsp" class="normal">View Reviewed Requests</a></li> -->					

<%
		}else if("3".equals(roleCode)){

%>
				<li><a href="../approver/approveRequests.jsp" class="normal">Approve Requests</a></li>					
				<!-- <li><a href="../approver/viewApprovedRequests.jsp" class="normal">View Approved Requests</a></li> -->					
<%
		}else if("4".equals(roleCode)){

%>
				<li><a href="../reviewer/reviewRequests.jsp" class="normal">Review Requests</a></li>					
				<!-- <li><a href="../reviewer/viewReviewedRequests.jsp" class="normal">View Reviewed Requests</a></li> -->					
				<li><a href="../approver/approveRequests.jsp" class="normal">Approve Requests</a></li>					
				<!-- <li><a href="../approver/viewApprovedRequests.jsp" class="normal">View Approved Requests</a></li> -->					
<%
		}else if("5".equals(roleCode)){

%>
				<li><a href="../processor/processRequests.jsp" class="normal">Print Requests</a></li>					
				<!-- <li><a href="../processor/viewProcessedRequests.jsp" class="normal">View Printed Requests</a></li> -->			
<%
		}

%>
			</ul>
		</li>
	</ul>
	</td>
  </tr>
</table>
