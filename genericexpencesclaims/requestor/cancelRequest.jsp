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
<jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 

<%
	//Set session attribute for the link of current page
	session.setAttribute("currLink", "../requestor/cancelRequest.jsp");
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
    if(currMonth<3){
        currYear = currYear - 1;
    }
	int lastYear = currYear - 1;
	int selYear = 0;
    String faYearL = String.valueOf(lastYear);
    String faYearS = String.valueOf(currYear);
    String faYearE = String.valueOf(currYear+1);
    String faYearCurr = faYearS.substring(2,faYearS.length())+faYearE.substring(2,faYearE.length());
    String faYearLast = faYearL.substring(2,faYearL.length())+faYearS.substring(2,faYearS.length());
    String faYear ="";
	String entitlementCode = "";

%>
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
		<script Language="JavaScript" src="../jscripts/util.js">
		 </script>
		<script Language="JavaScript" src="../jscripts/cancelRequest.js">
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
		viewDetails = genericClaimController.viewPendingRequests(timescapeUserOId,faYear);
}
else// load with the selected Year
{
		faYear = (String) request.getParameter("year");
		//selYear = Integer.parseInt(fromYear);
		viewDetails = genericClaimController.viewPendingRequests(timescapeUserOId,faYear);
}
%>

 <%@ include file="../includes/genericClaimHeader.html" %>
 <%@ include file="../includes/genericClaimMenu.jsp" %> 
<table width="100%" border="0" cellspacing="1" cellpadding="2">
<form name="frmCancelRequest" method="post">
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

<tr><td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" valign="middle" align="center">CANCEL REQUEST</td></tr>

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="15%" height="20">&nbsp;&nbsp;TRANSACTION ID</td>
			<td class="boldsmall" width="15%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM TYPE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM AMT</td>
			<td class="boldsmall" width="15%" height="20">APPROVED AMT</td>
			<!-- <td class="boldsmall" width="15%" height="20">BALANCE AMT</td> -->
			<td class="boldsmall" width="15%" height="20">PROCESSED ON</td>
			<td class="boldsmall" width="15%" height="20">STATUS</td>
			<td class="boldsmall" width="10%" height="20">SUBMIT</td>
		</tr>
<%	
	if(viewDetails.isEmpty())
	{
%>
<tr  align="center" class="normal">
		<td colspan="100%" height="40" >No request(s) for Generic Claim to be cancelled for the selected Year!</td>
		</tr>
<%
	} else {
	String txnIds = "";
	for(int kk=0; kk<viewDetails.size(); kk++)
	{		String[] arr = (String[])viewDetails.get(kk);
			String TID = arr[0];
			 entitlementCode = arr[11];
			 txnIds+= TID+",";
			if("int".equals(arr[11])){
		
		 arr[11] = "Internet";
	}else if("ent".equals(arr[11]))
	{
		 arr[11] = "Entertainment";
	}
			ArrayList txnStatusData = new ArrayList();
			//txnStatusData.add(arr[7],arr[8],arr[9],arr[3],arr[4],arr[5])
			//appDate-proccedBy-processedOn-claimamt-actualAmt-balAmt
           if(!arr[10].equals("Z")){  

%>

<tr>

<td class="normal" >&nbsp;&nbsp;
<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="underline">
<font color="#3366FF"><%=arr[0]%></font></a></td>
<td class="normal"  height="30"><%=arr[7]%></td>
<td class="normal"  height="30"><%=arr[11]%></td>
<td class="normal"  height="30">Rs.<%=arr[3]%></td>

<% if(arr[10].equals("L") || arr[10].equals("O")){//display 'x' when request status is in process or open

arr[8] = "-";
arr[9] = "-";
}
%>
<td class="normal"  height="30">Rs.<%=arr[4]%></td>
<!-- <td class="normal"  height="30">Rs.<%=arr[5]%></td> -->
<td class="normal"  height="30"><%=arr[9]%></td>
<td class="normal"  height="30">
<img src="../images/<%=icons.get(arr[10])%>">&nbsp;&nbsp;<%=requestStatus.get(arr[10])%></td>
<td align="left" class="normal">&nbsp;<a href="javascript:cancel(<%=kk%>)"  class="underline">Cancel</a></td>
<input type = "hidden" name = "entitlementCode" id = "entitlementCode" value = <%=entitlementCode%>>
</tr>
<%
        }//end of inner if
    }//end of for
	txnIds = txnIds.substring(0,txnIds.length()-1);
	session.setAttribute("GEN_IDS", txnIds);
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