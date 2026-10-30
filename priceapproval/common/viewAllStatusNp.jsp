<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
<%
	String tOId			=   Long.toString(timescapeUserOId);
	//System.out.println("tOIdtOIdtOId"+tOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewAllDetailsNp();
%>
<form name="viewAllStatusNp" method="post" action="" class="form-horizontal">
<table width="100%" cellspacing="0" cellpadding="0" border="0">
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data  = (String[])vStatus.get(i); 
			String status  = data[28];
			String priceid = data[0];
			String INITIATOR_NAME   = data[59];
			String INITIATEDON      = data[60];
            String view     ="";
            String view1     ="";
			String cancel   ="";
			String Ammendment   ="";
			String ap1   ="";
			String ap2   ="";
			String ap3   ="";
			String ap4   ="";
			String ap5   ="";
			String ap6   ="";
			String Approver  = "";
			String appStatus = "";
			String INITIATOREMAILID = data[75];

			//System.out.println("data[22]--"+data[22]);


			if(data[22].equals(tOId) )
			{
				//System.out.println("JHiiiiiii");
				Approver = "AP1";
				//appStatus = AP1_STATUS;
			}
			else if(ap2.equals(tOId))
			{
				Approver = "AP2";
				//appStatus = AP2_STATUS;
			}
			else if(ap3.equals(tOId) )
			{
				Approver = "AP3";
				//appStatus = AP3_STATUS;
			}
			else if(ap4.equals(tOId))
			{
				Approver = "AP4";
				//appStatus = AP4_STATUS;
			}

			else if(ap5.equals(tOId))
			{
				Approver = "AP5";
				//appStatus = AP5_STATUS;
			}
			else if(ap6.equals(tOId))
			{
				Approver = "AP6";
				//appStatus = AP6_STATUS;
			}

%>
		<tr>
            <td  width="10%" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
            <td  width="10%" align="left" valign="middle" class="normal"><%=priceid%></td>
            <td  width="10%" align="left" valign="middle" class="normal"><b><%=data[1] == null ? "NA" :data[1]%></b></td>
            <td  width="10%" align="left" valign="middle" class="normal">&nbsp;<b><%=data[6] == null ? "NA" :data[6]%></b></td>
            <td  width="10%" align="left" valign="middle" class="normal">&nbsp;&nbsp;<b><%=data[7] == null ? "NA" :data[7]%></b></td>
            <td  width="10%" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=INITIATOR_NAME%></td>
            <td  width="10%" align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=INITIATEDON%></td>
<%
		if(data[28].equals("L") || data[28].equals("UC") || data[28].equals("UCA")){
			if (data[63].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[53] == null ? "NA" :data[53]%></td>
<%

			}else if (data[65].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[54] == null ? "NA" :data[54]%></td>
<%

			}else if (data[67].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[55] == null ? "NA" :data[55]%></td>
<%

			}else if (data[69].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[56] == null ? "NA" :data[56]%></td>
<%

			}else if (data[71].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[57] == null ? "NA" :data[57]%></td>
<%

			}else if (data[73].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[58] == null ? "NA" :data[58]%></td>

<%
			}}else if(data[28].equals("AM") || data[28].equals("URE") || data[28].equals("UD")){

				if (data[63].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>
<%

			}else if (data[65].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>
<%

			}else if (data[67].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>
<%

			}else if (data[69].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>
<%

			}else if (data[71].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>
<%

			}else if (data[73].equals("L")){
%> 
			<td  width="10%" height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[59] == null ? "NA" :data[59]%></td>

<%
			}}
