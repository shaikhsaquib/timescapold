function validateFields(attachmentName) {


	var frmObj = document.frmUploadFile;
	//var stat = "";
	var fileExtn ="";	
//alert("here"+ frmObj);
	//var attachNo = frmObj.attachNo.value;
//alert("here"+ attachNo);
	var uploadFile = frmObj.uploadFile.value;
	var fileType = frmObj.uploadFile.value;
	
	stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}		
	
	fileType = fileType.toLowerCase();
	
    fileTypeArr = fileType.split('.');
	
	if(!(fileTypeArr[1]== "xls" || fileTypeArr[1]== "xlsx")) {
		alert("Please select xls/xlsx extn files");
		return;
	}else {

	}

//alert("here"+ "../upload/uploadFileSubmit.jsp?attachmentName="+attachmentName);

	frmObj.action="../upload/uploadFileRequest.jsp?attachmentName="+attachmentName;
    frmObj.submit();
	
}
