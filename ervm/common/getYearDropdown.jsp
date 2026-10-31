<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ page import="java.util.ArrayList" %>


<%

	/* String deptCode = (String)request.getParameter("deptCode");
	ArrayList areaList = new ArrayList(); */
	String yearCondition = "("; // For IN operator in the queries
	ArrayList yearList = ERVMController.yearDisplay();
	//session.setAttribute("yearList",yearList);
	int yearListSize = yearList.size();
	String[] yearData = null;
	
	String yearStr = "";
	for(int i=0;i<yearListSize;i++){
		yearData = (String[]) yearList.get(i);
		yearStr+="<option value=\""+yearData[0]+"\">"+yearData[0]+"</option>";
		
		if(i != yearListSize-1)
			yearCondition += "'"+yearData[0]+"',";
		else
			yearCondition += "'"+yearData[0]+"'";
	}
	yearCondition += ")";
	session.setAttribute("yearCondition",yearCondition);
%>

		<option value="all" selected="selected">ALL</option>
		<%=yearStr%>
		


