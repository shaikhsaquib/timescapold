<script src="../jscripts/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script Language="JavaScript" src="../jscripts/uploadFile.js"></script>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File" %>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ include file="../includes/empHeader.jsp" %>

<%!
									public static String getCurrentFinancialYearUp() {
										int getCurrentYear		= getCurrentYearUp();
										String financialYear 	= Integer.toString(getCurrentYear) + "-" + Integer.toString(++getCurrentYear);
										return financialYear;
									}
%>
<%!
									public static int getCurrentYearUp() {
										Calendar cal 		= Calendar.getInstance();
										int currentYear 	= cal.get(Calendar.YEAR);
										int currentMonth 	= cal.get(Calendar.MONTH);
										int currentDate 	= cal.get(Calendar.DAY_OF_MONTH);

										//out.println(currentYear);
									
										//if((currentMonth < 3) && (currentDate < 16)) {
										//if((currentMonth < 3) && (currentDate < 31)) {
										if((currentMonth < 3)) {
											currentYear 	= currentYear - 1;
										}
										return currentYear;
									}
								%>
								<%
String DPATH     = EnvironmentProperties.getValue("lta", "uploadPath");


String str = (String)request.getParameter("str");
String formName = (String)request.getParameter("formName");
String attachment="";

//out.println("attachment----"+attachment);
//out.println("str----"+str);
//System.out.println("formName----"+formName);

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

	String userFolderPath = DPATH +  getCurrentFinancialYearUp() + "/" + companyCode + "/" + emailid;
	String dirPath ="";
	String dirPath1 ="";
	String dirPath2 ="";
	//out.println("email"+emailid+"...."+userFolderPath);
	DirListing dirListing = new DirListing();
	
	
	String fileName="";
	attachment = (String)request.getParameter("attachment");
	//out.println("attachment..."+attachment);
	dirPath = userFolderPath+"/"+attachment;
	//out.println("dirPath2..."+dirPath);

	File addFolder = new File(dirPath);

	String [] fileList = dirListing.dirlist(dirPath);

	//out.println("fileList2-----"+fileList.length);

	if(str.equals("1")){
		//do nothing
	}else if(str.equals("0")){
%>
	<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "0">
<%

		if(fileList.length > 0){
			for(int i = 0; i < fileList.length; i++){
			  String fileName2 = fileList[i];
			  File b = new File(dirPath+"/"+fileName2);
			  b.delete();
			}
			if(addFolder.exists()){
				addFolder.delete();
			}
		}
	}
	
	//out.println("fileList...."+fileList);
%>
	
	<table cellspacing="0" cellpadding="0"  border="0">
		 <tr>
          <td  class="text-left">
<%
	//System.out.println("fileList.length---"+fileList.length);
        if(fileList==null ||fileList.length == 0){
            out.println("No File attached"); 
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
		  fileSize = fileList.length;
          for(int i = 0; i < fileList.length; i++){
			  fileName = fileList[i];
			  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
			  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
			  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
			  String display = st3 + "." + st2;
		            
%>
		<%=i+1%>.&nbsp;&nbsp;<a href="https://<%=request.getServerName()%>/timescape/sapep/employeeselfservice/lta/common/popup.jsp?fileName=<%=fileName%>&emailid=<%=emailid%>&str=0"><%=display%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:deleteFile('<%=fileName%>','<%=dirPath%>','<%=str%>','<%=formName%>');"> <font color="red">Delete</font></a><br><br>
		<!--input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>"-->
		<input type = "hidden" name = "hiddFilesName1<%=attachment%><%=i%>"  id = "hiddFilesName1<%=attachment%><%=i%>" value = "<%=display%>">


<%
          }
		
%>
		</td>
		

<%
        }

%>
		<input type = "hidden" name = "attachedFileSize"  id = "attachedFileSize"  value = "<%=fileSize%>">


<%

}//end of try
catch(Exception e){
    //out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%>
        </tr>
	</table>
