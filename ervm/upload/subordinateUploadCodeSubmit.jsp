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
<%@ page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="utilityObj" class="com.bccl.util.Utility"/>
<jsp:useBean id="ERVMController" class="com.bccl.ervm.web.controllerbeans.ERVMWebController"/>
<%@ include file="../includes/sessionCheck.jsp" %>
<%@ include file="../includes/empHeader.jsp" %>

	<link href="../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<link href="../jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet"/>  
	<link href="../bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet"/> 
	<link href="../css/ervm.css" rel="stylesheet"/>	
	<script src="../jquery-ui-1.11.4.custom/jquery-ui.js"></script>
	<script src="../bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>
	<script Language="JavaScript" src="../js/ervm.js"></script>
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
				
				//NEW CODE ADDED
				if(isDeckYearAttachment)
					userFolderPath = DPATH;
				//NEW CODE ADDED
				

				String dirCompulsory = userFolderPath+"/"+attachment;
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
				
				File tempFileName        = new File(userFolderPath);

				if (!tempFileName.isDirectory()) 
				{
					boolean flag = tempFileName.mkdirs();
				}

				String fileNameStr="";
				fileNameStr =	attachment+"/";
				
				//NEW CODE ADDED
				if(isDeckYearAttachment)
					fileNameStr += requestStr+"/";
				//NEW CODE ADDED
				

				String userDatePath = userFolderPath+"/"+fileNameStr;

				
				File tempRequestfileName = new File(userDatePath);

				if (!tempRequestfileName.isDirectory()) 
				{
					boolean flag = tempRequestfileName.mkdirs();
				}

				
			    String newFileName = fileNameNoExtension+format;  
				//out.println(newFileName);
				File savedFile = new File(userDatePath+'/'+newFileName);

				//out.println("savedFile"+savedFile);
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
						+"<br>Click <a href=\"javascript:closeWindowFixed('"+requestStr+"')\"> here</a> to close this window.";
						
						int firstHyphen = attachment.indexOf('-');
						String dept = attachment.substring(0,firstHyphen);
						String year = attachment.substring(firstHyphen+1);
						String fileType = fileNameStr.substring(fileNameStr.indexOf("/")+1,fileNameStr.length()-1);
						//message += "\n fileNameStr : "+fileNameStr+" attachment : "+attachment+" emailid : "+emailId;
						//message += "\n dept : "+dept+" year : "+year+" fileType : "+fileType;
						
						/* boolean rowPresent = ERVMController.addDeptBA10730005(dept,year,emailId);
						if(rowPresent){
							fileType = fileType.trim().replaceAll(" ","_").toUpperCase();
							ERVMController.addFileBA10730005(dept,year,emailId,fileType);
						}	*/
						
						boolean rowPresent = ERVMController.addDeptBA10730005(companyCode,dept,year,emailId);
						if(rowPresent){
							fileType = fileType.trim().replaceAll(" ","_").toUpperCase();
							ERVMController.addFileBA10730005(dept,year,emailId,fileType);
						}
    %>

   <div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
		<img src="../images/header.png" style="width: 100%;">
	</div>

	<div class="container">
		<div class="col-md-12" style="margin-top: 8%;">
			<div class="col-md-8 col-md-offset-2  well">
				<div class="col-md-12" style="background: #44bfe5; padding: 1% 2%; font-size: 1.2em; color: #fff;">
					<i class="fa fa-th"></i><strong>&nbsp;&nbsp;Upload Request</strong>
				</div>
		
				<div class="col-md-12" style="background: #fff;">
					
						<form class="" role="form" id="demo_form" name ="frmUploadFileSubmit" method="post">
							<div class="text-center" style="margin: 2% 0%;">
								<p><%=message%></p>
							</div>
						</form>
					
				</div>
			</div>
		</div>
	</div>
                          <%
						   }
				   }
			   }
			   else
				   {
                       %> <!-- <center><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"><tr><td><% out.println("File Size exceed : " + item.getContentType());%></td></tr></table></center>  -->
					   
		<div class="col-md-12 col-sm-12 col-xs-12" style="padding: 0;">
		<img src="../images/header.png" style="width: 100%;">
		</div>

	<div class="container">
		<div class="col-md-12" style="margin-top: 8%;">
			<div class="col-md-8 col-md-offset-2  well">
				<div class="col-md-12" style="background: #fff;">
					<div class="text-center" style="margin: 2% 0%;">
								<p>File Size exceed</p>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<%
                   }
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>