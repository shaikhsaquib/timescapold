<%--
 -- @(#)viewNomination.jsp - 1-APR-2010
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>
 <%--
 -- Comments -  This page is called from the Home Page of Mata Talent award
 -- @author  -  Megha Maheshwari & Afroz Sayed
 -- @version -  1.0
 -- This page is used to view history of nominations from users point of view
 --%>
<%@ page import = "java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar,java.util.Calendar" %>
<%@page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>



<%--
	Make all your global declarations over here 
--%>

<%
	String currLink = "../requestor/viewInsuranceClaim.jsp";
	String breadcrumbs = "";
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../style/global.css">
	<script Language="JavaScript" src="../jscripts/common.js"></script>
	<script Language="JavaScript" src="../jscripts/util.js"></script>
<!-- 	<script Language="JavaScript" src="../jscripts/courierDetails.js"></script>
 --></head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" >
	<form name  = "frmViewCourierDetails" method = "post"  >
		<%@ include file="../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
<%
			String claimNumber = (String)request.getParameter("claimNumber");
			String requestNo = (String)request.getParameter("requestNo");

			Object objArr[] = new Object[2];
			objArr[0] = "'DD-MON-YYYY'";
			objArr[1] = claimNumber;

			Hashtable viewCourierDetail = new Hashtable( );
			viewCourierDetail.put("queryId", "1000");
			viewCourierDetail.put("arguments", objArr);
		
			ArrayList courierDetailList = new ArrayList();
			courierDetailList = insuranceClaimController.viewClaimDetails(viewCourierDetail);

			for (int i = 0; i < courierDetailList.size(); i++)
			{
				String courierDetail[] = (String[]) courierDetailList.get(i);

				Hashtable courierDetailHash = xmlObj.readSubNode(courierDetail[17], "courierDetails");

%>

			<tr>
				<td  background = "../images/logo2.jpg" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../images/tshome_logo.gif" /></div>
				<td>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Number</div></td>
				<td width="74%" height="20" align="left" class="style3"><%=(String)courierDetailHash.get("courierNumber-")%>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Courier Name</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<%=(String)courierDetailHash.get("courierName-")%>
			</tr>
			<tr>
				<td height="50" align="right" class="style4"><div align="left">Remark</div></td>
				<td width="74%" height="20" align="left" class="style3">
					<%=(String)courierDetailHash.get("courierRemark-")%>  </td>
			</tr>
<%
			}
%>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr bgcolor="#D60202">
				 <td align="left"  colspan = "100%" background="../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
			<tr  bgcolor = "#EDE9E8">
				<td colspan = "100%" align="right" >
					<div align="center">
						<input name="Submit1" type="button" class="redButton" value="Close" onclick = "window.close();" />
					</div>
				</td>
			</tr>

		</table>
			<input type = "hidden" name = "hiddClaimNumber" value = "<%=claimNumber%>" />
			<input type = "hidden" name = "hiddRequestNo" value = "<%=requestNo%>" />

		<%@ include file="../includes/footer.jsp"%>
	</form>
</body>
</html>
