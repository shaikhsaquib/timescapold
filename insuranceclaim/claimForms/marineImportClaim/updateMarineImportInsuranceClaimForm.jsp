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
	String currLink = "../../marineImportClaim/updateMarineImportInsuranceClaimForm.jsp";
	String breadcrumbs = "";
	String requestNo = (String) request.getParameter("requestNo");
%>

<html>
<head>
	<title>Insurance Claim</title>
	<link rel="stylesheet" href="../../style/global.css">
	<script Language="JavaScript" src="../../jscripts/common.js"></script>
	<script Language="JavaScript" src="../../jscripts/util.js"></script>
	<script Language="JavaScript" src="../../jscripts/calendarControl.js"></script>
	<script Language="JavaScript" src="../../jscripts/insuranceClaimForms.js"></script>
	<script Language="JavaScript" src="../../jscripts/calculate.js"></script>
		<link href="../../style/calendarControl.css"rel="stylesheet">
	<script src="../../jscripts/calendarControl.js"language="javascript"></script>


</head>
<body leftmargin="0" topmargin="2" marginwidth="0" marginheight="0" onload = "onLoadDetail(<%=requestNo%>, 'frmMarineInsuranceClaim')" >
	<form id="frmMarineInsuranceClaim" name  = "frmMarineInsuranceClaim" method = "post">
		<%@ include file="../../includes/header.jsp"%>
		<table border = "0" cellspacing="0" cellpadding="0" width = "100%" align = "center">
			<tr>
				<td  bgcolor = "#90acb7" class = "normal" align = "left" colspan = "100%">
					<div align="left"><img src="../../images/header.jpg" width="825" height="62"/></div>
				</td>
			</tr>
			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					<!-- Include the Pagenation JSP over here if required -->
				<td>
			</tr>
			<tr>
				<td class = "normal" colspan = "100%">
					<%@ include file="../marineImportClaim/updateMarineImportInsuranceClaimFormContainer.jsp"%>
				<td>
			</tr>

			<tr>
				<td class = "normal" align = "left" colspan = "100%">
					&nbsp;
				<td>
			</tr>
			<tr bgcolor="#D60202">
				 <td align="left"  colspan = "100%" background="../../images/red_shadow.jpg" bgcolor="#D60202" height="20">
			</tr>
		</table>
		
	</form>
	<script>
function resetForm(){
	//document.getElementById("frmMarineInsuranceClaim").reset();
	var frm_elements = document.getElementsByTagName("form")[0].elements;

	for (i = 0; i < frm_elements.length; i++)
	{
		field_type = frm_elements[i].type.toLowerCase();
		switch (field_type)
		{
		case "text":
			frm_elements[i].value = "";
			break;
		case "password":
		case "textarea":
		case "hidden":
		case "radio":
		case "checkbox":
			if (frm_elements[i].checked)
			{
				frm_elements[i].checked = false;
			}
			break;
		case "select-one":
		case "select-multi":
			frm_elements[i].selectedIndex = -1;
			break;
		default:
			break;
		}
	}

}
</script>
</body>
</html>
