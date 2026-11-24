function validate(){

	frmObj = document.frmSearch;

	frequency = frmObj.frequency.value;
	riskCat = frmObj.riskCat.value;
	frmDate = frmObj.frmDate.value;
	toDate = frmObj.toDate.value;
    Function = frmObj.Function.value;

	if(frequency=='0' && riskCat=='0' && Function=='0' ){
		alert("Please select/enter atleast one search criteria to proceed!!");
		frmObj.frequency.focus();
		return;
	}

/*
    if((frequency!='0' && riskCat!='0' && Function !='0') || (frequency!='0' && riskCat!='0')|| (frequency !='0' && Function !='0') ||  (riskCat!='0' && Function!='0')){
		alert("Please select/enter only one criteria to proceed!!");
		frmObj.frequency.focus();
		return;
	}
*/
	if(frequency!='0' && frmDate == "" && toDate == ""){
		alert("Please select/enter the date range to proceed!!");
		frmObj.frmDate.focus();
		return;
	}

	if(riskCat!='0' && frmDate == "" && toDate == ""){
		alert("Please select/enter the date range to proceed!!");
		frmObj.frmDate.focus();
		return;
	}
	
	
   if(Function!="" && frmDate == "" && toDate == ""){
		alert("Please select/enter the date range to proceed!!");
		frmObj.frmDate.focus();
		return;
	}
	
	if(frequency!='0'){
		selectedOption = "frequency";
		selectedOptionVal = frequency;
	}

   if(riskCat!='0'){
		selectedOption = "riskCat";
		selectedOptionVal = riskCat;
	}

	
	 if(Function!='0'){
		selectedOption = "Function";
	
		selectedOptionVal = Function;
	}
	

	frmObj.action ="../common/searchSubmit.jsp?frequency="+frequency+"&riskCat="+riskCat+"&Function="+Function+"&frmDate="+frmDate+"&toDate="+toDate;
	frmObj.submit();
}