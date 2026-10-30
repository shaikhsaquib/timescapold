
<%

		String profilestr1="";
		profilestr1 = (String) session.getAttribute("profilestr1");
		//  out.println( " ----relaqted link-------- "+ profilestr1);
  
%>

<div class="row head1" style="margin-right:0px;margin-left:0px;">
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="padding-left:0px;padding-top:20px;background:url(../images/capexheadernew.jpg);background-repeat: no-repeat;height:60px;color:#FFF;">
</div>
<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="padding-top:20px;">
	<div class="RelatedLinks">
		<ul>
		<li class="RelLinks"><a href="#">Related Links</a>
		<ul class="dropdownmenu">
		<% if("USER".equals(profilestr1) ){  %>
			<li><a href="../creation/createProposalform.jsp">Create a Proposal</a></li>							
			<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposals</a></li>								
						
		<% } else  if("COORDINATOR".equals(profilestr1)){  %>	
			<li><a href="../creation/createProposalform.jsp">Create a Proposal</a></li>							
			<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposals</a></li>							
			<li><a href="../creation/createCapexWizard.jsp">Create Capex Note</a></li>											
			<li><a href="../view/viewMyCapexRequest.jsp">View My Capex Notes</a></li>
			<li><a href="../view/viewAllProposal.jsp">View All Proposals</a></li>
			<li><a href="../view/listOfPendingProposalRequest.jsp">View Pending Proposals</a></li>		
			<li><a href="../view/reviewDashboardCoodinator.jsp">View All Capex Notes</a></li>						
		<% } else  if("APPROVALS".equals(profilestr1)){  %>
			<!--li><a href="../view/approvalDashboard.jsp">Approve Capex Notes</a></li-->
			<li><a href="../view/newapprovalDashboard.jsp">Approve Capex Notes</a></li>
			<li><a href="../view/approvalDashboardHistory.jsp">Capex Note History</a></li>
			<li><a href="../creation/createProposalform.jsp">Create a Proposal</a></li>							
			<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposals</a></li>
		<% } else  if("MULTIUSER".equals(profilestr1)){  %>	
			<li><a href="../creation/createProposalform.jsp">Create a Proposal</a></li>							
			<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposals</a></li>							
			<li><a href="../creation/createCapexWizard.jsp">Create Capex Note</a></li>											
			<li><a href="../view/viewMyCapexRequest.jsp">View My Capex Notes</a></li>
			<li><a href="../view/viewAllProposal.jsp">View All Proposals</a></li>
			<li><a href="../view/listOfPendingProposalRequest.jsp">View Pending Proposals</a></li>		
			<li><a href="../view/reviewDashboardCoodinator.jsp">View All Capex Notes</a></li>
			<li><a href="../view/reviewDashboard.jsp">Review Capex Notes</a></li>
			<li><a href="../view/reviewDashboardHistory.jsp">Capex Notes History</a></li>
		<% }else {%>   	
			<li><a href="../view/reviewDashboard.jsp">Review Capex Notes</a></li>
			<li><a href="../view/reviewDashboardHistory.jsp">Capex Notes History</a></li>			
			<li><a href="../creation/createProposalform.jsp">Create a Proposal</a></li>							
			<li><a href="../view/listOfMyProposalRequest.jsp">View My Proposals</a></li>							

		<%} %>
		</ul>
		</li>
		</ul>
	</div>
</div>
</div>