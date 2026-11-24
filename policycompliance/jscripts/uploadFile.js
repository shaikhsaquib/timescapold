function validateFields(attachNo) {

//alert("here");
	var frmObj = document.frmUploadFile;
	//var stat = "";
	var fileExtn ="";	
//alert("here"+ frmObj);
	//var attachNo = frmObj.attachNo.value;
//alert("here"+ attachNo);
	var uploadFile = frmObj.uploadFile.value;

	stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}		


	frmObj.action="../upload/uploadFileRequest.jsp?attachNo="+attachNo;
    frmObj.submit();
}
