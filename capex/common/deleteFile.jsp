<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil"%>
 <!DOCTYPE >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<style>
	.form-control {
		height: 18px;
		
	}
	.table > tbody > tr > td, .table > tbody > tr > th, .table > tfoot > tr > td, .table > tfoot > tr > th, .table > thead > tr > td, .table > thead > tr > th {
    padding: 8px;
    line-height: 1.4285;
    vertical-align: top;
    border-top: 0px;
}


	</style>
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
<script Language="JavaScript" src="../jscript/uploadFile.js"></script>
<div class="row">
<div class="col-xs-12">
<table class="table" id="">
	<thead>
		<tr class="info" >
			<th class="text-center" width="15%" colspan="2" > Delete File</th>
		</tr>
	</thead>
	<tbody>
		<tr class="">
<%
			String id = (String)request.getParameter("id");
			String fileName = (String) request.getParameter("fileName");
			String requestStr = (String) request.getParameter("requestStr");
			String formName = (String) request.getParameter("formName");					
			try{    
				 String dirPath= (String) request.getParameter("dirPath");
				 dirPath = dirPath + "/" + fileName;
				 File f1 = new File(dirPath);
				 boolean success = f1.exists();
				 if (!success){
%>
					<td class="text-center" width="15%">The file has not been deleted</td>
			<%   }else{
					boolean delFlag = f1.delete();  
			%>					
					<td class="text-center" width="15%">The file has been deleted.</td>
			<%
					 }
				}catch(Exception e){
				   out.println("@@Failed@@");				 
					}
			%>
		</tr>
		<tr class="">
			<td class="text-center" width="15%">Click <a href="javascript:closeWindow('<%=requestStr%>','<%=formName%>')">here</a> to close this window.</td>
		</tr>
	</tbody>
</table>

</div>
</div>
</html>


