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

 <jsp:useBean id="vehicleClaimController" class="com.bccl.claim.web.controllerbeans.VehicleClaimController" /> 
<%
int id = Integer.parseInt((String)request.getParameter("id"));
String txnIds = (String)session.getAttribute("VEH_IDS");
	String txnArr[] = txnIds.split(",");
	String txnId = null;
	if(txnArr.length > id){
		txnId = txnArr[id];
if((request.getParameter("actionNumber")).equals("sub_req"))
{
	String[] medicalClaim = {"FAYEAR","TIMESCAPEUSEROID","CLAIMAMOUNT","CREATEDBY","TRANSACTIONID"};

	Hashtable medicalClaimHeader	= new Hashtable( );
	ArrayList medicalClaimDetail	= new ArrayList( );

	String year				= "";
	String claimTotal		= "";
	String actionNumber		= "";
	//String txnId			= null;

	medicalClaimHeader.put("FAYEAR", year);

	Long timescapeUserOIdLong = new Long(timescapeUserOId);
	medicalClaimHeader.put("TIMESCAPEUSEROID", timescapeUserOIdLong);

	claimTotal = (String) request.getParameter("claim");
	medicalClaimHeader.put("CLAIMAMOUNT", claimTotal);

	actionNumber = (String) request.getParameter("actionNumber");
	if(actionNumber.equals("sub_req"))
	{actionNumber = "L";}
	else{actionNumber = "O";}
	medicalClaimHeader.put("ACTIONNUMBER", actionNumber);

	medicalClaimHeader.put("CREATEDBY", emailId);

	//txnId = request.getParameter("txnId");
	medicalClaimHeader.put("TRANSACTIONID", txnId);
	
	String[] billDate			= new String[1];
	String[] billNo			    = new String[1];
	String[] billDesc			= new String[1];
	String[] billAmount			= new String[1];

	medicalClaimDetail.add(0,billDate);
	medicalClaimDetail.add(1,billNo);
	medicalClaimDetail.add(2,billDesc);
	medicalClaimDetail.add(3,billAmount);

	boolean status = false;

	status = vehicleClaimController.create(medicalClaimHeader,medicalClaimDetail);

	if(status){
		response.sendRedirect("../common/promptPage.jsp?msg=suc_req");
		return;
	}else{
		response.sendRedirect("../common/promptPage.jsp?msg=err_req");
		return;
	}
}// end of if(for release)
else{// for deleting a bill
	String billNumber = (String)request.getParameter("delBillNo");
	String billDate = (String)request.getParameter("delBillDate");
	String billAmount = (String)request.getParameter("delBillAmt");
	//String txnId	  = (String)request.getParameter("txnId");

    int newFilledRows   = Integer.parseInt(request.getParameter("newFilledRows"));
	int editDetailsSize = Integer.parseInt(request.getParameter("editDetailsSize"));
    int jj=newFilledRows-editDetailsSize;

    String [] billDateArray			= new String[jj+1];
	String [] billNoArray			= new String[jj+1];
	String [] billDescArray			= new String[jj+1];
	String [] billAmountArray		= new String[jj+1];

   	String[] deleteDetails = {"DELBILLNO","DELBILLDATE","DELBILLAMOUNT","TRANSACTIONID"};
	Hashtable deleteBill	= new Hashtable( );
	deleteBill.put("DELBILLNO", billNumber);
	deleteBill.put("DELBILLDATE", billDate);
	deleteBill.put("DELBILLAMOUNT", billAmount);
	deleteBill.put("TRANSACTIONID", txnId);

	boolean status = false;
  	status = vehicleClaimController.deleteBill(billNumber,billAmount,txnId);
	String actionFlow = "../requestor/createRequest.jsp?id="+txnId;
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
%>
            <input type="hidden" name="billDate<%=(editDetailsSize-1+ii)%>" value="<%=billDateArray[ii]%>">
			<input type="hidden" id="billNo" name="billNo<%=(editDetailsSize-1+ii)%>" value="<%=billNoArray[ii]%>">
			<input type="hidden" id="billDesc" name="billDesc<%=(editDetailsSize-1+ii)%>" value="<%=billDescArray[ii]%>">
			<input type="hidden" id="billAmount" name="billAmount<%=(editDetailsSize-1+ii)%>" value="<%=billAmountArray[ii]%>">
            

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
		//response.sendRedirect("/timescape/includes/unauthorized.html");
	}
%>
</form>
</body>