<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>
<jsp:useBean id="rmdAllowanceClaimDetails" class="com.bccl.rmdallowanceclaim.web.controllerbeans.RmdAllowanceClaimWebController" />
<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	    <meta http-equiv="no-cache">
		<meta http-equiv="expires" content="0">
        <script Language="JavaScript" src="../jscripts/util.js">
        </script>
	</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form name ="frmSearchRequest" method ="post">

<%
	String role = (String)	session.getAttribute("topLink");
    ArrayList searchList = null;

	if(searchList == null){
			
		Hashtable searchHash = new Hashtable();

		// Get the selected search option
		String searchOpt = (String) request.getParameter("searchOpt");

		if(searchOpt.equals("company")){

			String reqCompanyCode = (String) request.getParameter("companyCode");
			String reqPayId = (String) request.getParameter("payId");
			
			searchHash.put("companyCode", reqCompanyCode);
			searchHash.put("payId", reqPayId);

		}else if(searchOpt.equals("emailId")){
			
			String reqEmailId = (String) request.getParameter("emailId");
			reqEmailId = reqEmailId.toLowerCase();

			searchHash.put("emailId", reqEmailId);

		}else if(searchOpt.equals("employeeName")){
			
			String reqEmployeeName = (String) request.getParameter("employeeName");
			int pos = reqEmployeeName.lastIndexOf(" ");

			String reqFirstName = "";
			String reqLastName = "";

			if(pos < 1){
				reqFirstName = reqEmployeeName;
				reqLastName = "";
			}else{
				reqFirstName = reqEmployeeName.substring(0, reqEmployeeName.lastIndexOf(" "));
				reqLastName  = reqEmployeeName.substring(reqEmployeeName.lastIndexOf(" ") + 1, reqEmployeeName.length());
			}

			searchHash.put("firstName", reqFirstName);
			searchHash.put("lastName", reqLastName);

        }else if(searchOpt.equals("txnId")){
        
        String reqTxnId = (String) request.getParameter("txnId");
        searchHash.put("txnId", reqTxnId);

		}else{
			// Do Nothing
		}
			
		String tmpStr = timescapeUserOId + "";
		searchHash.put("timescapeUserOID", tmpStr);
		searchHash.put("roleCode", role);
		//searchHash.put("roleCode", (String) session.getAttribute("investmentRole"));
		searchList = rmdAllowanceClaimDetails.searchUser(searchHash);
		//session.setAttribute("results", searchList);
	}
%>
	<%@ include file="../includes/rmdClaimHeader.html" %>
	<%@ include file="../includes/rmdClaimMenu.jsp" %> 
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="10%" height="20">TXN ID</td>
			<td class="boldsmall" width="15%" height="20">&nbsp;NAME</td>
			<td class="boldsmall" width="10%" height="20">PAYROLL ID</td>
			<td class="boldsmall" width="10%" height="20">DEPARTMENT</td>
			<td class="boldsmall" width="10%" height="20">DESIGNATION</td>
			<td class="boldsmall" width="10%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="15%" height="20">CLAIM AMT</td>
			<td class="boldsmall" width="10%" height="20">PROCESS/VIEW</td>
		</tr>
<%
	//String tmpStr[] = null;

	if(searchList == null || searchList.size() == 0)
	{
          if(role.equalsIgnoreCase("2")){
%>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No results found matching the search criteria.<br><br> Please click <a href = "../processor/searchRequest.jsp" class = "boldunderline">here</a> to continue
			</td>
		</tr>
<%
          }
	} 
		else {
%>

<!-- 	  <tr>
		 <td height="5" colspan="3"><%//@ include file="../common/pagenation.jsp" %></td>
	  </tr> -->

<%
		String txnIds = "";
		for(int kk=0; kk<searchList.size(); kk++)
		{		
			String[] arr = (String[])searchList.get(kk);
			txnIds+= arr[11]+",";
%>

		<tr>
		
		
			 <td class="normal"  height="30">&nbsp;&nbsp;<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=kk%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=500,top=100,left=50')" class="normal"><u><%=arr[11]%></u></a></td> 
			<td class="normal"  height="30"><%=arr[5]%></td>
			<td class="normal"  height="30"><%=arr[3]%></td>
			<td class="normal"  height="30"><%=arr[9]%></td>
			<td class="normal"  height="30"><%=arr[10]%></td>
			<td class="normal"  height="30"><%=arr[15]%></td>
			<td class="normal"  height="30">Rs.<%=arr[12]%></td>
			<!-- <td class="normal"  height="30"><%=arr[13]%></td> -->
<%
			if(arr[13].equals("L")){
                if(timescapeUserOId!=Long.parseLong(arr[0])) //processor can't process his own request
                {
%>

				<td class="normal"  height="30">
				<a href="../processor/processRequestSubmit.jsp?status=A&txnId=<%=arr[11]%>&claim=<%=arr[12]%>&tUOid=<%=arr[0]%>&compCode=<%=arr[1]%>" class="normal"><u>accept</u></a>&nbsp;&nbsp;
				<a href="../processor/processRequestSubmit.jsp?status=R&txnId=<%=arr[11]%>&claim=<%=arr[12]%>&tUOid=<%=arr[0]%>&compCode=<%=arr[1]%>" class="normal"><u>reject</u></a>
		</td>

<%				}else
				{  //processor can't process his own request
%>
                 <td class="normal"  height="30">&nbsp;</td>
 <%
                }
			 }else{
%> 
			<td class="normal" >Verified</td>


<input type="hidden" name="compCode" value="<%=arr[1]%>">
<input type="hidden" name="payId" value="<%=arr[2]%>">
<input type="hidden" name="appliedDate" value="<%=arr[15]%>">
<input type="hidden" name="claimAmount" value="<%=arr[12]%>">

		</tr>
<%
		}
	}
	txnIds = txnIds.substring(0,txnIds.length()-1);
		session.setAttribute("RMD_IDS", txnIds);
}
%>
	</table>
	<body>
</form>
</html>