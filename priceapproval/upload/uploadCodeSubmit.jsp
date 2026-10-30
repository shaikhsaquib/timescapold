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
						
				String format= itemName.substring(itemName.indexOf("."));

                String fileNameNoExtension = itemName.substring(0,(itemName.indexOf(".")));

				String userFolderPath = DPATH + emailId1;

				// Create Date object.

				Date date = new Date();

				//Specify the desired date format

				String DATE_FORMAT = "ddMMyyyy";
		
				//Create object of SimpleDateFormat and pass the desired date format.

				SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
				SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");
				
				// MM/dd/yyyy hh:mm:ss a
				
				File tempFileName        = new File(userFolderPath);

				if (!tempFileName.isDirectory()) {

					boolean flag = tempFileName.mkdir();
				}

            			
				String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+format;  

				File savedFile = new File(userFolderPath+'/'+newFileName.replaceAll("&", "and"));

				//out.println(userFolderPath);

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
                                +"<br><a href=\"javascript:closeWindow('"+attachmentName+"','"+newFileName+"')\">Click here</a> to close this window."; 
    							
    %>
    <form name="frmUploadFileSubmit" method="post">
    <table width="780" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
 <!--    <tr bgcolor="000000">
       <td colspan="100%" class="whiteCopy" height="20">&nbsp;<strong>Upload File</strong></td>
    </tr> -->
        
	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="middle" class="normal" valign = "top"><%=message%></td>
		<td>&nbsp;</td>
	</tr>

	<input type = "hidden" name ="uploadFileName" value = "<%=fileNameNoExtension+format%>">
	<input type = "hidden" name ="isUpload" value ="YES">

	<tr>
		<td width="41%">&nbsp;</td>
		<td width="3%">&nbsp;</td>
		<td width="56%">&nbsp;</td>
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
			   else
				   {
                       %><center><table width="780" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"><tr><td><% out.println("File Size exceed : " + item.getContentType());%></td></tr></table></center><%
                   }
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>