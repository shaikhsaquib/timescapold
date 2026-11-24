function validate()
{

	var frmObj = document.frmUploadPicture;
	var stat = "";
    var pictureFile = frmObj.uploadPic.value;

	stat = checkNull("picture",pictureFile);

	if(!stat){
		frmObj.uploadPic.focus();
		return;
	}

	var imageType = frmObj.uploadPic.value;
	imageType = imageType.substring(imageType.length-3,imageType.length);
	imageType = imageType.toLowerCase();

	if(imageType == "jpg" || imageType == "jpeg") {
	}else {
		alert('You selected a .'+imageType+
			  ' file; please select a .jpg file instead!');
		return;

	}


	frmObj.action="../profile/pictureUploadSubmit.jsp";
	frmObj.submit();
}

function clearForm( ){
	var frmObj = document.frmUploadPicture;
	frmObj.reset( );
}