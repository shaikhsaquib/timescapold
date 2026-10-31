<%@ page language="java" %>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil,com.bccl.util.AESencrp"%>
<head>
<title>ervm </title>
	<script src="../js/jquery-1.9.1.min.js"></script>
<script Language="JavaScript" src="../js/ervm.js"></script> 
<link rel="stylesheet" href="../css/global.css">

<script>
/*
 function closeWindowFixed(str) {

	//var size = document.getElementById("size").value;
	alert("str---------"+str);

	var frmname;
	
	 frmname = "frmSubordinate";
	self.close();
//	document.getElementByName("Remarks"+str).focus();
	$("#Status"+str).focus();
	//eval("self.opener.document."+frmname+".Remarks"+str+".focus()");
	
		
   }
   */
</script>
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" > 
    <tr bgcolor="#44bfe5">
       <td colspan="100%" align = "left" class="style1" height="20" colspan="2">&nbsp;Delete File</td>
    </tr>
        
	<tr>
		<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>

<%
	AESencrp testEncrpt = new AESencrp();

	String id = (String)request.getParameter("id");
	String str=(String)request.getParameter("str");

	//out.println("id"+id);
	//String fileName = (String) request.getParameter("fileName");
	//String requestStr = (String) request.getParameter("requestStr");
	//out.println("requestStr-----"+requestStr);

	//String fileName		= (String)session.getAttribute("fileName");
	String requestStr	= (String)session.getAttribute("requestId");
	//out.println("requestStr-----"+requestStr);

	String dirPath		= (String)session.getAttribute("dirPath");

	String decryptfileName = (String)request.getParameter("fileName");

	decryptfileName = decryptfileName.replaceAll("\\s", "+");

	String fileName = testEncrpt.decrypt(decryptfileName);

try{
	/*final class  DirListing{
        private String[] dirlist(String fname){
            File dir = new File(fname);
            String[] chld = dir.list();
        return chld;
        }
    }*/

        //String dirPath= (String) request.getParameter("dirPath");
		dirPath = dirPath + "/" + fileName;
	out.println("dirPath-----"+dirPath);
		
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
		<td colspan="2" align="center" class="normal" >The file has been deleted. <br><br>Click <a href="javascript:closeWindowFixed1('<%=requestStr%>');">here</a> to close this window.</td>
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