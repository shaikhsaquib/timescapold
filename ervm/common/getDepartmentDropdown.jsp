<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>


<%

	String companyCode = (String)request.getParameter("companyCode");
	ArrayList deptList = new ArrayList();
	deptList = ERVMController.departmentDisplay(companyCode);
	HashMap<String,String> deptMap = new HashMap<String,String>();
	
	String deptCondition = "("; // For IN operator in the queries
	
	
	
	int deptListSize = deptList.size();
	String[] deptData = null;
	
	String deptStr = "";
	for(int i=0;i<deptListSize;i++){
		deptData = (String[]) deptList.get(i);
		deptStr+="<option value=\""+deptData[0]+"\">"+deptData[1]+"</option>";
		
		if(i != deptListSize-1)
			deptCondition += "'"+deptData[0]+"',";
		else
			deptCondition += "'"+deptData[0]+"'";
		
		deptMap.put(deptData[0],deptData[1]);
	}
	
	deptCondition += ")";
	session.setAttribute("deptCondition", deptCondition);
	session.setAttribute("deptMap",deptMap);
	session.setAttribute("deptOptionStr",deptStr);
	/* String departmentDropdownData = "<div class=\"col-md-4 col-sm-5 col-xs-5 text-right cust \" style=\"display:inline-block; width:20%\">"
									+"Department&nbsp:"
									+"</div>"
									+"<div class=\"col-md-3 col-sm-4 col-xs-7\" style=\"display:inline-block; width:80%\">"
									+"<select class=\"form-control input-xs pqr\" id=\"department\" name=\"department\" >"
									+"" */
	
%>


	

		<option value="all" selected="selected">ALL</option>
		<%=deptStr%>
		
	

	