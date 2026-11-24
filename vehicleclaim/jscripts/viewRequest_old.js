function process(noOfBills)
{
	frmObj = document.frmViewRequest;
	breakStat = 0;
	for(ii=1; ii<=noOfBills;ii++)
	{
		billCheck = 'frmObj.billCheck'+ii+'.checked';
		billCheck = eval(billCheck);

		if(!billCheck)
		{			
			expr2 = "frmObj.remark"+ii+".value";
			remark = trim(eval(expr2));

			if(remark == "")
			{
				alert("Please enter a reason for rejection of this Bill!");
				expr = "frmObj.remark"+ii;
				eval(expr).focus( );
				breakStat = 1;
				break;
			}
		}
	}//end of for
	if(breakStat ==1){
		return;
	}
	
	frmObj.action="../processor/processRequestSubmit.jsp"
	frmObj.submit( );
}

function addBills(noOfBills)
{
	frmObj = document.frmViewRequest;
	actualAmount = 0;
	var allowNum = ".0123456789";	

	for(ii=1; ii<=noOfBills;ii++)
	{
		billCheck = 'frmObj.billCheck'+ii+'.checked';
		billCheck = eval(billCheck);
		billAmount = 'frmObj.billAmount'+ii;
		billAmount = eval(billAmount);
		addBillAmount = 'frmObj.billAmount'+ii+'.value';
		addBillAmount = eval(addBillAmount);
		addBillAmount = trim(addBillAmount);

		if(billCheck)
		{
			valid = checkAmt("Bill Amount" , addBillAmount , allowNum);
			if(!valid)
			{	billAmount.focus( );
				return;
			} 
			addBillAmount = parseFloat(addBillAmount);
		}
		else
		{	addBillAmount=0;	}

		
		actualAmount = parseFloat(actualAmount + addBillAmount);
	}
	frmObj.actualAmount.value = actualAmount;
}