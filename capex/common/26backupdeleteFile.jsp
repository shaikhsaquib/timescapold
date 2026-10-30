<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil"%>
<head>
<title>capex </title>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script Language="JavaScript" src="../jscript/uploadFile.js"></script>
<link rel="stylesheet" href="../style/global.css">

</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
    <tr bgcolor="#2AA295">
       <td colspan="2" align="center" class="style1" height="20">&nbsp;<strong>Delete File</strong></td>
    </tr>
        
	<tr>
		<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>

<%
	String id = (String)request.getParameter("id");
	String fileName = (String) request.getParameter("fileName");
	String requestStr = (String) request.getParameter("requestStr");
	String formName = (String) request.getParameter("formName");
//    out.println("requestStr : "+requestStr);
	
try{    String dirPath= (String) request.getParameter("dirPath");
		dirPath = dirPath + "/" + fileName;

	//	out.println("directory  path : "+dirPath);
		File f1 = new File(dirPath);
		boolean success = f1.exists();
 //       	out.println("success :  "+success);
		if (!success){
%>
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top">The file has not been deleted.</td>
		<td>&nbsp;</td>
	</tr>
<%
		}
		 else{
			boolean delFlag = f1.delete();
		//	 System.out.println("delFlag----"+delFlag);
%>
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top">The file has been deleted.</td>
	</tr>
<%
		 }
}//end of try
catch(Exception e){
   out.println("@@Failed@@");
 //   System.out.println(e.getMessage()); 
}//end of catch
%>

	
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top"><a href="javascript:closeWindow('<%=requestStr%>','<%=formName%>')"><br><br>Click here</a> to close this window.</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="30%">&nbsp;</td>
		<td width="70%">&nbsp;</td>
	</tr>

	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
	</tr>
	</table>
	</body>