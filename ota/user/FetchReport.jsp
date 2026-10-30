<%@ page import="java.util.ArrayList,java.lang.Math,java.util.HashMap" %>
<jsp:useBean id="OtaController" class="com.bccl.ota.web.controllerbeans.OtaWebController"/>

<%

	ArrayList<String[]> historyReport = null;
	String requestType = (String)request.getParameter("requestType");
	if(requestType.equals("SUBORDINATE_ADMIN")) 
		historyReport = OtaController.getSubordinateReport();
	else if(requestType.equals("SUPERVISOR_ADMIN")) 
		historyReport = OtaController.getSupervisorReport();
	
	if(historyReport != null && historyReport.size()>0){

%>

	<div class="bs-example">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<table style="width: 100%; height: 120%">
				<tr style="text-align: center; width: 100%; height: 120%">
					<td style="text-align: center; width: 100%; height: 120%"><a
							href="../common/DownloadReport.jsp">	
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

		<div style="width: 100%; position: relative; height: 350px; overflow: scroll; display: block;">
			<table border="1" style="font-size: 20px; width: 100%;">
				<tr>  
					<td width="20%" height="25px"  bgColor="#CEF6F5"><b>COMPANY NAME</b></td> 
					<td width="16%" height="25px"  bgColor="#CEF6F5"><b>DEPARTMENT NAME</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>AUDIT STATUS</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>% IMPLEMENTED</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL RECOMMENDATIONS</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL RECOMMENDATIONS DUE</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL IMPLEMENTED</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL NOT IMPLEMENTED</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL IN PROGRESS</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TOTAL NO MORE APPLICABLE</b></td> 
				</tr>
				
				<%
					
					String[] row;
					int total_records_total  = 0;
			        int total_records  = 0;
				    int total_Impl_records  = 0;
					int total_Not_Impl_records  = 0;
					int total_In_Progress_records  = 0;
					int total_NMA_records  = 0;
					int  implPercent = 0;
					String statusImageColor = "";
					
					ArrayList<HashMap> completeDataArray = new ArrayList<HashMap>();
					HashMap<String,String> dataMap;
					
										
					for(int i=0;i<historyReport.size();i++){
						dataMap = new HashMap<String,String>();
						
						row = (String[])historyReport.get(i);
						
						total_records_total = Integer.parseInt(row[7]);			            
			            total_records = Integer.parseInt(row[2]);	
						total_Impl_records = Integer.parseInt(row[3]);	
						total_Not_Impl_records = Integer.parseInt(row[4]);
						total_In_Progress_records = Integer.parseInt(row[5]);
						total_NMA_records = Integer.parseInt(row[6]);
						
						implPercent = 100;
						if(total_records != 0){
							implPercent = (total_records != total_NMA_records) ? (int)(Math.round((((float)total_Impl_records/(total_records - total_NMA_records))*100))) : 100;
							//implPercent = (int)(((float)total_Impl_records/(total_records - total_NMA_records))*100);
						}
						
						if(implPercent<40) statusImageColor = "red";
						else if(implPercent>=80) statusImageColor = "green";
						else statusImageColor = "yellow";
						
						dataMap.put("COMPANY_NAME",row[0]);
						dataMap.put("DEPARTMENT_NAME",row[1]);
						dataMap.put("PERCENT_IMPLEMENTED",Integer.toString(implPercent)+"%");
						dataMap.put("TOTAL_RECOMMENDATIONS",Integer.toString(total_records_total));
						dataMap.put("TOTAL_RECOMMENDATIONS_DUE",Integer.toString(total_records));
						dataMap.put("TOTAL_IMPLEMENTED",Integer.toString(total_Impl_records));
						dataMap.put("TOTAL_NOT_IMPLEMENTED",Integer.toString(total_Not_Impl_records));
						dataMap.put("TOTAL_IN_PROGRESS",Integer.toString(total_In_Progress_records));
						dataMap.put("TOTAL_NO_MORE_APPLICABLE",Integer.toString(total_NMA_records));
						
						
						completeDataArray.add(dataMap);
				%>
				
					<tr>  
						<td><%=row[0]%></td> 
						<td><%=row[1]%></td> 
						<td><img src="../images/<%=statusImageColor%>.png" width="30" height="10" /></td>
						<td><%= Integer.toString(implPercent)+"%"%></td> 
						<td><%= total_records_total%></td> 
						<td><%= total_records%></td> 
						<td><%= total_Impl_records%></td> 
						<td><%= total_Not_Impl_records%></td> 
						<td><%= total_In_Progress_records%></td> 
						<td><%= total_NMA_records%></td> 
					</tr>
				
				<%
					}
					session.setAttribute("completeDashboardData",completeDataArray);
				%>
				
			</table>
			<div id="qustionsShow"></div>
		</div>
	</div>
				
				<%	
	}else{
		%>
			<div class="col-md-12 col-sm-12 col-xs-12 pad0" style="text-align: center">
				<h5>No Recommendation Available.</h5>
			</div>
		
		<%
	}
				%>