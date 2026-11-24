function check()
{
	//alert("123");
	//window.open('../profile/viewNomineeDetails.jsp','MediclaimNominee','resizable=yes,scrollbars=yes,toolbars=no,width=900,height=550,top=100,left=50');
	frmObj=document.frmSearchNominee;
    
	if(frmObj.sapNumber.value=="")
	{
		alert("Please enter SAP No !!!");
		frmObj.sapNumber.focus();
		return;
	}
	frmObj.action="../profile/searchNomineeDetails.jsp";
	frmObj.submit();
}

function clear()
{
	
	frmObj=document.frmSearchNominee;
    frmObj.action="../profile/searchNomineeDetails.jsp?sapNumber=";
	frmObj.submit();
	frmObj.sapNumber.focus();
}

function norecordsfound(sapNumber)
{
	alert(sapNumber+": No records found for this SAP No !!!");
}
