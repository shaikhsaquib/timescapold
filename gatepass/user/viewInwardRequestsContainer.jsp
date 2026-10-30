<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.Calendar, java.util.Date" %>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>

<%
	ArrayList requestsList = new ArrayList();
	Hashtable requestsHash = new Hashtable();

	String arg = (String)request.getParameter("arg");
	String reqStatus = "'UC'";

	requestsHash.put("MODIFIEDBY", timescapeUserOId+"");
	requestsHash.put("COMPANYCODE", companyCode);
	requestsHash.put("LOCATIONID", locationCode);
	//requestsHash.put("DEPARTMENT", "1029");
	requestsHash.put("DEPARTMENT", deptGroup);


	if(arg.equals("1")){
 
		String gatepassId = (String)request.getParameter("gatepassId");

		//out.println(gatepassId);
		
		if(gatepassId!=null){

			requestsHash.put("GATEPASSID", gatepassId);
		
		}

		String fromDate = (String)request.getParameter("fromDate");
		
		if(fromDate!=null){

			requestsHash.put("FROMDATE", fromDate);
		
		}
		String toDate = (String)request.getParameter("toDate");

		if(toDate!=null){

			requestsHash.put("TODATE", toDate);
		
		}else if(fromDate!=null){

			requestsHash.put("TODATE", fromDate);
		
		}

		String type = (String)request.getParameter("type");
		if(type!=null && !type.equals("0")){

			requestsHash.put("TYPE", type);
		
		}

		 reqStatus = (String)request.getParameter("reqStatus");
		if(reqStatus!=null&& !reqStatus.equals("0")){

			requestsHash.put("STATUS", reqStatus);
		
		}

		String department = (String)request.getParameter("department");
	
		if(department!=null && !department.equals("0")){			
			requestsHash.put("DEPTCODE", department);
			requestsHash.put("BRANCH", branchCode);
			requestsHash.put("LOCATION", locationCode);
			requestsHash.remove("CREATEDBY");		
			requestsHash.put("CREATEDBY","all");		
		}

	}
		/*if(reqStatus!=null && !reqStatus.equals("0") && !reqStatus.equals("UC")){

			requestsHash.put("STATUS", reqStatus);
		
		}else
		{
			requestsHash.put("STATUS", reqStatus);
		}*/
//out.println("requestsHash---"+requestsHash);
	requestsList = GatepassController.getInwordRequests(requestsHash);

	String pageName = "viewInwardUser";
%>
<table width="100%" border="0" align="left" cellpadding="0" cellspacing="2" class="normal">
<tr class="greyBG">
	<td width="20%" height="30px">Request ID </td>
	<td width="10%" align="left">Date </td>
	<td width="10%">Type </td>
	<td width="15%">Party Name </td>
	<td width="10%">Date Of Return</td>
	<!-- <td width="20%">Approver</td> -->
	<td width="15%">Request Status</td>
</tr>
<tr>
	<td height="1" colspan="8" bgcolor="#f8f8f8"><img src="../images/spacer.gif" width="1" height="1" /></td>
</tr>
<%

	if(requestsList.size()==0){
%>
	<tr>
		<td height="1" colspan="8" bgcolor="#f8f8f8"><img src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>
	<tr>
		<td height="30" align="center" valign="middle" class="bold" colspan="8">There are no request(s) to view!!</td>
	</tr>
	<tr>
		<td height="1" colspan="8" bgcolor="#f8f8f8"><img src="../images/spacer.gif" width="1" height="1" /></td>
	</tr>

<%
	}else{

		for(int ii=0; ii< requestsList.size(); ii++){

			String tmpArr[] = (String [])requestsList.get(ii);

			/*String approverName ="-";
			String reviewerName ="-";

			if("AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				approverName = tmpArr[14];
			}

			if("RA".equals(tmpArr[25])|| "RR".equals(tmpArr[25]) || "AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				reviewerName = tmpArr[16].equals("0")? "-" : tmpArr[17];
			}*/
%>	

	<tr>
		<td height="20px" align="left" valign="middle" class="normal"><a href="#" onclick="showInwardDetails('<%=tmpArr[0]%>', '<%=tmpArr[1]%>', '<%=pageName%>', '<%=tmpArr[10]%>', '<%=tmpArr[24]%>')" class="boldunderline" ><%=tmpArr[0]%></a></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[11]%></td>
		<td align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[1])%>" border="0"></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[8]%></td>
		<!-- <td align="left" valign="middle" class="normal"><%//=approverName%></td> -->
		<td align="left" valign="middle" class="hrblue"><%=statusInHash.get(tmpArr[24])%>
		<!-- <img src="<%//=statusImg.get(tmpArr[25])%>" border="0"> --></td>
	
	</tr>

<%
		}
	}
%>
</table>

