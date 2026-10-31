<%@ page import="java.io.File" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@include file="../upload/filePath.jsp" %>

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<style>
	th {
		text-align: center;
	}
	.uploadImageId{
		width : 15%
	}
</style>
<table border="1" style="font-size: 20px; width: 75%; text-align: center;">
	<tr style="background: #e3f1f5;">
		<th>Document</th>
		<th>Upload</th>
		<th>Uploaded</th>
		<th>Delete</th>
	</tr>
	
	<%
		String[] documentTypes = {"ERVM Matrix","Risk Response sheets","Positive Assurance Letter","Other documents","Misc Documents"};
		String filePath         = "";
		String attachment       = "";
		String[] allFilesInDir    = null;
		String deptVal = request.getParameter("deptVal");
		String year = request.getParameter("year");
		String compVal = request.getParameter("compVal");
		
		String folderName = (deptVal.equals(""))?year:(deptVal+"-"+year);
		for(int i=0;i<documentTypes.length;i++){
			filePath = getFilePath(documentTypes[i], folderName);
			allFilesInDir = new File(filePath).list();
			boolean fileExists = allFilesInDir != null && allFilesInDir.length != 0;
			if(fileExists) allFilesInDir[0]= URLEncoder.encode(allFilesInDir[0], "UTF-8");
			attachment = fileExists? "<a href=\"../common/downloadAttachment.jsp?filePath="+filePath+allFilesInDir[0]+"&fileName="+allFilesInDir[0]+"\">"+URLDecoder.decode(allFilesInDir[0], "UTF-8")+"</a>" : "NA";
	%>
	
			<tr>
				<td><%=documentTypes[i]%></td>
				<td class="uploadImageId">
					<% if(fileExists){%>
						<a><img onclick="javascript:alert('A file is already uploaded. Please delete the existing file before uploading a new one.')" src="../images/upload_light.png" style="width:25%;height:20%;text-align:center;"/></a> 
					<%}else{ %>
						<a href="javascript:attach('<%=documentTypes[i]%>');"><img src="../images/upload.png" style="width:25%;height:20%;text-align:center;cursor:pointer;"/></a>
					<%} %>
				</td>
				<td><%=attachment %></td>
				<td><img style="cursor: pointer;" onclick="deleteFile(this,'<%=filePath%>')" src="../images/delete.png" style="text-align:center;"/></td>
			</tr>
		
	<%
		}
	%>	
</table>
<input type="hidden" id="compVal" value="<%=compVal%>"/>
