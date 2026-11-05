function go(){
	//alert(frequency);
	frmObj = document.frmActivity;
		
	activity = document.getElementById('activity').value;


	if(activity == "governanceoca"){
	frmObj.action="../common/userRoles.jsp";
	frmObj.submit();
	}

	if(activity == "governancecode"){
	frmObj.action="../../governanceAdministationCode/common/userRoles.jsp";
	frmObj.submit();
	}

}