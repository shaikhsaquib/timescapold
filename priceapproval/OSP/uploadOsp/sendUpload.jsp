<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.io.*,java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File, java.io.*, java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/empHeader.jsp" %>
<head>
<title>Waste Aprroval Process</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../css/global.css">
<script Language="JavaScript" src="../js/uploadFile.js"></script>  
</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	 <form method="post" name="frmUploadFile" enctype="multipart/form-data">
    <%
		String attachment = (String) request.getParameter("attachment");
		String requestStr = (String) request.getParameter("requestStr");

		
		String redirectURL  = "../upload/uploadAttachment.jsp?attachment="+attachment+"&requestStr="+requestStr;
		
		response.sendRedirect(redirectURL);
	
	%>
	</form>
</body>
</html>