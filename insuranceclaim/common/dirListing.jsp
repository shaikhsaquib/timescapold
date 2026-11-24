<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*" %>
<%@ page import="com.bccl.workflow.web.util.HtmlUtil"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%

String DPATH     = EnvironmentProperties.getValue("insuranceclaim", "uploadPath");

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
	objArr[1] = requestNo;

	Hashtable claimRequestHash = new Hashtable();
	claimRequestHash.put("queryId", "1001");
	claimRequestHash.put("arguments", objArr);

	int fileSize=0;

	ArrayList myClaimRequest = insuranceClaimController.viewClaimRequest(claimRequestHash);

//	System.out.println("myClaimRequest "+myClaimRequest.size());

	String[] myClaimRequestValues = (String[])myClaimRequest.get(0);

	Hashtable userClaimDetails = xmlObj.readSubNode(myClaimRequestValues[2], "userDetails");
	//System.out.println(userClaimDetails);

	String emailid = (String)userClaimDetails.get("emailId-");
	if (emailid.indexOf("@") > -1) {
        emailid = emailid.substring(0, emailid.indexOf("@"));        
	}  
	//System.out.println("email"+emailid);


        String dirPath=DPATH+emailid+"/"+requestNo;
        DirListing dirListing = new DirListing();
        String [] fileList = dirListing.dirlist(dirPath);
        String fileName="";
        if(fileList==null){
            out.println("No File attached");
             //return;
        }else if (fileList.length == 0){
%>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr><td>&nbsp;</td></tr>
		 <tr>
          <td width="74%" height="20" align="left" class="style4">
<%
            out.println("The directory is empty");
            //return;
        }else{
%>
	<table cellspacing="0" cellpadding="0" width="700" border="0">
		<tr><td>&nbsp;</td></tr>
		 <tr>
          <td width="74%" height="20" align="left" class="style4">
<%			
		  //out.println("The Files in the currrent Directory are ..<br><br>");
          for(int i = 0; i < fileList.length; i++){
          fileName = fileList[i];
			//out.println(fileName);
		  String st1 = fileName.substring(0, fileName.lastIndexOf("."));
		  String st2 = fileName.substring(fileName.lastIndexOf(".")+1,fileName.length());
		  String st3 = st1.substring(0, fileName.lastIndexOf("_"));
		  String display = st3 + "." + st2;
		  fileSize = fileList.length;
		  //System.out.println("display="+display);
          
%>
		<%=i+1%>.&nbsp;&nbsp;<a href="http://<%=request.getServerName()%>/timescape/sapep/insuranceclaim/common/popup.jsp?fileName=<%=fileName%>&emailid=<%=emailid%>&requestNo=<%=requestNo%>"><%=display%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:deleteFile('<%=formName%>','<%=fileName%>','<%=dirPath%>');"> Delete</a><br><br>
		<input type = "hidden" name = "hiddFilesName<%=i%>" value = "<%=fileName%>">
<%
          }
        }
%>
	<input type = "hidden" name = "hiddDirectorySize" value = "<%=fileSize%>">
<%
}//end of try
catch(Exception e){
    //out.println("@@Failed@@");
    //System.out.println(e.getMessage()); 
}//end of catch
%>
		 </td>
        </tr>
	</table>

