<%--
 -- Project Approval
 -- @(#)uploadCodeSubmit.jsp	13/06/2012
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		Ashutosh Shimpi
 -- @version 	1.00, 13/06/2012
 --%>
   
   <%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File, java.io.*, java.util.*,java.text.SimpleDateFormat" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%


 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   try {
		   items = upload.parseRequest(request);
	   } catch (FileUploadException e) {
		   e.printStackTrace();
	   }
	   Iterator itr = items.iterator();
	   while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   if (item.isFormField()) {
	   } else {
		   
		   try {
			   if(item.getSize()<10000000 )
			   {
				if(item.getSize()!=0)
				   {
				String itemName = item.getName();
                
                if(itemName.lastIndexOf("\\") >=0)
				{
					itemName = itemName.substring(itemName.lastIndexOf("\\")+1);	
				}

				String strVersion = "";
						
				String format= itemName.substring(itemName.lastIndexOf("."));

                //String fileNameNoExtension = itemName.substring(0,(itemName.indexOf(".")));

				String fileNameNoExtension = itemName.substring(0,(itemName.lastIndexOf(".")));


				String userFolderPath = DPATH + emailId1;

				//out.println("userFolderPath------"+userFolderPath);
				File dirOnEmailID = new File(userFolderPath);
				if (!dirOnEmailID.isDirectory()) 
				{
					boolean dirOnEmailIDFlag = dirOnEmailID.mkdirs();
				}

			
				String dirCompulsory = userFolderPath+"/"+requestStr;
				File dirCompulsoryfileName = new File(dirCompulsory);
				if (!dirCompulsoryfileName.isDirectory()) 
				{
					boolean dirCompulsoryFlag = dirCompulsoryfileName.mkdirs();
				}

				////////////////dirCompulsory end/////////////////

				// Create Date object.

				Date date = new Date();

				//Specify the desired date format

				String DATE_FORMAT = "ddMMyyyy";
		
				//Create object of SimpleDateFormat and pass the desired date format.

				SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
				SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");
				
				// MM/dd/yyyy hh:mm:ss a
				
				/*File tempFileName        = new File(userFolderPath);

				if (!tempFileName.isDirectory()) 
				{
					boolean flag = tempFileName.mkdirs();
				}*/

				//String userDatePath = userFolderPath+"/"+  requestNo;
				//String userDatePath = userFolderPath+"/"+ emailId1+"_"+attachment;

				//System.out.println("requestStrr------"+requestStr);
				/*String fileNameStr="";
			    if(requestStr.equals("0"))
			    {
					fileNameStr =attachment;

			    }else
				{
					fileNameStr = requestStr+"/"+attachment;
				}*/

				//File compFolder = new File(dirPath1);

				String userDatePath = dirCompulsory+"/"+attachment;

				String userArchPath = dirCompulsory+"/"+"archive";
				String userSignOffPath = dirCompulsory+"/"+"signoff";

				//out.println("attachment------"+attachment);

				
				File tempRequestfileName = new File(userDatePath);
				strVersion = "V001";

				if("current".equals(attachment))
				{

					if (!tempRequestfileName.isDirectory()) 
					{
						boolean flag = tempRequestfileName.mkdirs();

					}else
					{
						File[] listOfFiles = tempRequestfileName.listFiles();

						 //System.out.println("File " + listOfFiles.length);

						for(int i = 0; i < listOfFiles.length; i++) 
						{
						  if (listOfFiles[i].isFile()) 
						  {
							  String currFileName =  listOfFiles[i].getName();

							 // String [] fileTypeArr = currFileName.split('.');
								//var fileExtn = fileTypeArr[fileTypeArr.length - 1];

							  String st1 = currFileName.substring(0, currFileName.lastIndexOf("."));
							//  System.out.println("st1-----"+st1);

							 // String st2 = currFileName.substring(currFileName.lastIndexOf(".")+1,currFileName.length());

							  //String st3 = st1.substring(0, currFileName.lastIndexOf("_"));

							 // String last3 = st1.substring(st1.length() - 3);
							  String lastV= st1.substring(st1.lastIndexOf("V"));
							 //  System.out.println("lastV-----"+lastV);
							  String last3 = lastV.substring(lastV.length() - 3);
							//   System.out.println("last3-----"+last3);
							 

							  int nxtVer =  Integer.parseInt(last3)+1;
							  String strVer = nxtVer+"";
							  if(strVer.length() == 1)
							  {
								  strVersion = "V00"+nxtVer+"";

							  }else if(strVer.length() == 2)
							  {
								   strVersion = "V0"+nxtVer+"";
							  }else
							  {
								  strVersion = "V"+nxtVer+"";
							  }

							 // System.out.println("strVersion " + strVersion);
							  
								// File (or Directory) to be moved
							  File moveFile = new File(tempRequestfileName+"/"+currFileName);

								// Destination directory
							  File destDir = new File(userArchPath);

							  boolean success = moveFile.renameTo(new File(destDir, moveFile.getName()));
							//  System.out.println("success " + success);

							 
						  }
						}
					}

					//String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+strVersion+format; 
					
					//out.println("newFileName----"+newFileName);
					//System.out.println("newFileName----"+newFileName);


					//	TM Assignment Agreement_04032016141455V001.doc

					//File savedFile = new File(userDatePath+'/'+newFileName);

			    }

				File tempRequestfileName1 = new File(userArchPath);

				if (!tempRequestfileName1.isDirectory()) 
				{
					boolean flag = tempRequestfileName1.mkdirs();
				}

				File tempRequestfileName2 = new File(userSignOffPath);

				if (!tempRequestfileName2.isDirectory()) 
				{
					boolean flag = tempRequestfileName2.mkdirs();
				}


				if("signoff".equals(attachment))
				{
					userDatePath = userSignOffPath;
					File dltFile = new File(userSignOffPath);

					String[] myFiles;    
					if(dltFile.isDirectory()){
					   myFiles = dltFile.list();
					   for (int i=0; i<myFiles.length; i++) {
						   File myFile = new File(dltFile, myFiles[i]); 
						   myFile.delete();
					   }
					}
					
					//userDatePath = dirCompulsory+"/"+"signoff";
				}	

				String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+strVersion+format;  


				if(newFileName.contains(".tif") || newFileName.contains(".html") || newFileName.contains(".txt") || newFileName.contains(".xls") || newFileName.contains(".ppt") || newFileName.contains(".xls") || newFileName.contains(".exe") || newFileName.contains(".js") || newFileName.contains(".jar"))
				{
					String message1 = "";

					message1 = "There was an error while uploading the document.<br>"
								+"<br>Click <a href=\"javascript:window.close()\"> here</a> to close this window."; 

%>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
				 <!--    <tr bgcolor="000000">
					   <td colspan="100%" class="whiteCopy" height="20">&nbsp;<strong>Upload File</strong></td>
					</tr> -->
					<tr  bgcolor="#2AA295">
						<td colspan="100%" align = "left" class="style1" height="20">&nbsp;Upload File</td>
					</tr>
						
					<tr>
						<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="20"></td>
					</tr>
					
					<tr>
						<td colspan="2" align="center" class="normal" valign = "top"><%=message1%></td>
					</tr>

					<input type = "hidden" name ="uploadOriginalFileName" value = "<%=fileNameNoExtension+format%>">
					<tr>
						<td width="100%" colspan="2">&nbsp;</td>
					</tr>

					<tr>
						<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
					</tr>
				   </table>

<%

				}else
				{


				File savedFile = new File(userDatePath+'/'+newFileName);

			//	System.out.println("savedFile---"+savedFile);

				
						if(savedFile.exists())
						   {
								%>
								<span class="normal">File already exists!!!</span>
								<%
						   }
						else
						   {
								item.write(savedFile);  
								
								String message = "";
						   
								message = "The file has been enclosed as an attachment successfully. <br>"
								+"<br>Click <a href=\"javascript:closeWindow('3')\"> here</a> to close this window."; 
								//'"+requestNo+"','"+requestStr+"' //requestStr
								
			%>
								<form name="frmUploadFileSubmit" method="post">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
							 <!--    <tr bgcolor="000000">
								   <td colspan="100%" class="whiteCopy" height="20">&nbsp;<strong>Upload File</strong></td>
								</tr> -->
								<tr  bgcolor="#2AA295">
									<td colspan="100%" align = "left" class="style1" height="20">&nbsp;Upload File</td>
								</tr>
									
								<tr>
									<td align="left" colspan="2"><img src="../images/spacer.gif" width="1" height="20"></td>
								</tr>
								
								<tr>
									<td colspan="2" align="center" class="normal" valign = "top"><%=message%></td>
								</tr>

								<input type = "hidden" name ="uploadOriginalFileName" value = "<%=fileNameNoExtension+format%>">
								<tr>
									<td width="100%" colspan="2">&nbsp;</td>
								</tr>

								<tr>
									<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
								</tr>
							   </table>
							   </form>
<%
							}
						}
				   }
			   }
			   else
				   {
                       %><center><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"><tr><td><% out.println("File Size exceed : " + item.getContentType());%></td></tr></table></center><%
                   }
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>