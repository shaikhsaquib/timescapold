<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<%

	ArrayList deptList = new ArrayList();
	deptList = OtaController.departmentDisplay();	
	
	int deptListSize = deptList.size();
	String[] deptData = null;
	
	String deptStr = "";
	for(int i=0;i<deptListSize;i++){
		deptData = (String[]) deptList.get(i);
		deptStr+="<option value=\""+deptData[0]+"\">"+deptData[1]+"</option>";
	}
	
	
%>


	
		
		<option value="select" selected="selected">Select</option>
		<%=deptStr%>
		
	

	