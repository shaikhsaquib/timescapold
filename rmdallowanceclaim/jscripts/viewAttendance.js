function viewAttendance( )
{
	frmObj = document.frmViewAttendance;

/*--------------Punch Month check begins--------------*/
	/*
		Checks on Punch Month
		1) It should not be null
	*/

// Get the Month
punchMonth = frmObj.punchMonth.options[frmObj.punchMonth.selectedIndex].value;

stat = checkNull("Punch Month", punchMonth);

	if(!stat){
		frmObj.punchMonth.focus( );
		return;
	}
/*--------------Punch Month check ends--------------*/


/*--------------Punch Year check begins--------------*/
	/*
		Checks on Punch Year
		1) It should not be null
	*/

// Get the Month
punchYear = frmObj.punchYear.options[frmObj.punchYear.selectedIndex].value;

stat = checkNull("Punch Year", punchYear);

	if(!stat){
		frmObj.punchYear.focus( );
		return;
	}
/*--------------Punch Year check ends--------------*/

	frmObj.action = "../common/attendance.jsp";
	frmObj.submit( );
}

