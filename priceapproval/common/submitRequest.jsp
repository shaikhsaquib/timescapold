<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PURCHASE APPROVAL - SUPPORT/REJECT</title>
<link href="../style/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
		

		//long priceid		= Long.parseLong(request.getParameter("priceid"));
		String priceid		= (String) request.getParameter("priceid");

		boolean	status	    = priceApprovalWebController.submitRequest(priceid);

		ArrayList approvers = new ArrayList();

		approvers = priceApprovalWebController.getApprovers(priceid);

		String apprv [] = (String [])approvers.get(0);

		String content  = "Price Approval Id : "+ priceid + "\n\n";
			   content += "Product/ Service/ Project Name : "+ apprv[11] + "\n\n";
			   content += "Indented User/ User group : "+ apprv[12] + "\n\n";
			   content += "Negotiated value (Rs) : "+ apprv[13] + "\n\n";
			   content += "Requirement : "+ apprv[14] + "\n\n";
			   content += "This mail is regarding Price Approval Request put on Timescape \n Regards";

		boolean mailStatus = true;
		//apprv.length

		for(int i = 0; i<apprv.length; i++)
		{
		  if(apprv[i]!=null)
			{
				mailStatus =  priceApprovalWebController.sendIndividualMail(apprv[i],content);
			}	
		}	
		//out.println("Length :" + apprv.length);
%>
<% if(status == true)
		{
%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
			<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
			<td width="23%" rowspan="2">&nbsp;</td>
			</tr>
			<tr>
			<td height="38"><img src="../images/header_price2.jpg" width="706" height="34" /><!-- <img src="images/related_links.png" width="18" height="18" /> --><span class="boldsmall"><!-- Related --> <!-- links&nbsp; --></span>&nbsp;&nbsp;&nbsp;&nbsp;  <!-- |  --><!-- <img src="images/otherESSlinks.png" width="18" height="18" /> --> <span class="boldsmall"><!-- Other ESS links --></span> </td>
			</tr>
			<!-- <tr>
				<td width="77%"><img src="../images/header_price1.jpg" width="842" height="44" /></td>
				<td width="23%" rowspan="2">&nbsp;</td>
			</tr> -->
			<tr><td colspan="2" align="center"><span class="normal">
			You have successfully submitted the request!!!</td><tr>
			<tr><td colspan="2" height="7"></td></tr>
			<tr><td colspan="2" align="center" class="normal">Click <a href="showDetails.jsp?tOId=<%=timescapeUserOId%>&priceid=<%=priceid%>" class="normal"><b>here</b></a> to check the status</td></tr>
			</table>
<%
					
	    }
%>
</body>
</html>