<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	String Approver ="";	
	ArrayList vStatus	=   new ArrayList();
	ArrayList vStatus1	=   new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewSABNP(tOId);
	vStatus1 			=	priceApprovalWebController.viewSABNPCAN(tOId);
	
	//out.println("kkkk"+vStatus.size());
	//out.println("ddd"+vStatus1.size());

	//vStatus1 			=	priceApprovalWebController.viewSAB(tOId);
	String appStatus = "";

%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			appStatus="";
			String[] data  = (String[])vStatus.get(i); 
			String status  = data[27];
			String priceid = data[0];   
			String INITIATOR_NAME   = data[40];
			String INITIATEDON      = data[41];

			//out.println("status---"+status);
if(!status.equals("C")	){
		if(!status.equals("AM")	){
    
%>
		<tr>
          <td width="8%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          
          <td width="18%" height="25" align="left" valign="middle" class="small"><%=data[1]%></td>
<td width="12%" height="25" align="left" valign="middle">&nbsp;&nbsp;&nbsp;<a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>&viewSAB=YES" class="boldunderline_small_Blue"><U><%=priceid%></U></a></td>
           <td width="18%" height="25" align="left" valign="middle" class="small"><a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>&viewSAB=YES" class="boldunderline_small"><%=data[6]%></a></td>
       <td width="16%" align="left" valign="middle" class="small"><%=INITIATOR_NAME%></td>
         <td width="10%" align="left" valign="middle" class="small"><%=INITIATEDON%></td>
          <td width="16%" height="25" valign="middle" align="left"><%if(status.equals("L")||status.equals("UC")){%><img src="images/inprocess.png" /><%}else if(status.equals("S")){%><img src="images/supported.png" /><%}else if(status.equals("CL")){%><img src="images/approved.png" /><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}%></td>
        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="7"></td></tr>
<% }}} }else{%>
<tr><td class="small" align="center">No Request Found!!</td></tr>	
<%}%>
</table>

<table width="100%" cellspacing="0" cellpadding="0" border="0">

		<tr>
			<td height="22" cellspacing="0" colspan="7" bgcolor="#ffffff" class="travelMenuBG">Amendment Request</td>
		</tr>

 <%
	if(vStatus1.size()!=0)
	{
		for(int i=0; i<vStatus1.size(); i++)
		{
			appStatus="";
			String[] data1  = (String[])vStatus1.get(i); 
			String status1  = data1[27];
			String priceid1 = data1[0];   
			String INITIATOR_NAME1   = data1[40];
			String INITIATEDON1      = data1[41];

			//out.println("status1---"+status1);

	//if (status1.equals("")){		
    
%>

		<tr>
          <td width="8%" height="25" align="left" valign="middle" class="small" >&nbsp;&nbsp;&nbsp;<%=i+1%></td>
          
          <td width="18%" height="25" align="left" valign="middle" class="small"><%=data1[1]%></td>
<td width="12%" height="25" align="left" valign="middle" >&nbsp;&nbsp;&nbsp;<a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid1%>&viewSAB=YES" class="boldunderline_small_Blue"><U><%=priceid1%></U></a></td>
           <td width="18%" height="25" align="left" valign="middle" class="small"><a href="common/showDetailsnp.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid1%>&viewSAB=YES" class="boldunderline_small"><%=data1[6]%></a></td>
       <td width="16%" align="left" valign="middle" class="small"><%=INITIATOR_NAME1%></td>
         <td width="10%" align="left" valign="middle" class="small"><%=INITIATEDON1%></td>
          <td width="16%" height="25" valign="middle" align="left"><%if(status1.equals("L")||status1.equals("UC") ||status1.equals("UCA")){%><img src="images/inprocess.png" /><%}else if(status1.equals("S")){%><img src="images/supported.png" /><%}else if(status1.equals("CL")){%><img src="images/approved.png" /><%}else if(status1.equals("CR")){%><img src="images/rejected.png" /><%}%></td>
        </tr>
	    <tr><td bgcolor="#f0f0f0" height="1" colspan="7"></td></tr>
<% }} else{%>
<!-- <tr><td class="small" align="center">No Request Found..</td></tr>	 -->
<%}%>
</table>