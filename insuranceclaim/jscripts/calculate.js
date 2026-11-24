function field1()
{
	//alert("ABC");	
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";

	grossWt1 = Trim(frmObj.grossWt.value);

	stat = checkNull("Gross Weight", grossWt1);
	
	if(!stat){
		frmObj.grossWt.focus();
		return;
	}

	stat = checkAmt("Gross Weight", grossWt1 , num);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}
	

	rate1 = Trim(frmObj.rate.value);

	stat = checkNullCalculate("Rate per kg.", rate1);

	if(stat){
		document.frmMarineInsuranceClaim.material.value = (grossWt1 * rate1).toFixed(2);			
	}
}

function field2()
{
		//alert("PQR");		
	
		frmObj = document.frmMarineInsuranceClaim;
		var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
		var num = "0123456789.";

		damaged1 = Trim(frmObj.damaged.value);

		
		stat = checkNull("Damaged quantity", damaged1);

		if(!stat){
			frmObj.damaged.focus();
			return;
		}

		stat = checkAmt("Damaged quantity" , damaged1 , num);

		if(!stat){
			frmObj.damaged.focus();
			return;
		}
		

		rate1 = Trim(frmObj.rate.value);

		stat = checkNullCalculate("Rate per kg", rate1);

		if(stat){
			alert(here);
			document.frmMarineInsuranceClaim.damageValue.value = (damaged1 * rate1).toFixed(2);
			field7(1);
			field9(1);
		}
}

function field3(value)
{
	
	
	//alert("ABC");
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";

	rate1 = Trim(frmObj.rate.value);

	stat = checkNull("Rate per kg", rate1);

	if(!stat){
		frmObj.rate.focus();
		return;
	}

	stat = checkAmt("Rate per kg" , rate1 , num);

	if(!stat){
		frmObj.rate.focus();
		return;
	}
	

	grossWt1 = Trim(frmObj.grossWt.value);
	damaged1 = Trim(frmObj.damaged.value);

	stat = checkNullCalculate("Gross Weight", grossWt1);
	stat1 = checkNullCalculate("Damaged Quantity", damaged1);

	if(stat){
		document.frmMarineInsuranceClaim.material.value = grossWt1 * rate1;
	}

	if(stat1){
		document.frmMarineInsuranceClaim.damageValue.value = (damaged1 * rate1).toFixed(2);		
					
		field7(1);
		field9(1);
	}
}

function field7(value)
{	//alert(value);
	//alert(2-1);
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";

	salvageRate = Trim(frmObj.salvageRate.value);

	if(value == 2)
	{
	
		stat = checkNull("Salvage Rate per kg", salvageRate);

		if(!stat){
			frmObj.salvageRate.focus();
			return;
		}

		stat = checkAmt("Salvage Rate per kg" , salvageRate , num);

		if(!stat){
			frmObj.salvageRate.focus();
			return;
		}
	}
	

	damageValue = Trim(frmObj.damageValue.value);
	damaged = Trim(frmObj.damaged.value);
	
	stat = checkNullCalculate("Damaged Quantity", damaged);
	stat1 = checkNullCalculate("Damaged Value", damageValue);

	if(stat){
		document.frmMarineInsuranceClaim.salvageMaterial.value = (damaged * salvageRate).toFixed(2);		
	}
	
	if(stat1){		
		document.frmMarineInsuranceClaim.claimAmt.value = (parseFloat(eval(document.frmMarineInsuranceClaim.cfr.value)) - parseFloat(eval(document.frmMarineInsuranceClaim.salvageMaterial.value))).toFixed(2);
		
		claimAmt = frmObj.claimAmt.value;

		if ( isNaN(claimAmt) ) {
			
			document.frmMarineInsuranceClaim.claimAmt.value = 0;
	
		}


		document.frmMarineInsuranceClaim.cfr.value = (parseFloat(damageValue) + parseFloat((eval(document.frmMarineInsuranceClaim.damageValue.value) / 10).toFixed(2))).toFixed(2);
		field9(1);
	}
}

