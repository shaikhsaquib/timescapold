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



<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/capex.css" rel="stylesheet"/>		
	<style>
	.form-control {
		height: 38px;
	}

	</style>
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="http://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="../jscript/jquery-1.9.1.min.js"></script>
<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

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

				//String userFolderPath = DPATH +  emailId1+"/"+priceId;
				String userFolderPath = DPATH +  "MD APPROVALS PAR"+"/"+priceId;
				//String userFolderPath = emailId1+"_"+attachment;
				//out.println("userFolderPath--"+userFolderPath);


				////////////////dirAdditional start/////////////////
				String dirAdditional = userFolderPath + "/additional";
				File dirAdditionalfileName = new File(dirAdditional);
				if (!dirAdditionalfileName.isDirectory()) 
				{
					boolean dirAdditionalFlag = dirAdditionalfileName.mkdirs();
				}

				////////////////dirAdditional end/////////////////


				////////////////dirCompulsory start/////////////////
			/*	String dirCompulsory = userFolderPath + "/compulsory";
				File dirCompulsoryfileName = new File(dirCompulsory);
				if (!dirCompulsoryfileName.isDirectory()) 
				{
					boolean dirCompulsoryFlag = dirCompulsoryfileName.mkdirs();
				}
*/
				////////////////dirCompulsory end/////////////////

				// Create Date object.

				Date date = new Date();

				//Specify the desired date format

				String DATE_FORMAT = "ddMMyyyy";
		
				//Create object of SimpleDateFormat and pass the desired date format.

				SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
				SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");
				
				// MM/dd/yyyy hh:mm:ss a
				
				File tempFileName        = new File(userFolderPath);

				if (!tempFileName.isDirectory()) 
				{
					boolean flag = tempFileName.mkdirs();
				}

				//String userDatePath = userFolderPath+"/"+  requestNo;
				//String userDatePath = userFolderPath+"/"+ emailId1+"_"+attachment;

				//out.println("requestStr------"+requestStr);
				String fileNameStr="";
			    if(requestStr.equals("0"))
			    {
					fileNameStr =attachment;

			    }else
				{
					fileNameStr = requestStr+"/"+attachment;
				}

				//File compFolder = new File(dirPath1);

				String userDatePath = userFolderPath+"/"+fileNameStr;
				
				File tempRequestfileName = new File(userDatePath);

				if (!tempRequestfileName.isDirectory()) 
				{
					boolean flag = tempRequestfileName.mkdirs();
				}

            			
				String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+format;  

				File savedFile = new File(userDatePath+'/'+newFileName);
	//	out.println("  userDatePath : " +userDatePath);
	//	out.println("  savedFile.exists(): " +savedFile.exists());
				
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
						+"Click <a href=\"javascript:closeWindow('"+requestStr+"','"+formName+"')\">here</a> to close this window."; 
						//'"+requestNo+"','"+requestStr+"'
    					
    %>
	<form name="frmUploadFileSubmit" method="post">
	<div class="row">
	<div class="col-xs-12">
	<table class="table table-bordered" id="">
		<thead>
			<tr class="info" >
				<th class="text-center" width="15%" colspan="2" > Upload File</th>
			</tr>
		</thead>
		<tbody>
			<tr class="">
				<td class="text-center" width="15%"></i> <%=message%></td>
				<input type = "hidden" name ="uploadOriginalFileName" value = "<%=fileNameNoExtension+format%>"></td>
			</tr>
		</tbody>
	</table>

	</div>
	</div>
	
                          <%
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