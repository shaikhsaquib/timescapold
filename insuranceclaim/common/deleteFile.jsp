<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil"%>
<jsp:useBean id="insuranceClaimController" class="com.bccl.insuranceclaim.web.controllerbeans.InsuranceClaimController"/>
<jsp:useBean id ="xmlObj" class = "com.bccl.util.XMLUtility"/>
<script Language="JavaScript" src="../jscripts/uploadFile.js"></script>
<link rel="stylesheet" href="../style/global.css">
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#EFEFEF">

<table width="780" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
    <tr bgcolor="#C11B17">
       <td colspan="100%" class="style1" height="20">&nbsp;<strong>Delete File</strong></td>
    </tr>
        
	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>

<%
	String requestNo = (String)request.getParameter("requestNo");
	String fileName = (String) request.getParameter("fileName");
	String formName = (String) request.getParameter("formName");

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
		File f1 = new File(dirPath);
		boolean success = f1.exists();
		if (!success){
%>
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top">The file has not been deleted.</td>
		<td>&nbsp;</td>
	</tr>
<%
		}
		 else{
			 f1.delete();
%>
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top">The file has been deleted.</td>
		<td>&nbsp;</td>
	</tr>
<%
		 }
}//end of try
catch(Exception e){
    out.println("@@Failed@@");
    System.out.println(e.getMessage()); 
}//end of catch
%>

	
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top"><a href="javascript:closeWindow(<%=requestNo%>,'<%=formName%>')"><br><br>Click here</a> to close this window.</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td width="41%">&nbsp;</td>
		<td width="3%">&nbsp;</td>
		<td width="56%">&nbsp;</td>
	</tr>

	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
	</tr>
	</table>
	</body>