<%--
 -- Comments....
 -- @author		kavita Yadav
 -- @version 	1.00, May 2014
 --%>
<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@page import="com.bccl.util.Utility"%>
<%
	GregorianCalendar today = new GregorianCalendar();
	
	String [] purchaseOrderNo	= null;
	String [] dcInvoice		= null;
	String [] materialDesc	= null;
	String [] uomId			= null;
	String [] quantity		= null;
	String [] remarks		= null;
	String [] rejectQuan	= null;
	String [] receivedQuan	= null;
	String noOfRows			= request.getParameter("row1");
	int rows				= 0;
	int actualRows			= 0;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
    <form name="frmRequest" method="post">

<%	
    actionNumber = (String) request.getParameter("actionNumber");

	if(noOfRows!=null){
	rows = Integer.parseInt(noOfRows);
	}
	
	purchaseOrderNo		= new String[rows+1];
	dcInvoice			= new String[rows+1];
	materialDesc		= new String[rows+1];
	uomId				= new String[rows+1];
	quantity			= new String[rows+1];
	remarks				= new String[rows+1];
	rejectQuan			= new String[rows+1];
	receivedQuan		= new String[rows+1];

	// Get fromDate in the 'YYYY-MM-DD' format
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	int todayMonth = today.get(Calendar.MONTH);
	int todayYear = today.get(Calendar.YEAR);
	applyDate = Utility.returnDate(todayDay, (todayMonth+1), todayYear);

	int monthNumber =Integer.parseInt(request.getParameter("forMonth"));
	String forMonth= months[monthNumber];
	String forYear = (String) request.getParameter("forYear");

	/*amountTotal= (String) request.getParameter("amountTotal");
	amountWords= (String) request.getParameter("amountWords");
	total= (String) request.getParameter("total");
	txnId = (String) request.getParameter("txnId");
	savedBills = (String) request.getParameter("savedBills");*/

	for(int ii=1;ii<=rows;ii++)
	{
		purchaseOrderNo[ii] = request.getParameter("purchaseOrderNo"+ii);
		dcInvoice[ii]		= request.getParameter("dcInvoice"+ii);
		materialDesc[ii]	= request.getParameter("materialDesc"+ii);
		uomId[ii]			= request.getParameter("uomId"+ii);
		quantity[ii]		= request.getParameter("quantity"+ii);
		remarks[ii]			= request.getParameter("remarks"+ii);
		rejectQuan[ii]		= request.getParameter("rejectQuan"+ii);
		receivedQuan[ii]	= request.getParameter("receivedQuan"+ii);

		if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		actualRows++;
%>
		<input type="hidden" id="purchaseOrderNo" name="purchaseOrderNo<%=ii%>" value="<%=purchaseOrderNo[ii]%>">
		<input type="hidden" id="dcInvoice" name="dcInvoice<%=ii%>" value="<%=dcInvoice[ii]%>">
		<input type="hidden" id="materialDesc" name="materialDesc<%=ii%>" value="<%=materialDesc[ii]%>">
		<input type="hidden" id="uomId" name="uomId<%=ii%>" value="<%=uomId[ii]%>">
		<input type="hidden" id="quantity" name="quantity<%=ii%>" value="<%=quantity[ii]%>">
		<input type="hidden" id="remarks" name="remarks<%=ii%>" value="<%=remarks[ii]%>">
		<input type="hidden" id="rejectQuan" name="rejectQuan<%=ii%>" value="<%=rejectQuan[ii]%>">
		<input type="hidden" id="receivedQuan" name="receivedQuan<%=ii%>" value="<%=receivedQuan[ii]%>">
<%      }
	}

%>
           <!-- <input type="hidden" name="actualRows" value="<%=actualRows%>">
		    <input type="hidden" name="total" value="<%=total%>">
			<input type="hidden" name="forMonth" value="<%=forMonth%>">
			<input type="hidden" name="forYear" value="<%=forYear%>">
			<input type="hidden" name="option" value="1">
			<input type="hidden" name="actionNumber" value="<%=actionNumber%>">
			<input type="hidden" name="txnId" value=<%=txnId%>>
            <input type="hidden" name="id" value=<%=txnId%>>
			<input type="hidden" name="savedBills" value="<%=savedBills%>"> -->
<script>
        function doSubmit(){
            frmObj = document.frmCreateInwordRequest;
            frmObj.action="../processor/createInwardMaterialRequest.jsp";
            frmObj.submit( );
        }
    doSubmit();
</script>
	</form>
</body>
</html>