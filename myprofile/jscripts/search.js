function validate()
{
	frmObj = document.frmSearch;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";


	var companyCode		= Trim( frmObj.companies.value );
	var payId			= Trim( frmObj.payId.value );
	var employeeName	= Trim( frmObj.employeeName.value );
	
	if(employeeName == "" && companyCode == "0" && payId == "") {
		alert("Please Select a Search Criteria To Proceed");
		return;
	}

	if(companyCode != "0") {
		stat = checkNull("Pay Id", payId);

		if(!stat){
			frmObj.payId.focus();
			return;
		}

		stat = checkJunk("Pay Id",  payId ,junk);
		if(!stat){
			frmObj.payId.focus( );
			return;
		}
	}

	if(payId != "") {
		stat = checkNull("Company Code", companyCode);

		if(!stat){
			frmObj.companies.focus();
			return;
		}
	}


	if(payId != "" && employeeName != "") {
		alert("Please Select Only One Search Criteria");
		return;
	}

	frmObj.action="../search/searchSubmit.jsp";
	frmObj.submit( );
}

function clear() {
	frmObj = document.frmSearch;
	frmObj.reset();
}

function printWindow() {
   bV = parseInt(navigator.appVersion)
   if (bV >= 4) window.print()
}

function showProfile(companyCode, payId, timescapeUserOID) {
	url = "displayProfilePopup.jsp?companyCode="+companyCode+"&payId="+payId+"&timescapeUserOID="+timescapeUserOID;
	win = window.open(url,"Profile","width=800,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes,resizable=yes");
}