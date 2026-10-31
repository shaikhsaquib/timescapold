function validateFields(attachmentName, projectName) {

	//alert(attachmentName);
	var frmObj = document.frmUploadFile;
	//var stat = "";
	var fileExtn ="";	
	
	var uploadFile = frmObj.uploadFile.value;

	stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}
    
    // Check Attachment for Ampersand (&)
        stat = checkAmp("Attached File ",  uploadFile , "&");
        if(!stat){
            frmObj.uploadFile.focus( );
            return;
        }		

	frmObj.action="../upload/uploadFileRequest.jsp?attachmentName="+attachmentName+"&projectName="+projectName;
    frmObj.submit();
}


function upload(attachmentName) {

	//alert(attachmentName);

	var frmObj = document.frmprojectApprovalsApply;
	
	var projectName = frmObj.project.value;
	
	if (projectName == "select") {
		
		alert("Please select a Project");
		frmObj.project.focus();
		return;
	}	
	//alert('../upload/uploadFile.jsp?attachmentName='+attachmentName+'&projectName='+projectName,'','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=120,top=70,left=100');
	window.open('../upload/uploadFile.jsp?attachmentName='+attachmentName+'&projectName='+projectName,'','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=120,top=70,left=100');

}

function checkAmp(fieldName, val, junkString)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < junkString.length;j++){
				if(val.charAt(i)==junkString.charAt(j)){
					alert(fieldName + " should not contain ampersand (&) !");
					return false;
				}
			}
		}
	return true;
}