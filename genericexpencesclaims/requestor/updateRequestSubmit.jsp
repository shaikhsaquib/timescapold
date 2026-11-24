<%--
 -- @(#)updateRequestSubmit.jsp	15/05/2008
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Viraj Patil
 -- @version 	1.00, 15/05/2008
 --%>

<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%//@ page errorPage="../common/errorPage.jsp"%>
<%@ include file="../includes/empHeader.jsp" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.claim.web.util.Constants,com.bccl.claim.web.util.HtmlUtil"%>
<%@ page import="com.bccl.claim.web.util.Utility"%>

 <jsp:useBean id="genericClaimController" class="com.bccl.claim.web.controllerbeans.GenericClaimController" /> 
<%
	String txnId = "";
    int id = Integer.parseInt((String)request.getParameter("id"));
	String txnIds = (String)session.getAttribute("GEN_IDS");

	String txnArr[] = txnIds.split(",");
	
	if(txnArr.length > id){
		txnId = txnArr[id];
		
	if((request.getParameter("actionNumber")).equals("sub_req")){

			String[] genericClaim = {"FAYEAR","TIMESCAPEUSEROID","CLAIMAMOUNT","CREATEDBY","TRANSACTIONID"};
			Hashtable genericClaimHeader	= new Hashtable( );
			ArrayList genericClaimDetail	= new ArrayList( );

			String year				= "";
			String claimTotal		= "";
			String actionNumber		= "";
			//String txnId			= null;

			genericClaimHeader.put("FAYEAR", year);

			Long timescapeUserOIdLong = new Long(timescapeUserOId);
			genericClaimHeader.put("TIMESCAPEUSEROID", timescapeUserOIdLong);

			claimTotal = (String) request.getParameter("claim");
			genericClaimHeader.put("CLAIMAMOUNT", claimTotal);

			actionNumber = (String) request.getParameter("actionNumber");
			if(actionNumber.equals("sub_req")){
				actionNumber = "L";
			}else{
				actionNumber = "O";
			}
			genericClaimHeader.put("ACTIONNUMBER", actionNumber);
			genericClaimHeader.put("CREATEDBY", emailId);
			//txnId = request.getParameter("txnId");
			genericClaimHeader.put("TRANSACTIONID", txnId);
			
			String[] billDate			= new String[1];
			String[] billNo			    = new String[1];
			String[] billDesc			= new String[1];
			String[] billAmount			= new String[1];
			String[] billAttachment					= new String[1];
			String[] strArrayUpdateAttachment		= new String[1];

			genericClaimDetail.add(0,billDate);
			genericClaimDetail.add(1,billNo);
			genericClaimDetail.add(2,billDesc);
			genericClaimDetail.add(3,billAmount);
			genericClaimDetail.add(4,billAttachment);
			genericClaimDetail.add(5,strArrayUpdateAttachment);

			boolean status = false;
			status = genericClaimController.create(genericClaimHeader,genericClaimDetail);

			if(status){
				response.sendRedirect("../common/promptPage.jsp?msg=suc_req");
				return;
			}else{
				response.sendRedirect("../common/promptPage.jsp?msg=err_req");
				return;
			}
		// end of if(for release)
		}else{
			// for deleting a bill
			String billNumber = (String)request.getParameter("delBillNo");
			String billDate = (String)request.getParameter("delBillDate");
			String billAmount = (String)request.getParameter("delBillAmt");
			String billAttachment = (String)request.getParameter("billAttachment");
			//String txnId	  = (String)request.getParameter("txnId");

			int newFilledRows   = Integer.parseInt(request.getParameter("newFilledRows"));
			int editDetailsSize = Integer.parseInt(request.getParameter("editDetailsSize"));
			int jj=newFilledRows-editDetailsSize;

			String [] billDateArray			= new String[jj+1];
			String [] billNoArray			= new String[jj+1];
			String [] billDescArray			= new String[jj+1];
			String [] billAmountArray		= new String[jj+1];
			String [] billAttachmentArray		= new String[jj+1];

			String[] deleteDetails = {"DELBILLNO","DELBILLDATE","DELBILLAMOUNT","TRANSACTIONID"};
			Hashtable deleteBill	= new Hashtable( );
			deleteBill.put("DELBILLNO", billNumber);
			deleteBill.put("DELBILLDATE", billDate);
			deleteBill.put("DELBILLAMOUNT", billAmount);
			deleteBill.put("TRANSACTIONID", txnId);

			boolean status = false;
			status = genericClaimController.deleteBill(billNumber,billAmount,txnId);
			String actionFlow = "../requestor/createRequest.jsp?id="+id;
%>
	
<body>
<form name="update" method="post">
<%
    if(status){
		for(int ii=1;ii<=jj;ii++){
			billDateArray[ii] = request.getParameter("billDate"+(editDetailsSize+ii));
			billNoArray[ii] = request.getParameter("billNo"+(editDetailsSize+ii));
			billDescArray[ii] = request.getParameter("billDesc"+(editDetailsSize+ii));
			billAmountArray[ii] = request.getParameter("billAmount"+(editDetailsSize+ii));
			billAttachmentArray[ii] = request.getParameter("billAttachment"+(editDetailsSize+ii));
%>
            <input type="hidden" name="billDate<%=(editDetailsSize-1+ii)%>" value="<%=billDateArray[ii]%>">
			<input type="hidden" id="billNo" name="billNo<%=(editDetailsSize-1+ii)%>" value="<%=billNoArray[ii]%>">
			<input type="hidden" id="billDesc" name="billDesc<%=(editDetailsSize-1+ii)%>" value="<%=billDescArray[ii]%>">
			<input type="hidden" id="billAmount" name="billAmount<%=(editDetailsSize-1+ii)%>" value="<%=billAmountArray[ii]%>">
			<input type="hidden" id="billAttachment" name="billAttachment<%=(editDetailsSize-1+ii)%>" value="<%=billAttachmentArray[ii]%>">
<%  
     }
%><input type="hidden" name="actualRows" value="<%=(newFilledRows-1)%>">
<script>
    function doSubmit(id){
    frmObj = document.update;
    frmObj.action="../requestor/createRequest.jsp?id="+id;
    frmObj.submit( );
}
doSubmit('<%=id%>');
</script>
<%
			}else{
				response.sendRedirect("../common/promptPage.jsp?msg=del_err_req");
				return;
			}
		}
	}else{		
		response.sendRedirect("/timescape/includes/unauthorized.html");
	}
%>
</form>
</body>