if (data[28].equals("C") ){
    cancel  ="";
%>
	<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=" "%></td>
<%
}
if (data[28].equals("CL") ){
    cancel  ="";
%>
	<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%="Approved"%></td>
<%
}
%>




            <td  width="10%" height="25" valign="middle" align="left">&nbsp;&nbsp;<%if(status.equals("L")||status.equals("UCA")){%><img src="images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="normal">Request Created</span><%}else if(status.equals("UD")){%><span class="normal">Draft</span><%}else if(status.equals("CL")){%><img src="images/approved.png" /><span class="normal"></span><%}else if(status.equals("CR")){%><img src="images/rejected.png" /><%}else if(status.equals("URE")){%><span class="normal">Review</span><%}else if(status.equals("C")){%><span class="normal">Cancelled</span><%}%></td></td>
 
<%
//if ((status.equals("CL")||status.equals("L")||status.equals("URE") ||status.equals("UD") ||status.equals("UCA")) 
	//&& (tOId.equals("20411") || tOId.equals("3459") || tOId.equals("4637") || tOId.equals("14729"))){

	if ((status.equals("CL")||status.equals("L")||status.equals("URE") ||status.equals("UD") ||status.equals("UCA")) 
	&& (tOId.equals("86058") || tOId.equals("3459") || tOId.equals("4637") || tOId.equals("14729"))){
	//out.println("uuuuu");
    view  ="<a href=\"common/showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
	cancel  ="/ <a href=\"javascript:cancelParNpAdmin1('"+priceid+"','C','"+timescapeUserOId+"','"+Approver+"','"+INITIATOREMAILID+"')\">Cancel</a> ";
	Ammendment  ="/ <a href=\"javascript:ammendParNpAdmin('"+priceid+"','AM','"+timescapeUserOId+"','"+Approver+"','"+INITIATOREMAILID+"')\">Amendment</a> ";
%><td width="10%" height="25" align="left" valign="middle" class="normal"><%=view%><%=cancel%><%=Ammendment%></td>
<%} else if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE") ||status.equals("UD") ||status.equals("UCA") ||status.equals("AM"))){
	//out.println("ffff");
		view  ="<a href=\"common/showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";

		//view  ="<a href=\"common/showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
%>		<td width="10%" height="25" align="left" valign="middle" class="normal"><%=view%><%=cancel%></td>
<%}
%>

<!-- <td height="25" align="left" valign="middle" class="normal"><%=view%><%=cancel%><%=Ammendment%></td> -->

    
  </tr>
			  <tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
<% } }else{%>
<tr><td class="normal" align="center" colspan="100%">No Request Found!!</td></tr>	
<%}%>
</table>


<!-- my code for date filter -->

<%
  	
if(allDataArr.size() == 0) {

  %>
  <td height="22"  class="normal"><strong>No Data To Display</strong></td> 
  <%
}
else if(allDataArr.size() > 0){

	for(int i=0; i<allDataArr.size(); i++)
		{
			String[] data  = (String[])allDataArr.get(i); 
			String status  = data[28];
			String priceid = data[0];
			String INITIATOR_NAME   = data[59];
			String INITIATEDON      = data[60];
            String view     ="";
            String view1     ="";
			String cancel   ="";
			String Ammendment   ="";
			String ap1   ="";
			String ap2   ="";
			String ap3   ="";
			String ap4   ="";
			String ap5   ="";
			String ap6   ="";
			String Approver  = "";
			String appStatus = "";
			String INITIATOREMAILID = data[75];

			//System.out.println("data[22]--"+data[22]);

			if(data[22].equals(tOId) )
			{
				//System.out.println("JHiiiiiii");
				Approver = "AP1";
				//appStatus = AP1_STATUS;
			}
			else if(ap2.equals(tOId))
			{
				Approver = "AP2";
				//appStatus = AP2_STATUS;
			}
			else if(ap3.equals(tOId) )
			{
				Approver = "AP3";
				//appStatus = AP3_STATUS;
			}
			else if(ap4.equals(tOId))
			{
				Approver = "AP4";
				//appStatus = AP4_STATUS;
			}

			else if(ap5.equals(tOId))
			{
				Approver = "AP5";
				//appStatus = AP5_STATUS;
			}
			else if(ap6.equals(tOId))
			{
				Approver = "AP6";
				//appStatus = AP6_STATUS;
			}
			
		}
	}		
