<%@ page language="java" %>
<%@page import="com.bccl.tsenvironment.EnvironmentProperties"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*, java.text.SimpleDateFormat" %>

<html>
<head>
<title>B2E</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="../style/scholarship.css">

<script>

   function closeWindow (fieldName,newFileName) {

		newFileName = newFileName.replace(/ /g,"%20");
		var ff = document.frmUploadFileSubmit;
		var temp = ff.uploadFileName.value;
        // var temp1 = ff.isUpload.value; is attach? yes or no
        //alert(temp);
       
		field= eval("self.opener.document.frmCreateAsset."+fieldName); 
		//field2= eval("self.opener.document.frmCreateAsset."+fieldName+"1"); 
       
		//isUpload= (String)eval("self.opener.document.frmCreateRequest.isUpload"+i);  


		field.value=temp;
		//field2.value=newFileName;
       
//        isUpload.value = temp1;

		self.close();
     //   self.opener.focus();
   }

</script>

</head>

<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#EFEFEF">

     
<form name="frmUploadFileSubmit" method="post">
 <%@ include file="../includes/empHeader.jsp"%> 
<%
    
     String emailId1 = emailId;
	String attachmentName= (String)request.getParameter("attachmentName");
	//out.println(attachmentName);

    if (emailId1.indexOf("@") > -1) {
        emailId1 = emailId1.substring(0, emailId1.indexOf("@"));        
	}   


	//out.println("check");
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
	//out.println(contentType);
	//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
			}

		String file = new String(dataBytes);
		//for saving the file name
	
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile =saveFile.substring(0, saveFile.indexOf("\n"));

		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));

        String format= saveFile.substring(saveFile.indexOf("."));
   
        String fileName= saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("."));


		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;


		// creating a new file with the same name and writing the content in new file
		String DPATH = EnvironmentProperties.getValue("assetmanagement", "uploadPath");
   //out.println(DPATH) ; 
		
         String userFolderPath = DPATH + emailId1;
	  
		// Create Date object.
		Date date = new Date();

		//Specify the desired date format
		String DATE_FORMAT = "ddMMyyyy";
		
		//Create object of SimpleDateFormat and pass the desired date format.
		SimpleDateFormat sdfDate = new SimpleDateFormat(DATE_FORMAT);
		SimpleDateFormat sdfTime = new SimpleDateFormat("HHmmss");
        // MM/dd/yyyy hh:mm:ss a
		File fileName1 = new File(userFolderPath);
		if (!fileName1.isDirectory()) {

			boolean flag = fileName1.mkdir();
		}
        
        String newFileName = fileName+"_"+sdfDate.format(date)+sdfTime.format(date)+format;    
	    FileOutputStream fileOut = new FileOutputStream(userFolderPath+"/"+newFileName);
		//out.println(sdfTime.format(date));
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();

		String message = "";
	    String currUrl = "";
        
	    currUrl = "javascript:uploadFile();";
	    message = "The file has been enclosed as an attachment successfully. <br>"
		+"<br><a href=javascript:closeWindow('"+attachmentName+"','"+newFileName+"')>Click here</a> to close this window."; 

//<a href="" class="underline">Click here</a> to close this window</br>
%>
<table width="780" border="0" cellspacing="0" cellpadding="0" bgcolor="FFFFFF"> 
    <tr bgcolor="#35b3ca">
       <td colspan="100%" class="style1" height="20">&nbsp;<strong>Upload File</strong></td>
    </tr>
        
	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="40"></td>
	</tr>
	
	<tr>
		<td colspan="2" align="middle" class="style3" valign = "top"><%=message%></td>
		<td>&nbsp;</td>
	</tr>

        <!-- <input type = "hidden" name ="uploadFileName" value = "<%=fileName+sdfDate.format(date)+sdfTime.format(date)+format%>"> -->

	<input type = "hidden" name ="uploadFileName" value = "<%=fileName+format%>">
	<input type = "hidden" name ="isUpload" value ="YES">

	<tr>
		<td width="41%">&nbsp;</td>
		<td width="3%">&nbsp;</td>
		<td width="56%">&nbsp;</td>
	</tr>

	<tr>
		<td align="left" colspan="3"><img src="../images/spacer.gif" width="1" height="70"></td>
	</tr>

   <!-- <input type = "hidden" name = "attachmentName" value = "<%=sdfDate.format(date)+sdfTime.format(date)+saveFile%>"/> -->

</table>
</form>
</body>
</html>
<%
	}
%>