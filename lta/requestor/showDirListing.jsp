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
String attachment = (String)request.getParameter("attachment");
String requestId = (String)request.getParameter("requestId");
String userEmailId = (String)request.getParameter("userEmailId");
String userStatus = (String)request.getParameter("status");
String formName = (String)request.getParameter("formName");

//out.println(str + " : "+attachment + " : "+requestId + " : "+userEmailId + " : "+userStatus + " : "+formName );
  

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

	String userFolderPath = DPATH +  getCurrentFinancialYearUp() + "/" + companyCode + "/"+ emailid;
	String dirPath ="";
	String dirPath1 ="";
	String dirPath2 ="";

	DirListing dirListing = new DirListing();
	String fileName="";

	if(str.equals("1"))
	{
		attachment = (String)request.getParameter("attachment");
		//dirPath = userFolderPath+"/"+emailid+"_"+attachment;
		dirPath = userFolderPath+"/"+attachment;
		//String dirPath=DPATH+emailid+"_"+attachment;
		//out.println("dirPath.."+dirPath);
	}else if(str.equals("0"))	{		
		dirPath2 = userFolderPath+"/"+"additional";
		File addFolder = new File(dirPath2);
		String [] fileList2 = dirListing.dirlist(dirPath2);
	
		if(fileList2.length > 0){
			for(int i = 0; i < fileList2.length; i++){
			  String fileName2 = fileList2[i];
			  File b = new File(dirPath2+"/"+fileName2);
			  b.delete();
			}
			if(addFolder.exists()){
				addFolder.delete();
			}
		}
	}
	
	String [] fileList  = dirListing.dirlist(dirPath);


%>
	<div class="row">
		 <div class="col-xs-10">
          <p  class="text-left">
<%
        if(fileList==null || fileList.length == 0){
            out.println("No file attached.");
             //return;
        %>
		</p>
		</div>
		</div>

<%
        }else{
%>
		<div class="row">
		  <div class="col-xs-10">
         <p  class="text-left">
<%			
		  //out.println("The Files in the currrent Directory are ..<br><br>");

          for(int i = 0; i < fileList.length; i++){
          fileName = fileList[i];
		  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
		  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
		  String display = st3 + "." + st2;
		  fileSize = fileList.length;
		 // System.out.println("display="+display);
		  //request.getServerName();
		  //String urlName = "../common/popup.jsp?fileName="+fileName;
          
%>
		<%=i+1%>.&nbsp;&nbsp;
		<a onclick="openFile('<%=fileName%>','<%=emailid%>','<%=attachment%>');" href="#"><%=display%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
	
	//	if(userEmailId.equals(emailId) &&( "CR".equals(userStatus) ||"I".equals(userStatus))){
			if(userEmailId.equals(emailId) &&( "CR".equals(userStatus) ||"I".equals(userStatus) ||"D".equals(userStatus))){
%>
		<a href="javascript:deleteFile('<%=fileName%>','<%=dirPath%>','<%=requestId%>','<%=formName%>');"> <font color="red">Delete</font></a> 
		<%}%><br><br>
		<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>">
		<input type = "hidden" name = "hiddFilesName1<%=attachment%><%=i%>"  id = "hiddFilesName1<%=attachment%><%=i%>" value = "<%=display%>">
<%
          }
%>
		</td>
<%
        }
%>
		<input type = "hidden" name = "hiddDirectorySize<%=attachment%>"  id = "hiddDirectorySize<%=attachment%>"  value = "<%=fileSize%>">
<%

}//end of try
catch(Exception e){
  ///  out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%>
        </p>
	</div>
	</div>
