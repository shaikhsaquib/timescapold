<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<head>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}


</style>
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/popup.css" rel="stylesheet" type="text/css" />
<link href="/timescape/sapep/employeeselfservice/priceapproval/OSP/css/global.css" rel="stylesheet" type="text/css" />
<script Language="JavaScript" src="../../jscripts/osp.js"></script>
<script Language="JavaScript" src="../../jscripts/reports.js"></script>

</head>
<body >

<form name="viewStatus" method="post" action="">

<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewBuyersLst(tOId);
	
%>
<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="greyBG">Buyers Status</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="/timescape/sapep/employeeselfservice/priceapproval/images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="../images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="/timescape/sapep/employeeselfservice/priceapproval/images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="../images/rejected.jpg" /> --><a href = "#" onclick="javascript:reportWin('../reportsUser.jsp');"><!-- Dashboard --></a></td></td>
          </tr>
</table>
<table width="100%" cellspacing="1" cellpadding="1">       
		<tr class="greyBG">
            <td width="3%" height="29" class="greyBG">Sr. No</td>
            <td width="13%" align="left" class="greyBG">Project Name</td> 
            <td width="14%" align="left" class="greyBG">Price Approval Id</td>    
            <td width="20%" align="left" class="greyBG">Contract Validity</td>
            <td width="16%" align="left" class="greyBG">Initiator Name</td>
            <td width="10%" align="left" class="greyBG">Initiated On</td>
            <td width="10%" align="left" class="greyBG">Status</td>
            <td  align="left" class="greyBG">Action</td>
        </tr>
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
			String status               = data[38];
			String priceid              = data[0];
			String INITIATOR_NAME       = data[39];
			String INITIATEDON          = data[34];
			String AP11                 = data[16];
			String AP21                 = data[19];
			String AP31                 = data[22];
			String APPROVER31_STATUS    = data[44];

            String approverType ="";

                if(!AP11.equals("0") && AP11.equals(tOId)){
                    approverType    ="AP11";
                }else if(!AP21.equals("0") && AP21.equals(tOId)){
                approverType    ="AP21";
                }else if(!AP31.equals("0") && AP31.equals(tOId)){
                   approverType    ="AP31";
                }
            String cancel   ="";
            String edit     ="";
            String view     ="";



%>
		<tr>
             <td width="4%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          <td width="13%" height="25" align="left" valign="middle" class="normal BreakWord"><%=data[4] == null ? "NA" :data[4]%></td>
 <td width="14%" height="25" align="left" valign="middle" class="normal "><b><%=priceid%></b></td>

          <td width="20%" height="25" align="left" valign="middle" class="normal"><%=data[5]==null?"NA":data[5]%> to <%=data[5]==null?"NA":data[46]%></td>

        <td width="16%" align="left" valign="middle" class="normal"><%=INITIATOR_NAME%></td>
        <td width="10%" align="left" valign="middle" class="normal"><%=INITIATEDON%></td>

          <td width="10%" height="25" valign="middle" align="left"><%if(status.equals("L")){%><img src="../../images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="normal">Request Created</span><%}else if(status.equals("UD")){%><span class="normal">Draft</span><%}else if(status.equals("CL")){%><img src="../../images/approved.png" /><%}else if(status.equals("CR")){%><img src="../../images/rejected.png" /><%}else if(status.equals("URE")){%><span class="normal">Review</span><%}else if(status.equals("C")){%><span class="normal">Cancelled</span><%}%></td>

<%

if (status.equals("C")){
    cancel  ="";
}
else if (!AP31.equals("0") && APPROVER31_STATUS.equals("L")||status.equals("UD")||status.equals("URE"))
{
  cancel  ="/ <a href=\"#\" onclick=\"cancelParOsp('"+priceid+"','"+tOId+"','C')\">Cancel</a> ";
}

if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE")) && (!status.equals("UD"))){
    view  ="<a href=\"showDetailsBuyersOsp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}

if (status.equals("URE")){
    edit  ="/ <a href=\"../indexUpdateOsp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
}else if(status.equals("UD"))
{
    edit  =" <a href=\"../indexUpdateDraftOsp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
}
%>
<td height="25" align="left" valign="middle" class="normal"><%=view%><%=edit%><%=cancel%></td>

        </tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }//end of for
 }else{%>
<tr><td class="small" align="center">No Request Found</td></tr>	
<%}%>
</table>
</form>
</body>
</html>