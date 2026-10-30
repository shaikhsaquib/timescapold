<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewAllDetailsOSp();
	
	//out.println(vStatus.size());
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0" border="1">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
			String status  = data[31];
			String priceid = data[0];
			String INITIATOR_NAME   = data[27];
			String INITIATEDON      = data[28];
            String view     ="";
%>
		<tr>
           <td width="3%" height="25" align="left" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          <td width="13%" height="25" align="left" class="normal BreakWord"><%=data[4] == null ? "NA" :data[4]%></td>
           <td width="18%" height="25" align="left"  class="normal"><strong><%=priceid%></strong></td>
          <td width="20%" height="25" align="left" class="normal"><%=data[5]== null ? "NA" :data[5]%> - <%=data[32]== null ? "NA" :data[32]%></td>
       <td width="16%" align="left"  class="normal"><%=INITIATOR_NAME%></td>
         <td width="10%" align="left"  class="normal"><%=INITIATEDON%></td>
<td width="10%" height="25"  align="left"><%if(status.equals("L")){%><img src="images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="normal">Request Created</span><%}else if(status.equals("UD")){%><span class="normal">Draft</span><%}else if(status.equals("CL")){%><img src="images/approved.png" /><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}else if(status.equals("URE")){%><span class="normal">Review</span><%}else if(status.equals("C")){%><span class="normal">Cancelled</span><%}%></td>

<%
if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE"))|| (status.equals("UD"))){
    view  ="<a href=\"OSP/common/showDetailsAdminOsp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}
%>
<td height="25" align="left"  class="normal">&nbsp;&nbsp;<%=view%></td>

        </tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
<% } }else{%>
<tr><td class="normal" align="center">No Request Found</td></tr>	
<%}%>
</table>