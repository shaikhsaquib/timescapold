function field1()
{
	//alert("ABC");	
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789.";

	

	repairCos = Trim(frmObj.repairCos.value);
	//alert(repairCos);
	document.frmMarineInsuranceClaim.charges.value = (repairCos * 0.10).toFixed(2);	
	
	
}

/*function field2()
{
		//alert("PQR");		
	
		frmObj = document.frmMarineInsuranceClaim;
		var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
		var num = "0123456789.";

		repairCos = Trim(frmObj.repairCos.value);
		//alert(repairCos);
		charges = Trim(frmObj.charges.value);
		//alert(charges);
		cost = Trim(frmObj.cost.value);
		//alert(cost);
		claimAmt = Trim(frmObj.claimAmt.value);
		//alert(claimAmt);
		lessExcess = Trim(frmObj.lessExcess.value);
		//alert(lessExcess);
		document.frmMarineInsuranceClaim.netClaimAmt.value = (eval(claimAmt) - eval(lessExcess)).toFixed(2);;
		//alert(document.frmMarineInsuranceClaim.netClaimAmt.value);
}*/

function field3(companyName)
{
		//alert(companyName);		
	
		frmObj = document.frmMarineInsuranceClaim;
		var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
		var num = "0123456789.";

		repairCos = Trim(frmObj.repairCos.value);
		//alert(repairCos);
		charges = Trim(frmObj.charges.value);
		//alert(charges);
		cost = Trim(frmObj.cost.value);
		//alert(cost);
		
		document.frmMarineInsuranceClaim.claimAmt.value = ((eval(repairCos) +  eval(charges)) - eval(cost)).toFixed(2);;
		//alert(document.frmMarineInsuranceClaim.netClaimAmt.value);

		claimAmt = Trim(frmObj.claimAmt.value);
		//alert(claimAmt);
		lessExcess = Trim(frmObj.lessExcess.value);
		//alert(lessExcess);

		if (companyName=="Bennett, Coleman & Co. Ltd.")
		{
			document.frmMarineInsuranceClaim.netClaimAmt.value = eval(claimAmt).toFixed(2);
		}
		else
		{
			document.frmMarineInsuranceClaim.netClaimAmt.value = (eval(claimAmt) - eval(lessExcess)).toFixed(2);
		}
}

