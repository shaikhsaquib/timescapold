<ul id="nav">
 <li><img src="../../images/related_links.png" border="0"><span class="bold">ACTION</span><br>
  <ul>
 

  <%if(true/*pageType!=null*/){if(true/*pageType.equals("YES")*/){if(appStatus.equals("L") && !STATUS.equals("CL"))
	{
  %>

 <li><a class="normal" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A')" href="javascript:void(0)">Approve</a></li>

 <li><a class="normal" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H')" href="javascript:void(0)">Review</a></li>

 <%}else{
	if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("CR")){%><b>STATUS: Rejected</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b>
 <%
		}}}}
 %>

   </ul>
 </li>
</ul>
    