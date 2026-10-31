<%--
 -- Project Approval
 -- @(#)uploadCodeSubmit.jsp	13/07/2017
 --
 -- Copyright 2009 BCCL. All Rights Reserved.
 --
 -- This software is the proprietary information of BCCL.
 -- Use is subject to license terms.
 --
 --%>

 <%--
 -- Comments....
 -- @author		pranita doiphode
 -- @version 	1.00, 13/07/2017
 --%>
<%@ page import="java.util.regex.Pattern,java.text.ParseException,java.text.DateFormat"%>
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
	<script Language="JavaScript" src="../js/moment.js"></script> 
	<script Language="JavaScript" src="../js/ervm.js"></script> 

<%
	String requestStr = "0";
	Hashtable detailsHash = new Hashtable();
	boolean messg = false;
	detailsHash.put("TIMESCAPEUSEROID", timescapeUserOId+"");
	detailsHash.put("COMPANYCODE",companyCode);

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (!isMultipart) {
		//out.println("test1");
	}else{
		//out.println("test");
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			List items = null;
			try {
					items = upload.parseRequest(request);
			}catch (FileUploadException e) {
					e.printStackTrace();
			}
			//out.println("items"+items);
			Iterator itr = items.iterator();
			//out.println("====="+itr);
			while (itr.hasNext()) {
			FileItem item = (FileItem) itr.next();
			//out.println("item"+item);
			if (item.isFormField()) {
				
			} else {
				//out.println("abc");

				try {
					
					if(item.getSize()<10000000){
						if(item.getSize()!=0)
						{
							String itemName = item.getName();
							if(itemName.lastIndexOf("\\") >=0){
								itemName = itemName.substring(itemName.lastIndexOf("\\")+1);	
							}

							String format= itemName.substring(itemName.indexOf("."));
							String fileNameNoExtension = itemName.substring(0,(itemName.indexOf(".")));
							String userFolderPath = DPATH;
							//out.println("=========="+DPATH);
							
							File tempFileName        = new File(userFolderPath);
							if (!tempFileName.isDirectory()){
								boolean flag = tempFileName.mkdirs();
							}

							// Create Date object.
							Date date = new Date();

							//Specify the desired date format
							String DATE_FORMAT = "ddMMyyyy";
							
							//Create object of SimpleDateFormat and pass the desired date format.
							SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
							SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");

							String newFileName = fileNameNoExtension+"_"+sdfDate.format(date)+sdfTime.format(date)+format;  
							File savedFile = new File(userFolderPath+'/'+newFileName);
							boolean success  = savedFile.delete();
							item.write(savedFile); 
							
							
							

							ArrayList xlsDataList = new ArrayList();
							String inputFile = (String) userFolderPath + newFileName;
							//out.println("inputFile"+inputFile);
							String bulk = "";
							/* detailsHash.put("INPUTFILE",inputFile); */
							
							
							String message = "";
							String error = "";
							
							xlsDataList = utilityObj.readXLSX(inputFile, 0, 1); // Reads the excel sheet and loads the data in an Arraylist
							String invalidDataMessage = ERVMController.validateData(xlsDataList); // Checks whether the data uploaded is valid or not
							
							if(invalidDataMessage != null){ //If invalidDataMessage is not null, that means some invalid data has been passed.
								%>
									<script>
										alert('<%=invalidDataMessage%>');
										window.location.href = "../upload/uploadFile.jsp";
									</script>
								<%
								detailsHash.clear();
							}else{
								detailsHash.put("INPUTFILE",xlsDataList);
								detailsHash.put("createdByEmailId",emailId);
								messg = ERVMController.bulkUpload(detailsHash);
							}
							
							if (messg){
								message = "Uploaded successfully."
								+"<br> Click <a href=\"#\" onclick=\"javascript:history.back()\">here</a> to close.";
							}else {
								
									message = "There was some error while uploading the data. Please try again later."
											+"<br> Click <a href=\"#\" onclick=\"javascript:history.back(-1)\">here</a> to return.";
								
							}
							%>
 <form name="frmUploadFileSubmit" method="post">
   <div class="col-md-12">
		<div class="container" style="margin-top: 8%;">
			<div class="col-md-8 col-md-offset-2  well">
				<div class="col-md-12" style="background: #44bfe5; padding: 1% 2%; font-size: 1.2em; color: #fff;">
					<strong>&nbsp;&nbsp;Upload File</strong>
				</div>
				
				<div class="col-md-12" style="background: #fff;">
					
						<form class="" role="form" id="demo_form" name ="frmRequestSubmit" method="post">
							<div class="text-center" style="margin: 2% 0%;">
								<p><%=message%></p>
							</div>
							<input type = "hidden" name ="uploadOriginalFileName" value = "<%=fileNameNoExtension+format%>">
						</form>
					
				</div>
			</div>
		</div>
	</div>				
   </form>
<%
						}
					}else{
%>
						<center><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"><tr><td><% out.println("File Size exceed : " + item.getContentType());%></td></tr></table></center>
<%
				   }
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
			}
	}
   

%>

