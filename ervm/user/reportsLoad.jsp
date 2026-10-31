<%@ page language="java" %>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

<%@ page import="java.util.Hashtable,java.util.ArrayList,java.util.HashMap" %>

<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<!DOCTYPE html>
<html>
<head>
<meta content="width=device-width, initial-scale=1" name="viewport">
<link href="../css/ervm.css" rel="stylesheet">
<script src="../js/ervm.js"></script>
<title>Audit Recommendations | Approver</title>
<style>
label {
	color: #2F6C87;
	font-size: 12px;
}

body {
	font-size: 12px !important;
}

a {
	text-decoration: none;
	color: #2F6C87;
	cursor: pointer;
}


</style>
</head>
<body>
	<%
	Hashtable reportUserNameHash = new Hashtable();
	ArrayList reportNameList = new ArrayList();
	ArrayList Plist = new ArrayList();
	ArrayList fullNameList = new ArrayList();
	
	String userId ="";
	String userName = "";
	String userArray="";
	String subordinateId="";
	String deptCode="";
	String compCode = "";
	String area = "";
	String year = "";

	String department = "";
	String userStatus = "";
	String questions = "";
	String timescapeuseroid = "";
	String statusImageColor = "";
	String [] fullArr = null;
	String userFullName = "";
	ArrayList<HashMap> completeDataArray = new ArrayList<HashMap>();
	HashMap<String,String> dataMap;
	int count = 0;
	int countI = 0;
	int countIP =0;
	int countNI = 0;
	int countNMA = 0;
	double  noPercentI = 0.0;
	double  noPercent = 0.0;
	int tervmlCount = 0;
	int tervmlCountI = 0;
	int tervmlNMA = 0;

	compCode = (String)request.getParameter("company");
	deptCode = (String)request.getParameter("department");
	area = (String)request.getParameter("area");
	year = (String)request.getParameter("year");
	String deptCondition = (String)session.getAttribute("deptCondition");
	String areaCondition = (String)session.getAttribute("areaCondition");
	String yearCondition = (String)session.getAttribute("yearCondition");
	session.setAttribute("myDeptCode",deptCode);
	session.setAttribute("area",area);
	reportUserNameHash.put("TIMESCAPEUSEROID",timescapeUserOId+ "");
	reportUserNameHash.put("DEPTCODE",deptCode);
	reportUserNameHash.put("AREA",area);
	reportUserNameHash.put("YEAR",year);
	reportUserNameHash.put("DEPTCONDITION",deptCondition);
	reportUserNameHash.put("AREACONDITION",areaCondition);
	reportUserNameHash.put("YEARCONDITION",yearCondition);
	reportUserNameHash.put("EMAILID",emailId);

	reportNameList =  ERVMController.reportUserName(reportUserNameHash);
	session.setAttribute("reportNameList",reportNameList);

	if(reportNameList.size()>0){
	
	%>
	<div class="bs-example">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<table style="width: 100%; height: 120%">
				<tr style="text-align: center; width: 100%; height: 120%">
					<td style="text-align: center; width: 100%; height: 120%"><a
							href="../common/downloadNsoReport.jsp">	
							<img src="../images/excel.png" border="0"
							style="width: 30px; height: 30px; text-align: center;">
					</a>
						<p style="font-size: 1.2em;">&nbsp;&nbsp;Download Report</p></td>
				</tr>
				<tr>
					<td>
						<div class="col-md-5 col-sm-5 col-xs-6 imgHide">
							<img src="../images/legend.jpg" style="width: 100%;">
						</div>
					</td>
				</tr>
			</table>
		</div>

		<br>
		<br>

		<div
			style="width: 100%; position: relative; height: 350px; overflow: scroll; display: block;">
			<table border="1" style="font-size: 20px; width: 100%;">
				<tr style="text-align: center; font-weight: bold; background: rgba(0, 157, 194, 0.36);">
					<td width="20%">User Name</td>
					<td width="15%">Number of Recommendations</td>
					<td width="10%">Status</td>
					<td width="10%">Implemented</td>
					<td width="15%">Not Implemented</td>
					<td width="10%">In Progress</td>
					<td width="10%">No More Applicable</td>
					<td width="10%">% Implemented</td>

				</tr>

				<% 	
		
	Hashtable fullNameHash = new Hashtable();
    String[] arrUserList = new String[reportNameList.size()];
	for(int ii =0 ;ii< reportNameList.size();ii++){
		String [] tmpArr = (String[])reportNameList.get(ii);
		arrUserList[ii] = tmpArr[0];
	} 
	
		ArrayList rList = new ArrayList();
		rList = ERVMController.reportdataDisplay(reportUserNameHash);
		session.setAttribute("rList",rList);
		
		/* edited */
		/* out.println("reportNameList.size() : "+reportNameList.size());
		out.println("arrUserList.length : "+arrUserList.length);
		out.println("rList.size() : "+rList.size()); */
		/* edited */
		
		for(int kk =0; kk< arrUserList.length;kk++){
			dataMap = new HashMap<String,String>();
			userName = arrUserList[kk];
			count = 0;
			countI = 0;
			countIP =0;
			countNI = 0;
			countNMA = 0;
			noPercentI = 0.0;
			noPercent = 0.0;

			fullNameHash.put("USERID",userName);
			fullNameList =  ERVMController.fullNameDisplay(fullNameHash);
			session.setAttribute("fullNameList",fullNameList);
			
			/*Original*/
			//userFullName = ((String[])fullNameList.get(0))[0];
			/*Original*/
			/* Edited */
			if(fullNameList.size() != 0)
				userFullName = ((String[])fullNameList.get(0))[0];
			else
				userFullName = userName.split("@")[0].replace("."," ").toUpperCase();
			/* Edited */
			
			dataMap.put("userFullName",userFullName);

			for(int mm =0; mm< rList.size();mm++){

				String tmpArr[] = (String [])rList.get(mm);
				
				timescapeuseroid= "";
				questions= "";
				userStatus="";
				questions =	 tmpArr[1];
				userStatus = tmpArr[2];
				timescapeuseroid = tmpArr[0];
				if(userName.indexOf(timescapeuseroid) != -1){
				
					if(questions != "" ){
							 count++;
							 tervmlCount++;
					}
					if("I".equals(userStatus)){
							 countI++;
							 tervmlCountI++;			
					}else if("IP".equals(userStatus) ){
							 countIP++;
					}else if("NI".equals(userStatus) ){
							 countNI++;
					}else if("NMA".equals(userStatus) ){
							 countNMA++;
							 tervmlNMA++;
					}

					double countduble = count;
					double countIduble = countI;
					double countNMAduble = countNMA;
					noPercentI = (countduble!=countNMAduble) ? ((countIduble/(countduble-countNMAduble)))*100 : 100.0;
					if(noPercentI<40) statusImageColor = "red";
					else if(noPercentI>80) statusImageColor = "green";
					else statusImageColor = "yellow";
					
				}
			}
			if((!"".equals(userFullName) && userFullName != null)){
%>
				<tr style="text-align: center;">
					<td><%=userFullName%></td>
					<td><a href="#" id="myLink" onclick="questionAdminHistory(<%=kk%>,'<%=deptCode%>','<%=area%>','<%=year%>')"><%=count%></a></td>
					<td><img src="../images/<%=statusImageColor%>.png" width="30" height="10" /></td>
					<td><a href="#" id="" onclick="statusAdminHistoryI(<%=kk%>,'<%=deptCode%>','<%=area%>','<%=year%>')"><%=countI%></a></td>
					<td><a href="#" id="" onclick="statusAdminHistoryNI(<%=kk%>,'<%=deptCode%>','<%=area%>','<%=year%>')"><%=countNI%></a></td>
					<td><a href="#" id="" onclick="statusAdminHistoryIP(<%=kk%>,'<%=deptCode%>','<%=area%>','<%=year%>')"><%=countIP%></a></td>
					<td><a href="#" id="" onclick="statusAdminHistoryNMA(<%=kk%>,'<%=deptCode%>','<%=area%>','<%=year%>')"><%=countNMA%></a></td>
					<td><%=Math.round(noPercentI)%></td>
				</tr>
				<tr><td><input type="hidden" name="userId<%=kk%>" id="userId<%=kk%>" value="<%=userName%>" /></td></tr>
<%			}
			
			dataMap.put("recommendation",Integer.toString(count));
			dataMap.put("implemented",Integer.toString(countI));
			dataMap.put("notImplemented",Integer.toString(countNI));
			dataMap.put("inProgress",Integer.toString(countIP));
			dataMap.put("noMoreApplicable",Integer.toString(countNMA));
			dataMap.put("PercentImplemented",Integer.toString((int)Math.round(noPercentI)));
			
			completeDataArray.add(dataMap);
		}
		session.setAttribute("completeDashboardData",completeDataArray);
%>

			</table>
			<div id="qustionsShow"></div>
		</div>
	</div>
	<% } else { %>
	<div class="col-md-12 col-sm-12 col-xs-12 pad0"
		style="text-align: center">
		<h5>No Recommendation Available.</h5>
	</div>
	<% } %>
	<input type="hidden" id="sizeReport" value="<%=reportNameList.size()%>"></input>
	
</body>
</html>
