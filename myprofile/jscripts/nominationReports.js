function viewNominations(){
	frmObj = document.frmReports;
	url = "../reports/medicalNominations.jsp";
	window.open(url,"MedicalNominations","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=no,scrollbar=no");
//	url = "../reports/completeReport.jsp";
	
//	frmObj.action = url;
//  frmObj.submit( );

}
function noNominations(){


	frmObj = document.frmReports;
	url = "../reports/noEmpNominees.jsp";
	window.open(url,"NoEmpNominees","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=yes,scrollbar=no");
//	url = "../reports/completeReport.jsp";
	
//	frmObj.action = url;
//  frmObj.submit( );

}


function addedNominees( ){
	frmObj = document.frmReports;
	
/*--------------From Month check begins--------------*/
	/*
		Checks on From Month
		1) It should not be null
	*/
	// Checking the From Month for Null Value
	month   = frmObj.month[0].options[frmObj.month[0].selectedIndex].value;
	stat = checkNull("From Month", month);

	if(!stat){
		frmObj.month[0].focus( );
		return;
	}
/*--------------From Month check ends--------------*/

/*--------------From Year check begins--------------*/
	/*
		Checks on From Year
		1) It should not be null
	*/
	// Checking the From Year for Null Value
	year   = frmObj.year[0].options[frmObj.year[0].selectedIndex].value;
	stat = checkNull("From Year", year);

	if(!stat){
		frmObj.year[0].focus( );
		return;
	}
/*--------------From Year check ends--------------*/

	url = "../reports/nomineesAdded.jsp?month="+month+"&year="+year;
	window.open(url,"NomineesAdded","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=no,scrollbar=no");
}


function addedMoreNominees( ){
	frmObj = document.frmReports;
	
/*--------------From Month check begins--------------*/
	/*
		Checks on From Month
		1) It should not be null
	*/
	// Checking the From Month for Null Value
	month   = frmObj.month[1].options[frmObj.month[1].selectedIndex].value;
	stat = checkNull("From Month", month);

	if(!stat){
		frmObj.month[1].focus( );
		return;
	}
/*--------------From Month check ends--------------*/

/*--------------From Year check begins--------------*/
	/*
		Checks on From Year
		1) It should not be null
	*/
	// Checking the From Year for Null Value
	year   = frmObj.year[1].options[frmObj.year[1].selectedIndex].value;
	stat = checkNull("From Year", year);

	if(!stat){
		frmObj.year[1].focus( );
		return;
	}
/*--------------From Year check ends--------------*/

	url = "../reports/newNomineesAdded.jsp?month="+month+"&year="+year;
	window.open(url,"NomineesAdded","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=no,scrollbar=no");
}


function deletedNominees( ){
	frmObj = document.frmReports;

/*--------------From Month check begins--------------*/
	/*
		Checks on From Month
		1) It should not be null
	*/
	// Checking the From Month for Null Value
	month   = frmObj.month[2].options[frmObj.month[2].selectedIndex].value;
	stat = checkNull("From Month", month);

	if(!stat){
		frmObj.month[2].focus( );
		return;
	}
/*--------------From Month check ends--------------*/

/*--------------From Year check begins--------------*/
	/*
		Checks on From Year
		1) It should not be null
	*/
	// Checking the From Year for Null Value
	year   = frmObj.year[2].options[frmObj.year[2].selectedIndex].value;
	stat = checkNull("From Year", year);

	if(!stat){
		frmObj.year[2].focus( );
		return;
	}
/*--------------From Year check ends--------------*/

	url = "../reports/nomineesDeleted.jsp?month="+month+"&year="+year;
	window.open(url,"NomineesDeleted","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=no,scrollbar=no");
}


function deletedEmpNominees( ){
	frmObj = document.frmReports;

/*--------------From Month check begins--------------*/
	/*
		Checks on From Month
		1) It should not be null
	*/
	// Checking the From Month for Null Value
	month   = frmObj.month[3].options[frmObj.month[3].selectedIndex].value;
	stat = checkNull("From Month", month);

	if(!stat){
		frmObj.month[3].focus( );
		return;
	}
/*--------------From Month check ends--------------*/

/*--------------From Year check begins--------------*/
	/*
		Checks on From Year
		1) It should not be null
	*/
	// Checking the From Year for Null Value
	year   = frmObj.year[3].options[frmObj.year[3].selectedIndex].value;
	stat = checkNull("From Year", year);

	if(!stat){
		frmObj.year[3].focus( );
		return;
	}
/*--------------From Year check ends--------------*/

	url = "../reports/empNomineesDeleted.jsp?month="+month+"&year="+year;
	window.open(url,"NomineesDeleted","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=no,scrollbar=no");
}

function topUpAmtReports(){


	frmObj = document.frmReports;
	url = "../reports/bcclTopupAmtReports.jsp";
	window.open(url,"NoEmpNominees","width=352,height=352,status=no,toolbar=no,location=no,menubar=no,resizable=yes,scrollbar=no");
//	url = "../reports/completeReport.jsp";
	
//	frmObj.action = url;
//  frmObj.submit( );

}