function field9(value)
{
	//alert("hi");
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";
	
	rewind = Trim(frmObj.rewind.value);
	//alert("rewind=="+rewind);
	policyNumber = frmObj.policyNumber.value;
	var policyval = "";
	var policyval = frmObj.policyval.value;
	
	//alert(policyNumber);
	//alert("policyval---"+policyval);
	if(rewind == 0)
		document.frmMarineInsuranceClaim.rewind.value = "0.0";

	claimAmt = Trim(frmObj.claimAmt.value);
	cfr = Trim(frmObj.cfr.value);	
	//alert("value=="+value);
	if(value == 2)
	{		
		//alert("11");
		stat = checkNull("Rewinding charges", rewind);
		
		if(!stat){
			frmObj.rewind.focus();
			//return;
		}		
		
		stat1 = checkNullCalculate("Amount of claim", claimAmt);

		//if(stat1 && (policyNumber == "211200/21/2013/60") || (policyNumber =="211200/21/2014/55") )
			if((policyval === null) || (policyval === 0) || (policyval === 'null') ) 
	
		{
			//alert("55");
			document.frmMarineInsuranceClaim.total.value = eval(claimAmt) +  eval(rewind);
			//document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value) - 5000).toFixed(2);
			document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value));

		} 
		//else if(stat1 && (policyNumber == "211200/21/2012/55") || (policyNumber == "211200/21/2013/54") || (policyNumber == "211200/21/2013/56") || (policyNumber == "211200/21/2014/56") || (policyNumber == "211200/21/2014/47") || (policyNumber == "211200/21/2014/49") || (policyNumber == "211200/21/2014/44") || (policyNumber == "211200/21/2015/55" || policyNumber == "211200/21/2015/56")){
			else if(policyval == 5000){
			//alert("66");
			document.frmMarineInsuranceClaim.total.value = eval(claimAmt) +  eval(rewind);
			document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value) - 5000).toFixed(2);
			//document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value));
		}	
	}

	else
	{
		//alert("22");
		stat1 = checkNullCalculate("Rewinding Charges", rewind);
		//alert(policyval);
		
		//if(stat1 && (policyNumber == "211200/21/2013/60") || (policyNumber =="211200/21/2014/55") || (policyNumber =="211200/21/2015/56"))
		if((policyval === null) || (policyval === 0) || (policyval === 'null') || (policyval === '0')  ) 
		{
			//alert("33");
			document.frmMarineInsuranceClaim.total.value = eval(claimAmt) +  eval(rewind);
			//document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value) - 5000).toFixed(2);
			document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value));

		} 
		//else if(stat1 && (policyNumber == "211200/21/2012/55") || (policyNumber == "211200/21/2013/54") || (policyNumber == "211200/21/2013/56") || (policyNumber == "211200/21/2014/56") || (policyNumber == "211200/21/2014/47") || (policyNumber == "211200/21/2014/49") || (policyNumber == "211200/21/2014/44") || (policyNumber == "211200/21/2015/55") || (policyNumber == "211200/21/2015/53" || policyNumber == 211200/21/2015/56)){
			else if(policyval == 5000){
			//alert("44");
			document.frmMarineInsuranceClaim.total.value = eval(claimAmt) +  eval(rewind);
			document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value) - 5000).toFixed(2);
			//document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value));
		}
	}	
}

function field()
{
	//alert(2-1);	
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";

	repair = Trim(frmObj.repair.value);				

	stat = checkNull("Repair cost", repair);

	if(!stat){
		frmObj.repair.focus();
		//return;
	}
	
	stat = checkAmt("Repair cost" , repair , num);

		if(!stat){
			frmObj.repair.focus();
			return;
		}
	
	stat1 = checkNullCalculate("Repair cost", repair);

	if(stat1)
	{
		document.frmMarineInsuranceClaim.total.value = document.frmMarineInsuranceClaim.repair.value;
		document.frmMarineInsuranceClaim.netAmt.value = (eval(document.frmMarineInsuranceClaim.total.value) - 5000).toFixed(2);
	}
}