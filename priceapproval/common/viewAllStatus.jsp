<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewAllDetails();
	
	//out.println(vStatus.size());
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
			String status  = data[48];
			String priceid = data[0];
			String INITIATOR_NAME   = data[44];
			String INITIATEDON      = data[45];
            String view     ="";
%>
		<tr>
           <td width="3%" height="25" align="left" valign="middle" class="small">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          <td width="13%" height="25" align="left" valign="middle" class="small"><%=data[8] == null ? "NA" :data[8]%></td>
           <td width="18%" height="25" align="left" valign="middle" class="small"><a href="common/showDetailsAdmin.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>" class="boldunderline_small"><%=priceid%></a></td>
          <td width="20%" height="25" align="left" valign="middle" class="small"><a href="common/showDetailsAdmin.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>" class="boldunderline_small">&nbsp;<%=data[7]== null ? "NA" :data[7]%> - <%=data[9]%></a></td>
       <td width="16%" align="left" valign="middle" class="small">&nbsp;<%=INITIATOR_NAME%></td>
         <td width="10%" align="left" valign="middle" class="small">&nbsp;<%=INITIATEDON%></td>
<td width="10%" height="25" valign="middle" align="left">&nbsp;&nbsp;<%if(status.equals("L")){%><img src="images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="small">Request Created</span><%}else if(status.equals("UD")){%><span class="small">Draft</span><%}else if(status.equals("CL")){%><img src="images/approved.png" /><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}else if(status.equals("URE")){%><span class="small">Review</span><%}else if(status.equals("C")){%><span class="small">Cancelled</span><%}%></td>

<%
if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE"))|| (status.equals("UD"))){
    view  ="<a href=\"common/showDetailsAdmin.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}
%>
<td height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=view%></td>

        </tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
<% } }else{%>
<tr><td class="small" align="center" colspan="100%">No Request Found</td></tr>	
<%}%>
</table>