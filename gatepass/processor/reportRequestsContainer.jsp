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
	//arg="0";

	//requestsHash.put("PRINTEDBY", timescapeUserOId+"");
	requestsHash.put("PRINTEDBY", "0");
	requestsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	requestsHash.put("WORKFLOWTYPE", "10");
	requestsHash.put("ROLECODE", "5");
	requestsHash.put("STATUS", "'AA'");

	String gatepassId = "";
	String fromDate = "";
	String toDate = "";
	String type = "";
	String department = "";
	String reqStatus = "";


	if(arg.equals("1")){

		 gatepassId = (String)request.getParameter("gatepassId");
		
		if(gatepassId!=null){

			requestsHash.put("GATEPASSID", gatepassId);
		
		}

		 fromDate = (String)request.getParameter("fromDate");
		
		if(fromDate!=null){

			requestsHash.put("FROMDATE", fromDate);
		
		}
		 toDate = (String)request.getParameter("toDate");

		if(toDate!=null){

			requestsHash.put("TODATE", toDate);
		
		}else if(fromDate!=null){

			requestsHash.put("TODATE", fromDate);
		
		}

		 type = (String)request.getParameter("type");
		
		if(type!=null && !type.equals("0")){

			requestsHash.put("TYPE", type);
		
		}


		 department = (String)request.getParameter("department");
		if(department!=null && !department.equals("0")){

			if(!department.equals("all")){
				requestsHash.put("DEPTCODE", department);
				requestsHash.put("BRANCH", branchCode);
				requestsHash.put("LOCATION", locationCode);
			
			}else{
				requestsHash.put("DEPTCODE", "all");
				requestsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
				requestsHash.put("WORKFLOWTYPE","10");
			}
		
			requestsHash.remove("PRINTEDBY");		
			requestsHash.put("PRINTEDBY","all");		
		}

		 reqStatus = (String)request.getParameter("reqStatus");
		if(reqStatus!=null&& !reqStatus.equals("0")){

			requestsHash.remove("STATUS");		
			requestsHash.put("STATUS", reqStatus);

		}else{

			requestsHash.remove("STATUS");		
		}
	}//end of main if


	//out.println(requestsHash);

	requestsList = GatepassController.getMyRequests(requestsHash);

	//out.println(requestsList.size());
	
%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2" class="normal">
<tr class="greyBG">
	<td width="11%" height="30px">Request ID </td>
	<td width="9%" align="left">Date </td>
	<td width="4%">Type </td>
	<td width="15%">Party Name </td>
	<td width="9%">Date Of Return</td>
	<td width="17%">Recommender/Authoriser</td>
	<td width="17%">Approver</td>
	<td width="20%">Request Status</td>
	
</tr>
<tr>
	<td height="1" colspan="8" bgcolor="#f8f8f8"><img src="../images/spacer.gif" width="1" height="1" /></td>
</tr>
<%
	String pageName = "report";
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

			String approverName ="-";
			String reviewerName ="-";
			String showStatus = "";

			if("AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				approverName = tmpArr[14];
			}

			if("RA".equals(tmpArr[25])|| "RR".equals(tmpArr[25]) || "AA".equals(tmpArr[25])|| "AR".equals(tmpArr[25]) || "PA".equals(tmpArr[25]) || "PR".equals(tmpArr[25]) || "CL".equals(tmpArr[25])){
				
				reviewerName = tmpArr[16].equals("0")? "-" : tmpArr[17];
			}

			String id = (ii<10)? "0"+ii : ii+"";

			
		/*	if("AA".equals(tmpArr[25])){
				
				showStatus = "<a href=\"#\" onClick=\"updateAction('"+id+"','AA', '"+tmpArr[0]+"', '"+pageName+"', '"+tmpArr[1]+"')\" class=normal underline>Accept</a> / <a href=\"#\" onClick=\"updateAction('"+id+"','AR', '"+tmpArr[0]+"', '"+pageName+"', '"+tmpArr[1]+"')\" class=normal underline>Reject</a>";
				
			}else{
				
				showStatus = (String)statusHash.get(tmpArr[25]);
			}*/

			
%>	
				<tr >
					<td align="left" valign="middle" class="normal"><%=tmpArr[0]%></td>
					<td align="left" valign="middle" class="normal"><%=tmpArr[12]%></td>
					<td align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[1])%>" border="0"></td>
					<td align="left" valign="middle" class="normal"><%=tmpArr[2]%></td>
					<td align="left" valign="middle" class="normal"><%=tmpArr[7]%></td>
					<td align="left" valign="middle" class="normal"><%=reviewerName%></td>
					<td align="left" valign="middle" class="normal"><%=approverName%></td>
					<td align="left" valign="middle" class="normal"><%=statusHash.get(tmpArr[25])%></td>
				</tr>
				


<%        //    }		
		}
	}
%>

</table>
