function validate(){

	frmObj = document.frmSearchRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
	var selectedOption = "company";
	var choice = 0;

	var frmDate		= frmObj.frmDate.value;
	var toDate		= frmObj.toDate.value;
	var location	= frmObj.location.value;
   
    
    if(frmDate=="" || toDate==""){

		alert("Please select atleast one search criteria to proceed !!");
        frmObj.frmDate.focus();
		return;
	}

    if(location=='0'){
		alert("Please select location !!");
		frmObj.location.focus();
		return;
	}
     
	

var months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];

frmDateArr = frmDate.split('-');
toDateArr = toDate.split('-');
frmMon =0;
toMon =0;
 for (var i = 0; i < months.length; i++) {
    if (months[i] == frmDateArr[1])
        frmMon = i;
    if (months[i] == toDateArr[1])
        toMon = i;
 }

var fromDate = new Date(frmDateArr[2],frmMon,frmDateArr[0]);
var toDate = new Date(toDateArr[2],toMon,toDateArr[0]);

// Checks on Date

	if(frmDate != ""){

        // Check whether From Date is earlier than Current Date
        if(fromDate > toDate){
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
	frmObj.action="../processor/searchRequestSubmitProcessor.jsp";
	frmObj.submit();

}

function clear() {
	frmObj = document.frmSearchRequest;
	frmObj.reset();
}