function validateFields() {

	var frmObj = document.frmUploadFile;
	var uploadFile = frmObj.uploadFile.value;
	var attachment = frmObj.attachmentName.value;
	var requestStr = frmObj.requestStr.value;
	var formName = frmObj.formName.value;
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";

	var	requestStr	= document.getElementById('requestStr').value;
	//alert("  requestStr : " +requestStr + " : uploadFile " + uploadFile + " : attachment  " +attachment);
    var stats = "";	
	stats = "";
	stat = checkNull("File",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}
	stat = checkJunk("File", uploadFile, junk);
    if(!stat){
        frmObj.uploadFile.focus();
        return;
    }

	//var requestNo = requestNo;
	var fileType = frmObj.uploadFile.value;
	
    fileTypeArr = fileType.split('.');
	//fileType = fileType.substring(fileType.length-3,fileType.length);
	fileType = fileType.toLowerCase();

	

    if(fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {

	}
//	frmObj.action="../upload/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr;
	frmObj.action="../upload/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr+"&formName="+formName;
	frmObj.submit();
	

}
/*
function closeWindow(str) {
	var frmname;
	if(str =="0" || str =="1")	{
		frmname = 'create';
	}else{
		frmname = 'create';
	}
	self.close();
	eval("self.opener.document."+frmname+".projectCoordinator.focus()");
}
*/
function closeWindow(str,formName) {
	var frmname;
	//alert("hello "+formName);
	if(str =="0" || str =="1")	{
		frmname = 'create';
	}else{	
		frmname = 'create';
	}
	self.close();	
	//alert("formName :"+formName);
	if(formName =='create'){		
		eval("self.opener.document."+formName+".projectCoordinator.focus()");
	}else if(formName =='viewWizard'){
		eval("self.opener.document."+formName+".approvedBy0.focus()");
	}else if(formName =='wizard'){
		eval("self.opener.document."+formName+".approvedBy0.focus()");
	}else if(formName =='createForm'){	
		eval("self.opener.document."+formName+".showAtt.focus()");		
	}else if(formName =='dashboard'){	
		eval("self.opener.document."+formName+".recommendedBy.focus()");		
	}else{		
	}

}


function onLoadDetail(str,formName){	
	if(str == '0'){
		loadFragment("../common/dirListing.jsp?attachment=additional&str="+str+"&formName="+formName,"attachment1","Attachment");
	}else 	{
		loadFragment("../common/dirListing.jsp?attachment=additional&str=1&formName="+formName,"attachment1","Attachment");
	}
}
function checkJunk(val)
{
	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	for (var i = 0; i <val.length;i++){
		for(var j=0;j < junk.length;j++){
			if(val.charAt(i)==junk.charAt(j)){
				//alert("Remark cannot contain junk characters !");
				return false;
			}
		}
	}
	return true;
}