<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<%
		int tOId		= Integer.parseInt(request.getParameter("tOId"));

		String priceid		= (String) request.getParameter("priceid");

		boolean	status	= priceApprovalWebController.reject(tOId, priceid);
		
		//boolean status2 = priceapprovalWebController.changeVendorTableStatus(tOId, priceid);

		//boolean	status3	= priceapprovalWebController.changeUserTableStatus(tOId, priceid); 	
%>
<% if(status == true)
		{
%>
			<center>You have rejected request successfully...</center>
<%
		}
%>