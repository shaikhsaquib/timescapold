<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ page import="java.util.ArrayList,java.util.Arrays" %>
<%@ page import="java.util.Set,java.util.HashSet,java.util.Map,java.util.HashMap" %>
<%@ page import="java.io.File" %>
<%@include file="../upload/filePath.jsp" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>

<%
	String companyCode = (String)request.getParameter("company");
	ArrayList deptList = companyCode.equals("all")?ERVMController.departmentDisplay():ERVMController.departmentDisplay(companyCode);
	String year = (String)request.getParameter("year");
	String[] documentTypes = {"ERVM Matrix","Risk Response sheets","Positive Assurance Letter","Other documents","Misc Documents"};
	String uploadPath = EnvironmentProperties.getValue("ervm", "uploadPathSub");
	String[] allDirs = new File(uploadPath).list();
	int allDirsLength = (allDirs == null)?0:allDirs.length;
	
	Set<String> allDirsSet = new HashSet<String>();
	for(int i = 0;i<allDirsLength;i++){
		allDirsSet.add(allDirs[i]);
	}
%>


<style>
	th{
		width:10%;
		text-align: center;
	}
	.red_cell{
		background-color:red;
	}
	.green_cell{
		background-color:green;
	}
</style>

<table style="font-size: 20px; width: 40%; text-align: center;">
	<tr>
		<th style="text-align:right;"><span>NOT SUBMITTED :</span>&nbsp</th>
		<!-- <th style="width:5%" class="red_cell"></th> -->
		<th style="width:5%;background-color:red;"></th>
		<th style="text-align:right;"><span>SUBMITTED :</span>&nbsp</th>
		<!-- <th style="width:5%" class="green_cell"></th> -->
		<th style="width:5%;background-color:green;"></th>
	</tr>
</table>

<br><br>

<table border="1" style="font-size: 20px; width: 60%; text-align: center;">

	<tr id="myHeader" style="background: #e3f1f5;">
		<th style="width:50%;">Business/ Function</th>
		<th>ERVM Matrix</th>
		<th>Risk Response Sheets</th>
		<th>Positive Assurance Letter</th>
		<th>Other Documents</th>
		<th>Misc Documents</th>
	</tr>
	
	<%
		String parentFolder = null;
		String[] uploadedFolders = null;
		Set uploadedFoldersSet = null;
		String cellClass = null;
		String color = null;
		for(int i=0;i<deptList.size();i++){
			parentFolder = ((String[])deptList.get(i))[0]+"-"+year;
	%>
			<tr>
				<td style="width:50%;"><%=((String[])deptList.get(i))[1]%></td>
				
				<%
					
					if(allDirsSet.contains(parentFolder)){
						uploadedFolders = new File(uploadPath+File.separator+parentFolder).list();
						uploadedFoldersSet = new HashSet<String>(Arrays.asList(uploadedFolders));
						for(int j=0;j<5;j++){
							if(uploadedFoldersSet.contains(documentTypes[j])){
								cellClass = "green_cell";
								color = "green";
								
							}else{
								cellClass = "red_cell";
								color = "red";
							}
							
							%>					
								<%-- <td class="<%=cellClass%>"></td> --%>					
								<td style="background-color:<%=color%>;"></td>					
							<%
							
						}
					}else{
						for(int j=0;j<5;j++){				
				%>	
							<!-- <td class="red_cell"></td> -->				
							<td style="background-color:red;"></td>				
				<%
						}
					}
				%>
				
				
			</tr>
	<%
		}
	%>

</table>
