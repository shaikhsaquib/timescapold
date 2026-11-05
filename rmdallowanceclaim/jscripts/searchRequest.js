function validate(){

	frmObj = document.frmSearchRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	var selectedOption = '';
	var choice = 0;
    
    var txnId			= trim(frmObj.txnId.value);
    var companyCode		= frmObj.companyCode.options[frmObj.companyCode.selectedIndex].value;
	var payId			= trim(frmObj.payId.value);
	var emailId			= trim(frmObj.emailId.value);
	var employeeName	= trim(frmObj.employeeName.value);

	if(txnId == "" && emailId == "" && employeeName == "" && companyCode == "0" && payId == ""){
		alert("Please select atleast one search criteria to proceed");
        frmObj.txnId.focus();
		return;
	}

    if(txnId != ""){
            // Check Transaction Id for Junk
            stat = checkJunk("Transaction Id",  txnId ,junk);
            if(!stat){
                frmObj.txnId.focus( );
                return;
            }
            // Check Transaction Id for Numbers
            stat = checkPhone("Transaction Id", txnId, goodchars);
            if(!stat){
                frmObj.txnId.focus( );
                return;
            }

        choice = choice + 1;
		selectedOption = "txnId";
    }

	if(companyCode != "0") {
		
		// Check Pay Id for Null
		stat = checkNull("Pay Id", payId);

		if(!stat){
			frmObj.payId.focus();
			return;
		}

		// Check Pay Id for Null
		stat = checkJunk("Pay Id",  payId ,junk);
		if(!stat){
			frmObj.payId.focus( );
			return;
		}
		// Check Pay Id for Null
		stat = checkMinLength("Pay Id",  payId ,4);
		if(!stat){
			frmObj.payId.focus( );
			return;
		}

		choice = choice + 1;
        selectedOption = "company";
	}
	
		
	if(payId != "") {
		stat = checkNull("Company Code", companyCode);

		if(!stat){
			frmObj.companyCode.focus();
			return;
		}
		
	}

	
	// Checks on Email Id
	if(emailId != ""){
		
		// Check for valid email address
		stat = checkEmail('emailId')

		if(!stat){
			return;
		}

		choice = choice + 1;
		selectedOption = "emailId";
	
	}
	
	// Checks on Employee Name
	if(employeeName != ""){
		
		choice = choice + 1;
		selectedOption = "employeeName";
	
	}
	
	// If choice is greater than 1 then more than one criteria has been selected
	if(choice > 1){
		alert("Please select only one search criteria");
		return;
	}

	frmObj.searchOpt.value = selectedOption;
	frmObj.action="../processor/searchRequestSubmit.jsp";
	frmObj.submit();

}

function clear() {
	frmObj = document.frmSearchRequest;
	frmObj.reset();
}