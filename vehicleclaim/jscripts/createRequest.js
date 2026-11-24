function validate(noOfRows,action)
 {
	frmObj = document.frmCreateRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var allowNum = "0123456789.";
	var actionRequest = action;

	//var noOfRows = 6;

    forMonth=frmObj.forMonth.value;
    forYear=frmObj.forYear.value;
    
    selectDate = new Date(forYear, forMonth-1);
	currentDate= new Date();
   
    if(selectDate > currentDate){
        alert("Please enter/select the month and year properly !!!!");
        //cannot be greater than the Current Date
        frmObj.forMonth.focus( );
		return;	
    }else{
   
for(ii=1; ii<=noOfRows; ii++)
 {
	var billDateValue = 'frmObj.billDate'+ ii+'.value';
	billDateValue = eval(billDateValue);
	stat1 = checkNextNull("Bill Number", billDateValue);

	var billNoValue = 'frmObj.billNo'+ ii+'.value';
	billNoValue = eval(billNoValue);
	stat2 = checkNextNull("Bill Number", billNoValue);

	var billDescValue = 'frmObj.billDesc'+ ii+'.value';
	billDescValue = eval(billDescValue);
	stat3 = checkNextNull("Bill Description", billDescValue);

	var amountValue = 'frmObj.billAmount'+ ii+'.value';
	amountValue = eval(amountValue);
	stat4 = checkNextNull("Amount", amountValue);

		 if(stat1 || stat2 || stat3 || stat4) {

/*--------------Bill Date Field check begins------*/
var billDate = 'frmObj.billDate'+ ii;
billDate = eval(billDate);
value1 = trim(billDateValue);
	// Checking for null
	valid = checkNull("Bill Date.", value1);
	if(!valid){
		billDate.focus( );
		return;
	}
/*--------------Bill Date Field check ends--------------*/
/*--------------Bill No Field check begins------*/
var billNo = 'frmObj.billNo'+ ii;
billNo = eval(billNo);
value1 = trim(billNoValue);
	// Checking for null
	valid = checkNull("Bill No.", value1);
	if(!valid){
		billNo.focus( );
		return;
	}
/*--------------Bill No Field check ends--------------*/

/*--------------Amount Field check begins--------------------*/
var billAmount = 'frmObj.billAmount'+ ii;
billAmount = eval(billAmount);
	amt = trim(amountValue);
	// Checking for null
	valid = checkNull("Amount", amt);
	if(!valid){
		billAmount.focus( );
		return;
	}
		// Checking for Allowed characters
	valid = checkAmt("Amount" , amt , allowNum);
	if(!valid){
		billAmount.focus( );
		return;
	}
		valid= parseFloat(amountValue.value);
	if(valid<1)
		{alert("The Amount must be greater than 0");
		billAmount.focus( );
		return;
		}
/*--------------Amount Field check ends--------------*/

	}// end of if
 }// end of for loop

addAll(noOfRows);

	/*----------------To check completion of atleast one row--------*/
	var total = frmObj.total.value;
	if(total == "0")
	{alert("Please Complete atleast one Row!!");
	 frmObj.billDate1.focus();
	 return;
	}
/*--------------End of check of completion of atleast one row---*/
	frmObj.actionNumber.value = action;
    if(action=="add_req"){
        frmObj.action = "../requestor/addBills.jsp";
	    frmObj.submit( );
    }else{
        frmObj.action = "../requestor/previewRequest.jsp";
        frmObj.submit( );
    }

    }//end of main else
}// end of validate function

function clear()
{	frmObj = document.frmCreateRequest;
	frmObj.reset();
}

function addAll(noOfRows) // function to add all Bill Amounts
{	frmObj = document.frmCreateRequest;
	var allowNum = ".0123456789";	
billAmount = eval(billAmount);
	for(kkk=1; kkk<=noOfRows; kkk++){
	var billAmount = 'frmObj.billAmount'+ kkk;
	billAmount = eval(billAmount);
	var amountValue = 'frmObj.billAmount'+ kkk+'.value';
	amountValue = eval(amountValue);
	var price = trim(amountValue);
		valid = checkAmt("Amount" , price , allowNum);
		if(!valid)
			{billAmount.focus( );
			return;
			}  // end of if 
	} // end of for loop	

	summation = 0;
	for(kkk=1; kkk<=noOfRows; kkk++)
	{
	var amountValue = 'frmObj.billAmount'+ kkk+'.value';
	amountValue = eval(amountValue);
	currentAmount = ((amountValue) != '') ?parseFloat(amountValue) : 0;
		summation = summation + currentAmount;
	}// end of for loop
	 summation = RoundTo(summation);
	 frmObj.total.value = summation;
	 frmObj.amountTotal.value = summation;
} // end of add

function removeBill(kkk,txnId,newFilledRows){
	
	frmObj = document.frmCreateRequest;

    if(newFilledRows <=1){
        alert("This is the only bill left, please add bill/s first!!!");
        return;
    }else{
        val = confirm("Do you wish delete this Bill?");
        if(val){ 
            var billNumber = 'frmObj.billNo'+kkk+'.value';
            billNumber = eval(billNumber);
            frmObj.delBillNo.value = billNumber;
            
            var amountValue = 'frmObj.billAmount'+kkk+'.value';
            amountValue = eval(amountValue);
            frmObj.delBillAmt.value = amountValue;

            var billDate = 'frmObj.billDate'+kkk+'.value';
            billDate = eval(billDate);
            frmObj.delBillDate.value = billDate;

            frmObj.id2.value = "del_bil";

            frmObj.action = "../requestor/updateRequestSubmit.jsp";
            frmObj.submit( );
        }
    }
}