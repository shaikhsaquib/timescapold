<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%
	ArrayList compList = new ArrayList(); 

	String compStr = "<option value='select' selected>Select</option>";
	
	compList = ERVMController.companyDisplay();

	int compListSize = compList.size();

	String[] compData = null;
	
	for(int i=0;i<compListSize;i++){
		compData = (String[]) compList.get(i);
		compStr+="<option value=\""+compData[0]+"\">"+compData[1]+"</option>";
	}


%>