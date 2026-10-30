<%@ page import="java.util.Hashtable, java.util.ArrayList,java.text.SimpleDateFormat,java.util.Date, java.text.DateFormat" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp"%>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<head>
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
<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>

<%
	String tOId			=   Long.toString(timescapeUserOId);
	
	ArrayList vStatus	=  new ArrayList();
	
	vStatus 			=	priceApprovalWebController.viewDetailsnP(tOId);
	
	//out.println(vStatus.size());
%>


</head>
<form name="viewStatusNp" method="post" action="" class="form-horizontal">

<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr /></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">Buyers Status</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="../images/inprocess.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|<!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Supported <img src="../images/supported.png" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="../images/approved.png" /><!-- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Rejected<img src="../images/rejected.jpg" /> --></td>
          </tr>
</table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">       
		<tr class="greyBG">
            <td width="2%" height="29" >Sr. No</td>
            <td width="11%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="20%" align="left">VENDOR NAME</td> 
            <td width="10%" align="left">QUANTITY</td>
            <td width="10%" align="left">DELIVERY IN</td>
            <td width="12%" align="left">INITIATOR NAME</td>
            <td width="8%" align="left">INITIATED ON</td>
            <td width="7%" align="left">STATUS</td>
            <td width="10%" align="left">PENDING WITH</td>
            <td width="16%" align="left">ACTION</td>

        </tr>
 <%
	if(vStatus.size()!=0)
	{
		for(int i=0; i<vStatus.size(); i++)
		{
			String[] data               = (String[])vStatus.get(i); 
			String status               = data[28];
			String priceid              = data[0];
			String AP1                  = data[22];
			String APPROVER11_STATUS    = data[59];
			String INITIATOR_NAME       = data[71];
			String INITIATEDON          = data[72];
			String deliveryIn           = data[7];

            String cancel   ="";
            String edit     ="";
            String view     ="";
            String view2    ="";
            String view3    ="";
            String cancelAuthorision ="";

%>
		<tr>
            <td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
            <td  height="25" align="left" valign="middle" class="normal"><%=priceid%></td>
            <td  height="25" align="left" valign="middle" class="normal"><b><%=data[1] == null ? "NA" :data[1]%></b></td>

          <td  height="25" align="left" valign="middle" class="normal"><b><%=data[6] == null ? "NA" :data[6]%></b></td>
          <td  height="25" align="left" valign="middle" class="normal"><b><%=data[7] == null ? "NA" :data[7]%></b></td>
       <td  align="left" valign="middle" class="normal"><%=INITIATOR_NAME%></td>
         <td  align="left" valign="middle" class="normal"><%=INITIATEDON%></td>
          <td  height="25" valign="middle" align="left"><%if(status.equals("L")  || status.equals("AM") || status.equals("UCA")){%><img src="../images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="normal">Request Created</span><%}else if(status.equals("UD")){%><span class="normal">Draft</span><%}else if(status.equals("CL")){%><img src="../images/approved.png" /><%}else if(status.equals("CR")){%><img src="../images/rejected.png" /><%}else if(status.equals("URE")){%><span class="normal">Review</span><%}else if(status.equals("C")){%><span class="normal">Cancelled</span><%}%></td></td>
<%
if(data[28].equals("L") || data[28].equals("UC") || data[28].equals("UCA")){

if (data[59].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[53] == null ? "NA" :data[53]%></td>
<%

}else if (data[61].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[54] == null ? "NA" :data[54]%></td>
<%

}else if (data[63].equals("L")){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[55] == null ? "NA" :data[55]%></td>
<%

}else if (data[65].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[56] == null ? "NA" :data[56]%></td>
<%

}else if (data[67].equals("L")){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[57] == null ? "NA" :data[57]%></td>
<%

}else if (data[69].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[58] == null ? "NA" :data[58]%></td>

<%
}
		  }else if(data[28].equals("AM") || data[28].equals("URE") || data[28].equals("UD")){

if (data[59].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>
<%

}else if (data[61].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>
<%

}else if (data[63].equals("L")){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>
<%

}else if (data[65].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>
<%

}else if (data[67].equals("L")){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>
<%

}else if (data[69].equals("L") ){
%> 
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=data[71] == null ? "NA" :data[71]%></td>

<%
}
		  }
if (status.equals("C")){
    cancel  ="";
%>
	<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=" "%></td>
<%
}
else if (!AP1.equals("0") && APPROVER11_STATUS.equals("L")||status.equals("UD")||status.equals("URE"))
{
  cancel  ="/ <a href=\"#\" onclick=\"cancelParNp('"+priceid+"','"+tOId+"','C')\">Cancel</a> ";
}

if ((status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE") ||status.equals("AM") ||status.equals("UCA")) && (!status.equals("UD")))
	{
		view  ="<a href=\"../common/showDetailsBuyersStatusnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
		view2  ="/ <a href=\"../common/showDetailsBuyersStatusNP2.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View2</a>";
		view3  ="/ <a href=\"../common/showDetailsBuyersStatusNP3.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View3</a>";

	}

if (status.equals("CL"))
	{
		view  ="<a href=\"../common/showDetailsBuyersStatusnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
		view2  ="/ <a href=\"../common/showDetailsBuyersStatusNP2.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View2</a>";
		view3  ="/ <a href=\"../common/showDetailsBuyersStatusNP3.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View3</a>";
		cancelAuthorision  ="/ <a href=\"../indexUpdatenpCan.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Cancel</a> ";
%>
<td  height="25" align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%="Approved"%></td>
<%	}

if (status.equals("URE")){
    edit  ="/ <a href=\"../indexUpdatenp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
}else if(status.equals("UD"))
{
    edit  =" <a href=\"../indexUpdateDraftnp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">Modify</a> ";
}
%>

<%

	SimpleDateFormat format1 = new SimpleDateFormat("dd-MMM-yyyy");

	Date initiatedOnDate = format1.parse(INITIATEDON);
	Date printCutOffDate = format1.parse("01-MAR-2022");

	if (initiatedOnDate.compareTo(printCutOffDate) < 0) {
%>

	<td height="25" align="left" valign="middle" class="normal"><%=view%>&nbsp;<%=edit%>&nbsp;<%=cancel%>&nbsp;<%=cancelAuthorision%></td>
 
<%
	}else{
%>
	<td height="25" align="left" valign="middle" class="normal"><%=view%>&nbsp;<%=view2%>&nbsp;<%=view3%>&nbsp;<%=edit%>&nbsp;<%=cancel%>&nbsp;<%=cancelAuthorision%></td>
 <%
	}
%>
  
	</tr>
	<tr><td bgcolor="#f0f0f0" height="1" colspan="9"></td></tr>
<% } }else{%>
	<tr><td class="normal" align="center" colspan="100%">No Request Found!!</td></tr>	
<%}%>
</table>