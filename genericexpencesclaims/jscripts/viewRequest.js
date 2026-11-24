processVar = 0;
processStat = 0;
function process(noOfBills,allAmount)
{
	frmObj = document.frmViewRequest;
   
    if(processVar == 0){
        processVar = 1;
        breakStat = 0;
        amtArray = allAmount.split(",");
        for(ii=1; ii<=noOfBills;ii++)
        {
            billCheck = 'frmObj.billCheck'+ii+'.checked';
            billCheck = eval(billCheck);

            if(billCheck)
            {	
                billAmount = 'frmObj.billAmount'+ii+'.value';
                billAmount = eval(billAmount);
                expr2 = "frmObj.remark"+ii+".value";
                remark = trim(eval(expr2));

                if((amtArray[ii-1] != billAmount) &&  (remark == ""))
                {
                    alert("Please enter a reason for change in Bill Amount!");
                    expr = "frmObj.remark"+ii;
                    eval(expr).focus( );
                    breakStat = 1;
                    break;
                }
            }
            else
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
            processVar = 0;
            return;
        }

       /*actualAmount = frmObj.actualAmount.value;
       claimAmount  = frmObj.claimAmount.value;
       
       if(actualAmount > claimAmount){
            alert("The Processed Amount can not be greater than Claimed Amount");
            return;
       }*/
	   //alert("1");
        if(processStat == 0){
            processStat = 1;
            frmObj.submit2.disabled=true;
	        //frmObj.option.value="submit";
            frmObj.action="../processor/processRequestSubmit.jsp";
            frmObj.submit();
		}
	}
}

function addBills(noOfBills,kk,actualAmt)
{
	frmObj = document.frmViewRequest;
	actualAmount = 0;
    processVar = 0;
	var allowNum = ".0123456789";	
    newBillAmount = 'frmObj.billAmount'+kk+'.value';
	newBillAmount = eval(newBillAmount);
	newBillAmount = trim(newBillAmount);
  
    if(newBillAmount > actualAmt){
        alert("You can not increase the actual Claimed Amount!!!");
        newBillAmount = 'frmObj.billAmount'+kk;
	    eval(newBillAmount).value=actualAmt;
        newBillFocus = 'frmObj.billAmount'+kk+'.focus()';
        eval(newBillFocus);
        
	    return;
   }else{
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
			addBillAmount = RoundTo(addBillAmount);
		}
		else
		{	addBillAmount=0;	}

		actualAmount = RoundTo(actualAmount + addBillAmount);
	}

	frmObj.actualAmount.value = actualAmount;

   }
}
