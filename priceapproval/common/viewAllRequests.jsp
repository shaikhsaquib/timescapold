<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.util.Hashtable, java.util.ArrayList,java.text.SimpleDateFormat,java.util.GregorianCalendar,java.util.Calendar, java.util.Date,java.text.*" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility,com.bccl.util.AESencrp"%>
<%@ page import = "java.util.*"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 

<%@ page language="java"%>
<%@ include file="../includes/sessionCheck.jsp"%>

<%@ include file="../includes/empHeader.jsp"%>



<script Language="JavaScript" src="../jscripts/fieldCheck.js"></script>
<script Language="JavaScript" src="../jscripts/newsprint.js"></script>
<script Language="JavaScript" src="../jscripts/reports.js"></script>

<link href="../style/popup.css" rel="stylesheet" type="text/css" />
<link href="../style/global.css" rel="stylesheet" type="text/css" />

<head>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
</style>
</head>

<body>
<form name="viewAllRequests" method="post" action="" class="form-horizontal">
<script src="../jscripts/calendarControl.js" language="javascript"></script>
<link href="../style/calendarControl.css" rel="stylesheet">

<%
	String frmDate = " ";
	String toDate =" ";
	String status2 = " ";

	String tOId			=   Long.toString(timescapeUserOId);
	//System.out.println("tOIdtOIdtOId"+tOId);

	ArrayList vStatus	=  new ArrayList();
	ArrayList allDataArr  =  new ArrayList();
	Hashtable allData = new Hashtable();
	//vStatus 			=	priceApprovalWebController.viewAllDetailsNpPending();
	

	String status1 = (String)request.getParameter("status");
	String frmDate1 = (String)request.getParameter("fromdate") == null ? "" : (String)request.getParameter("fromdate");
	String toDate1 = (String)request.getParameter("todate") == null ? "" : (String)request.getParameter("todate"); 
	
	
	if((!frmDate1.equals("") || !frmDate1.equals(null) )&& (!toDate1.equals("") || !toDate1.equals(null)))
	{
	vStatus 			=	priceApprovalWebController.viewAllDetailsNpPending();	
	}
	else
	{
		allData.put("FROMDATE", frmDate1);
		allData.put("TODATE",toDate1);
		allDataArr = priceApprovalWebController.viewAllDetailsByDate(allData);
	}
		
	
	
