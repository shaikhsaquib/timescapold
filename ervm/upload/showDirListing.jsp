<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File, java.io.*, java.util.*,java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>
<%

  String DPATH  = EnvironmentProperties.getValue("ervm", "uploadPathSub");


String str = (String)request.getParameter("str");

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

	


	

	String userFolderPath = DPATH + sapId;
	String dirPath ="";

//	System.out.println("email"+emailid);
	DirListing dirListing = new DirListing();
	
	
	String fileName="";
	
	dirPath = userFolderPath;

	//out.println("dirPath="+dirPath);
	String [] fileList  = dirListing.dirlist(dirPath);

	if(str.equals("0"))
	{
		
		File compFolder = new File(dirPath);

		if(fileList.length >0)
		{

			for(int i = 0; i < fileList.length; i++)
			{
			  String fileName1 = fileList[i];
			  File a = new File(dirPath+"/"+fileName1);
			  a.delete();

			}

			/*if(compFolder.exists())
			{
				compFolder.delete();
			}*/
		}
	}


%>
	<table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
<%
        if(fileList==null || fileList.length == 0){

%>
		<td  class="text-left" style="font-size:12px;font-family:Segoe UI;align:left;">No file attached</td>
<%
          // out.println("No file attached");
             //return;
         }else{
%>
	   <td  class="text-left" >

		<table cellspacing="0" cellpadding="0"  border="0">
		 <tr class="text-left">
          <td  class="text-left">

<%			
		
          for(int i = 0; i < fileList.length; i++){
          fileName = fileList[i];
		
		  String st0= fileName.substring(0, fileName.lastIndexOf("."));
		
		  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
	
		  String display = st0+"."+st2;
		  String fileName1 =  display;
		  fileSize = fileList.length;
		
		  AESencrp testEncrpt = new AESencrp();

		  fileName = testEncrpt.encrypt(fileName);
		  fileName = fileName.replaceAll("\\s+", "");

		//  String sapId1 = testEncrpt.encrypt(sapId);
		 // sapId1 = sapId1.replaceAll("\\s+", "");
	
          
%>
		<%//=i+1%>&nbsp;&nbsp; <a style="font-size:14px;font-family:Segoe UI;align:left;"  href="javascript:void(0);" onclick ="showAttachedFile('<%=fileName%>');"><%=display%></a>&nbsp;&nbsp;&nbsp;
		<input type = "hidden" name = "hiddFilesName" value = "<%=fileName1%>">
<%
          }
%>
		</td>
		

<%
        }

%>

<%

}//end of try
catch(Exception e){
    //out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%>
        </tr>
	</table>
