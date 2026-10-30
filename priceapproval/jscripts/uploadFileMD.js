function validateFieldsMD(priceId) {

	//alert("MMMMMM");

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

	//if(fileTypeArr[1]!="jpg" && fileTypeArr[1]!="jpeg" && fileTypeArr[1]!="pdf" && fileTypeArr[1]!="png" && fileTypeArr[1]!="bmp" ){
	if(fileTypeArr[1]!="jpg" && fileTypeArr[1]!="jpeg" && fileTypeArr[1]!="pdf" && fileTypeArr[1]!="png" && fileTypeArr[1]!="bmp" && fileTypeArr[1]!="JPEG" && fileTypeArr[1]!="JPG" && fileTypeArr[1]!="PDF" && fileTypeArr[1]!="msg" && fileTypeArr[1]!="MSG" && fileTypeArr[1]!="PNG" && fileTypeArr[1]!="BMP" ){
		alert("Please upload valid file (.jpg, .png, .bmp, .jpeg, .pdf) only");
		return;
	}else {

	}

    /*if(fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {

	}*/
//	frmObj.action="../upload/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr;
	frmObj.action="../uploadMD/uploadFileRequestMD.jsp?attachment="+attachment+"&requestStr="+requestStr+"&formName="+formName+"&priceId="+priceId;
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
	//alert("hello "+str);
	if(str =="0" || str =="1")	{
		frmname = 'postRemarksForm';
	}else{	
		frmname = 'postRemarksForm';
	}
	self.close();	
	//("formName :"+formName);
	if(formName =='postRemarksForm'){		
		eval("self.opener.document."+formName+".remarksContainer.focus()");
		//onLoadDetail('1','annuallta');
		
	}

}


function onLoadDetail(str,formName){	
	//alert("llll");
	if(str == '0'){
		loadFragment("../requestor/dirListing.jsp?attachment=additional&str="+str+"&formName="+formName,"attachment1","Attachment");
	}else 	{
		loadFragment("../requestor/dirListing.jsp?attachment=additional&str=1&formName="+formName,"attachment1","Attachment");
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

function deleteFile(fileName,dirPath,str,formName){
	var url = "../common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str+"&formName="+formName;
	window.open(url,"File","width=400,height=200, resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}


function showAttachmentFile(str,  userEmailId, formName){	
	
	loadFragment("../common/showDirListing.jsp?attachment=additional&str=1&userEmailId="+userEmailId+"&formName="+formName,"attachment1","Attachment");
}


function loadFragment(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
				 
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}