%>
		<table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td height="14" bgcolor="#ffffff"><hr/></td>
        </tr>
		<tr>
          <td height="22" bgcolor="#ffffff" class="travelMenuBG">View All Requests</td>
        </tr>
	     <tr>
            <td class="small" height="20"  align="left">&nbsp;In Process <img src="/timescape/sapep/employeeselfservice/priceapproval/images/inprocess.png" />
			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Approved <img src="/timescape/sapep/employeeselfservice/priceapproval/images/approved.png" />
			|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:viewAllReportNew()"><img src="../images/excel.png" >Excel Report
				
          </tr> 
		</table> 
 
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		  <tr height = "10"></tr>
		   <tr class="greyBG">
	
		  <td  align="right" width="60%">STATUS : &nbsp;&nbsp; </td>
		  <td  width="10%" height = "30" >
            <select class="normal" style="height:20px;" style="padding-left:5px;"  id="status" name="status" >
			<option value="0">Select Status</option>
			<option value="UD">Draft</option>
			<option value="UC" selected>Request Created</option>
			<option value="L">In Process</option>	
			<option value="C">Cancelled</option>
			<option value="URE">Review</option>
			<option value="CL">Approved</option>
			</select>
      </td>
	   
		 <td align = "left" font-size="7pt" width="7%" height= "40" style="padding-right:5px;padding-left:3px;" >&nbsp;&nbsp;FROM&nbsp;&nbsp;DATE</td>
		 <td align="left" width="5%" style="padding-left:5px;"><span class="normal">
		<input name="frmDate" id="frmDate" class="normal" value = "<%//=frmDate%>" maxlength="100" onfocus="showCalendarControl(this);" readonly="readonly"/>
		</span></td>

		<td align = "left"   width="7%" style="padding-right:0px;padding-left:8px;">&nbsp;&nbsp;TO &nbsp;DATE:&nbsp;</td>
		 <td  align="left" width="5%" style="padding-left:5px;"><span class="normal">
		<input name="toDate" id="toDate" class="normal" maxlength="100" value = "<%//=toDate%>" onfocus="showCalendarControl(this);"  readonly="readonly"/>
		</span></td>
			
		<td><input name="go" type="button" class="style4" id="go" value="Go" onclick = "dispValues()"/></td> &nbsp; </tr>	
		</table>
		  		 
	<div id = "pricedataReq">
		<table width="100%" cellspacing="2" cellpadding="2" border="0" id="values">
		<tr class="greyBG">
            <td width="2%" height="29" >Sr. No</td>
            <td width="11%" align="left">PURCHASE APPROVAL ID</td>    
            <td width="10%" align="left">VENDOR NAME</td> 
            <td width="10%" align="left">QUANTITY</td>
            <td width="10%" align="left">DELIVERY IN</td>
            <td width="12%" align="left">INITIATOR NAME</td>
            <td width="10%" align="left">INITIATED ON</td>
            <td width="10%" align="left">PENDING WITH</td>
            <td width="10%" align="left">STATUS</td>
            <td width="10%" align="left">ACTION</td>
        </tr>
		
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
            <td  align="left" valign="middle" class="normal">&nbsp;&nbsp;&nbsp;<%=i+1%></td>
            <td  align="left" valign="middle" class="normal"><%=priceid%></td>
            <td  align="left" valign="middle" class="normal"><b><%=data[1] == null ? "NA" :data[1]%></b></td> <!-- vendor name -->
            <td  align="left" valign="middle" class="normal">&nbsp;<b><%=data[6] == null ? "NA" :data[6]%></b></td>    <!-- quantity -->
            <td  align="left" valign="middle" class="normal">&nbsp;&nbsp;<b><%=data[7] == null ? "NA" :data[7]%></b></td> <!-- delivery in -->
            <td  align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=INITIATOR_NAME%></td>
            <td  align="left" valign="middle" class="normal">&nbsp;&nbsp;<%=INITIATEDON%></td>
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
          <td  width="10%" height="25" valign="middle" align="left">&nbsp;&nbsp;<%if(status.equals("L")||status.equals("UCA")){%><img src="../images/inprocess.png" /><%}else if(status.equals("UC")){%><span class="normal">Request Created</span><%}else if(status.equals("UD")){%><span class="normal">Draft</span><%}else if(status.equals("CL")){%><img src="../images/approved.png" /><span class="normal"></span><%}else if(status.equals("CR")){%><img src="../images/rejected.png" /><%}else if(status.equals("URE")){%><span class="normal">Review</span><%}else if(status.equals("C")){%><span class="normal">Cancelled</span><%}%></td></td>
 
<%
	//out.println(tOId);
	//out.println("timescapeUserOId..."+timescapeUserOId);
if ((status.equals("CL")||status.equals("L")||status.equals("URE") ||status.equals("UD") ||status.equals("UCA")||status.equals("UC")) 
	&& (tOId.equals("20411") || tOId.equals("3459") || tOId.equals("4637") || tOId.equals("14729") ||  emailId.equals(data[75]))){ 
	//out.println("uuuuu");
    view  ="<a href=\"showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
	cancel  ="/ <a href=\"javascript:cancelParNpAdmin1('"+priceid+"','C','"+timescapeUserOId+"','"+Approver+"','"+INITIATOREMAILID+"')\">Cancel</a> ";
	Ammendment  ="/ <a href=\"javascript:ammendParNpAdmin('"+priceid+"','AM','"+timescapeUserOId+"','"+Approver+"','"+INITIATOREMAILID+"')\">Amendment</a> ";
%><td width="10%" height="25" align="left" valign="middle" class="normal"><%=view%><%=cancel%><%=Ammendment%></td>
<%} else if ((status.equals("CL")||status.equals("L")||status.equals("UC")||status.equals("C")||status.equals("URE") ||status.equals("UD") ||status.equals("UCA") ||status.equals("AM"))){
	//out.println("ffff");
		view  ="<a href=\"showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";

		//view  ="<a href=\"showDetailsAdminNp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid+"\">View</a>";
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
</div>

</form>
</body>