<%@ page language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<%@ include file="../includes/statusHash.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable,java.util.Enumeration, java.util.ArrayList, java.util.GregorianCalendar, java.util.Calendar, java.util.Date, java.text.SimpleDateFormat, java.util.*" %>

<jsp:useBean id="GatepassController" class="com.bccl.gatepass.web.controller.GatepassWebController"/>



<%
	String months[ ] ={"0","JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};

	GregorianCalendar today = new GregorianCalendar();

	int todayDay = today.get(Calendar.DAY_OF_MONTH);

	String todayMon = months[today.get(Calendar.MONTH)+1];

	int  todayYear = today.get(Calendar.YEAR);

	String dayMonYear			= todayDay + "-" + todayMon + "-" + todayYear;

	ArrayList requestsList = new ArrayList();

	Hashtable requestsHash = new Hashtable();

	String arg = (String)request.getParameter("arg");

	//arg="0";
	//requestsHash.put("PRINTEDBY", timescapeUserOId+"");
	requestsHash.put("PRINTEDBY", "0");
	requestsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	requestsHash.put("WORKFLOWTYPE", "10");
	requestsHash.put("ROLECODE", "5");

	if(arg.equals("1")){

		String gatepassId = (String)request.getParameter("gatepassId");
		
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


		String department = (String)request.getParameter("department");
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

		String reqStatus = (String)request.getParameter("reqStatus");
		if(reqStatus!=null&& !reqStatus.equals("0")){

			requestsHash.remove("STATUS");		
			requestsHash.put("STATUS", reqStatus);

		}else{

			requestsHash.remove("STATUS");		
		}
	}//end of main if

	//out.println(requestsHash);

	requestsList = GatepassController.viewInwardRequests(requestsHash);

	//out.println(requestsList.size());

	String pageName = "processorViewInwardRequest";

	
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
	<td width="15%">Employee Name </td>
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
		<td height="20px" align="left" valign="middle" class="normal"><a href="#" onclick="showInwardDetails('<%=tmpArr[0]%>', '<%=tmpArr[1]%>', '<%=pageName%>', '<%=tmpArr[9]%>', '<%=tmpArr[24]%>')" class="boldunderline" ><%=tmpArr[0]%></a></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[11]%></td>
		<td align="left" valign="middle" class="normal"><img src="<%=statusImg.get(tmpArr[1])%>" border="0"></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[4]%></td>
		<td align="left" valign="middle" class="normal"><%=tmpArr[8]%></td>
		<!-- <td align="left" valign="middle" class="normal"><%//=approverName%></td> -->
		<td align="left" valign="middle" class="hrblue"><%=statusInHash.get(tmpArr[24])%>
		 <td align="left" valign="middle" class="hrblue"><%=(tmpArr[27])%>
		<!-- <img src="<%//=statusImg.get(tmpArr[25])%>" border="0"> --></td>
	
	</tr>

<%
		}
	}
%>
</table>

