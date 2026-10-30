<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	String Approver ="";	
	ArrayList vStatus	=   new ArrayList();
	ArrayList specialRstatus	=   new ArrayList();
	ArrayList vStatus1	=   new ArrayList();
	Hashtable rStatus = new Hashtable();
	vStatus 			=	priceApprovalWebController.viewSAB(tOId);

	specialRstatus 			=	priceApprovalWebController.specialReviewStatus(rStatus);

	//vStatus1 			=	priceApprovalWebController.viewSAB(tOId);
	String appStatus = "";
    String createdForApproverType = "";
            String view     ="";
            String view1    ="";
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			appStatus="";
			String[] data           = (String[])vStatus.get(i); 
			String status           = data[50];
			String priceid          = data[0];
			String INITIATOR_NAME   = data[65];
			String INITIATEDON      = data[66];
%>
		<tr>
            <td width="3%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=i+1%></td>

            <td width="10%" height="25" align="left" valign="middle" class="small"><%=data[8]%></td>
            <td width="13%" height="25" align="left" valign="middle" class="normal">&nbsp;<b><%=priceid%></b></td>
            <td width="15%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<b><%=data[7]%> - <%=data[9]%></b></td>
            <td width="15%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=INITIATOR_NAME%></td>
            <td width="10%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=INITIATEDON%></td>
            <td width="8%" height="25" valign="middle" align="left">&nbsp;&nbsp;<%if(status.equals("L")||status.equals("UC")){%><img src="images/inprocess.png" /><%}else if(status.equals("S")){%><img src="images/supported.png" /><%}else if(status.equals("CL")){%><img src="images/approved.png" /><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}%></td>

<%
if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE"))|| (status.equals("UD"))){
    view  ="<a href=\"common/showDetails.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
}
%>
<td width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=view%></td>
        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }} //else{%>
<!-- <tr><td class="small" align="center">No Request Found</td></tr>	 -->
<%//}%>
<%int ii=0;
	if(specialRstatus.size()!=0)
	{
		for(ii=0; ii<specialRstatus.size(); ii++)
		{			String[] data3      =   (String[])specialRstatus.get(ii);

        createdForApproverType = data3[62];

String createdFor="";
        createdFor=data3[55];
//out.println("priceid = "+data3[0]);
%><%if(createdFor.equals(tOId)){%>
		<tr>
          <td width="3%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=ii+1%></td>
          
          <td width="10%" height="25" align="left" valign="middle" class="small"><%=data3[8]%></td>
<td width="13%" height="25" align="left" valign="middle" class="normal">&nbsp;<strong><%=data3[0]%></strong></td>
<!-- <td width="13%" height="25" align="left" valign="middle">&nbsp;&nbsp;&nbsp;<a href="common/createdForReview.jsp?tOId=<%//=timescapeUserOId%>&priceid=<%//=data3[0]%>&splId=<%//=data3[51]%>&approverType=<%//=createdForApproverType%>&viewSAB=YES" class="boldunderline_small"><%//=data3[0]%></a></td> -->
           <td width="15%" height="25" align="left" valign="middle" class="small">&nbsp;&nbsp;<strong><%=data3[7]%> - <%=data3[9]%></strong></td>
           <!-- <td width="15%" height="25" align="left" valign="middle" class="small"><a href="common/createdForReview.jsp?tOId=<%//=timescapeUserOId%>&priceid=<%//=data3[0]%>&splId=<%//=data3[51]%>&approverType=<%//=createdForApproverType%>&viewSAB=YES" class="boldunderline_small"><%//=data3[7]%> - <%//=data3[9]%></a></td>
 -->       
        <td width="15%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=data3[63]%></td>
        <td width="10%" align="left" valign="middle" class="small">&nbsp;&nbsp;<%=data3[60]%></td>

          <td width="8%" height="25" valign="middle" align="left" class="small"><%if(data3[61].equals("SPLR")||data3[61].equals("UC")){%>Specific review<%}else if(data3[61].equals("S")){%><img src="images/supported.png" /><%}else if(data3[61].equals("CL")){%><img src="images/approved.png" /><%}%></td>

<%
if (data3[61].equals("SPLR")) {
    view1  ="<a href=\"common/createdForReview.jsp?tOId="+timescapeUserOId+"&priceid="+data3[0]+"&splId="+data3[51]+"&approverType="+createdForApproverType+"&viewSAB=YES\">View</a>";
}
%>
<td width="8%"height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=view1%></td>

        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="8"></td></tr>
<% }}} %>

<%if(vStatus.size()==0 && specialRstatus.size()==0){%>
<tr><td class="small" align="center">No Request Found</td></tr>
<%}%>
</table>