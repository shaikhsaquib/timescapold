<%@ page import = "java.util.Properties" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.PrintWriter" %>
<%-- <%@ include file="deleteAttachment.jsp" %> --%>
<script Language="JavaScript" src="../js/ervm.js"></script>

<%
    String filePath = (String)request.getParameter("filePath");
    File file = new File(filePath);
    File[] allFilesInDir = file.listFiles();
    String[] allFiles = file.list();

    
    %>
    	<div style="display: flex;align-items: center;width:100%;height:100%">
	    	<table id="downloadTable" style="width:100%;text-align:center;font-size: 20px;margin-top: 10%;" border="1">
	    		<tr style="background: #e3f1f5;">
	    			<th></th><th>Files</th><th>Download</th>
	    		</tr>
    			<% 
    				/* String backwardSlash = "\\\\";
    				String forwardSlash = "/";
    				String allowedChar = "[^a-zA-Z0-9./]";
    				String emptyString = ""; */
    				for(int i=0;i<allFilesInDir.length;i++){
   				%>
    		
		    			<tr>
		    				<td style="width:10%"><%=i+1%></td>
		    				<td style="width:70%"><%=allFiles[i]%></td>
		    				<td style="text-align:centre;width:10%"><a href="downloadAttachment.jsp?filePath=<%=allFilesInDir[i]%>&fileName=<%=allFiles[i]%>"><img src="../images/download.png"></a></td>

		    				<%-- <td style="text-align:centre;width:10%"><img style="cursor: pointer;" onclick="deleteFile(this,'<%=allFilesInDir[i].toString().replaceAll(backwardSlash,forwardSlash).replaceAll(allowedChar,emptyString)%>')" src="../images/delete.png"></td> --%>
		    				<%-- <td style="text-align:centre;width:10%"><img style="cursor: pointer;" onclick="deleteFile(this,'<%=allFilesInDir[i].toString().replaceAll(backwardSlash,forwardSlash)%>')" src="../images/delete.png"></td> --%>
		    			</tr>
    			
                <%  } %>
    			
    		</table>
    	</div>
