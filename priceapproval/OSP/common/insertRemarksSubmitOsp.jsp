<%@ page import="java.util.Hashtable, java.util.ArrayList" %>
<%@ page import="com.bccl.util.HtmlUtil,com.bccl.util.Utility, java.io.UnsupportedEncodingException, java.net.URLDecoder"%>
<jsp:useBean id="priceApprovalWebController" class="com.bccl.priceapproval.web.controller.priceApprovalWebController" /> 
<%@ page language="java" %>
<%@ include file="../../includes/sessionCheck.jsp"%>
<%@ page errorPage="../../common/errorPage.jsp"%>
<%@ include file="../../includes/empHeader.jsp"%>


<%

Hashtable remarksData	 = new Hashtable();

    long tOId		    = Long.parseLong(request.getParameter("userId"));


    String userOid			= Long.toString(tOId);
    //out.println(userOid);
    String priceid		= (String) request.getParameter("priceId");
    String company		= (String) request.getParameter("company");
    String approverType = (String) request.getParameter("approverType");
    String statusType   = (String) request.getParameter("statusType");

    String remarks  = (String)request.getParameter("remarksContainer");
    String flag  = (String)request.getParameter("flag");


 /*   if(company.equals("1000") && approverType.equals("AP4"))
    {
        remarks ="Ref. Delegated Authority: "+remarks;

    }else  if(!company.equals("1000") && approverType.equals("AP5"))
    {
        remarks ="Ref. Delegated Authority: "+remarks;
    }*/
    remarksData.put("PRICEID",Utility.replaceQuoteOracle(priceid));
    remarksData.put("APPROVERTYPE",Utility.replaceQuoteOracle(approverType));
    remarksData.put("STATUSTYPE",Utility.replaceQuoteOracle(statusType));
    remarksData.put("REMARKS",Utility.replaceQuoteOracle(remarks));
    //remarksData.put("FLAG",flag);
    remarksData.put("USERID",Utility.replaceQuoteOracle(userOid));
		//remarks = Utility.replaceQuoteOracle(remarks);
		boolean	status	= false;
			status	= priceApprovalWebController.insertRemarks(remarksData);
		//boolean status2 = priceapprovalWebController.changeVendorTableStatus(tOId, priceid);
		//boolean status3 = priceapprovalWebController.changeUserTableStatus(tOId, priceid); 	
    	//System.out.println(status);
if(status == true ){
response.sendRedirect("../common/supportApproveOsp.jsp?priceid="+priceid+"&appType="+approverType+"&statusType="+statusType);
}else{
%>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td colspan="2" align="center"><span class="normal">Sorry there was an Error while posting your Remark.</td><tr>
 </table>
<%}%>