<%--
 -- Interaction Center -- Common
 -- @(#)searchRequestSubmit.jsp	21/8/2008
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
 -- @version 	1.00, 21/8/2008
 --%>

<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.StringTokenizer" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.Utility , com.bccl.util.HtmlUtil"%>

<jsp:useBean id="interactionCenterWebController" class="com.bccl.interactioncenter.web.controllerbeans.InteractionCenterWebController"/> 
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
	<%@ include file="../includes/interactionCenterMenu.jsp" %> 

<%
	Hashtable interactionHash = (Hashtable)session.getAttribute("interactionHash");
	String roleCode = (String) interactionHash.get(providerCode);
	//System.out.println(roleCode);
	//System.out.println("Emailid"+emailId+"ServiceType"+providerType);
	ArrayList categoryCodeList = (ArrayList)session.getAttribute("categoryCode");
	String listCategoryCode = "";

	for (int ii=0; ii<categoryCodeList.size(); ii++)
	{
		String[] categoryCodeArray = (String[])categoryCodeList.get(ii);
		if(!listCategoryCode.equals("")){
			listCategoryCode += ",";
		}

		listCategoryCode = listCategoryCode.concat(categoryCodeArray[0]);
	}	

//	String cateCode  = (String) session.getAttribute("categoryCode");

//	String cateCode = "01";
    String pagenationUrl = "../common/searchRequestSubmit.jsp";

//put respective icon images into icons hashtable
	Hashtable icons = new Hashtable( );
	icons.put("L",	"ico_inprocess.gif");
	icons.put("R",	"ico_rejected.gif");
	icons.put("C",  "ico_cancelled.gif");
	icons.put("H",  "ico_brejected.gif");
	icons.put("P",  "ico_approved.gif");
	icons.put("D",  "ico_cancelled.gif");

//put respective process status into requestStatus hashtable
	Hashtable requestStatus = new Hashtable( );
	requestStatus.put("L", "In Process");
	requestStatus.put("R", "Not Processed");
	requestStatus.put("C", "Cancelled");
	requestStatus.put("H", "Hold");
	requestStatus.put("P", "Processed");
	requestStatus.put("D", "Deleted");

	ArrayList searchList = null;
	ArrayList searchList1 = null;

// Get the selected search option from searchRequest.jsp
	String searchOpt = (String) request.getParameter("searchOpt");
	if(searchOpt == null){

		searchList = (ArrayList)session.getAttribute("searchResult");
	}else{
			
		Hashtable searchHash = new Hashtable();

		if(searchOpt.equals("company")){

			String reqCompanyCode = (String) request.getParameter("companyCode");
			String reqPayId = (String) request.getParameter("payId");
			
			searchHash.put("companyCode", reqCompanyCode);
			searchHash.put("payId", reqPayId);
			searchHash.put("providerCode", providerCode);

		}else if(searchOpt.equals("emailId")){
			
			String reqEmailId = (String) request.getParameter("emailId");
			reqEmailId = reqEmailId.toLowerCase();

			searchHash.put("emailId", reqEmailId);
			searchHash.put("providerCode", providerCode);

		}else if(searchOpt.equals("employeeName")){
			
			String reqEmployeeName = (String) request.getParameter("employeeName");

			searchHash.put("employeeName", reqEmployeeName);
			searchHash.put("providerCode", providerCode);

		}else if(searchOpt.equals("requestNo")){

			String reqRequestNo = (String) request.getParameter("requestNo");
			
			searchHash.put("requestNo", reqRequestNo);
			searchHash.put("providerCode", providerCode);

		}else if(searchOpt.equals("courierName")){

			String courierName = (String) request.getParameter("courierName");
			String month = (String) request.getParameter("month");
            String year = (String) request.getParameter("year");
			String departmentName = (String) request.getParameter("department");
			listCategoryCode ="301";
  			searchHash.put("providerCode", providerCode);
            
			if(!courierName.equals("0")){
                searchHash.put("courierName", courierName.trim());
            }

			if(!month.equals("0") && !year.equals("0")){

               int monthValue = Integer.parseInt(month);
				
				if(monthValue<10){
					month = "0"+month;
				}
				String applyDate = month+"/"+year;
                searchHash.put("applyDate", applyDate);
			}

			if(!departmentName.equals("0")){
                departmentName=departmentName.substring(departmentName.indexOf("|")+1);
                searchHash.put("departmentName", departmentName);
            }

		}else if(searchOpt.equals("consignmentNo")){

			String consignmentNo = (String) request.getParameter("consignmentNo");
			listCategoryCode ="301";
			
			searchHash.put("consignmentNo", consignmentNo);
			searchHash.put("providerCode", providerCode);
        
        }else if(searchOpt.equals("receiverName")){

			String receiverName = (String) request.getParameter("receiverName");

            searchHash.put("receiverName", receiverName);
			searchHash.put("providerCode", providerCode);

		}else{
			// Do Nothing
		}
			
		searchHash.put("processorEmailid", emailId);
		searchHash.put("providerType", providerType);
// Obtain the request details filed by the specific user from TIMESGROUPEMPLOYEE , SERVICEREQUEST , SERVICES tables
		if(!companyCode.equals("25")&&!companyCode.equals("31")&&!companyCode.equals("32")&&!companyCode.equals("33"))
		{
			searchList = interactionCenterWebController.searchUser(searchHash,listCategoryCode);
		
			session.setAttribute("searchResult", searchList);
		}else{
			
			if(roleCode.equals("4"))
			{
				searchList = interactionCenterWebController.searchUser(searchHash,listCategoryCode);
			}else{

				searchList = interactionCenterWebController.searchProcessorsRequest(searchHash,listCategoryCode);
				searchList1 = interactionCenterWebController.searchAdminRequest(searchHash,listCategoryCode);
				searchList.addAll(searchList1);
				session.setAttribute("searchResult", searchList);
			}
		}

	}
%>
<!----------------------------------------------- Status Denomenations Table Begins ----------------------------------------------->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td class="boldsmall" height="20" width="100%" align="right">
				<img src="../images/<%=icons.get("L")%>">
				&nbsp;<%=requestStatus.get("L")%>
				&nbsp;&nbsp;<img src="../images/<%=icons.get("H")%>">
				&nbsp;<%=requestStatus.get("H")%>
				&nbsp;&nbsp;<img src="../images/<%=icons.get("P")%>">
				&nbsp;<%=requestStatus.get("P")%>
				&nbsp;&nbsp;<img src="../images/<%=icons.get("R")%>">
				&nbsp;<%=requestStatus.get("R")%>
				&nbsp;&nbsp;<img src="../images/<%=icons.get("C")%>">
				&nbsp;<%=requestStatus.get("C")%>
			</td>
		</tr>
	</table>
<!----------------------------------------------- Status Denomenations Table Ends ----------------------------------------------->

<!--------------------------------------------------- Search Results Table Begins ----------------------------------------------------->
	<table width="100%" border="0" cellspacing="0" cellpadding="0">

<!-- Set hidden field -->
	<input type="hidden" name="searchOpt" value="<%=searchOpt%>"/>
	<input type="hidden" name="requestId" value=""/>
	<input type="hidden" name="actionN" value=""/>
		<tr >
			<td bgcolor="#000000" width="80%" class="whitesmall" height="30" align="center">
				SEARCH RESULT
			</td>
			<td bgcolor="#000000" width="20%" class="whitesmall" height="30" align="left">
				<a href="#" class="whitesmall" onclick="downLoadReports()"><U>DOWNLOAD REPORT >></U></a><!-- &nbsp;<img src="../images/greyarrow.gif" border="0" onclick="downLoadReports()"> -->
			</td>
		</tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#CCCCCC" align="left">
			<td class="boldsmall" width="8%" height="20">REQUESTID</td>
			<td class="boldsmall" width="15%" height="20">SERVICE TYPE</td>
			<td class="boldsmall" width="12%" height="20">APPLIED DATE</td>
			<td class="boldsmall" width="20%" height="20">NAME</td>
			<td class="boldsmall" width="8%" height="20">PAY ID</td>
			<td class="boldsmall" width="10%" height="20">DEPARTMENT</td>
			<td class="boldsmall" width="15%" height="20">DESIGNATION</td>
			<td class="boldsmall" width="2%" height="20">&nbsp;&nbsp;</td>
			<td class="boldsmall" width="2%" height="20">&nbsp;</td>
			<td class="boldsmall" width="8%" height="20">&nbsp;</td>
		</tr>
<%

	if(searchList == null || searchList.size() == 0)
	{
%>
		<tr>
			<td colspan = "100%" class = "normal" height = "100" align = "center">
				No results found matching the search criteria.<br><br> Please click <a href = "../common/searchRequest.jsp" class = "boldunderline">here</a> to continue
			</td>
		</tr>
<%
	} else {

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
			<td class="normal">
				<a href="javascript:void window.open('../common/requestDetails.jsp?id=<%=arr[12]%>&categoryCode=<%=arr[18]%>','','resizable=yes,scrollbars=yes,toolbars=no,width=750,height=375,top=100,left=50')" class="underline">
					<%=arr[12]%>
				</a>
			</td>
			<td class="normal"><%=arr[14]%></td>
			<td class="normal"><%=arr[16]%></td>
			<td class="normal"><%=arr[6]%></td>
			<td class="normal"><%=arr[2]%></td>
			<td class="normal"><%=arr[10]%></td>
			<td class="normal"><%=arr[11]%></td>
<%
			if (arr[19] != null && !arr[19].equals("null") && !arr[19].trim().equals(""))
		{
%>
				<td class="normal" align="center">
					<a href="../download/fileDownload.jsp?listArray=<%=arr[19]%>">
						<img src="../images/attachment.gif" border="0">
					</a>
				</td>
<%
		}else{
%>
  				<td class="normal" align="center">
					-
				</td>
<%
			}
%>
			<td class="normal" align="center"><img src="../images/<%=icons.get(arr[13])%>"></td>

<%
		String categoryCode = arr[18];
		String status = arr[13];
		if ((categoryCode.equals("311") | categoryCode.equals("301") | categoryCode.equals("331") | categoryCode.equals("341") | categoryCode.equals("351")) && (status.equalsIgnoreCase("H") | status.equalsIgnoreCase("A") | status.equalsIgnoreCase("L")))
		{
			String actionName = "action" + kk;
%>
			<td class="normal"  valign="center">
				&nbsp;<select name="<%=actionName%>" class="normal">
					<option value="Process" selected>close</option>
					<option value="Hold" >hold</option>
					<option value="Reject" >reject</option>
				</select>&nbsp;
				
				<a href="#" onclick="courierProcessorRequest(<%=kk%>,'<%=arr[12]%>')"><img src="../images/greyarrow.gif" border="0"></a>
			</td>
<%
		}else{
%>
  				<td class="normal" height="20" align="center">
					-
				</td>
<%
		}
%>

		</tr>

<!-- set hidden fields -->
		<input type="hidden" name="companyCode" value="<%=arr[1]%>">
		<input type="hidden" name="payId" value="<%=arr[2]%>">

<%
		}
	}
%>
	</table>