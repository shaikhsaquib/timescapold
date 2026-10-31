<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<%

	ArrayList deptList = new ArrayList();
	deptList = ERVMController.departmentDisplay();	
	
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
		
	

	