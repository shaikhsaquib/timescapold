<%@ page import="java.lang.StringBuilder" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge; IE=9; IE=8; IE=7;chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<title>Audit Recommendations</title>
		
		<%@ page import="java.util.Hashtable,java.util.HashMap, java.util.ArrayList, java.util.Calendar, java.util.GregorianCalendar, java.util.Date, java.util.Calendar, java.text.*, java.util.GregorianCalendar, java.io.File" %>
		<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
		<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>
		<%@include file="../upload/filePath.jsp" %>
		<%@include file="../common/FormatDate.jsp" %>
		<link rel="stylesheet" href="../bootstrap-3.3.2-dist/css/bootstrap.min.css">
		<link href="../bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet">
		<link href="../css/ota.css" rel="stylesheet">
		
		<script src="../js/ota.js"></script>
		
		
		
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
			.read{
				background-color: #DCDCDC !important;
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
		/* String deptOptionStr; */
		StringBuilder deptOptionStr = new StringBuilder();
		String departmentCode;
		int index;
		int firstIndexOfSelected;
		int lastIndexOfSelected;
		
		company 		= (String)request.getParameter("company");
		deptCode 		= (String)request.getParameter("department");
		area 			= (String)request.getParameter("area");
		year 			= (String)request.getParameter("year");
		deptCondition 	= session.getAttribute("deptCondition") != null?(String)session.getAttribute("deptCondition"):"";
		areaCondition 	= (String)session.getAttribute("areaCondition");
		yearCondition 	= (String)session.getAttribute("yearCondition");
		HashMap<String,String> deptMap = (HashMap)session.getAttribute("deptMap");
		//deptOptionStr = "<select class=\"form-control input-xs pqr\" id=\"editDepartment\" name=\"editDepartment\">"+(String)session.getAttribute("deptOptionStr")+"</select>";
		deptOptionStr.append("<select class=\"form-control input-xs pqr\" id=\"editDepartment\" name=\"editDepartment\" onchange=\"enableSubmitButton(this);\">"+(String)session.getAttribute("deptOptionStr")+"</select>");
			
		viewHash.put("DEPTCODE",deptCode);
		viewHash.put("AREA",area);
		viewHash.put("YEAR",year);
		viewHash.put("DEPTCONDITION",deptCondition);
		viewHash.put("AREACONDITION",areaCondition);
		viewHash.put("YEARCONDITION",yearCondition);
		
		viewList 		= OtaController.displayUploadData(viewHash);
	
			
		session.setAttribute("viewList",viewList); //This is used in downloadHistoryReport file
		session.setAttribute("viewHashNew",viewHash);
		if(viewList.size() > 0){
		
	%>
		<div class="row clearfix bs-example scrollit" style="height:350px;text-align:center;width:100%">
			<div class="" style=" width:100%; height:20%">
			<table style="width:100%; height:100%; font-size:1px" >
			<tr>
				<td style="text-align:left; width:40%;font-size:10px"><b>SEVERITY : </b><img width="40px" height="40px" src="../images/HighPriority.png"></img> High <img width="40px" height="40px" src="../images/MediumPriority.png"></img> Medium <img width="40px" height="40px" src="../images/LowPriority.png"></img> Low </td>
			</tr>
		</table>
		</div>

		<table id="table" class="table table-bordered table-hover"  style="width:100%">
				<thead>
				<tr class="tableRow" style="height:10px;background: #e3f1f5;text-align:center;">
				    <th style="max-width: 7%;">Year</th>
				    <th style="max-width: 5%;">Area</th>          		            
		            <th style="max-width: 1%;">Seve rity</th>
		            <th style="max-width: 12%;">Recommendations</th>
		            <th style="max-width: 12%;">Management Comments</th>
		            <th style="max-width: 10%;">Subordinate Id</th>
		            <th style="max-width: 12%;">Subordinate remark</th>
		            <th style="max-width: 10%;">Supervisor Id</th>
		            <th style="max-width: 12%;">Supervisor remark</th>
		            <th style="max-width: 7%;">TargetDate</th>
		            <th style="max-width: 7%;">RevisedTarget Date</th>
		            <th style="max-width: 7%;">Edit_Department_Name</th>  
		            <th style="max-width: 7%;">Action</th>
	            </tr>
	            </thead>
	            <tbody>
	            
<%				boolean isCalled = false;
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
					departmentCode = ((tmpArr[14] != null) ? tmpArr[14] : null);
					
					if(departmentCode != null){
						/* deptOptionStr = deptOptionStr.replace("value=\""+departmentCode+"\"","value=\""+departmentCode+"\" selected=\"selected\""); */
						index = deptOptionStr.indexOf("value=\""+departmentCode+"\"")+("value=\""+departmentCode+"\"").length();
						deptOptionStr.insert(index," selected=\"selected\"");
					}else{
						//deptOptionStr = "Department Not Available.";
						deptOptionStr.delete(0,deptOptionStr.length());
						deptOptionStr.append("Department Not Available.");
					}			
					
					if(severety.equals("high")) bgColor = "red";
					if(severety.equals("medium")) bgColor = "yellow";
					if(severety.equals("low")) bgColor = "#33E0FF";
					
					filePath = getFilePath(transactionId, userId);
					allFilesInDir = new File(filePath).list();						
					attachment = (allFilesInDir != null && allFilesInDir.length != 0)?"<img onclick=\"openWindow('../common/getAttachments.jsp?filePath="+filePath+"', 'Download Files', 'width=500,height=500, left=200,right=200,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes',  'Download Files'); return false;\" src=\"../images/attachment.png\" style=\"width:50%;height:100%;text-align:center;cursor:pointer;\">":"NA";
					
					targetDate = formatDate(targetDate,"yyyy-MM-dd","dd-MM-yyyy");
					revisedTargetDate = formatDate(revisedTargetDate,"yyyy-MM-dd","dd-MM-yyyy");
 
			%>
				<tr class="tableRow" style="width:100%">
					<td style="width:7%" class="read"><%=year%></td>
					<td style="width:5%" class="read"> <%=area%></td>
					<td title = "<%=severety%>" style="background-color:<%=bgColor%>;cursor: pointer;width:1%;"></td>
					<td style="width:12%" class="read">
						<textarea maxlength="1000" rows="10" style="resize: none;" class="read" readonly><%=recommendation%> </textarea>
					</td>
					<td style="width:12%" class="read">
						<textarea maxlength="1000" rows="10"  style="resize: none;" class="read" readonly><%=mangComments%> </textarea>
					</td>
					<td style="width:10%"><input type="text" class = "userId" id="userId<%=i%>" value="<%=userId%>" onClick="addUser(this.id);enableSubmitButton(this)"/></td>
					<td style="width:12%" class="read"> 
						<textarea maxlength="1000" rows="10" style="resize: none;" class="read" readonly><%=userRemarks%> </textarea>
					</td>
					<td style="width:10%" ><input type="text" class = "supervisorId" id="supervisorId<%=i%>" value="<%=superId%>" onClick="addUser(this.id);enableSubmitButton(this);"/></td>
					<td style="width:12%" class="read">
						<textarea maxlength="1000" rows="10" style="resize: none;" class="read" readonly><%=supRemarks%> </textarea>
					</td>
					<td style="width:7%" class="read"> <%=targetDate%></td>
					<td style="width:7%" class="read"> <%=revisedTargetDate%></td>
					<td style="width:7%" > <%=deptOptionStr%> </td>
					<td style="width:7%;text-align: center;"><input id="submitEditionButton" style="float:left" type="button" value="Submit Changes" onclick="updateReport(this,'<%=transactionId%>')" disabled><br><br><input id="delete" style="float:left" type="button" value="Delete" onclick="deleteReportRecord(this,'<%=transactionId%>')"></td>
				</tr>				
			<% 
			firstIndexOfSelected = deptOptionStr.indexOf(" selected=\"selected\"");
			lastIndexOfSelected = firstIndexOfSelected+(" selected=\"selected\"").length();
			if(firstIndexOfSelected >= 0) {
				deptOptionStr.delete(firstIndexOfSelected,lastIndexOfSelected);
			}
			} %>	
			</tbody>	
			</table>
		</div>
		<% } else { %>
				<div class="col-md-12 col-sm-12 col-xs-12 pad0" style="text-align:center;">
					<h5>No Recommendation Available.</h5>
				</div> 
		<% } %>
	</body>
	
</html>