<%

		Hashtable attributeHash1 = new Hashtable();
		attributeHash1.put("docId", "DOC1001");
        attributeHash1.put("emailId",emailId);
		ArrayList listAttribute1 = wasteSalesHeaderController.listOfAtrributes(attributeHash1);
		String profilestr1="";

		for (int kk = 0; kk<listAttribute1.size(); kk++){
                String strArray1[] = (String[]) listAttribute1.get(kk);  
				if("PLANT HEAD".equals(strArray1[4]))
				{
					profilestr1 = strArray1[4];

				}else if("ZONE HEAD".equals(strArray1[4]))
				{
					profilestr1 = strArray1[4];
				}
	       }
%>

<div class="row head1" style="margin-right:0px;margin-left:0px;">
<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 " style="padding-left:0px;padding-top:20px;background:url(../images/wasteSalesBanner.jpg);border:0;height:60px;color:#000;">
</div>
<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 " style="padding-top:20px;">
<div class="RelatedLinks ">
<ul>
	<li class="RelLinks"><a href="#" style="">Related Links</a>
	<ul class="dropdownmenu">
		<% if("PLANT HEAD".equals(profilestr1) ){  %>
				<li style="font-size:14px;"><a href="../user/wscreateForms.jsp">Create Waste Sales Request</a></li>
			   <!--  <li><a href="../user/createProcessWasteSalesRequest.jsp">Create Waste Sales Request</a></li> -->			
				<li style="font-size:14px;"><a href="../user/viewWSProcess.jsp">View Waste Sales Requests</a></li>
				
		<% } else  if("ZONE HEAD".equals(profilestr1)){  %>
				 <li style="font-size:14px;"><a href="../user/viewWSZonalRequests.jsp">View History</a></li>
			   <li style="font-size:14px;"><a href="../approvals/wasteDisposalForms.jsp">Approval Screen</a></li>
				<!--  <li><a href="../user/viewWSApprovals.jsp">View Pending Approvals</a></li>             
				<li><a href="../approvals/approvalHistory.jsp">Approval History</a></li>     -->
				 <!-- <li><a href="../approvals/wasteDisposalNote.jsp">Approval Screen111</a></li> -->
			  <% } else {%>
				<!-- <li><a href="../approvals/viewWSApprovalAllRequests.jsp">View History</a></li>     -->         
				<!-- <li><a href="../user/viewWSApprovals.jsp">View Pending Approvals</a></li>             
				<li><a href="../approvals/approvalHistory.jsp">Approval History</a></li>   -->    
				<!-- <li><a href="../approvals/viewWSDisposalApprovals.jsp">View Disposal Pending Approvals</a></li>              -->
		<%} %>  
		<li style="font-size:14px;"><a href="../user/wsDisposalForms.jsp">Create FAD/One-Off/DNP Request</a></li> 
		<li style="font-size:14px;"><a href="../user/viewWSDisposal.jsp">View FAD/One-Off/DNP Requests</a></li>
		<li style="font-size:14px;"><a href="../user/viewWSApprovals.jsp">View Pending Approvals</a></li>             
		<li style="font-size:14px;"><a href="../approvals/approvalHistory.jsp">Approval History</a></li>    
	</ul>
	</li>
</ul>
</div>
</div>
</div>