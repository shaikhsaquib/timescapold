<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />

<%
	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/checkRequest.jsp");
	session.setAttribute("topLink", "1");

	Hashtable icons = new Hashtable( );
	Hashtable requestStatus = new Hashtable( );

	icons.put("L",  "ico_inprocess.gif");
	icons.put("A",  "ico_approved.gif");
	icons.put("P",  "ico_approved.gif");
	icons.put("R",  "ico_rejected.gif");
	icons.put("C",  "ico_cancelled.gif");
	icons.put("D",  "ico_bapproved.gif");
	icons.put("O",  "edit.jpg");
	icons.put("TB",  "images.jpg");

	requestStatus.put("L", "In Process");
	requestStatus.put("A", "Accepted");
	requestStatus.put("P", "Verified");
	requestStatus.put("R", "Rejected");
	requestStatus.put("C", "Cancelled");
	requestStatus.put("D", "Draft");
	requestStatus.put("O", "Edit");
	requestStatus.put("TB", "TimeBarred");

	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
%>
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<script Language="JavaScript" src="../jscripts/util.js">
		 </script>
		<script Language="JavaScript" src="../jscripts/checkRequest.js">
		</script>
	 </head>

  <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<%	
	ArrayList viewDetails = new ArrayList();
	String option = null;
	option  = (String)request.getParameter("option");
//out.println(option);
	
    if(option == null)// load the page(default) 
    {
           viewDetails = rmdAllowanceClaimDetails.viewHistory(timescapeUserOId);
    }
    else// load with the selected Year
    {
            viewDetails = rmdAllowanceClaimDetails.viewHistory(timescapeUserOId);
    }

%>
	<%@ include file="../includes/rmdClaimHeader.html" %>
	<%@ include file="../includes/rmdClaimMenu.jsp" %> 
	<table width="100%" border="0" cellspacing="1" cellpadding="2">
	<form name="frmCheckRequest" method="post">
	<input type="hidden" name="option" value="1">

	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			 <td align="right" class="normal">In Process <img src="../images/ico_inprocess.gif" width="10" height="10"/>&nbsp;&nbsp; Verified <img src="../images/ico_approved.gif" width="10" height="10"/>&nbsp;&nbsp; Rejected <img src="../images/ico_rejected.gif" width="10" height="10"/>&nbsp;&nbsp;Draft <img src="../images/ico_bapproved.gif" width="10" height="10"/>&nbsp;&nbsp;</td>
		</tr>

	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="15%" height="20">&nbsp;&nbsp;TRANSACTION ID</td>
			<td class="boldsmall" width="15%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM AMT</td>
			<td class="boldsmall" width="15%" height="20">APPROVED AMT</td>
			<td class="boldsmall" width="15%" height="20">PROCESSED ON</td>
			<td class="boldsmall" width="10%" height="20">STATUS</td>
		</tr>
<%
        //out.println("size---"+viewDetails.size());
   if(viewDetails.size() == 0)
	{
%>
	<tr width="100%" align="center" class="normal">
		<td colspan="100%" height="40" >No Request(s) to be processed!!!</td>
	</tr>
<%
	} else {
		String txnIds = "";
		for(int kk=0; kk<viewDetails.size(); kk++)
		{		
			String[] arr = (String[])viewDetails.get(kk);
			//String TID = arr[0];
			//ArrayList txnStatusData = new ArrayList();
			txnIds += arr[0]+",";
            if(!arr[5].equals("Z")){  

%>
		<tr>
			<td class="normal" height="20">
			<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="normal"><u>
			<%=arr[0]%></a></u></td>
			<td class="normal" height="20"><%=arr[4]%></td>
			<td class="normal" height="20">Rs.<%=arr[1]%></td>
			<td class="normal" height="20">Rs.<%=arr[2]%></td>
			<td class="normal" height="20"><%=arr[7]%></td>
			
<%
			if(arr[5].equalsIgnoreCase("L")) {
%>
			<td class="normal" height="20"><img src="../images/<%=icons.get(arr[5])%>">&nbsp;&nbsp;<%=requestStatus.get(arr[5])%></td>
<%
			} else {
%>
			<td class="normal" height="20">
				<img src="../images/<%=icons.get(arr[5])%>">&nbsp;&nbsp;<%=requestStatus.get(arr[5])%>
			</td> 

<%
        }//end of inner if
    }//end of for
}
txnIds = txnIds.substring(0,txnIds.length()-1);
session.setAttribute("RMD_IDS", txnIds);
}//end of else
%>
</tr>
</table>
<tr><td colspan="100%" height="20">&nbsp;</td><tr>
<tr>
<td colspan="100%" align="center">
</td>
</tr>
</table>
</form>
</body>
</html> 