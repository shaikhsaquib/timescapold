<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ include file="../../includes/empHeader.jsp" %>
<%

String DPATH            = EnvironmentProperties.getValue("priceapproval", "uploadPath");

String str = (String)request.getParameter("str");
String attachment="";

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

	String emailid = emailId;
	if (emailid.indexOf("@") > -1) {
		emailid = emailid.substring(0, emailid.indexOf("@"));        
	}  

	String userFolderPath = DPATH + emailid;
	String dirPath ="";
	String dirPath1 ="";
	String dirPath2 ="";
//	System.out.println("email"+emailid);
	DirListing dirListing = new DirListing();

	////////////////dirAdditional start/////////////////

	String dirAdditional = userFolderPath;
	File dirAdditionalfileName = new File(dirAdditional);
	if (!dirAdditionalfileName.isDirectory()) 
	{
		boolean dirAdditionalFlag = dirAdditionalfileName.mkdir();

		//System.out.println("dirAdditionalFlag---"+dirAdditionalFlag);
	}
	
	////////////////dirAdditional end/////////////////
	
	String fileName="";

	if(str.equals("1"))
	{
		attachment = (String)request.getParameter("attachment");
		//dirPath = userFolderPath+"/"+emailid+"_"+attachment;
		dirPath = userFolderPath+"/"+attachment;
		//String dirPath=DPATH+emailid+"_"+attachment;		
	}
	else if(str.equals("0"))
	{
		attachment = (String)request.getParameter("attachment");
%>
	<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "0">
<%
		//dirPath1 = userFolderPath+"/"+emailid+"_"+"compulsory";
		dirPath1 = userFolderPath+"/"+"compulsory";
		dirPath2 = userFolderPath+"/"+"additional";
		//dirPath2 = userFolderPath+"/"+emailid+"_"+"additional";
		File compFolder = new File(dirPath1);
		File addFolder = new File(dirPath2);

		String [] fileList1 = dirListing.dirlist(dirPath1);

		String [] fileList2 = dirListing.dirlist(dirPath2);
		//System.out.println("file1-----"+fileList.length);
		//System.out.println("2-----"+fileList1.length);

		if(fileList1.length >0)
		{
			for(int i = 0; i < fileList1.length; i++)
			{
			  String fileName1 = fileList1[i];
			  File a = new File(dirPath1+"/"+fileName1);
			  a.delete();
			}

			if(compFolder.exists())
			{
				//compFolder.delete();
			}
		}
		if(fileList2.length > 0)
		{

			for(int i = 0; i < fileList2.length; i++)
			{
			  String fileName2 = fileList2[i];
			  File b = new File(dirPath2+"/"+fileName2);
			  b.delete();

			}

			if(addFolder.exists())
			{
				//addFolder.delete();
			}
		}
	}
	
	String [] fileList  = dirListing.dirlist(dirPath);
%>

	<table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
          <td  >
<%
        if(fileList==null){
            out.println("No file attached");
             //return;
        }else if (fileList.length == 0){

            out.println("No file attached");
%>
		</td>

<%
        }else{
%>
		<table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
          <td  >

<%			
          for(int i = 0; i < fileList.length; i++){
          fileName = fileList[i];
		

		  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
		  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
		  String display = st3 + "." + st2;
		  fileSize = fileList.length;
          
%>
		<%=i+1%>.&nbsp;&nbsp;<a href="http://<%=request.getServerName()%>/timescape/sapep/employeeselfservice/priceapproval/common/popup.jsp?fileName=<%=fileName%>&emailid=<%=emailid%>&str=0&attachment=<%=attachment%>"><%=display%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:deleteFile('<%=fileName%>','<%=dirPath%>','<%=str%>');"> <font color="red">Delete</font></a><br><br>
		<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>">
		<input type = "hidden" name = "hiddFilesName1<%=attachment%><%=i%>"  id = "hiddFilesName1<%=attachment%><%=i%>" value = "hiddFilesName1<%=attachment%>">
<%
          }
%>
		</td>
<%
        }
%>
		<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "hiddDirectorySize<%=attachment%>">
<%
}//end of try
catch(Exception e){
    //System.out.println(e.getMessage()); 
}//end of catch
%>
        </tr>
	</table>