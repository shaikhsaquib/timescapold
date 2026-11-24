<%@ page language="java"%>
<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*"%>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil,com.bccl.util.AESencrp"%>

<head>
	<meta http-equiv="X-UA-Compatible" content="IE=10"/>
	<title>Communication - claim</title>
	<script src="../jscripts/jquery-1.9.1.min.js"></script>
	<script Language="JavaScript" src="../jscripts/createRequest.js"></script>
	<link rel="stylesheet" href="../style/bootstrap-3.3.2-dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="../style/global.css">
	<link rel="stylesheet" href="../style/common.css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td colspan="100%" class="style1" height="20" colspan="2"><!-- <img src="../images/communicationClaimHeader.gif" style="width: 100%;"></td> --></tr>
		<tr>
			<td colspan="100%" colspan="2" height="20" bgcolor="#E7EAEF" class="budgetMenuBG">DELETE FILE<img src="../images/spacer.gif" width="2" height="1" /></td>
		</tr>
		<tr>
			<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="40"></td>
		</tr>
		<%
			//System.out.println("*****fixedDeleteFile******");
			AESencrp testEncrpt = new AESencrp();

			String id 				= (String)request.getParameter("id");
			String str 				= (String)request.getParameter("str");
			String requestStr		= (String)session.getAttribute("requestId");
			/* String dirPath			= (String)session.getAttribute("dirPath"); */
			String dirPath			= (String)request.getParameter("dirPath");
			String decryptfileName 	= (String)request.getParameter("fileName");
	
			decryptfileName = decryptfileName.replaceAll("\\s", "+");
			String fileName = testEncrpt.decrypt(decryptfileName);
			
			try{
				dirPath = session.getAttribute("emailDirPath").toString() + "/" + fileName;
				
				File f1 = new File(dirPath);
				boolean success = f1.exists();
				
				if (!success){
		%>
				<tr>
					<td colspan="2" align="middle" class="normal">The file has not	been deleted.</td>
					<td>&nbsp;</td>
				</tr>
		<%
				} else {
					boolean delFlag = f1.delete();
					session.removeAttribute("hiddenSavedFileName"); 

		%>
				<tr>
					<td colspan="2" align="center" class="normal">
						The file has been deleted. <br><br>
						Click <a href="javascript:closeWindowFixed1('<%=str.replace("attachment", "")%>');">here</a> to close this window.
					</td>
				</tr>
		<%
		 		}
				//System.out.println("*****fixedDeleteFile******");
			} catch(Exception e) {
			    out.println("@@Failed@@");
			    //System.out.println(e.getMessage()); 
			}
		%>
		<tr>
			<td width="30%">&nbsp;</td>
			<td width="70%">&nbsp;</td>
		</tr>
		<tr>
			<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
		</tr>
	</table>
</body>