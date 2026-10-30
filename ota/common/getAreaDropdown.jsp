<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
<%@ page import="java.util.ArrayList" %>


<%

	String deptCode = (String)request.getParameter("deptCode");
	ArrayList areaList = new ArrayList();
	String areaCondition = "("; // For IN operator in the queries
	
	String deptCondition = (String)session.getAttribute("deptCondition"); // For IN operator in the queries
	
	areaList = OtaController.areaDisplay(deptCode,deptCondition);
	
	
	
	//areaList = OtaController.areaDisplay(deptCode);
	//session.setAttribute("areaList",areaList);
	int areaListSize = areaList.size();
	String[] areaData = null;
	//String areaData = "";
	
	String areaStr = "";
	for(int i=0;i<areaListSize;i++){
		areaData = (String[]) areaList.get(i);
		//areaData = (String) areaList.get(i);
		//areaStr+="<option value=\""+areaData+"\">"+areaData+"</option>";
		areaStr+="<option value=\""+areaData[0]+"\">"+areaData[0]+"</option>";
		
		if(i != areaListSize-1)
			areaCondition += "'"+areaData[0]+"',";
		else
			areaCondition += "'"+areaData[0]+"'";
	}
	areaCondition += ")";
	session.setAttribute("areaCondition",areaCondition);
	
%>

		<option value="all" selected="selected">ALL</option>
		<%=areaStr%>
		


