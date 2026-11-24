function confirmRequest( ){
	frmObj = document.frmprocessRequestPreview;

	stat = checkNull("Vendor Email ",frmObj.vendorEmail.value);
	if(!stat){
		frmObj.vendorEmail.focus();
		return;
	}

	stat = isValidEmail(frmObj.vendorEmail.value);
	if(!stat){
		alert("Please enter valid email Id");
		frmObj.vendorEmail.focus();
		return;
	}



	frmObj.action="../processor/processRequestSubmit.jsp";
	frmObj.submit( );

}


function confirmRequestVendor(){
	frmObj = document.frmprocessRequestPreview;
   
  // alert(cardType);

	frmObj.action="../vendor/processRequestSubmit.jsp";
	frmObj.submit( );

}