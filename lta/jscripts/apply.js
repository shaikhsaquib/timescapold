/*function apply () {
	
	frmObj = document.frmLtaApplication;

	val = confirm("Do you wish to apply for LTA ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../requestor/submit.jsp";

		frmObj.submit();
	
	}else{
		return;
	}
}*/

function apply () {
	
	frmObj = document.frmLtaApplication;

	val = confirm("Do you wish to apply for LTA ? ");

	if(val){
		//If "yes" then submit the page
		//frmObj.action = "../requestor/submitmonthlylta.jsp";
		frmObj.submitForm.disabled = true;  
        frmObj.submitForm.value = 'Please Wait...';  

		frmObj.action = "../common/submitmonthlylta.jsp";
		frmObj.submit();
	
	}else{
		return;
	}
}
function reviewerapply () {
	
	frmObj = document.frmLtaApplication;

	val = confirm("Do you wish to apply for LTA ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../reviewer/submitmonthlylta.jsp";

		frmObj.submit();
	
	}else{
		return;
	}
}
function cancelRequestUser (applicationId) {
	
	frmObj = document.annualltacheckstatus;

	val = confirm("Do you wish to cancel for LTA ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../common/cancelrequest.jsp?applicationId="+applicationId;

		frmObj.submit();
	
	}else{
		return;
	}
}

