
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Audit Recommendations</title>
		
		<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar, java.io.File" %>
		<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
		<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
		<%@include file="filePath.jsp" %>
		<%@include file="../common/FormatDate.jsp" %>
		<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
		<link href="../bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
		<link href="../css/ervm.css" rel="stylesheet">
		
		<script src="../js/ervm.js"></script>
		
		<style>
			label{ color: #2F6C87; font-size: 12px; }
			body{ font-size: 12px !important; }
			a{ text-decoration: none; color: #2F6C87; cursor: pointer; }
			@media only screen and (max-width: 600px){ .mob_pad{ padding: 0 !important; } }   
			@media only screen and (min-width: 601px){ .mob_pad{ padding-left: 0 !important; } }   
			.customborder{ border: 1px solid #c6c6c6; font-size: 1.1	em; font-weight: bold; padding: 0.5%; text-align: center; background-color: rgba(0, 135, 167, 0.11); }
			.customborder1{ border: 1px solid #c6c6c6; font-size: 1em; padding: 0.5%; text-align: center; }
			.scrollit { height:20em; overflow-y:scroll; }
			th{
				text-align:center;
			}
		</style>
		
		<script>
			$(document).ready(function() {
				$('.RelatedLinks ul li.RelLinks').hover(function() {
						$(this).find('.dropdownmenu').show();
					}, function(){
						$(this).find('.dropdownmenu').hide();
				});
			});
		</script>
	</head>
	<body>
	
	<% 
		
		ArrayList viewList = new ArrayList();
		Hashtable viewHash = new Hashtable();
		
		String txnId 			= "";//0
		String srNo 			= "";//2
		String severety 		= "";//5
		String myFile 			= "";//10
		String userRemarks 		= "";//12
		String supRemarks 		= "";//13
		String reviseTargetDate = "";//9
		String area 			= "";//4
		String year 			= "";
		String recommendation 	= "";//3
		String mangComments 	= "";//7
		String targetDate 		= "";//8
		String userId 			= "";//8
		String superId 			= "";//8
		String deptCode 		= "";
		String company 			= "";
		String deptCondition 	= "";
		String areaCondition 	= "";
		String yearCondition 	= "";
		String userStatus       = "";
		String supervisorStatus = "";
		String userStatusIconImageName    = "";
		String supervisorStatusIconImageName    = "";
		String severityIconImageName    = "";
		String userStatusFullForm   = "";
		String supervisorStatusFullForm   = "";
		String bgColor          = "";
		String revisedTargetDate = "";
		String transactionId    = "";
		String filePath         = "";
		String attachment       = "";
		String[] allFilesInDir    = null;
		
		company 		= (String)request.getParameter("company");
		deptCode 		= (String)request.getParameter("department");
		area 			= (String)request.getParameter("area");
		year 			= (String)request.getParameter("year");
		deptCondition 	= session.getAttribute("deptCondition") != null?(String)session.getAttribute("deptCondition"):"";
		areaCondition 	= (String)session.getAttribute("areaCondition");
		yearCondition 	= (String)session.getAttribute("yearCondition");
			
		viewHash.put("DEPTCODE",deptCode);
		viewHash.put("AREA",area);
		viewHash.put("YEAR",year);
		viewHash.put("DEPTCONDITION",deptCondition);
		viewHash.put("AREACONDITION",areaCondition);
		viewHash.put("YEARCONDITION",yearCondition);
		
		viewList 		= ERVMController.displayUploadData(viewHash);
	
			
		session.setAttribute("viewList",viewList); //This is used in downloadHistoryReport file
		session.setAttribute("viewHashNew",viewHash);
		if(viewList.size() > 0){
		
	%>
		
		<div class="" style=" width:100%; height:20%">
			<table style="width:100%; height:100%; font-size:1px" >
			<tr>
				<!-- <td style="text-align:left; width:40%;font-size:10px"><b>SEVERITY : </b><img width="40px" height="40px" src="../images/HighPriority.png"></img> High <img width="40px" height="40px" src="../images/MediumPriority.png"></img> Medium <img width="40px" height="40px" src="../images/LowPriority.png"></img> Low </td> -->
		
				<!-- <td style="width:15%;height:100%"> -->
				
				<td style="width:2%;height:10%;text-align:center;">
					
				<a href="../common/downloadHistoryReport.jsp">
					<!-- <img src="../images/excel.png" border="0" style="width: 15%;height:50%;margin-left:40%"> -->
					<img src="../images/excel.png" border="0" style="">
				<!-- </a><p style="font-size: 1.2em;font-size:10px;margin-left:40%">&nbsp;&nbsp;Download Report</p> -->	
				</a><p style="font-size: 1.2em;font-size:10px">&nbsp;&nbsp;Download Report</p>	
			
				</td>
			
				<!-- <td style="text-align:right; width:45%;font-size:10px"><b>STATUS:</b><img width="40px" height="40px" src="../images/Implemented.png"></img> Implemented <img width="40px" height="40px" src="../images/InProgress.png"></img> In Progress <img width="40px" height="40px" src="../images/NotImplemented.png"></img> Not Implemented <img width="40px" height="40px" src="../images/NoMoreApplicable.png"></img> No More Applicable</td> -->
			</tr>
		</table>
		</div>
		
		
		<div class="row clearfix bs-example scrollit" style="height:300px;text-align:center;width:100%">

		<table class="table table-bordered table-hover"  style="width:100%">
				<tr style="height:10px;background: #e3f1f5;text-align:center;">
				    <th style="max-width: 7%;">Year</th>
				    <th style="max-width: 5%;">Area</th>          		            
		            <th style="max-width: 1%;">Risk Classification</th>
		            <th style="max-width: 12%;">Risk</th>
		            <th style="max-width: 12%;">Management Comments</th>
		            <th style="max-width: 10%;">Risk Champion Id</th>
		            <th style="max-width: 12%;">Risk Champion remark</th>
		            <th style="max-width: 10%;">Supervisor Id</th>
		            <th style="max-width: 12%;">Supervisor remark</th>
		            <th style="max-width: 2%;">Attachment</th>
		            <th style="max-width: 7%;">TargetDate</th>
		            <th style="max-width: 7%;">RevisedTarget Date</th>   
		            <th style="max-width: 3%;">User Status</th>
		            <th style="max-width: 3%;">Sup Status</th>
	            </tr>
	            
<%
				for(int i = 0; i< viewList.size(); i++){
					String[] tmpArr = (String[])viewList.get(i);
					
					recommendation 	= utilityObj.replaceQuoteOracle(tmpArr[0]).trim();
					mangComments 	= tmpArr[1].trim();
					severety 		= tmpArr[2].toLowerCase();
					userId 			= tmpArr[3];
					superId 		= tmpArr[4];
					targetDate 		= tmpArr[5];
					area 			= tmpArr[6];
					year 			= tmpArr[7];
					userRemarks 	= ((tmpArr[8] != null) ? tmpArr[8] : "");
					supRemarks 		= ((tmpArr[9] != null) ? tmpArr[9] : "");
					revisedTargetDate = tmpArr[10];
					transactionId   = tmpArr[11];
					userStatus		= ((tmpArr[12] != null) ? tmpArr[12] : "");
					supervisorStatus= ((tmpArr[13] != null) ? tmpArr[13] : "");
					
					
					
					if(userStatus.equals("I")) userStatusIconImageName = "Implemented.png";
					else if(userStatus.equals("IP")) userStatusIconImageName = "InProgress.png";
					else if(userStatus.equals("NI")) userStatusIconImageName = "NotImplemented.png";
					else if(userStatus.equals("NMA")) userStatusIconImageName = "NoMoreApplicable.png";
					
					if(supervisorStatus.equals("I")) supervisorStatusIconImageName = "Implemented.png";
					else if(supervisorStatus.equals("IP")) supervisorStatusIconImageName = "InProgress.png";
					else if(supervisorStatus.equals("NI")) supervisorStatusIconImageName = "NotImplemented.png";
					else if(supervisorStatus.equals("NMA")) supervisorStatusIconImageName = "NoMoreApplicable.png";
					
					userStatusFullForm = userStatusIconImageName.split("\\.")[0];
					supervisorStatusFullForm = supervisorStatusIconImageName.split("\\.")[0];
					
					if(severety.equals("high")) bgColor = "red";
					if(severety.equals("medium")) bgColor = "yellow";
					if(severety.equals("low")) bgColor = "#33E0FF";
					
					filePath = getFilePath(transactionId, userId);
					allFilesInDir = new File(filePath).list();						
					attachment = (allFilesInDir != null && allFilesInDir.length != 0)?"<img onclick=\"openWindow('../common/getAttachments.jsp?filePath="+filePath+"', 'Download Files', 'width=500,height=500, left=200,right=200,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes',  'Download Files'); return false;\" src=\"../images/attachment.png\" style=\"width:50%;height:100%;text-align:center;cursor:pointer;\">":"NA";
					
					targetDate = formatDate(targetDate,"yyyy-MM-dd","dd-MM-yyyy");
					revisedTargetDate = formatDate(revisedTargetDate,"yyyy-MM-dd","dd-MM-yyyy");
 
			%>
				<tr style="width:100%">
					<td style="width:7%" ><%=year%></td>
					<td style="width:5%" > <%=area%></td>
					<%-- <td title = "<%=severety%>" style="background-color:<%=bgColor%>;cursor: pointer;width:1%;"></td> --%>
					<td style="width:1%;"><%=severety%></td>
					<td style="width:12%" >
						<textarea maxlength="1000" rows="10" style="resize: none;" readonly><%=recommendation%> </textarea>
					</td>
					<td style="width:12%" >
						<textarea maxlength="1000" rows="10"  style="resize: none;" readonly><%=mangComments%> </textarea>
					</td>
					<td style="width:10%" ><%=userId%></td>
					<td style="width:12%" > 
						<textarea maxlength="1000" rows="10" style="resize: none;" readonly><%=userRemarks%> </textarea>
					</td>
					<td style="width:10%" ><%=superId%></td>
					<td style="width:12%" >
						<textarea maxlength="1000" rows="10" style="resize: none;" readonly><%=supRemarks%> </textarea>
					</td>
					<td style="width:2%">
						<b><%=attachment%></b>
					</td>
					<td style="width:7%" > <%=targetDate%></td>
					<td style="width:7%" > <%=revisedTargetDate%></td>
					<%-- <td style="width:3%" > <img style="cursor: pointer;" title = "<%=userStatusFullForm%>" width="40px" height="40px" src="../images/<%=userStatusIconImageName%>"></img> </td>
					<td style="width:3%" > <img style="cursor: pointer;" title = "<%=userStatusFullForm%>" width="40px" height="40px" src="../images/<%=userStatusIconImageName%>"></img> </td> --%>
					<td style="width:3%" ><%=userStatusFullForm%></td>
					<td style="width:3%" ><%=supervisorStatusFullForm%></td>
				</tr>
			<% } %>		
			</table>
		</div>
		<% } else { %>
				<div class="col-md-12 col-sm-12 col-xs-12 pad0" style="text-align:center;">
					<h5>No Recommendation Available.</h5>
				</div> 
		<% } %>
	</body>
</html>