<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%//@ include file="../includes/sessionCheck.jsp"%>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp"%>
<html>
<body>
<form name ="remarksSubmit">
<%
		long tOId		    = Long.parseLong(request.getParameter("userId"));

		//long priceid		= Long.parseLong(request.getParameter("priceId"));
		String priceid		= (String) request.getParameter("priceId");

		String approverType = request.getParameter("approverType");

		String remarks      = request.getParameter("remarks");
		String statusType   = request.getParameter("statusType");

		String buyerEmailaddress1 = request.getParameter("buyerEmailaddress");

		remarks             = Utility.replaceQuoteOracle(remarks);

		boolean	status	= priceApprovalWebController.insertRemarksNp(tOId, priceid, remarks, approverType);

		
		//boolean status2 = priceapprovalWebController.changeVendorTableStatus(tOId, priceid);

		//boolean	status3	= priceapprovalWebController.changeUserTableStatus(tOId, priceid); 	
//out.println(status);
/*	System.out.println(tOId);
	System.out.println(priceid);
	System.out.println(approverType);
	System.out.println(remarks); */
session.setAttribute("reviewersComments",remarks);

%>
<%
if(status == true ){
response.sendRedirect("../common/supportApprovenp.jsp?priceid="+priceid+"&appType="+approverType+"&statusType="+statusType+"&buyerEmailaddress1="+buyerEmailaddress1);
}else{
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="2" align="center"><span class="normal">Sorry there was an Error while posting your Remark.</td><tr>
 </table>
<%}%>
</form>
</body>
</html>	