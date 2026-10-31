<%

	//String redirectURL = "";
		
	Hashtable attributeHash = new Hashtable();
	attributeHash.put("docId", "DOC1006");
	attributeHash.put("emailId",emailId);
	ArrayList listAttribute = docHeaderController.listOfAtrributes(attributeHash);
	String profilestr="";
	
	for (int kk = 0; kk<listAttribute.size(); kk++){
		String strArray[] = (String[]) listAttribute.get(kk);  
		//if("DEPT HEAD".equals(strArray[4]) || "LEGAL HEAD".equals(strArray[4]))
		if( "LEGAL HEAD".equals(strArray[4]))
		{
			profilestr = strArray[4];

		}
   }
%>

<div class="row head1" style="margin-right:0px;margin-left:0px;background-color:#F6D9AF;">
<div class="col-xs-10 col-sm-10 col-md-9 col-lg-9 " style="padding-left:0px;padding-top:20px;background:url(../images/legalheader.jpg);  background-repeat: no-repeat;height:60px;color:#000;">
<h3 class="special" >Contract Management</h3>
</div>
<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 " style="padding-top:20px;">
<div class="RelatedLinks ">
<ul>
	<li class="RelLinks"><a href="#" style="">Related Links</a>
	<ul class="dropdownmenu">
		<% //if("DEPT HEAD".equals(profilestr) ){  %>
			<!-- <li><a href="../user/wscreateForms.jsp">View Pending Approvals</a></li>
			<li><a href="../approvals/approvalHistory.jsp">Approval History</a></li>   -->   
		  	<li><a href="../user/createRequest.jsp">Create Request</a></li>
			<li><a href="../user/viewRequests.jsp">View My Requests</a></li>	
		<% /*} else*/  if("LEGAL HEAD".equals(profilestr)){  %>
			<li><a href="../legalHead/viewPendingRequests.jsp">View Pending Requests</a></li>
			<li><a href="../legalHead/approvalHistory.jsp">Approval History</a></li>
			 <!-- <li><a href="../approvals/wasteDisposalNote.jsp">Approval Screen111</a></li> -->
		  <% } //else {%>

							
											
		<%//} %>                                         
	</ul>
	</li>
</ul>
</div>
</div>
</div>




