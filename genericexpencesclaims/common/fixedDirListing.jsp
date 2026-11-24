<%
	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>

<%@ page import="java.util.Hashtable, java.util.ArrayList, java.util.Calendar, java.util.Date, java.util.StringTokenizer,java.io.*, java.io.File"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties,com.bccl.util.AESencrp"%>
<%@ include file="../includes/empHeader.jsp"%>

<link rel="stylesheet" href="../style/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="../style/global.css">

<%
	//System.out.println("**************fixedDirListing***************************");
	String DPATH	= EnvironmentProperties.getValue("claim", "uploadPath");
	String str 		= (String)request.getParameter("str");
	
	String attachment = "";
	AESencrp testEncrpt = new AESencrp();
	
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
	
		String userFolderPath 	= DPATH + emailid;

		String dirPath 			= "";
		String dirPath1 		= "";
		String dirPath2 		= "";
		DirListing dirListing 	= new DirListing();
		
		String dirAdditional = userFolderPath;
		
		File dirAdditionalfileName = new File(dirAdditional);
		
		if (!dirAdditionalfileName.isDirectory()) {
			boolean dirAdditionalFlag = dirAdditionalfileName.mkdirs();
		}
	
		String fileName	= "";
	
		attachment = (String)request.getParameter("attachment");
		/* dirPath = userFolderPath+"/"+attachment; */
		dirPath = userFolderPath;

		attachment = (String)request.getParameter("attachment");
%>
		<input type="hidden" name="hiddDirectorySize<%=attachment%>" id="hiddDirectorySize<%=attachment%>" value="0">
<%
		/* dirPath1 = userFolderPath+"/"+attachment; */
		dirPath1 = userFolderPath;

		File compFolder = new File(dirPath1);
		
		if (!compFolder.isDirectory()) {
			boolean dirCompFlag = compFolder.mkdirs();
		}
	
		String [] fileList  = dirListing.dirlist(dirPath);
%>
		<table border="0">
			<tr>
				<td>
<%
			        if(fileList==null){ 
			        	out.println();
			        } else if (fileList.length == 0) { 
			        	out.println();
%>
				</td>
<%
        			} else {
%>
					<td id="hideThisTableData<%=attachment%>" name="hideThisTableData<%=attachment%>" align="right">
<%			
			 			/* session.setAttribute("dirPath",dirPath); */
						session.setAttribute("requestId","0");
						session.setAttribute("emailDirPath",userFolderPath);
						
						String name=(String)session.getAttribute("hiddenSavedFileName");
		 
						for(int i = 0; i < fileList.length; i++){
							fileName = fileList[i];
							
							if(name.equals(fileName)){
								String display = fileName;
								fileSize = fileList.length;

								String fileNameEncrypt = testEncrpt.encrypt(fileName);
								fileNameEncrypt = fileNameEncrypt.replaceAll("\\s+", "");
%> 
								<a href="javascript:void(0);" onclick="javascript:showCurrentFile('<%=fileName%>','<%=emailid%>','0','');">
									<%-- <%=display%> --%><img src="../images/Downloads-icon.png" height="12px" width="12px" title="<%=fileName%>">
									<!-- <span class="glyphicon glyphicon-download" title="<%=fileName%>"></span> -->
								</a>
								<a href="javascript:fixedDeleteFile('<%=fileNameEncrypt%>','<%=attachment%>','<%=str%>');">
									<img src="../images/icons8-cancel-48.png" height="12px" width="12px" ><!-- <font color="red">Delete</font> -->
								</a>
								<input type="hidden" name="hiddFilesName<%=i%>" value="<%=fileName%>"> 
								<input type="hidden" name="hiddFilesName1<%=attachment%><%=i%>" id="hiddFilesName1<%=attachment%><%=i%>" value="<%=(display ==null) ? "" : display%>"> 
<%
							}
						}
%>
					</td>
<%
					}
%>
					<input type="hidden" name="hiddDirectorySize<%=attachment%>" id="hiddDirectorySize<%=attachment%>" value="<%=fileSize%>">
					<input type="hidden" name="fileSize" id="fileSize" value="<%=fileSize%>">
					<input type="hidden" name="fileListLength" id="fileListLength" value="<%=fileList.length%>">
<%
					//System.out.println(fileList.length);	
					//System.out.println("**************fixedDirListing***************************");		
				} catch(Exception e) { }
%>
			</tr>
		</table>