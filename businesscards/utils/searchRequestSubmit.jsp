<%--
 -- 
 -- @(#)searchRequestSubmit.jsp	04/06/2009
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Amruta Gangan
 -- @version 	1.00, 04/06/2009
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility , com.bccl.util.HtmlUtil"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>
<jsp:useBean id="paging" class="com.bccl.util.Paging"/> 

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
        <script Language="JavaScript" src="../jscripts/util.js"></script>
        <script Language="JavaScript" src="../jscripts/searchRequestSubmit.js"></script>
	</head>
	
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<form name  = "frmSearchRequest" method = "post">

		<%@ include file="../includes/header.jsp" %>
		<%@ include file="../includes/businessCardMenu.jsp" %>

<%
	String pagenationUrl = "../utils/searchRequestSubmit.jsp";

	String challanNo	= "";
//	String frmDay		= "";
//	String frmMonth		= "";
//	String frmYear		= "";
//	String toDay		= "";
//	String toMonth		= "";
//	String toYear		= "";
	String frmDate		= "";
	String toDate		= "";

	Hashtable requestStatus = new Hashtable( );
	requestStatus.put("V", "vendor approved");
	requestStatus.put("D", "card received");

	ArrayList searchList = null;
// Get the selected search option from searchRequest.jsp
	String searchOpt = (String) request.getParameter("searchOpt");
	if(searchOpt == null){

		searchList = (ArrayList)session.getAttribute("searchResult");
	}else{
			
		Hashtable searchHash = new Hashtable();

		if(searchOpt.equals("challanNo")){

			challanNo = (String) request.getParameter("challanNo");
			
			searchHash.put("challanNo", challanNo);
			searchHash.put("emailId", emailId);

		}else if(searchOpt.equals("date")){

//			frmDay = (String) request.getParameter("frmDay");
//			frmMonth = (String) request.getParameter("frmMonth");
//			frmYear = (String) request.getParameter("frmYear");
//			String frmDate = frmMonth+"/"+frmDay+"/"+frmYear;
			frmDate = (String) request.getParameter("frmDate");

//			toDay = (String) request.getParameter("toDay");
//			toMonth = (String) request.getParameter("toMonth");
//            toYear = (String) request.getParameter("toYear");
//           String toDate = toMonth+"/"+toDay+"/"+toYear;
			toDate = (String) request.getParameter("toDate");

            searchHash.put("frmDate", frmDate);
            searchHash.put("toDate", toDate);
			searchHash.put("emailId", emailId);

		}else{
			// Do Nothing
		}
			
// Obtain the request details filed by the specific user from TIMESGROUPEMPLOYEE , SERVICEREQUEST , SERVICES tables
		searchList = businessCardUserWebController.searchUser(searchHash);

		session.setAttribute("searchResult", searchList);
	}
%>

<!--------------------------------------------------- Search Results Table Begins ----------------------------------------------------->

	<table width="100%" border="0" cellspacing="0" cellpadding="0">

<!-- Set hidden field -->
	<input type="hidden" name="searchOpt" value="<%=searchOpt%>"/>
	<input type="hidden" name="requestId" value=""/>
	<input type="hidden" name="actionN" value=""/>
	
		<tr >
			<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="center">
				SEARCH RESULTS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
	//if(!role.equals("5")){
%>
<a href="../includes/downloadReports.jsp?id=<%=emailId%>&schOpt=<%=searchOpt%>&chNo=<%=challanNo%>&frmDD=<%=frmDate%>&toDD=<%=toDate%>" class="whitesmall"><u>Download</u></a>
<%
	//}
%>
				<!-- <a href="../includes/downloadReports.jsp?id=<%//=emailId%>&schOpt=<%//=searchOpt%>&chNo=<%//=challanNo%>&frmDD=<%//=frmDay%>&frmMM=<%//=frmMonth%>&frmYY=<%//=frmYear%>&toDD=<%//=toDay%>&toMM=<%//=toMonth%>&toYY=<%//=toYear%>">Download</a> -->
			</td>
		</tr>

		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="15%" height="20">REQUESTOR NAME</td>
			<td class="boldsmall" width="5%" height="20">CARD TEMPL</td>
			<td class="boldsmall" width="13%" height="20">CARD TYPE</td>
		    <td class="boldsmall" width="10%" height="20">QUANTITY</td>
			<td class="boldsmall" width="9%" height="20">CARD COST(Rs.)</td>
			<td class="boldsmall" width="15%" height="20">CHALLAN NO</td>
			<td class="boldsmall" width="10%" height="20">CHALLAN DATE</td>
			<td class="boldsmall" width="14%" height="20">REMARK</td>
			<td class="boldsmall" width="9%" height="20">STATUS</td>
		</tr>
<%

	if(searchList == null || searchList.size() == 0)
	{
%>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No results found matching the search criteria.<br><br> Please <a href = "../utils/searchRequest.jsp" class = "boldunderline">Click here</a> to continue
			</td>
		</tr>
<%
	}else{

		int arrSize = searchList.size();
%>
	
		<%@ include file="../includes/pagenation.jsp" %>

<%
	String clr = "";
		for(long kk=startIndex; kk<endIndex; kk++)
		{	
				if (kk%2 != 0)
				{
					clr = "#e8e8e8";

				}else{
					clr = "#FFFFFF";
				}
	
			String[] arr = (String[])searchList.get((int)kk);
%>

		<tr bgcolor=<%=clr%>  height="30">
			<td class="normal"><%=arr[1]%></td>
			<td class="normal"><a href="#" onclick="javascript:window.open('../utils/viewCardTemplate.jsp?id=<%=arr[0]%>','_blank','top=100, left=100, height=500, width=500, status=no, menubar=no, resizable=no, scrollbars=yes, toolbar=no, location=no, directories=no');" class="underline"><img src="../images/icon_vcard.gif" border="0"></a></td>
			<td class="normal"><%=arr[11]%></td>
			<td class="normal"><%=arr[14]%></td>
			<td class="normal"><%=arr[12]%></td>
			<td class="normal"><%=arr[16]%></td>
			<td class="normal"><%=arr[15]%></td>
			<td class="normal"><%=arr[29]%></td>
			<td class="normal"><%=requestStatus.get(arr[31])%></td>
		</tr>
<%
		}
	}
%>
	</table>
<!--------------------------------------------------- Search Results Table Ends ------------------------------------------------------->

	</body>
	</form>
</html>