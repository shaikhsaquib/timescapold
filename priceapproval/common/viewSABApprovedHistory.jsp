<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<script Language="JavaScript" src="../jscripts/reports.js"></script>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
<link href="../style/popup.css" rel="stylesheet" type="text/css" />
<link href="../style/global.css" rel="stylesheet" type="text/css" />
<%
	String tOId			=   Long.toString(timescapeUserOId);
	String Approver ="";	
	ArrayList vStatus	    =   new ArrayList();
    ArrayList apprStatus	=   new ArrayList();
	ArrayList vStatus1	    =   new ArrayList();
	
	vStatus 			    =	priceApprovalWebController.viewSABApprovedHistory(tOId);
    apprStatus 			    =	priceApprovalWebController.getApprList(tOId);

	String appStatus = "";
%>
<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Approvers Status</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="../images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="../images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="../images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="../images/rejected.jpg" /> --><%if(apprStatus.size() > 0){%><a href = "#" onclick="javascript:reportWin('../reportsApprover.jsp');">Dashboard</a><%}%></td>
          </tr>
</table>
<table width="100%" cellspacing="0" cellpadding="0">       
		<tr class="greyBG">
            <td width="3%" height="29" >Sr. No</td>
            <td width="13%" align="left">INTENDED USER</td> 
            <td width="18%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="20%" align="left">PROJECT - PACKAGE NAME</td>
            <td width="16%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="10%" align="left">STATUS</td>
            <td  align="left">ACTION</td>
        </tr>
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			appStatus="";
			String[] data  = (String[])vStatus.get(i); 
			String status  = data[50];
			String priceid = data[0];
			String INITIATOR_NAME   = data[65];
			String INITIATEDON      = data[66];
			String AP11                 = data[32];
			String AP21                 = data[35];
			String AP31                 = data[38];
			String APPROVER31_STATUS    = data[57];
            String view     ="";
%>
		<tr>
        <td  height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=i+1%></td>

        <td  height="25" align="left" valign="middle" class="small"><%=data[8]%></td>
        <td  height="25" align="left" valign="middle" class="normal"><b><%=priceid%></b></td>
        <td  height="25" align="left" valign="middle" class="normal"><b><%=data[7]%> - <%=data[9]%></b></td>
        <td  align="left" valign="middle" class="small"><%=INITIATOR_NAME%></td>
        <td  align="left" valign="middle" class="small"><%=INITIATEDON%></td>
        <td  height="25" valign="middle" align="left"><%if(status.equals("L")){%><img src="../images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="small">Request Created</span><%}else if(status.equals("UD")){%><span class="small">Draft</span><%}else if(status.equals("CL")){%><img src="../images/approved.png" /><%}else if(status.equals("CR")){%><img src="../images/rejected.png" /><%}else if(status.equals("URE")){%><span class="small">Review</span><%}else if(status.equals("C")){%><span class="small">Cancelled</span><%}%></td></td>
<%
if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE")) && (!status.equals("UD"))){
    view  ="<a href=\"../common/showDetailsHistory.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}
%>
<td height="25" align="left" valign="middle" class="normal"><%=view%></td>
        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }} else{%>
<tr><td class="small" align="center" colspan="100%">No Request Found</td></tr>	
<%}%>
</table>