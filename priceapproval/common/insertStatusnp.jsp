<ul id="nav">
 <li><img src="../images/related_links.png" border="0"><span class="bold">ACTION</span><br>
  <ul>
 

  <%if(true/*pageType!=null*/){if(true/*pageType.equals("YES")*/){if(appStatus.equals("L") && (!STATUS.equals("CL") && !STATUS.equals("UCA") && !STATUS.equals("C")))
	{
  %>

 <li><a class="normal" onClick="openRemarksnp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'A','<%=creatorEmailid%>')" href="javascript:void(0)">Approve</a></li>

 <li><a class="normal" onClick="openRemarksnp('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'H','<%=creatorEmailid%>')" href="javascript:void(0)">Review</a></li>

 <!-- <li><a href="javascript:void(0)" onClick="openRemarks('<%//=priceid%>',<%//=tOId%>,'<%//=Approver%>' ,'R')" class="normal">Reject</a></li> -->

 <%}else if(appStatus.equals("L") && STATUS.equals("UCA") && !STATUS.equals("C")){%>
 
	<li><a class="normal" onClick="openRemarksnpAmmend('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'MA','<%=creatorEmailid%>')" href="javascript:void(0)">Approve</a></li>

 <li><a class="normal" onClick="openRemarksnpAmmend('<%=priceid%>',<%=tOId%>,'<%=Approver%>' ,'MH','<%=creatorEmailid%>')" href="javascript:void(0)">Review</a></li>

<% }else{
	if(STATUS.equals("CL")){%><b>STATUS: Approved</b><%}else if(STATUS.equals("CR")){%><b>STATUS: Rejected</b><%}else if(STATUS.equals("URE")){%><b>STATUS: Review</b>
 <%
		}}}}
 %>

   </ul>
 </li>
</ul>
    