<%--
 -- @(#)checkMedicalClaimRequest.jsp	15/3/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Viraj Patil
 -- @version 	1.00, 15/3/2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>

<jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 

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
	icons.put("O",  "edit.jpg");
	icons.put("TB",  "images.jpg");
    
	requestStatus.put("L", "In Process");
	requestStatus.put("A", "Accepted");
	requestStatus.put("P", "Verified");
	requestStatus.put("R", "Rejected");
	requestStatus.put("C", "Cancelled");
	requestStatus.put("O", "Edit");
	requestStatus.put("TB", "TimeBarred");


%>
<%
	String [] months = {"Month", "January" , "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
	GregorianCalendar today = new GregorianCalendar();
	Calendar cal = Calendar.getInstance();
%>

<%
	int currYear = cal.get(Calendar.YEAR);
	int currMonth = cal.get(Calendar.MONTH);
    if(currMonth<3)
        currYear = currYear - 1;
    int lastYear = currYear - 1;
	int selYear = 0;
    String faYearL = String.valueOf(lastYear);
    String faYearS = String.valueOf(currYear);
    String faYearE = String.valueOf(currYear+1);
    String faYearCurr = faYearS.substring(2,faYearS.length())+faYearE.substring(2,faYearE.length());
    String faYearLast = faYearL.substring(2,faYearL.length())+faYearS.substring(2,faYearS.length());
    String faYear ="";

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
	ArrayList viewDetails = null;
	String option = null;
	option  = (String)request.getParameter("option");

	if(option == null)// load the page(default) 
{
		//selYear = currYear;
        faYear = faYearCurr;
		viewDetails = vehicleClaimController.viewHistory(timescapeUserOId,faYear);
}
else// load with the selected Year
{
		faYear = (String) request.getParameter("year");
		//selYear = Integer.parseInt(fromYear);
		viewDetails = vehicleClaimController.viewHistory(timescapeUserOId,faYear);
}
//out.println(faYearCurr);
%>

 <%@ include file="../includes/medicalClaimHeader.html" %>
 <%@ include file="../includes/medicalClaimMenu.jsp" %> 
<table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name="frmCheckRequest" method="post">
<input type="hidden" name="option" value="1">

<table width="100%" border="0" cellspacing="1" cellpadding="2" >
	<tr>

			<td align="right" class="normal">
			Financial Year <select id="year" name="year" class="normal">
				<%//= HtmlUtil.getYearList(lastYear,currYear, selYear,"desc")%>
                <%
                    if(faYear.equals(faYearCurr)){
                %>
                <option value="<%=faYearCurr%>" selected><%=faYearS+"-"+faYearE.substring(2,faYearE.length())%></option>
                <option value="<%=faYearLast%>"><%=faYearL+"-"+faYearS.substring(2,faYearS.length())%></option>

                <%
                    }else{
                %>
                <option value="<%=faYearCurr%>"><%=faYearS+"-"+faYearE.substring(2,faYearE.length())%></option>
                <option value="<%=faYearLast%>" selected><%=faYearL+"-"+faYearS.substring(2,faYearS.length())%></option>
                <%
                    }
                %>
			</select>
	<a href="javascript:go( )"><img src="../images/greyarrow.gif" border="0" align="absmiddle"></a>
		</td>

	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">

<tr><td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" valign="middle">&nbsp;&nbsp;STATUS of Vehicle Lease Reimbursement for Financial Year&nbsp;-&nbsp;<%=faYear%>.</td></tr>

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="15%" height="20">&nbsp;&nbsp;TRANSACTION ID</td>
			<td class="boldsmall" width="15%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM AMT</td>
			<td class="boldsmall" width="15%" height="20">APPROVED AMT</td>
			<!-- <td class="boldsmall" width="15%" height="20">BALANCE AMT</td> -->
			<td class="boldsmall" width="15%" height="20">PROCESSED ON</td>
			<td class="boldsmall" width="10%" height="20">STATUS</td>
		</tr>
<%	
	if(viewDetails.isEmpty())
	{
%>
<tr  align="center" class="normal">
		<td colspan="100%" height="40" >No Vehicle Lease Claim(s) have been filed for the selected period !</td>
		</tr>
<%
	} else {
	String txnIds = "";
	for(int kk=0; kk<viewDetails.size(); kk++)
	{		String[] arr = (String[])viewDetails.get(kk);
			String TID = arr[0];
			txnIds+= TID+",";
			ArrayList txnStatusData = new ArrayList();
			//txnStatusData.add(arr[7],arr[8],arr[9],arr[3],arr[4],arr[5])
			//appDate-proccedBy-processedOn-claimamt-actualAmt-balAmt
        if(!arr[10].equals("Z")){  
%>

<tr>
<td class="normal" >&nbsp;&nbsp;
	<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="normal"><u><%=arr[0]%></u></a>
</td>
<td class="normal"  height="30"><%=arr[7]%></td>
<td class="normal"  height="30">Rs.<%=arr[3]%></td>

<% if(arr[10].equals("L") || arr[10].equals("O")){//display '-' when request status is in process or open
    arr[8] = "-";
    arr[9] = "-";
}
%>
<td class="normal"  height="30">Rs.<%=arr[4]%></td>
<!-- <td class="normal"  height="30">Rs.<%=arr[5]%></td>-->
<td class="normal"  height="30"><%=arr[9]%></td>
<%      if(arr[10].equals("O")){
        ArrayList viewMedicalClaimDetails = null;
        viewMedicalClaimDetails = vehicleClaimController.viewTxnId(arr[0]);
%>
<td class="normal"  height="30">
<a href="../requestor/createRequest.jsp?id=<%=kk%>" class="normal"><u>edit</u></a>
&nbsp;/&nbsp;<a href="javascript:release(<%=arr[3]%>,<%=kk%>,<%=viewMedicalClaimDetails.size()%>)" class="normal"><u>submit</u></a>
</td>
<%      }else{
%>
<td class="normal"  height="30">
<img src="../images/<%=icons.get(arr[10])%>">&nbsp;&nbsp;<%=requestStatus.get(arr[10])%></td>
<%      }
%>
</tr>
<%
        }//end of inner if
    }//end of for
	txnIds = txnIds.substring(0,txnIds.length()-1);
		session.setAttribute("VEH_IDS", txnIds);
}//end of else
%>
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