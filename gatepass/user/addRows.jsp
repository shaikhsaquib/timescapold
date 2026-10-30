<%--
 -- Comments....
 -- @author		Ashutosh Joshi, Deepika Chekkala
 -- @version 	1.00, May 2012
 --%>
<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar" %>
<%@ page import="com.bccl.util.HtmlUtil"%>
<%@page import="com.bccl.util.Utility"%>
<%
	GregorianCalendar today = new GregorianCalendar();
	
	String [] matDesc	= null;
	String [] qty		= null;
	String [] uom		= null;
	String [] atnNo		= null;
	String [] atnDate	= null;
	String [] loc		= null;
	String [] remarks	= null;
	String noOfRows			= request.getParameter("noOfRows");
	int rows				= 0;
	int actualRows			= 0;
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
    <form name="frmRequest" method="post">

<%	
    actionNumber = (String) request.getParameter("actionNumber");

	if(noOfRows!=null){
	rows = Integer.parseInt(noOfRows);
	}
	
	matDesc			= new String[rows+1];
	qty			    = new String[rows+1];
	uom				= new String[rows+1];
	atnNo			= new String[rows+1];
	atnDate			= new String[rows+1];
	loc				= new String[rows+1];
	remarks			= new String[rows+1];

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
		matDesc[ii] = request.getParameter("matDesc"+ii);
		qty[ii]		= request.getParameter("qty"+ii);
		uom[ii]		= request.getParameter("uom"+ii);
		atnNo[ii]	= request.getParameter("atnNo"+ii);
		atnDate[ii] = request.getParameter("atnDate"+ii);
		loc[ii]		= request.getParameter("loc"+ii);
		remarks[ii] = request.getParameter("remarks"+ii);

		if(!(billNo[ii]==null || billNo[ii].trim().equals(""))){
		actualRows++;
%>
            <input type="hidden" id="billDate" name="matDesc<%=ii%>" value="<%=matDesc[ii]%>">
			<input type="hidden" id="billNo" name="qty<%=ii%>" value="<%=qty[ii]%>">
			<input type="hidden" id="billDesc" name="uom<%=ii%>" value="<%=uom[ii]%>">
			<input type="hidden" id="billAmount" name="atnNo<%=ii%>" value="<%=atnNo[ii]%>">
			<input type="hidden" id="billAmount" name="atnDate<%=ii%>" value="<%=atnDate[ii]%>">
			<input type="hidden" id="billAmount" name="loc<%=ii%>" value="<%=loc[ii]%>">
			<input type="hidden" id="billAmount" name="remarks<%=ii%>" value="<%=remarks[ii]%>">
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
            frmObj = document.frmPreviewRequest;
            frmObj.action="../requestor/createRequest.jsp";
            frmObj.submit( );
        }
    doSubmit();
</script>
	</form>
</body>
</html>