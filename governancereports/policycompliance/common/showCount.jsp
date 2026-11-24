<%@ page language="java" %>
<%@ page import="java.util.Hashtable, java.util.ArrayList"%>
<jsp:useBean id="policyController" class="com.bccl.policycompliance.web.controllerbeans.PolicyWebController"/> 
<%
	
	String date = (String)request.getParameter("date");
	int srNo = Integer.parseInt(request.getParameter("srNo"));
	//String frequency = (String)request.getParameter("frequency");
	String policyId = (String)request.getParameter("policyId");
	String assurerfdbk = (String)request.getParameter("assurerfdbk");
	String ensurerfdbk = (String)request.getParameter("ensurerfdbk");
	
	Hashtable details = new Hashtable();

	details.put("date",date);
	//details.put("frequency",frequency);
	details.put("policyId",policyId);
	details.put("assurerfdbk",assurerfdbk);
	details.put("ensurerfdbk",ensurerfdbk);

	//out.println("details: "+ details);

	ArrayList policyResult = new ArrayList();
	policyResult = policyController.getCount(details);

	//out.println("Size: "+ policyResult.size());
	//out.println("srNo: "+ srNo);
	
	//String bgcolor="#F7F7F7";
	//if(srNo%2==0)
	//	bgcolor="";
	String count = "0";
	for(int i = 0; i< policyResult.size(); i++){
		String[] tmpArr = (String [] )policyResult.get(0); 
		//out.println("count: "+ tmpArr[5]);
		count = tmpArr[5];
	}
out.println("<span class=\"style7\">"+count+"</span>");
%>