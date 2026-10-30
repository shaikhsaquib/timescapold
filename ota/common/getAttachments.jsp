
<%@ page import = "java.util.Properties" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.PrintWriter" %>

<%
    String filePath = (String)request.getParameter("filePath");
    File file = new File(filePath);
    File[] allFilesInDir = file.listFiles();
    String[] allFiles = file.list();
    
    %>
    	<div style="display: flex;align-items: center;width:100%;height:100%">
	    	<table id="downloadTable" style="width:100%;text-align:center;font-size: 20px;margin-top: 10%;" border="1">
	    		<tr>
	    			<td></td><td>Files</td><td>Download</td>
	    		</tr>
    			<% 
    
    				for(int i=0;i<allFilesInDir.length;i++){
   				%>
    		
		    			<tr>
		    				<td style="width:10%"><%=i+1%></td>
		    				<td style="width:80%"><%=allFiles[i]%></td>
		    				<td style="text-align:centre;width:10%"><a href="downloadAttachment.jsp?filePath=<%=allFilesInDir[i]%>&fileName=<%=allFiles[i]%>"><img src="../images/download.png"></a></td>
		    			</tr>
    			
                <%  } %>
    			
    		</table>
    	</div>
