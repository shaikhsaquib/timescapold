function validateFields() {
	var frmObj = document.frmUploadFile;

	var uploadFile = frmObj.uploadFile.value;
	var attachment = frmObj.attachmentName.value;
	var requestStr = frmObj.requestStr.value;
	var	requestStr	= document.getElementById('requestStr').value;
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";
    var stats = "";

	//var requestNo = requestNo;
	var fileType = frmObj.uploadFile.value;

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

    fileTypeArr = fileType.split('.');
	//fileType = fileType.substring(fileType.length-3,fileType.length);
	fileType = fileType.toLowerCase();	

   if(fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {

	}
	frmObj.action="/timescape/sapep/employeeselfservice/priceapproval/uploadnp/uploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr;
	frmObj.submit();
}

function fixedValidateFields() {
	var frmObj = document.frmFixedUploadFile;

	var uploadFile = frmObj.uploadFile.value;
	var attachment = frmObj.attachmentName.value;
	var requestStr = frmObj.requestStr.value;
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

   if(fileTypeArr[1] == "tif" || fileTypeArr[1]== "html") {
		alert("Please select txt/doc/xls/ppt/pdf extn files");
		return;
	}else {

	}
	frmObj.action="/timescape/sapep/employeeselfservice/priceapproval/uploadnp/fixedUploadFileRequest.jsp?attachment="+attachment+"&requestStr="+requestStr;
	frmObj.submit();

}


function closeWindow(str) {

	var frmname;

	if(str =="0" || str =="1")
	{
		frmname = 'priceApprovalMain';

	}else
	{
	
		frmname = 'priceApprovalMain';
	}

	self.close();

	eval("self.opener.document."+frmname+".bussinessAndCommercial.focus()");
	
   }

   function closeWindowFixed(str) {

	var frmname;
	if(str =="0" || str =="1")
	{
		frmname = 'frmCreateFixedAsset';

	}else
	{
		frmname = 'frmDratfView';
	}

	self.close();

	eval("self.opener.document."+frmname+".userDeptHead0.focus()");
	//loadFragment("../common/fixedDirListing.jsp?attachment=fixedAsset&str="+str,"attachment","Attachment");
		
   }

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