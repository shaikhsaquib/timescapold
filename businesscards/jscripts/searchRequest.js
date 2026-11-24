function validate(){

	frmObj = document.frmSearchRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
	var selectedOption = "company";
	var choice = 0;

	var challanNo	= frmObj.challanNo.value;
//	var frmDay		= frmObj.frmDay.value;
//  var frmMonth	= frmObj.frmMonth.value;
//	var frmYear		= frmObj.frmYear.value;
//	var toDay		= frmObj.toDay.value;
//	var toMonth		= frmObj.toMonth.value;
//	var toYear		= frmObj.toYear.value;
	var frmDate		= frmObj.frmDate.value;
	var toDate		= frmObj.toDate.value;
   
//	if(challanNo == "" && (frmDay=="0" || frmMonth=="0" || frmYear=="0")){
	if(challanNo == "" && (frmDate=="" || toDate=="")){

		alert("Please select atleast one search criteria to proceed !!");
        frmObj.challanNo.focus();
		return;
	}


	if(challanNo != ""){
		
// Check for valid email address
		stat = checkNull("Challan Number", challanNo);

		if(!stat){
			frmObj.challanNo.focus();
			return;
		}

		choice = choice + 1;
		selectedOption = "challanNo";
	
	}
	
// Checks on Date
/*
	if(frmDay != "0"){
        dDown   = frmObj.frmDay;
        dDown2  = frmObj.frmMonth;
        dDown3  = frmObj.frmYear;
        
        stat = checkDate(dDown,dDown2,dDown3);

        if(!stat){
            return;
        }

        fromDate = new Date(frmYear, frmMonth-1,frmDay);
        toDate = new Date(toYear, toMonth-1,toDay);
        // Check whether From Date is earlier than Current Date
        if(fromDate > toDate){
            alert("From Date cannot be greater than the To Date! ");
            frmObj.frmDay.focus( );
            return;
        }
        choice = choice + 1;
		selectedOption = "date";
    }
*/

	if(frmDate != ""){

        // Check whether From Date is earlier than Current Date
        if(frmDate > toDate){
            alert("From Date cannot be greater than the To Date! ");
            frmObj.frmDate.focus( );
            return;
        }
        choice = choice + 1;
		selectedOption = "date";
    }


// If choice is greater than 1 then more than one criteria has been selected
	if(choice > 1){
		alert("Please select only one search criteria");
		return;
	}
	
	frmObj.searchOpt.value = selectedOption;
	frmObj.action="../utils/searchRequestSubmit.jsp";
	frmObj.submit();

}

function clear() {
	frmObj = document.frmSearchRequest;
	frmObj.reset();
}