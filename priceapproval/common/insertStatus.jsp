<ul id="nav">
 <li><img src="../images/related_links.png" border="0"><span class="bold">ACTION</span><br>
  <ul>
 

  <%if(true/*pageType!=null*/){if(true/*pageType.equals("YES")*/){if(appStatus.equals("L") && !STATUS.equals("CL"))
	{
  %>

 <li><a class="normal" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A','<%=COMPANY%>')" href="javascript:void(0)">Approve</a></li>

 <li><a class="normal" onClick="openRemarks('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H','<%=COMPANY%>')" href="javascript:void(0)">Review</a></li>


<%if(COMPANY.equals("1000") && Approver.equals("AP4")){%><li><a class="normal" onClick="remarkspop('<%=priceid%>',<%=tOId%>,'<%=Approver%>')" href="javascript:void(0)">Specific Review</a></li><%}else if(!COMPANY.equals("1000") && Approver.equals("AP5")){%><li><a class="normal" onClick="remarkspop('<%=priceid%>',<%=tOId%>,'<%=Approver%>')" href="javascript:void(0)">Specific Review</a></li>
<%}%>

 <%}else{
	if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("CR")){%><b>STATUS: Rejected</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b>
 <%
		}}}}
 %>

   </ul>
 </li>
</ul>
    