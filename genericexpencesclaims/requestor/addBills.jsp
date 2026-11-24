<%--
 -- @(#)addBills.jsp	2/2/2009
 --
 -- Copyright 2004 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Sachin Kale
 -- @version 	1.00, 2/2/2009
 --%>
<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@page import="com.bccl.util.Utility"%>
<%
	GregorianCalendar today = new GregorianCalendar();
	String applyDate		= "";
	String days				= "";
	String amountTotal		= "";
	String amountWords		= "";
	String total			= "";
	String actionNumber		= "";
	String txnId			= "";
	String savedBills		= "";
	String [] billDate		= null;
	String [] billNo		= null;
	String [] billDesc		= null;
	String [] billAmount	= null;
	String [] billAttachment	= null;
	String noOfRows			= request.getParameter("noOfRows");
	int rows				= 0;
	int actualRows			= 0;
	String[] months = {"Month", "January" , "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
	<form name="frmPreviewRequest" method="post">
<%	
    actionNumber = (String) request.getParameter("actionNumber");
    
	if(noOfRows!=null){
	rows = Integer.parseInt(noOfRows);
	}
	
	billDate			= new String[rows+1];
	billNo			    = new String[rows+1];
	billDesc			= new String[rows+1];
	billAmount			= new String[rows+1];
	billAttachment		= new String[rows+1];

	// Get fromDate in the 'YYYY-MM-DD' format
	int todayDay = today.get(Calendar.DAY_OF_MONTH);
	int todayMonth = today.get(Calendar.MONTH);
	int todayYear = today.get(Calendar.YEAR);
	applyDate = Utility.returnDate(todayDay, (todayMonth+1), todayYear);

	int monthNumber =Integer.parseInt(request.getParameter("forMonth"));
	String forMonth= months[monthNumber];
	String forYear = (String) request.getParameter("forYear");

	amountTotal= (String) request.getParameter("amountTotal");
	amountWords= (String) request.getParameter("amountWords");
	total= (String) request.getParameter("total");
	txnId = (String) request.getParameter("txnId");
    savedBills = (String) request.getParameter("savedBills");


	for(int ii=1;ii<=rows;ii++)
	{   
        
		billDate[ii] = request.getParameter("billDate"+ii);
		billNo[ii] = request.getParameter("billNo"+ii);
		billDesc[ii] = request.getParameter("billDesc"+ii);
		if(billDesc[ii]==null || billDesc[ii].equals("null") || billDesc[ii].trim().equals("")){
			billDesc[ii] = "-";
		}
		billAmount[ii] = request.getParameter("billAmount"+ii);
		billAttachment[ii] = request.getParameter("billAttachment"+ii);

        if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		actualRows++;
%>
            <input type="hidden" id="billDate" name="billDate<%=ii%>" value="<%=billDate[ii]%>">
			<input type="hidden" id="billNo" name="billNo<%=ii%>" value="<%=billNo[ii]%>">
			<input type="hidden" id="billDesc" name="billDesc<%=ii%>" value="<%=billDesc[ii]%>">
			<input type="hidden" id="billAmount" name="billAmount<%=ii%>" value="<%=billAmount[ii]%>">
			<input type="hidden" id="billAttachment" name="billAttachment<%=ii%>" value="<%=billAttachment[ii]%>">
<%      }
	}

%>
            <input type="hidden" name="actualRows" value="<%=actualRows%>">

			<input type="hidden" name="total" value="<%=total%>">
			<input type="hidden" name="forMonth" value="<%=forMonth%>">
			<input type="hidden" name="forYear" value="<%=forYear%>">
			<input type="hidden" name="option" value="1">
			<input type="hidden" name="actionNumber" value="<%=actionNumber%>"/>
			<input type="hidden" id="txnId" name="txnId" value=<%=txnId%> />
            <input type="hidden" id="id" name="id" value=<%=txnId%> />
			<input type="hidden" name="savedBills" value="<%=savedBills%>"/>
<script>
        function doSubmit(){
            frmObj = document.frmPreviewRequest;
            frmObj.action="../requestor/createRequest.jsp";
            frmObj.submit();
         }
    doSubmit();
</script>
	</form>
</body>
</html>