<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil"%>
<head>
<title>Waste Aprroval Process </title>
<script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/OSP/js/uploadFile.js"></script>        
<script Language="JavaScript" src="/timescape/sapep/employeeselfservice/priceapproval/OSP/js/util.js"></script>
<link rel="stylesheet" href="../css/global.css">

</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" > 
    <tr bgcolor="#2AA295">
       <td colspan="100%" align = "left" class="style1" height="20" colspan="2">&nbsp;Delete File</td>
    </tr>
        
	<tr>
		<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>

<%
	String id = (String)request.getParameter("id");
	String fileName = (String) request.getParameter("fileName");
	String requestStr = (String) request.getParameter("requestStr");
	//System.out.println("requestStr-----"+requestStr);

try{
	/*final class  DirListing{
        private String[] dirlist(String fname){
            File dir = new File(fname);
            String[] chld = dir.list();
        return chld;
        }
    }*/

        String dirPath= (String) request.getParameter("dirPath");
		dirPath = dirPath + "/" + fileName;
	System.out.println("dirPath-----"+dirPath);

		
		File f1 = new File(dirPath);
		boolean success = f1.exists();
		if (!success){
%>
	<tr>
		<td colspan="2" align="middle" class="normal" >The file has not been deleted.</td>
		<td>&nbsp;</td>
	</tr>
<%
		}
		 else{
			boolean delFlag = f1.delete();
		//	 System.out.println("delFlag----"+delFlag);
%>
	<tr>
		<td colspan="2" align="center" class="normal" >The file has been deleted. <br><br>Click <a href="javascript:closeWindow('<%=requestStr%>');">here</a> to close this window.</td>
	</tr>
<%
		 }
}//end of try
catch(Exception e){
    out.println("@@Failed@@");
    System.out.println(e.getMessage()); 
}//end of catch
%>

	
	<!-- <tr>
		<td colspan="2" align="middle" class="normal" ><br><br>Click <a href="javascript:closeWindow('<%//=requestStr%>')">here</a> to close this window.</td>
		<td>&nbsp;</td>
	</tr> -->
	<tr>
		<td width="30%">&nbsp;</td>
		<td width="70%">&nbsp;</td>
	</tr>

	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
	</tr>
	</table>
	</body>