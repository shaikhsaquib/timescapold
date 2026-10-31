<%@ page import="java.util.ArrayList,java.lang.Math,java.util.HashMap" %>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>

<%

	ArrayList<String[]> historyReport = ERVMController.getSubordinateReport();
	
	if(historyReport.size()>0){

%>

	<div class="bs-example">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<table style="width: 100%; height: 120%">
				<tr style="text-align: center; width: 100%; height: 120%">
					<td style="text-align: center; width: 100%; height: 120%"><a
						<%-- href="../common/downloadNsoReport.jsp?company=<%=compCode%>&department=<%=deptCode%>&area=<%=area%>&year=<%=year%>&deptCondition=<%=deptCondition%>&areaCondition=<%=areaCondition%>&yearCondition=<%=yearCondition%>"> --%>
						href="../common/DownloadSupervisorReport.jsp">	
							<img src="../images/excel.png" border="0"
							style="width: 2%; height: 220%; text-align: center;">
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
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML RECOMMENDATIONS</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML RECOMMENDATIONS DUE</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML IMPLEMENTED</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML NOT IMPLEMENTED</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML IN PROGRESS</b></td> 
					<td width="8%" height="25px"  bgColor="#CEF6F5"><b>TERVML NO MORE APPLICABLE</b></td> 
				</tr>
				
				<%
					
					String[] row;
					int tervml_records_tervml  = 0;
			        int tervml_records  = 0;
				    int tervml_Impl_records  = 0;
					int tervml_Not_Impl_records  = 0;
					int tervml_In_Progress_records  = 0;
					int tervml_NMA_records  = 0;
					int  implPercent = 0;
					String statusImageColor = "";
					
					ArrayList<HashMap> completeDataArray = new ArrayList<HashMap>();
					HashMap<String,String> dataMap;
					
										
					for(int i=0;i<historyReport.size();i++){
						dataMap = new HashMap<String,String>();
						
						row = (String[])historyReport.get(i);
						
						tervml_records_tervml = Integer.parseInt(row[7]);			            
			            tervml_records = Integer.parseInt(row[2]);	
						tervml_Impl_records = Integer.parseInt(row[3]);	
						tervml_Not_Impl_records = Integer.parseInt(row[4]);
						tervml_In_Progress_records = Integer.parseInt(row[5]);
						tervml_NMA_records = Integer.parseInt(row[6]);
						
						implPercent = 100;
						if(tervml_records != 0){
							implPercent = (int)(Math.round((((float)tervml_Impl_records/(tervml_records - tervml_NMA_records))*100)));
							//implPercent = (int)(((float)tervml_Impl_records/(tervml_records - tervml_NMA_records))*100);
						}
						
						if(implPercent<40) statusImageColor = "red";
						else if(implPercent>=80) statusImageColor = "green";
						else statusImageColor = "yellow";
						
						dataMap.put("COMPANY_NAME",row[0]);
						dataMap.put("DEPARTMENT_NAME",row[1]);
						dataMap.put("PERCENT_IMPLEMENTED",Integer.toString(implPercent)+"%");
						dataMap.put("TERVML_RECOMMENDATIONS",Integer.toString(tervml_records_tervml));
						dataMap.put("TERVML_RECOMMENDATIONS_DUE",Integer.toString(tervml_records));
						dataMap.put("TERVML_IMPLEMENTED",Integer.toString(tervml_Impl_records));
						dataMap.put("TERVML_NOT_IMPLEMENTED",Integer.toString(tervml_Not_Impl_records));
						dataMap.put("TERVML_IN_PROGRESS",Integer.toString(tervml_In_Progress_records));
						dataMap.put("TERVML_NO_MORE_APPLICABLE",Integer.toString(tervml_NMA_records));
						
						
						completeDataArray.add(dataMap);
				%>
				
					<tr>  
						<td><%=row[0]%></td> 
						<td><%=row[1]%></td> 
						<td><img src="../images/<%=statusImageColor%>.png" width="30" height="10" /></td>
						<td><%= Integer.toString(implPercent)+"%"%></td> 
						<td><%= tervml_records_tervml%></td> 
						<td><%= tervml_records%></td> 
						<td><%= tervml_Impl_records%></td> 
						<td><%= tervml_Not_Impl_records%></td> 
						<td><%= tervml_In_Progress_records%></td> 
						<td><%= tervml_NMA_records%></td> 
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