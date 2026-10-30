<%
String userRoll= (String)session.getAttribute("rollUser");
%>
 
 <script Language="JavaScript" src="../js/ota.js"></script>
 <style>
 	li:hover:not(.RelLinks) {
  		background-color: #3784a5;
	}
 </style>
	<div class="RelatedLinks" id = "RelatedLinks" >
		<ul>
			<li class="RelLinks">
			<a href="#" style="color:white;">Related Links <span class="glyphicon" style="font-size: 12px;">&#xe114;</span></a>
			<ul class="dropdownmenu" id="dropdownmenu" style="display:none">
			<%
			if("user".equals(userRoll)){
			%>
					<li style="font-size:13px;"><a href="../user/subordinate.jsp">User</a></li>

		<%}else if("supervisor".equals(userRoll) && sapId.equals ("10033445")){ %>
					<li style="font-size:13px;"><a href="../user/supervisor.jsp">Approver Feedback</a></li>
					<li style="font-size:13px;"><a href="../user/subordinate.jsp">Auditee Feedback</a></li>
					<!--
					<li style="font-size:13px;"><a href="../user/reports.jsp">Dashboard</a></li>
					<li style="font-size:13px;"><a href="../user/Single_Upload_Form.jsp">Single Upload</a></li>
					<li style="font-size:13px;"><a href="../user/FunctionalAdminDashboard.jsp">Function Dashboard</a></li>
					-->

		<% }else if(("supervisor".equals(userRoll) && !sapId.equals ("10033445"))){ %>
					<li style="font-size:13px;"><a href="../user/supervisor.jsp">Approver Feedback</a></li>
					<li style="font-size:13px;"><a href="../user/subordinate.jsp">Auditee Feedback</a></li>
					 

		<% }else if("admin".equals(userRoll)){ %>
			<li style="font-size:13px;"><a href="../user/audit_upload.jsp">Add ATR Questions</a></li>
			<li style="font-size:13px;"><a href="../common/ATRReport.jsp">ATR Report</a></li>
			<li style="font-size:13px;"><a href="../common/ATRDashboard.jsp">ATR Dashboard</a></li>
					<!--<li style="font-size:13px;"><a href="../upload/uploadFile.jsp">Bulk Upload</a></li>
					<li style="font-size:13px;"><a href="../user/Single_Upload_Form.jsp">Single Upload</a></li>
					  <li style="font-size:13px;"><a href="../user/SubordinateReport.jsp">Subordinate Report</a></li>					
					<li style="font-size:13px;"><a href="../user/SupervisorReport.jsp">Supervisor Report</a></li> 
					<li style="font-size:13px;"><a href="../user/Report.jsp?type=SUBORDINATE_ADMIN">Subordinate Report</a></li>					
					<li style="font-size:13px;"><a href="../user/Report.jsp?type=SUPERVISOR_ADMIN">Supervisor Report</a></li>
					<li style="font-size:13px;"><a href="../upload/test.jsp">View Upload History</a></li>
					<li style="font-size:13px;"><a href="../user/EditOrDeleteReportsAdmin.jsp">Edit/Delete Upload History</a></li>
					<li style="font-size:13px;"><a href="../common/downloadFile.jsp">Download</a></li> -->
					
		 
		<%}else if(("functional admin").equals(userRoll) && sapId.equals ("14802698")){ %>
			<li style="font-size:13px;"><a href="../user/audit_upload.jsp">Add ATR Questions</a></li>
			<li style="font-size:13px;"><a href="../common/ATRReport.jsp">ATR Report</a></li>
			<li style="font-size:13px;"><a href="../common/ATRDashboard.jsp">ATR Dashboard</a></li>
			<!--
			<li style="font-size:13px;"><a href="../user/supervisor.jsp">Approver Feedback</a></li>
			<li style="font-size:13px;"><a href="../user/subordinate.jsp">Auditee Feedback</a></li>
			<li style="font-size:13px;"><a href="../user/FunctionalAdminDashboard.jsp">Dashboard</a></li>
			<li style="font-size:13px;"><a href="../upload/FunctionalAdminViewHistory.jsp">View Upload History</a></li>
			<li style="font-size:13px;"><a href="../user/Single_Upload_Form.jsp">Single Upload</a></li>
			<li style="font-size:13px;"><a href="../user/FunctionalAdminDashboard.jsp">Function Dashboard</a></li> -->

		<%}else if(("functional admin").equals(userRoll) && !sapId.equals ("14802698")){ %>
			<li style="font-size:13px;"><a href="../user/audit_upload.jsp">Add ATR Questions</a></li>
			<li style="font-size:13px;"><a href="../common/ATRReport.jsp">ATR Report</a></li>
			<li style="font-size:13px;"><a href="../common/ATRDashboard.jsp">ATR Dashboard</a></li>
		<%} %>
				</ul>
			</li>
		</ul>
	</div>


