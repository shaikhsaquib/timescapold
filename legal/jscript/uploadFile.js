function validateFields() {
	var frmObj = document.frmlegalUploadFile;

	var uploadFile = frmObj.uploadFile.value;
	var attachment = frmObj.attachmentName.value;
	var requestStr = frmObj.requestStr.value;
	var userEmailid = frmObj.userEmailid.value;
	var	requestStr	= document.getElementById('requestStr').value;
    var stats = "";
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";


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


	var fileType = frmObj.uploadFile.value;
    fileTypeArr = fileType.split('.');
	fileType = fileType.toLowerCase();


   if(fileTypeArr[2] == "tif" || fileTypeArr[2]== "html" || fileTypeArr[2]== "pdf" || fileTypeArr[2]== "txt" || fileTypeArr[2]== "xls" || fileTypeArr[2]== "ppt" || fileTypeArr[2]== "xls") {
		alert("Please select doc/pdf extn files");
		return;
	}else {

	}
	
	//frmObj.action="../upload/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr+"&userEmailid="+userEmailid;
	frmObj.action="../upload/uploadFileRequest.jsp";
	frmObj.submit();

}


function userValidateFields() {
	var frmObj = document.frmlegalUploadFile;

	var uploadFile = frmObj.uploadFile.value;
	var attachment = frmObj.attachmentName.value;
	var requestStr = frmObj.requestStr.value;
	var userEmailid = frmObj.userEmailid.value;
	//var	requestStr	= document.getElemenTById('requestStr').value;

    var stats = "";
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";


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


	var fileType = frmObj.uploadFile.value;
    fileTypeArr = fileType.split('.');
	fileType = fileType.toLowerCase();
	var fileExtn = fileTypeArr[fileTypeArr.length - 1];


	/*if(fileExtn == "tif" || fileExtn== "html" || fileExtn== "pdf" || fileExtn== "txt" || fileExtn== "xls" || fileExtn== "ppt" || fileExtn== "xls" || fileExtn== "doc") {
		alert("Please select pdf extn files");
		return;
	}else {

	}*/

	if(attachment == 'signoff')
	{
		if(fileExtn == 'pdf')
		{

		}else
		{
			alert("Please attach the signed-off document in pdf format only.");
			return;
		}

	}else
	{
		if(fileExtn == 'doc' || fileExtn == 'docx')
		{
		}else
		{
			alert("Please attach the document in doc format only.");
			return;
		}

	}
	//var url = "../upload/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr+"&userEmailid="+userEmailid;
	var url = "../upload/uploadFileRequest.jsp";

	frmObj.action= url;
	frmObj.submit();

}





function closeWindow(str) {

	var frmname;
	if(str =="0" || str =="1")
	{
		frmname = 'frmCreateFixedAsset';

	}else
	{
		frmname = 'frmDashBoard';
	}

	self.close();

	eval("self.opener.document."+frmname+".msg.focus()");
	//loadFragment("../common/fixedDirListing.jsp?attachment=fixedAsset&str="+str,"attachment","Attachment");
		
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
				   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}