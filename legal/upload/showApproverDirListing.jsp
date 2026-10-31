<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ include file="../includes/empHeader.jsp" %>
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

	//if(str.equals("1"))
	//{
		
		attachment = (String)request.getParameter("attachment");

		String[] attachmentArr = attachment.split(",");
		//System.out.println("attachmentArr------"+attachmentArr.length);
		int b= 0; 
		
		for(int k=0; k<attachmentArr.length; k++)
		{
			
		//System.out.println("attachment------"+attachmentArr[k]);

			dirPath = userFolderPath+"/"+requestId+"/"+attachmentArr[k];

		//System.out.println("b------"+b);
			
		//}
		
		String [] fileList  = dirListing.dirlist(dirPath);
	


%>
		<table cellspacing="0" cellpadding="0"  border="0">
			 <tr>
			  <td  class="text-left"> 
<%
			if(fileList==null){
				//out.println("No file attached");
				 //return;
			}else if (fileList.length == 0){

				//out.println("No file attached");	
				//return;
%>
			</td>

<%
			}else{
%>
			<table cellspacing="0" cellpadding="0"  border="0">
			 <tr>
			  <td  class="text-left">

<%			
			  //out.println("The Files in the currrent Directory are ..<br><br>");
			int c  = 0;
		  session.setAttribute("requestId",requestId);
		//  session.setAttribute("attachment",attachment);
		  session.setAttribute("emailid",emailid);

			  for(int i = 0; i < fileList.length; i++){
			  fileName = fileList[i];
			 // out.println("i----"+i+"---b-----"+b);
			  c = b+(i+1);
			//session.setAttribute("fileName",fileName);

			  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
			  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
			  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
			  String verStr = st1.substring(st1.length() - 4);
			  String display = st3+"_"+verStr+ "." + st2;
			  fileSize = fileList.length;
			 // System.out.println("display="+display);
			  //request.getServerName();
          
%>
			<%=c%>.&nbsp;&nbsp;<!-- <a href="http://<%=request.getServerName()%>/timescape/sapep/collaboration/workflow/wastesalesapproval/common/popup.jsp?fileName=<%=fileName%>&emailid=<%=emailid%>&str=1&requestNo=<%=requestId%>&attachment=<%=attachment%>"> --><!-- <a href="popup.jsp?fileName=<%=fileName%>&emailid=<%=emailid%>&str=1&requestNo=<%=requestId%>&attachment=<%=attachment%>"><%=display%></a> --> <a style="font-size:13px;font-family:Segoe UI;"  href="javascript:void(0);" onclick ="showAttachedFile('<%=fileName%>','<%=attachmentArr[k]%>');"><%=display%></a>&nbsp;&nbsp;&nbsp;
<%
	
			if(userEmailId.equals(emailId) && ("D".equals(userStatus)))
			{
%>
				<a href="javascript:fixedDeleteFile('<%=fileName%>','<%=dirPath%>','<%=requestId%>');"> <font color="red">Delete</font></a> 
				<%}%><br><br>
				<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>">
				<input type = "hidden" name = "hiddFilesName1<%=attachment%><%=i%>"  id = "hiddFilesName1<%=attachment%><%=i%>" value = "<%=display%>">
<%
			}
			b= b+c;
%>
			</td>
		

<%
        }
//b++;
		}
		if(b==0)
		{
			out.println("No file attached");
		}

%>
		<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "<%=fileSize%>">

<%

}//end of try
catch(Exception e){
    //out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%>
        </tr>
	</table>
