<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ include file="../includes/empHeader.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/legal2.css" rel="stylesheet"/>		
	<link href="../css/select2.min.css" rel="stylesheet">
	<link href="../css/bootstrap-tagsinput.css" rel="stylesheet">
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>			
	<script src="../js/jquery-1.9.1.min.js"></script>
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script src="../js/select2.min.js"></script>	
	<script src="../js/bootstrap-maxlength.min.js"></script>
	<script src="../js/jquery.jscroll.min.js"></script>
	<script src="../js/bootstrap-tagsinput.js"></script>
	<script src="../jscript/legal.js"></script>	
	<script src="../jscript/common.js"></script>	
	<script src="../jscript/util.js"></script>	
	<script>
	$(document).ready(function() {
	
	
	 $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });
 	
	
		});
	</script>	
</head>
<%

String DPATH     = EnvironmentProperties.getValue("legalContractManagement", "uploadPath");


String str = (String)request.getParameter("str");
String attachment = (String)request.getParameter("attachment");
/*String requestId = (String)request.getParameter("requestId");
String userEmailId = (String)request.getParameter("userEmailId");
String userStatus = (String)request.getParameter("status");*/
String requestId = (String)session.getAttribute("requestId");
String userEmailId = (String)session.getAttribute("userEmailId");
String userStatus = (String)session.getAttribute("userStatus");


try{
	final class  DirListing{
		private String[] dirlist(String fname){
			File dir = new File(fname);
			String[] chld = dir.list();
		return chld;
		}
	}
	
	Object objArr[] = new Object[3];
	objArr[0] = "'DD-MON-YYYY'";
	int fileSize=0;

	


	String emailid = userEmailId;
	if (emailid.indexOf("@") > -1) {
		emailid = emailid.substring(0, emailid.indexOf("@"));        
	}  

	String userFolderPath = DPATH + emailid;
	String dirPath ="";
	String dirPath1 ="";
	String dirPath2 ="";
//	System.out.println("email"+emailid);
	DirListing dirListing = new DirListing();
	
	
	String fileName="";

	if(str.equals("1"))
	{	
		attachment = (String)request.getParameter("attachment");


		dirPath = userFolderPath+"/"+requestId+"/"+attachment;		

	}
	
	String [] fileList  = dirListing.dirlist(dirPath);
%>
	<!-- <table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
          <td  class="text-left">&nbsp;&nbsp; -->
<%
        if(fileList==null){
%>
	<!--<a href="javascript:void(0);" class="pull-right " style="margin-top:0px;"><strong>No file to view <i class="fa fa-file-word-o " ></i></strong></a>-->
			
<%           // out.println("No file attached");
             //return;
        }else if (fileList.length == 0){
%>
	<!--<a href="javascript:void(0);" class="pull-right " style="margin-top:0px;"><strong>No file to view <i class="fa fa-file-word-o " ></i></strong></a>-->
<%
            //out.println("No file attached");
            //return;
%>
		<!-- </td> -->

<%
        }else{
%>
		<!-- <table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
          <td  class="text-left"> -->

<%			
		  //out.println("The Files in the currrent Directory are ..<br><br>");

		  //session.setAttribute("dirPath",dirPath);
		  session.setAttribute("requestId",requestId);
		 // session.setAttribute("attachment",attachment);
		  session.setAttribute("emailid",emailid);

          for(int i = 0; i < fileList.length; i++){
          fileName = fileList[i];
		//  session.setAttribute("fileName",fileName);
		

		  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
		  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
		  String display = st3 + "." + st2;
		  fileSize = fileList.length;
		
%>
<!-- 	<%//=i+1%>&nbsp;&nbsp; -->

		<a href="javascript:void(0);" onclick = "javascript:showAttachedFile('<%=fileName%>','<%=attachment%>');"  style="margin-top:0px;"> <i class="fa fa-file-word-o fa-2x" data-toggle="tooltip" title="View current version of document " ></i></a><!-- '<%//=fileName%>','<%//=emailid%>','1','<%//=requestId%>','<%//=attachment%>' -->
						
<%
	
		if(userEmailId.equals(emailId) && ("D".equals(userStatus)))
		{
%>
		<a href="javascript:fixedDeleteFile('<%=fileName%>','<%=dirPath%>','<%=requestId%>');"> <font color="red">Delete</font></a> 
		<%}%>
		<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>">
		<input type = "hidden" name = "hiddFilesName1<%=attachment%><%=i%>"  id = "hiddFilesName1<%=attachment%><%=i%>" value = "<%=display%>">
<%
          }
%>
		<!-- </td> -->
		

<%
        }

%>
		<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "<%=fileSize%>">

<%

}//end of try
catch(Exception e){
    //out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%><!-- 
        </tr>
	</table> -->
