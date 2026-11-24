<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.pdf.PdfReader"%>
<%@ page import="java.io.*,java.util.*,java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=10"/>
		<title>Communication Claim - Upload</title>
		<script Language="JavaScript" src="../jscripts/createRequest.js"></script> 
		<link rel="stylesheet" href="../style/bootstrap-3.3.2-dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="../style/global.css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center><table border="0" width="100%" cellpadding="0" cellspacing="0">
			<!-- <tr>
				<td>
					<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
						<img src="../images/communicationClaimHeader.gif" style="width: 100%;">
					</div>
				</td>
			</tr> -->
			
		<%!
			public static boolean getFileExtension(File file) {
		        String fileName = file.getName();
		        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0){
		        	String str = fileName.substring(fileName.lastIndexOf(".")+1);
		        	if(str.equalsIgnoreCase("pdf"))
		        		return true;
		        	else{
		        		return false;
		        	}
		        } else {
		        	return false;
		        }
		    }
		%>
			
		<%!
			public static void isPasswordProtectedFile(String fileName) throws FileNotFoundException, DocumentException, IOException {
				PdfReader pdf = null;
				try {
					pdf = new PdfReader(fileName);
				} catch (IOException e) {
					System.out.println("IOException: " + e.getMessage());
				}

				Boolean editable = pdf.isOpenedWithFullPermissions();
				
				/*
				 * PdfReader reader = new PdfReader(fileName, "cp1234".getBytes());
				 * PdfStamper stamper = new PdfStamper(reader, new
				 * FileOutputStream("C:\\var\\NoPasswordPDF.pdf")); stamper.close();
				 * reader.close(); System.out.println("Done");
				 */

				if (!editable) {
					System.out.println("File is Encrypted / Password Protected.....");
					throw new IOException();
				}
			}				
		%>
		
		<%
			String attachment 	= (String)session.getAttribute("attachmentName");
			String requestStr 	= (String)session.getAttribute("requestStr");
			String email 		= (String)session.getAttribute("emailId");
			
	        String DPATH     	= EnvironmentProperties.getValue("claim", "uploadPath");
			String emailId1  	= email;
			
			if (emailId1.indexOf("@") > -1) {
				emailId1 = emailId1.substring(0, emailId1.indexOf("@"));        
			}
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			
			if (isMultipart) {
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
					
					if (!item.isFormField()) {
						try {
							if(item.getSize() < 10000000) {
								if(item.getSize() != 0) {
									String itemName = item.getName();
									
									if(itemName.lastIndexOf("\\") >= 0) {
										itemName = itemName.substring(itemName.lastIndexOf("\\") + 1);
									}
									
									String format = itemName.substring(itemName.indexOf("."));
									String fileNameNoExtension = itemName.substring(0,(itemName.indexOf(".")));
									String userFolderPath = DPATH + emailId1;
									/* String dirCompulsory = userFolderPath+"/"+attachment; */
									String dirCompulsory = userFolderPath;
									
									File dirCompulsoryfileName = new File(dirCompulsory);
									
									if (!dirCompulsoryfileName.isDirectory()) {
										boolean dirCompulsoryFlag = dirCompulsoryfileName.mkdirs();
									}
									
									Date date 				 = new Date();
									String DATE_FORMAT 		 = "ddMMyyyy";
									SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
									SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");
									File tempFileName        = new File(userFolderPath);
									
									if (!tempFileName.isDirectory()) {
										boolean flag = tempFileName.mkdirs();
									}
									
									String fileNameStr="";
									/* fileNameStr =	attachment+"/"; */
									
									String userDatePath = userFolderPath+"/"+fileNameStr;
									
									File tempRequestfileName = new File(userDatePath);
									
									if (!tempRequestfileName.isDirectory()) {
										boolean flag = tempRequestfileName.mkdirs();
									}
									
									/* String newFileName = fileNameNoExtension+format; */
									String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+format;
									File savedFile = new File(userDatePath+'/'+newFileName);
									
									if(savedFile.exists()){
										%>
											<span class="normal">File already exists!!!</span>
										<%
									} else {

										item.write(savedFile); 
										
										String message = "";
										message = "The file has been enclosed as an attachment successfully. <br>"
												+"<br>Click <a href=\"javascript:closeWindowFixed('"+attachment+"')\"> here</a> to close this window."; 
																				
										//System.out.println(savedFile.getAbsolutePath());
										try {
											if (getFileExtension(savedFile)) {
									            System.out.println("The Keyword :example: is found in given string");
									            isPasswordProtectedFile(savedFile.getAbsolutePath());
									        }
											
										} catch (Exception e) {
											System.out.println("isPasswordProtectedFile Exception: " + e.getMessage());
											message = "Please do not upload encrypted / password protected file. <br>"
													//+"<br>Click <a href=\"javascript:closeWindowFixedNormal('"+attachment+"')\"> here</a> to close this window.";
													+"<br>Click <a href = 'javascript:history.back()'>here</a> to return.";
										}
										
										
										%>
										<form role="form" id="demo_form" name ="frmUploadFileSubmit" method="post">
											<table width="100%" border="0" cellspacing="0" cellpadding="0"> 
												<tr>    
													<td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">UPLOAD FILE<img src="../images/spacer.gif" width="2" height="1" /></td>
												</tr>
												<tr>
													<td align="left"><img src="../images/spacer.gif" width="1" height="40"></td>
												</tr>
												<tr>
													<td align="middle" class="normal" valign = "top"><%=message%></td>
													<input type="hidden" id="hiddenSavedFileName" name="hiddenSavedFileName" value="<%=savedFile.getName() %>" />
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
												</tr>
											</table>
										</form>
										
										<%
										session.setAttribute("hiddenSavedFileName",savedFile.getName());
									}
								}
							} else {	
								%>
									<tr>    
									  <td height="20" bgcolor="#E7EAEF" class="budgetMenuBG">UPLOAD FILE<img src="../images/spacer.gif" width="2" height="1" /></td>
									</tr>
									<tr>    
									  <td height="20" >&nbsp;</td>
									</tr>
									<tr><td class = "bold" align = "center">The upload file size exceeded the maximum upload limit of 10 MB. <br> Please upload a file of size less than 10 MB. <br>Click <a href = 'javascript:history.back()'>here</a> to return.</td></tr>
								<%
							}
						} catch(Exception e) {
						   e.printStackTrace();
						}
					} 
				}
			}
		%>
		</table></center>
	</body>
</html>