function validateFields(formName) {

	//alert(formName);
	var frmObj = document.frmUploadFile;
	var uploadFile = frmObj.uploadFile.value;

	hiddRequestNo = frmObj.hiddRequestNo.value
    var stats = "";

	stat = checkNull("File",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}

	//var requestNo = requestNo;
	var fileType = frmObj.uploadFile.value;
    fileTypeArr = fileType.split('.');
	//fileType = fileType.substring(fileType.length-3,fileType.length);
	fileType = fileType.toLowerCase();

/*	if(fileTypeArr[1] == "jpg" || fileTypeArr[1] == "gif" || fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {
	}  

*/

    if(fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {

	}
	
	frmObj.action="../upload/uploadFileRequest.jsp?hiddRequestNo="+hiddRequestNo+"&formName="+formName;
	frmObj.submit();
}

function closeWindow (requestNo,formName) {

     
		//var ff = document.frmUploadFileSubmit;
		//var temp = ff.uploadFileName.value;
        // var temp1 = ff.isUpload.value; is attach? yes or no
        //alert(temp);
       
		//field= eval("self.opener.document.frmUploadFileSubmit."+fieldName);        
		//isUpload= (String)eval("self.opener.document.frmCreateRequest.isUpload"+i);  

		//field.value=newFileName;
       
//        isUpload.value = temp1;
		//alert(formName);
		self.close();
        eval("self.opener.document."+formName+".fillDate.focus()");
		//loadFile(requestNo);
		
   }

/*function loadFile(requestNo) {
	//alert(requestNo);
	loadFragment("../common/attachment.jsp?requestNo="+requestNo,"attachment","Attachment");
}*/

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    
    var element = document.getElementById(element_id);

    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
    //alert(processingRequest);    
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
				alert(message);   
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}