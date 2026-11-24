<%--
 -- Business Card utils
 -- @(#)requestDetails.jsp	14/7/2008
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
 -- @version 	1.00, 24-NOV-2008
 --%>


<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../utils/statusHash.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.Constants,com.bccl.util.HtmlUtil"%>
<%@ page import="com.bccl.util.Utility"%>

<jsp:useBean id="businessCardUserWebController" class="com.bccl.businesscards.web.controllerbeans.BusinessCardUserWebController"/>

<html>
	<head>
		<title>B2E</title>
		<link rel="stylesheet" href="../style/global.css">
	</head>

	<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#FFFFFF">
		<form name="frmDetails" method="post">

<%
			long requestId = Long.parseLong(request.getParameter("id"));

			ArrayList requestDetails = new ArrayList( );

			requestDetails = businessCardUserWebController.view(requestId, companyCode,"1");

			int listSize = requestDetails.size( );

			String roleCode = (String)session.getAttribute("businessCardRole");
%>

		<table width="100%" border="0" cellspacing="0" cellpadding="0">

			<tr>
				<td bgcolor="#000000" colspan="100%" class="whitesmall" height="30" align="center">
					VIEW REQUEST
				</td>
			</tr>

<%
		for(int ii=0; ii < listSize; ii++){

			String tempArr[ ] = (String[ ]) requestDetails.get(ii);
%>
			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Requestor Name</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[1]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Designation</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[2]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Department</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[24]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Work Area</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[3]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Requested On</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[12]%> </td>
			</tr>
<%  if(!tempArr[41].equals("-")&&!tempArr[41].equals("NA")&&!tempArr[41].equals("0")&&!tempArr[41].equals("null")){
%>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;<span class="rednormal">*</span><u>Personal Belief</u></td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="rednormal" align="left" height="30">&nbsp;<%=(tempArr[41].equals("NA")||tempArr[41].equals("0"))?"-":tempArr[41]%> </td>
			</tr>
<%	}
%>
			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Quantity</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[11]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Approved By</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[13]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Approved On</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[14]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Approver Remarks</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[15]%> </td>
			</tr>
<%  if(!tempArr[41].equals("-")&&!tempArr[41].equals("NA")&&!tempArr[41].equals("0")&&!tempArr[41].equals("null")){
%>
			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Personal Belief Checked By</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[43]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Personal Belief Checked On</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[44]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Personal Belief Checker Remarks</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[45]%> </td>
			</tr>
<%	}
%>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Reviewed By</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[16]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Reviewed on</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[17]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Reviewer Remarks</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[18]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Processed By</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[19]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Processed on</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[20]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Processed Remarks</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[21]%> </td>
			</tr>
<%
		if(roleCode.equals("4")){
%>
			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Vendor Id</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[37]%> </td>
			</tr>
<%
		}
%>
			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Vendor Processing Date</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=(tempArr[23].equals("V")|| tempArr[23].equals("D"))?tempArr[38]:"-"%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Vendor Remarks</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=tempArr[39]%> </td>
			</tr>

			<tr>
				<td width="30%" class="bold" align="right" height="30">&nbsp;Status</td>
				<td width="5%" class="bold" align="center" height="30">:</td>
				<td width="65%" class="normal" align="left" height="30">&nbsp;<%=statusHash.get(tempArr[23])%> </td>
			</tr>

<%
	}
%>
	<tr>
		<td colspan="3" class="normal">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3" class="normal" align="center">&nbsp;<a href="javascript:window.close( )"><img src="../images/but_close.gif" border="0"></a></td>
	</tr>
</table>
</form>
</body>
</html>