function fire_validate(){
	frmObj = document.frmFireInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var i = 0;
	var j = 0;
	
/*--------------insuredName check begins--------------*/
	insuredName = frmObj.insuredName.options[frmObj.insuredName.selectedIndex].value;
	stat = checkNull("Insured Name",insuredName);

	if(!stat){
	frmObj.insuredName.focus();
	return;
	}

/*--------------insuredName check Ends--------------*/

/*--------------Area check begins--------------*/
	area = Trim(frmObj.area.value);
	stat = checkNull("Area",area);

	if(!stat){
	frmObj.area.focus();
	return;
	}
/*--------------Area check Ends--------------*/

/*--------------lossArea check begins--------------*/
	lossArea = Trim(frmObj.lossArea.value);
	stat = checkNull("Loss Area",lossArea);

	if(!stat){
	frmObj.lossArea.focus();
	return;
	}
/*--------------lossArea check Ends--------------*/

/*--------------Contact Phone No. check begins--------------*/

	insuredTelephone = Trim(frmObj.insuredTelephone.value);

	stat = checkNull("Insured Telephone",insuredTelephone);

	if(!stat){
	frmObj.insuredTelephone.focus();
	return;
	}

	stat = checkAmt("Phone No" , insuredTelephone , num);
	
	if(!stat){
		frmObj.insuredTelephone.focus();
		return;
	}


/*--------------Contact Phone No. check ends--------------*/

/*--------------Contact Fax No. check begins--------------*/

	insuredFax = Trim(frmObj.insuredFax.value);

	stat = checkNull("Insured Fax",insuredFax);

	if(!stat){
	frmObj.insuredFax.focus();
	return;
	}

	stat = checkAmt("Insured Fax No" , insuredFax , num);
	
	if(!stat){
		frmObj.insuredFax.focus();
		return;
	}


/*--------------Contact Fax No. check ends--------------*/

/*--------------mortgageName check begins--------------*/
	mortgageName = Trim(frmObj.mortgageName.value);
	stat = checkNull("Mortgage Names",mortgageName);

	if(!stat){
	frmObj.mortgageName.focus();
	return;
	}

	stat = checkJunk("Mortgage Names" , mortgageName, junk);
	
	if(!stat){
		frmObj.mortgageName.focus();
		return;
	}
/*--------------mortgageName check Ends--------------*/

/*--------------fireTime check begins--------------*/
	fireTime = Trim(frmObj.fireTime.value);
	stat = checkNull("Time of Fire",fireTime);

	if(!stat){
	frmObj.fireTime.focus();
	return;
	}

/*--------------fireTime check Ends--------------*/

/*--------------fireDate check begins--------------*/
	fireDate = Trim(frmObj.fireDate.value);
	stat = checkNull("Date of Fire",fireDate);

	if(!stat){
	frmObj.fireDate.focus();
	return;
	}

/*--------------fireDate check Ends--------------*/

/*--------------Fire Cause check begins--------------*/
	fireCause = Trim(frmObj.fireCause.value);
	stat = checkNull("Fire Cause",fireCause);

	if(!stat){
	frmObj.fireCause.focus();
	return;
	}
/*--------------Fire Cause check Ends--------------*/

/*--------------Fire Item check begins--------------*/
	fireItem = Trim(frmObj.fireItem.value);
	stat = checkNull("Fire Item",fireItem);

	if(!stat){
	frmObj.fireItem.focus();
	return;
	}
/*--------------Fire Item check Ends--------------*/

/*--------------Fire Occupation check begins--------------*/
	fireOccupation = Trim(frmObj.fireOccupation.value);
	stat = checkNull("Occupation",fireOccupation);

	if(!stat){
	frmObj.fireOccupation.focus();
	return;
	}
/*--------------Fire Item check Ends--------------*/

/*--------------fireFir check begins--------------*/
	fireFir = Trim(frmObj.fireFir.value);
	stat = checkNull("FIR",fireFir);

	if(!stat){
	frmObj.fireFir.focus();
	return;
	}

	stat = checkJunk("FIR" , fireFir, junk);
	
	if(!stat){
		frmObj.fireFir.focus();
		return;
	}

	stat = checkNumInName("FIR" , fireFir, num);
	
	if(!stat){
		frmObj.fireFir.focus();
		return;
	}
/*--------------fireFir check Ends--------------*/

/*--------------fireEstimatedLoss check begins--------------*/

	fireEstimatedLoss = Trim(frmObj.fireEstimatedLoss.value);

	stat = checkNull("Fire Estiamted Loss", fireEstimatedLoss);

	if(!stat){
		frmObj.fireEstimatedLoss.focus();
		return;
	}

	stat = checkAmt("Fire Estimated Loss" , fireEstimatedLoss , num);

	if(!stat){
		frmObj.fireEstimatedLoss.focus();
		return;
	}

	stat1= parseFloat(frmObj.fireEstimatedLoss.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.fireEstimatedLoss.focus();
		return;
		}

/*--------------fireEstimatedLoss check ends--------------*/

/*--------------Fire Details check begins--------------*/
	fireDetails = Trim(frmObj.fireDetails.value);
	stat = checkNull("Details of Fire",fireDetails);

	if(!stat){
	frmObj.fireDetails.focus();
	return;
	}
/*--------------Fire Details check Ends--------------*/

/*--------------Ammount check begins--------------*/
	/*
		1) It should not contains alphabets
	*/

	for(i = 1; i<=5 ; i++)
	{
		temp = eval("frmObj.claimedArticle"+i).value;
		if(temp != null)
		{
			stat = checkAmt("Claimed Article" , temp , num);
		
			if(!stat){
				eval("frmObj.claimedArticle"+i).focus();
				return;
			}
		}
	}

	for(i = 1; i<=5 ; i++)
	{
		temp = eval("frmObj.itemPolicy"+i).value;
		if(temp != null)
		{
			stat = checkAmt("Item no. of the Policy" , temp , num);
		
			if(!stat){
				eval("frmObj.itemPolicy"+i).focus();
				return;
			}
		}
	}

	for(i = 1; i<=5 ; i++)
	{
		temp = Trim(eval("frmObj.articleValue"+i).value);

		stat = checkAmt("Value at the time of fire" , temp , num);

		if(!stat){
			eval("frmObj.articleValue"+i).focus();
			return;
		}
	}

	for(i = 1; i<=5 ; i++)
	{
		temp = Trim(eval("frmObj.salvageValue"+i).value);

		stat = checkAmt("Deduction for value of Salvage:" , temp , num);

		if(!stat){
			eval("frmObj.salvageValue"+i).focus();
			return;
		}
	}

	for(i = 1; i<=5 ; i++)
	{
		temp = Trim(eval("frmObj.claimedAmmount"+i).value);

		stat = checkAmt("Net amount of claim " , temp , num);

		if(!stat){
			eval("frmObj.claimedAmmount"+i).focus();
			return;
		}
	}

/*--------------Ammount check ends--------------*/

/*--------------Check box begins----------------*/

	if(document.getElementById("intimation").checked == true)
		j += 1;
	if(document.getElementById("panchnama").checked == true)
		j += 1;
	if(document.getElementById("report").checked == true)
		j += 1;
	if(document.getElementById("photo").checked == true)
		j += 1;
	if(document.getElementById("quantum").checked == true)
		j += 1;
	if(document.getElementById("receipt").checked == true)
		j += 1;
	if(document.getElementById("pics").checked == true)
		j += 1;
	if(document.getElementById("value").checked == true)
		j += 1;
	if(document.getElementById("newspaper").checked == true)
		j += 1;
	if(document.getElementById("meteor").checked == true)
		j += 1;
	if(document.getElementById("policyRp").checked == true)
		j += 1;
	if(document.getElementById("info").checked == true)
		j += 1;
	if(document.getElementById("brigade").checked == true)
		j += 1;
	if(document.getElementById("insured").checked == true)
		j += 1;
	if(document.getElementById("cutting").checked == true)
		j += 1;
	if(document.getElementById("photos").checked == true)
		j += 1;

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		intimation = Trim(frmObj.intimation.value);
		frmObj.intimation.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

/*--------------Attachment check ends--------------*/
	
	frmObj.action = "../fireClaim/fireInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}

function gpa_validate(){
	frmObj = document.frmGpaInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var i = 0;
	var j = 0;
	
/*--------------periodOfInsurance check begins--------------*/
	periodOfInsurance = Trim(frmObj.periodOfInsurance.value);
	stat = checkNull("Period Of Insurance",periodOfInsurance);

	if(!stat){
	frmObj.periodOfInsurance.focus();
	return;
	}

/*--------------periodOfInsurance check Ends--------------*/

/*--------------accidentDate check begins--------------*/
	accidentDate = Trim(frmObj.accidentDate.value);
		stat = checkNull("Date Of Accident",accidentDate);

		if(!stat){
		frmObj.accidentDate.focus();
		return;
		}

/*--------------accidentDate check Ends--------------*/

/*--------------insuredName check begins--------------*/
	insuredName = Trim(frmObj.insuredName.value);
	stat = checkNull("Name of insured",insuredName);

	if(!stat){
	frmObj.insuredName.focus();
	return;
	}
/*--------------insuredName check Ends--------------*/

/*--------------address check begins--------------*/
	address = Trim(frmObj.address.value);
	stat = checkNull("Address for correspondence",address);

	if(!stat){
	frmObj.address.focus();
	return;
	}
/*--------------address check Ends--------------*/

/*--------------Contact Phone No. check begins--------------*/

	insuredTelephone = Trim(frmObj.insuredTelephone.value);

	stat = checkNull("Insured Telephone",insuredTelephone);

	if(!stat){
	frmObj.insuredTelephone.focus();
	return;
	}

	stat = checkAmt("Phone No" , insuredTelephone , num);
	
	if(!stat){
		frmObj.insuredTelephone.focus();
		return;
	}


/*--------------Contact Phone No. check ends--------------*/

/*--------------injuredName check begins--------------*/
	injuredName = Trim(frmObj.injuredName.value);
	stat = checkNull("Name of injured person",injuredName);

	if(!stat){
	frmObj.injuredName.focus();
	return;
	}
/*--------------injuredName check Ends--------------*/

/*--------------address1 check begins--------------*/
	address1 = Trim(frmObj.address1.value);
	stat = checkNull("Address of injured person",address1);

	if(!stat){
	frmObj.address1.focus();
	return;
	}


/*--------------address1 check Ends--------------*/

/*--------------age check begins--------------*/
	age = Trim(frmObj.age.value);
	stat = checkNull("Age",age);

	if(!stat){
	frmObj.age.focus();
	return;
	}

/*--------------age check Ends--------------*/

/*--------------injuryDate check begins--------------*/
	injuryDate = Trim(frmObj.injuryDate.value);
	stat = checkNull("Date & time of injury",injuryDate);

	if(!stat){
	frmObj.injuryDate.focus();
	return;
	}

/*--------------injuryDate check Ends--------------*/

/*--------------placeOfInjury check begins--------------*/
	placeOfInjury = Trim(frmObj.placeOfInjury.value);
	stat = checkNull("Place of injury",placeOfInjury);

	if(!stat){
	frmObj.placeOfInjury.focus();
	return;
	}
/*--------------placeOfInjury check Ends--------------*/

/*--------------accidentdetails check begins--------------*/
	accidentdetails = Trim(frmObj.accidentdetails.value);
	stat = checkNull("Details of the accident",accidentdetails);

	if(!stat){
	frmObj.accidentdetails.focus();
	return;
	}
/*--------------accidentdetails check Ends--------------*/

/*--------------Whether Repoting to Police check begins--------------*/
	
	var chks = document.getElementsByName('r1');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select Yes/NO for Whether reported to Police ");
		
		return;
		}
/*--------------Whether Repoting to Police check Ends--------------*/

/*--------------Hospital Details check begins--------------*/

	var chks = document.getElementsByName('r2');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select Yes/NO for Were you moved to hospital immediately after the accident? ");
		
		return;
		}
/*--------------Hospital Details check Ends--------------*/


/*--------------Personal Accident Policy check begins--------------*/

	var chks = document.getElementsByName('r3');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select Yes/NO for Do you have any other Personal Accident Policy? ");
		
		return;
		}

/*--------------Personal Accident Policy check Ends--------------*/


/*--------------Injured Person Claim Details check begins--------------*/

	var chks = document.getElementsByName('r4');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select Yes/NO for Was the injured person in respect of whom claims being made absent from work?:");
		
		return;
		}

/*--------------Injured Person Claim Details check Ends--------------*/

/*--------------Hospital Details check begins--------------*/
	nameAndAddress = Trim(frmObj.nameAndAddress.value);
	stat = checkNull("Name and address of the hospital",nameAndAddress);

	if(!stat){
	frmObj.nameAndAddress.focus();
	return;
	}
/*--------------Hospital Details check Ends--------------*/

/*--------------dateOfAdmission check begins--------------*/
	dateOfAdmission = Trim(frmObj.dateOfAdmission.value);
	stat = checkNull("Date of admission",dateOfAdmission);

	if(!stat){
	frmObj.dateOfAdmission.focus();
	return;
	}
/*--------------dateOfAdmission check Ends--------------*/

/*--------------dateOfDischarge check begins--------------*/
	dateOfDischarge = Trim(frmObj.dateOfDischarge.value);
	stat = checkNull("Date of discharge",dateOfDischarge);

	if(!stat){
	frmObj.dateOfDischarge.focus();
	return;
	}
/*--------------dateOfDischarge check Ends--------------*/

/*--------------natureOfInjury check begins--------------*/
	natureOfInjury = Trim(frmObj.natureOfInjury.value);
	stat = checkNull("Nature of injury",natureOfInjury);

	if(!stat){
	frmObj.natureOfInjury.focus();
	return;
	}
/*--------------natureOfInjury check Ends--------------*/

/*--------------treatmentdetails check begins--------------*/
	treatmentdetails = Trim(frmObj.treatmentdetails.value);
	stat = checkNull("Particulars of treatment",treatmentdetails);

	if(!stat){
	frmObj.treatmentdetails.focus();
	return;
	}
/*--------------treatmentdetails check Ends--------------*/

/*--------------Accident Injury Details check begins--------------*/

	var chks = document.getElementsByName('r5');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select Yes/NO for Has the accident resulted into loss of hand/s or foot/feet or eye/s or permanent disability");
		
		return;
		}
/*--------------Accident Injury Details check Ends--------------*/

/*--------------nomineeName check begins--------------*/
	nomineeName = Trim(frmObj.nomineeName.value);
	stat = checkNull("FullName",nomineeName);

	if(!stat){
	frmObj.nomineeName.focus();
	return;
	}
/*--------------nomineeName check Ends--------------*/

/*--------------address5 check begins--------------*/
	address5 = Trim(frmObj.address5.value);
	stat = checkNull("Address",address5);

	if(!stat){
	frmObj.address5.focus();
	return;
	}
/*--------------address5 check Ends--------------*/

/*--------------nomineeAge check begins--------------*/
	nomineeAge = Trim(frmObj.nomineeAge.value);
	stat = checkNull("Age",nomineeAge);

	if(!stat){
	frmObj.nomineeAge.focus();
	return;
	}
/*--------------nomineeAge check Ends--------------*/

/*--------------relation check begins--------------*/
	relation = Trim(frmObj.relation.value);
	stat = checkNull("Relationship with the deceased",relation);

	if(!stat){
	frmObj.relation.focus();
	return;
	}
/*--------------relation check Ends--------------*/


/*--------------Check box begins----------------*/

	if(document.getElementById("intimation").checked == true)
		j += 1;
	if(document.getElementById("invoice").checked == true)
		j += 1;
	if(document.getElementById("report").checked == true)
		j += 1;
	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		intimation = Trim(frmObj.intimation.value);
		frmObj.intimation.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	/*fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}*/

/*--------------Attachment check ends--------------*/
	
	frmObj.action = "../GPAClaim/GPAClaimFormPreview.jsp";
	frmObj.submit();
}

function eei_validate(){
	frmObj = document.frmEeiInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var i = 0;
	var j = 0;
	
/*--------------periodOfInsurance check begins--------------*/
	/*periodOfInsurance = Trim(frmObj.periodOfInsurance.value);
	stat = checkNull("Period Of Insurance",periodOfInsurance);

	if(!stat){
	frmObj.periodOfInsurance.focus();
	return;
	}*/

/*--------------periodOfInsurance check Ends--------------*/

/*--------------accidentDate check begins--------------*/
	accidentDate = Trim(frmObj.accidentDate.value);
		stat = checkNull("Date Of Accident",accidentDate);

		if(!stat){
		frmObj.accidentDate.focus();
		return;
		}

/*--------------accidentDate check Ends--------------*/

/*--------------insuredName check begins--------------*/
	insuredName = Trim(frmObj.insuredName.value);
	stat = checkNull("Name",insuredName);

	if(!stat){
	frmObj.insuredName.focus();
	return;
	}
/*--------------insuredName check Ends--------------*/

/*--------------address check begins--------------*/
	address = Trim(frmObj.address.value);
	stat = checkNull("Address for correspondence",address);

	if(!stat){
	frmObj.address.focus();
	return;
	}
/*--------------address check Ends--------------*/

/*--------------Contact Number check begins--------------*/

	insuredTelephone = Trim(frmObj.insuredTelephone.value);

	stat = checkNull("Contact Number",insuredTelephone);

	if(!stat){
	frmObj.insuredTelephone.focus();
	return;
	}

	stat = checkAmt("Contact Number" , insuredTelephone , num);
	
	if(!stat){
		frmObj.insuredTelephone.focus();
		return;
	}


/*--------------Contact Number check ends--------------*/

/*--------------lossordamage check begins--------------*/
	lossordamage = Trim(frmObj.lossordamage.value);
	stat = checkNull("lossordamage",lossordamage);

	if(!stat){
	frmObj.lossordamage.focus();
	return;
	}
/*--------------lossordamage check Ends--------------*/

/*--------------HH check begins--------------*/
	HH = Trim(frmObj.HH.value);
	stat = checkNull("damage time",HH);

	if(!stat){
	frmObj.HH.focus();
	return;
	}
/*--------------HH check Ends--------------*/

/*--------------address1 check begins--------------*/
	address1 = Trim(frmObj.address1.value);
	stat = checkNull("The address where the property (item) covered is situated",address1);

	if(!stat){
	frmObj.address1.focus();
	return;
	}


/*--------------address1 check Ends--------------*/

/*--------------inventoryItem check begins--------------*/
	inventoryItem = Trim(frmObj.inventoryItem.value);
	stat = checkNull("Item of the Inventory",inventoryItem);

	if(!stat){
	frmObj.inventoryItem.focus();
	return;
	}

/*--------------inventoryItem check Ends--------------*/

/*--------------sum check begins--------------*/
	/*sum = Trim(frmObj.sum.value);
	stat = checkNull("Sum Insured",sum);

	if(!stat){
	frmObj.sum.focus();
	return;
	}*/

/*--------------sum check Ends--------------*/

/*--------------description check begins--------------*/
	description = Trim(frmObj.description.value);
	stat = checkNull("The description of the equipment",description);

	if(!stat){
	frmObj.description.focus();
	return;
	}
/*--------------description check Ends--------------*/

/*--------------manufactureDetails check begins--------------*/
	manufactureDetails = Trim(frmObj.manufactureDetails.value);
	stat = checkNull("Manufacturer’s name and year of manufacture",manufactureDetails);

	if(!stat){
	frmObj.manufactureDetails.focus();
	return;
	}
/*--------------manufactureDetails check Ends--------------*/

/*--------------cost check begins--------------*/
	cost = Trim(frmObj.cost.value);
	stat = checkNull("What is the cost of replacement of the equipment",cost);

	if(!stat){
	frmObj.cost.focus();
	return;
	}
/*--------------cost check Ends--------------*/


/*--------------property check begins--------------*/
	property = Trim(frmObj.property.value);
	stat = checkNull("Was the property brand new or second hand?",property);

	if(!stat){
	frmObj.property.focus();
	return;
	}
/*--------------property check Ends--------------*/


/*--------------occasion check begins--------------*/
	occasion = Trim(frmObj.occasion.value);
	stat = checkNull("What was the last occasion before the damage?",occasion);

	if(!stat){
	frmObj.occasion.focus();
	return;
	}
/*--------------occasion check Ends--------------*/


/*--------------serviceDate check begins--------------*/
	serviceDate = Trim(frmObj.serviceDate.value);
	stat = checkNull("when the equipment was serviced or attended to for maintenance or damage?",serviceDate);

	if(!stat){
	frmObj.serviceDate.focus();
	return;
	}
/*--------------serviceDate check Ends--------------*/

/*--------------destroy check begins--------------*/
	destroy = Trim(frmObj.destroy.value);
	stat = checkNull("Is the damaged property totally destroyed?",destroy);

	if(!stat){
	frmObj.destroy.focus();
	return;
	}
/*--------------destroy check Ends--------------*/

/*--------------replacement check begins--------------*/
	replacement = Trim(frmObj.replacement.value);
	stat = checkNull("What has occurred and which parts of the property are damaged to such an extent the replacement is necessary?",replacement);

	if(!stat){
	frmObj.replacement.focus();
	return;
	}
/*--------------replacement check Ends--------------*/

/*--------------guarantee check begins--------------*/
	guarantee = Trim(frmObj.guarantee.value);
	stat = checkNull("Has the period of guarantee expired?",guarantee);

	if(!stat){
	frmObj.guarantee.focus();
	return;
	}
/*--------------guarantee check Ends--------------*/

/*--------------estimatedloss check begins--------------*/
	estimatedloss = Trim(frmObj.estimatedloss.value);
	stat = checkNull("What is the estimated amount of loss or damage?",estimatedloss);

	if(!stat){
	frmObj.estimatedloss.focus();
	return;
	}
/*--------------estimatedloss check Ends--------------*/

/*--------------causeOfDamage check begins--------------*/
	causeOfDamage = Trim(frmObj.causeOfDamage.value);
	stat = checkNull("What was the cause of the damage",causeOfDamage);

	if(!stat){
	frmObj.causeOfDamage.focus();
	return;
	}
/*--------------causeOfDamage check Ends--------------*/

/*--------------repairs check begins--------------*/
	repairs = Trim(frmObj.repairs.value);
	stat = checkNull("Has the property undergone any repairs previously?",repairs);

	if(!stat){
	frmObj.repairs.focus();
	return;
	}
/*--------------repairs check Ends--------------*/

/*--------------natureOfRepaires check begins--------------*/
	natureOfRepaires = Trim(frmObj.natureOfRepaires.value);
	stat = checkNull("What was the nature of such repairs?",natureOfRepaires);

	if(!stat){
	frmObj.natureOfRepaires.focus();
	return;
	}
/*--------------natureOfRepaires check Ends--------------*/

/*--------------nameAndAddress check begins--------------*/
	nameAndAddress = Trim(frmObj.nameAndAddress.value);
	stat = checkNull("Name and Address of the repairer",nameAndAddress);

	if(!stat){
	frmObj.nameAndAddress.focus();
	return;
	}
/*--------------nameAndAddress check Ends--------------*/

/*--------------information check begins--------------*/
	information = Trim(frmObj.information.value);
	stat = checkNull("Any additional information relevant to processing of claim",information);

	if(!stat){
	frmObj.information.focus();
	return;
	}
/*--------------information check Ends--------------*/


/*--------------Check box begins----------------*/

	if(document.getElementById("format").checked == true)
		j += 1;
	if(document.getElementById("repairbill").checked == true)
		j += 1;
	if(document.getElementById("photographs").checked == true)
		j += 1;
	if(document.getElementById("engineerreport").checked == true)
		j += 1;
	if(document.getElementById("lossdetails").checked == true)
		j += 1;
		
	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		format = Trim(frmObj.format.value);
		frmObj.format.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	/*fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}*/

/*--------------Attachment check ends--------------*/
	
	frmObj.action = "../EEIClaim/EEIClaimFormPreview.jsp";
	frmObj.submit();
}

function gti_validate(){
	frmObj = document.frmGtiInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var i = 0;
	var j = 0;

          
  /*--------------memberId check begins--------------*/

    memberId = Trim(frmObj.memberId.value);
	stat = checkNull("Member id",memberId);

	if(!stat){
	frmObj.memberId.focus();
	return;
	}

  /*--------------memberId check ends--------------*/

  /*--------------policyHolder check begins--------------*/

    policyHolder = Trim(frmObj.policyHolder.value);
	stat = checkNull("Name of Policyholder",policyHolder);

	if(!stat){
	frmObj.policyHolder.focus();
	return;
	}

  /*--------------policyHolder check ends--------------*/

  /*--------------deceasedMember check begins--------------*/

    deceasedMember = Trim(frmObj.deceasedMember.value);
	stat = checkNull("Full Name of deceased Member",deceasedMember);

	if(!stat){
	frmObj.deceasedMember.focus();
	return;
	}

  /*--------------deceasedMember check ends--------------*/

  /*--------------dateOfBirth check begins--------------*/

    dateOfBirth = Trim(frmObj.dateOfBirth.value);
	stat = checkNull("Date of Birth",dateOfBirth);

	if(!stat){
	frmObj.dateOfBirth.focus();
	return;
	}

  /*--------------dateOfBirth check ends--------------*/

  /*--------------dateOfJoining check begins--------------*/

    dateOfJoining = Trim(frmObj.dateOfJoining.value);
	stat = checkNull("Date of Joining Company/ Group",dateOfJoining);

	if(!stat){
	frmObj.dateOfJoining.focus();
	return;
	}

  /*--------------dateOfJoining check ends--------------*/

  /*--------------Date of Joining Policy check begins--------------*/

    joiningPolicy = Trim(frmObj.joiningPolicy.value);
	stat = checkNull("Date of Joining Policy",joiningPolicy);

	if(!stat){
	frmObj.joiningPolicy.focus();
	return;
	}

  /*--------------Date of Joining Policy check ends--------------*/

  /*--------------dateOfDeath check begins--------------*/

    dateOfDeath = Trim(frmObj.dateOfDeath.value);
	stat = checkNull("Date of Death",dateOfDeath);

	if(!stat){
	frmObj.dateOfDeath.focus();
	return;
	}

  /*--------------dateOfDeath check ends--------------*/

  /*--------------deathCause check begins--------------*/

    deathCause = Trim(frmObj.deathCause.value);
	stat = checkNull("Cause of Death",deathCause);

	if(!stat){
	frmObj.deathCause.focus();
	return;
	}

  /*--------------deathCause check ends--------------*/

  /*--------------lastDuties check begins--------------*/

    lastDuties = Trim(frmObj.lastDuties.value);
	stat = checkNull("Date last attended duties",lastDuties);

	if(!stat){
	frmObj.lastDuties.focus();
	return;
	}

  /*--------------lastDuties check ends--------------*/


   /*--------------the Payment to be made in favour of check begins--------------*/

   var chks = document.getElementsByName('c1');
		var hasChecked = false;
		for (var i = 0; i < chks.length; i++)
		{
		if (chks[i].checked)
		{
		hasChecked = true;
		continue;
		}
		}
		if (hasChecked == false)
		{
		alert("Please select the Payment to be made in favour of");
		
		return;
		}

		
  /*--------------the Payment to be made in favour of check ends--------------*/

  if(document.getElementById("g2").checked == true)
	{
	beneficiaryName = Trim(frmObj.beneficiaryName.value);
	stat = checkNull("Full Name of the Beneficiary",beneficiaryName);

	if(!stat){
		frmObj.beneficiaryName.focus();
		return;
	}

	relationship = Trim(frmObj.relationship.value);
	stat = checkNull("Relationship with the deceased member",relationship);

	if(!stat){
		frmObj.relationship.focus();
		return;
	}

	age = Trim(frmObj.age.value);
	stat = checkNull("Age",age);

	if(!stat){
		frmObj.age.focus();
		return;
	}

	beneficiaryAddress = Trim(frmObj.beneficiaryAddress.value);
	stat = checkNull("Full Address of the Beneficiary",beneficiaryAddress);

	if(!stat){
		frmObj.beneficiaryAddress.focus();
		return;
	}

	}
	
	/*else {
		alert("Kindly select the documents that you are attaching");
		deathCertificate = Trim(frmObj.deathCertificate.value);
		frmObj.deathCertificate.focus();
		return;
	}*/


  /*--------------Check box begins----------------*/

	if(document.getElementById("deathCertificate").checked == true)
		j += 1;
	if(document.getElementById("fir").checked == true)
		j += 1;
	if(document.getElementById("postMortem").checked == true)
		j += 1;
	if(document.getElementById("policeReport").checked == true)
		j += 1;
	
		
	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		deathCertificate = Trim(frmObj.deathCertificate.value);
		frmObj.deathCertificate.focus();
		return;
	}

  

	frmObj.action = "../GTIClaim/GTIClaimFormPreview.jsp";
	frmObj.submit();
}

function test( ){

	frmObj = document.frmGtiInsuranceClaim;
	var months = {	JAN: 01,
					FEB: 02, 
					MAR: 03, 
					APR: 04, 
					MAY: 05, 
					JUN: 06, 
					JUL: 07, 
					AUG: 08, 
					SEP: 09, 
					OCT: 10, 
					NOV: 11, 
					DEC: 12 };
//    alert("1");
	 //status = frmObj.status.value;

	 //fromDate = frmObj.fromdate.value;
	// toDate = frmObj.todate.value;

    for(ii = 0; ii < 5; ii++) {

	var str1 = document.getElementById("fromdate"+ii).value;    
	var str2 = document.getElementById("todate"+ii).value;
	//var str1 = document.getElementById("fromdate").value;
	//var str2 = document.getElementById("todate").value;
    //alert(str1);
    //alert(str2);
	var dt1  = parseInt(str1.substring(0,2),10); 
	var mon1 = (String)(str1.substring(3,6),11);
	var yr1  = parseInt(str1.substring(7,11),11); 
	//alert(dt1);
	var mon1 = months[mon1]; 
	var dt2  = parseInt(str2.substring(0,2),10); 
	var mon2 = (String)(str2.substring(3,6),11); 
	var yr2  = parseInt(str2.substring(7,11),11); 
    //alert(dt2);
    var mon2 = months[mon2]; 
	var date1 = new Date(yr1, mon1, dt1); 
	var date2 = new Date(yr2, mon2, dt2); 
	

	 if (date2 < date1)
	 {
		 alert("To Date cannot be earlier than From Date !!!");
		break;
	 } 

	
	 if (str1!="" && str2!="")
	 {
		 var dt3 = dt2-dt1;
		document.getElementById("noofdays"+ii).value = dt3+1;
	 }else 
	 {
        var dt3 ="";
		document.getElementById("noofdays"+ii).value = dt3;
	 }
	
		
}
}
	


function marine_validate_part1(){
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;
	
	/*--------------insuredName check begins--------------*/
//alert("abc");
	assuredName = frmObj.assuredName.options[frmObj.assuredName.selectedIndex].value;;

/*--------------insuredName check Ends--------------*/

/*--------------consignorName check begins--------------*/
	consignorName = Trim(frmObj.consignorName.value);
	stat = checkNull("Consignor Name",consignorName);

	if(!stat){
	frmObj.consignorName.focus();
	return;
	}

	stat = checkNumInName("Consignor Name" , consignorName, num);
	
	if(!stat){
		frmObj.consignorName.focus();
		return;
	}

	stat = checkJunk("Consignor Name" , consignorName, junk);
	
	if(!stat){
		frmObj.consignorName.focus();
		return;
	}
/*--------------consignorName check Ends--------------*/

/*--------------consignorAddr check begins--------------*/
	consignorAddr = Trim(frmObj.consignorAddr.value);
	stat = checkNull("Consignor Address",consignorAddr);

	if(!stat){
	frmObj.consignorAddr.focus();
	return;
	}

/*--------------insuredOccupation check Ends--------------*/

/*--------------insuredAddr check begins--------------*/
	/*areaDesc = Trim(frmObj.lossArea.value);
	stat = checkNull("Loss Area",lossArea);

	if(!stat){
	frmObj.lossArea.focus();
	return;
	}
	stat = checkJunk("Consignor Address" , consignorAddr, junk);
	
	if(!stat){
		frmObj.consignorAddr.focus();
		return;
	}

	stat = checkNumInName("Insured Occupation" , insuredOccupation, num);
	
	if(!stat){
		frmObj.insuredOccupation.focus();
		return;
	}
	*/
/*--------------insuredAddr check Ends--------------*/

/*--------------consigneeName check begins--------------*/

	consigneeName = Trim(frmObj.consigneeName.value);

	stat = checkNull("Consignee Name",consigneeName);

	if(!stat){
	frmObj.insuredNo.focus();
	return;
	}

	/*stat = checkAmt("Consignee Name" , consigneeName , num);
	
	if(!stat){
		frmObj.consigneeName.focus();
		return;
	}*/


/*--------------consigneeName check ends--------------*/

/*--------------lossNature check begins--------------*/

	/*lossNature = Trim(frmObj.lossNature.value);

	stat = checkNull("Nature of Loss",lossNature);

	if(!stat){
	frmObj.lossNature.focus();
	return;
	}*/

/*--------------lossNature check ends--------------*/
//alert(formsHeaderValue);
	frmObj.action = "../marineInlandClaim/marineInlandInsuranceClaimFormContainer2.jsp";
	frmObj.submit();
}

// done
function marine_validate_part2(){
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	//alert("abc");
	
	frmObj.action = "../marineInlandClaim/marineInlandInsuranceClaimFormContainer3.jsp";
	frmObj.submit();
}


function marine_validate_part3(){
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
/*--------------Attachment check ends--------------*/
	
	frmObj.action = "../marineInlandClaim/marineInlandInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}



function marine_import_validate(){
	frmObj = document.frmMarineInsuranceClaim;
//	alert("Hi");
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;

/*--------------invoiceNo check begins--------------*/
	invoiceNo = Trim(frmObj.invoiceNo.value);
	stat = checkNull("Invoice Number",invoiceNo);

	if(!stat){
	frmObj.invoiceNo.focus();
	return;
	}

	stat = checkJunk("Invoice Number" , invoiceNo, junk);
	
	if(!stat){
		frmObj.invoiceNo.focus();
		return;
	}
/*--------------invoiceNo check Ends--------------*/

/*--------------invoiceDate check begins--------------*/
	invoiceDate = Trim(frmObj.invoiceDate.value);
	stat = checkNull("Invoice Date",invoiceDate);

	if(!stat){
	frmObj.invoiceDate.focus();
	return;
	}

/*--------------invoiceDate check Ends--------------*/
	var hiddenFormName =  frmObj.hiddFormName;
	formName = "";
	if (typeof(hiddenFormName) != 'undefined' && hiddenFormName != null)
	{
	  formName	=	frmObj.hiddFormName.value;
	}
	

/*--------------ladingNo check begins--------------*/
	if ( formName != "marineInlandInsurance")
	{

		ladingNo = Trim(frmObj.ladingNo.value);
		stat = checkNull("Lading Number",ladingNo);

		if(!stat){
		frmObj.ladingNo.focus();
		return;
		}

		stat = checkJunk("Lading Number" , ladingNo, junk);
		
		if(!stat){
			frmObj.ladingNo.focus();
			return;
		}
	/*--------------ladingNo check Ends--------------*/

	/*--------------ladingDate check begins--------------*/
		ladingDate = Trim(frmObj.ladingDate.value);
		stat = checkNull("Lading Date",ladingDate);

		if(!stat){
		frmObj.ladingDate.focus();
		return;
		}

	/*--------------ladingDate check Ends--------------*/

	}


/*--------------item check begins--------------*/
	item1 = frmObj.item.value;
	stat = checkNull("Item",item1);

	if(!stat){
		frmObj.item.focus();
		return;
	}
/*--------------item check Ends--------------*/

/*--------------grossWt check begins--------------*/

	grossWt = Trim(frmObj.grossWt.value);

	stat = checkNull("Gross Weight", grossWt);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}

	/*stat = checkAmt("Gross Weight" , grossWt , num);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.grossWt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.grossWt.focus();
		return;
		}

/*--------------grossWt check ends--------------*/

/*--------------damaged check begins--------------*/

	damaged = Trim(frmObj.damaged.value);

	stat = checkNull("Damaged Quantity", damaged);

	if(!stat){
		frmObj.damaged.focus();
		return;
	}

	/*stat = checkAmt("Damaged Quantity" , damaged , num);

	if(!stat){
		frmObj.damaged.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.damaged.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.damaged.focus();
		return;
		}

/*--------------damaged check ends--------------*/

/*--------------rate check begins--------------*/

	rate = Trim(frmObj.rate.value);

	stat = checkNull("Rate per kg", rate);

	if(!stat){
		frmObj.rate.focus();
		return;
	}

	/*stat = checkAmt("Rate per kg" , rate , num);

	if(!stat){
		frmObj.rate.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.rate.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.rate.focus();
		return;
		}

/*--------------rate check ends--------------*/

/*--------------material check begins--------------*/

	material1 = Trim(frmObj.material.value);

	stat = checkNull("Material Value", material1);

	if(!stat){
		frmObj.material.focus();
		return;
	}

	/*stat = checkAmt("Material Value" , material1 , num);

	if(!stat){
		frmObj.material.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.material.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.material.focus();
		return;
		}

/*--------------material check ends--------------*/

/*--------------damageValue check begins--------------*/

	damageValue = Trim(frmObj.damageValue.value);

	stat = checkNull("Damage Value", damageValue);

	if(!stat){
		frmObj.damageValue.focus();
		return;
	}

	/*stat = checkAmt("Damage Value" , damageValue , num);

	if(!stat){
		frmObj.damageValue.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.damageValue.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.damageValue.focus();
		return;
		}

/*--------------damageValue check ends--------------*/

/*--------------salvageRate check begins--------------*/

	salvageRate = Trim(frmObj.salvageRate.value);

	stat = checkNull("Salvage Rate", salvageRate);

	if(!stat){
		frmObj.salvageRate.focus();
		return;
	}

	/*stat = checkAmt("Salvage Rate" , salvageRate , num);

	if(!stat){
		frmObj.salvageRate.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.salvageRate.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.salvageRate.focus();
		return;
		}

/*--------------salvageRate check ends--------------*/

/*--------------salvageMaterial check begins--------------*/

	salvageMaterial = Trim(frmObj.salvageMaterial.value);

	stat = checkNull("Salvage Material Value", salvageMaterial);

	if(!stat){
		frmObj.salvageMaterial.focus();
		return;
	}

	/*stat = checkAmt("Salvage Material Value" , salvageMaterial , num);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.salvageMaterial.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.salvageMaterial.focus();
		return;
		}

/*--------------salvageMaterial check ends--------------*/

/*--------------claimAmt check begins--------------*/

	claimAmt = Trim(frmObj.claimAmt.value);

	stat = checkNull("Claim Amount", claimAmt);

	if(!stat){
		frmObj.claimAmt.focus();
		return;
	}

	/*stat = checkAmt("Claim Amount" , claimAmt , num);

	if(!stat){
		frmObj.claimAmt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.claimAmt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.claimAmt.focus();
		return;
		}

/*--------------claimAmt check ends--------------*/

/*--------------cfr check begins--------------*/

	cfr = Trim(frmObj.cfr.value);

	stat = checkNull("CFR", cfr);

	if(!stat){
		frmObj.cfr.focus();
		return;
	}

	/*stat = checkAmt("CFR" , cfr , num);

	if(!stat){
		frmObj.cfr.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.cfr.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.cfr.focus();
		return;
		}

/*--------------cfr check ends--------------*/

/*--------------rewind check begins--------------*/

	rewind = Trim(frmObj.rewind.value);

	stat = checkNull("REWINDING CHARGES", rewind);

	if(!stat){
		frmObj.rewind.focus();
		return;
	}	

/*--------------rewind check ends--------------*/

/*--------------total check begins--------------*/

	total = Trim(frmObj.total.value);

	stat = checkNull("Total", total);

	if(!stat){
		frmObj.total.focus();
		return;
	}

	/*stat = checkAmt("Total" , total , num);

	if(!stat){
		frmObj.total.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.total.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.total.focus();
		return;
		}

/*--------------total check ends--------------*/

/*--------------netAmt check begins--------------*/

	netAmt = Trim(frmObj.netAmt.value);

	stat = checkNull("Net Amount", netAmt);

	if(!stat){
		frmObj.netAmt.focus();
		return;
	}

	/*stat = checkAmt("Net Amount" , grossWt , num);

	if(!stat){
		frmObj.netAmt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.netAmt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.netAmt.focus();
		return;
		}

/*--------------netAmt check ends--------------*/
	
/*--------------Check box begins----------------*/

	if(document.getElementById("intimation").checked == true)
		j += 1;
	if(document.getElementById("invoice").checked == true)
		j += 1;
	if(document.getElementById("report").checked == true)
		j += 1;
	if(document.getElementById("lading").checked == true)
		j += 1;
	if(document.getElementById("custom").checked == true)
		j += 1;
	if(document.getElementById("joint").checked == true)
		j += 1;
	if(document.getElementById("gr").checked == true)
		j += 1;
	if(document.getElementById("delivery").checked == true)
		j += 1;
	if(document.getElementById("survey").checked == true)
		j += 1;
	if(document.getElementById("sale").checked == true)
		j += 1;
	if(document.getElementById("photos").checked == true)
		j += 1;
	if(document.getElementById("policy").checked == true)
		j += 1;
	if(document.getElementById("copy").checked == true)
		j += 1;
	if(document.getElementById("letter").checked == true)
		j += 1;
	if(document.getElementById("bill").checked == true)
		j += 1;
	if(document.getElementById("origin").checked == true)
		j += 1;	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		intimation = Trim(frmObj.intimation.value);
		frmObj.intimation.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);

	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

/*--------------Attachment check ends--------------*/


	frmObj.action = "../marineImportClaim/marineImportInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}



// working fine from below

function marine_inland_validate(){
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;

/*--------------invoiceNo check begins--------------*/
	invoiceNo = Trim(frmObj.invoiceNo.value);
	stat = checkNull("Invoice Number",invoiceNo);

	if(!stat){
	frmObj.invoiceNo.focus();
	return;
	}

	stat = checkJunk("Invoice Number" , invoiceNo, junk);
	
	if(!stat){
		frmObj.invoiceNo.focus();
		return;
	}
/*--------------invoiceNo check Ends--------------*/

/*--------------invoiceDate check begins--------------*/
	invoiceDate = Trim(frmObj.invoiceDate.value);
	stat = checkNull("Invoice Date",invoiceDate);

	if(!stat){
	frmObj.invoiceDate.focus();
	return;
	}

/*--------------invoiceDate check Ends--------------*/

/*--------------lrNo check begins--------------*/
	lrNo = Trim(frmObj.lrNo.value);
	stat = checkNull("LR Number",lrNo);

	if(!stat){
	frmObj.lrNo.focus();
	return;
	}

	stat = checkJunk("LR Number" , lrNo, junk);
	
	if(!stat){
		frmObj.lrNo.focus();
		return;
	}
/*--------------lrNo check Ends--------------*/

/*--------------lrDate check begins--------------*/
	lrDate = Trim(frmObj.lrDate.value);
	stat = checkNull("LR Date",lrDate);

	if(!stat){
	frmObj.lrDate.focus();
	return;
	}

/*--------------lrDate check Ends--------------*/

/*--------------item check begins--------------*/
	item1 = Trim(frmObj.item.value);
	stat = checkNull("Item",item1);

	if(!stat){
	frmObj.item.focus();
	return;
	}	
/*--------------item check Ends--------------*/

/*--------------grossWt check begins--------------*/

	grossWt = Trim(frmObj.grossWt.value);

	stat = checkNull("Gross Weight", grossWt);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}

	/*stat = checkAmt("Gross Weight" , grossWt , num);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.grossWt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.grossWt.focus();
		return;
		}

/*--------------grossWt check ends--------------*/

/*--------------damaged check begins--------------*/

	damaged = Trim(frmObj.damaged.value);

	stat = checkNull("Damaged Quantity", damaged);

	if(!stat){
		frmObj.damaged.focus();
		return;
	}

	/*stat = checkAmt("Damaged Quantity" , damaged , num);

	if(!stat){
		frmObj.damaged.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.damaged.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.damaged.focus();
		return;
		}

/*--------------damaged check ends--------------*/

/*--------------rate check begins--------------*/

	rate = Trim(frmObj.rate.value);

	stat = checkNull("Rate per kg", rate);

	if(!stat){
		frmObj.rate.focus();
		return;
	}

	/*stat = checkAmt("Rate per kg" , rate , num);

	if(!stat){
		frmObj.rate.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.rate.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.rate.focus();
		return;
		}

/*--------------rate check ends--------------*/

/*--------------material check begins--------------*/

	material1 = Trim(frmObj.material.value);

	stat = checkNull("Material Value", material1);

	if(!stat){
		frmObj.material.focus();
		return;
	}

	/*stat = checkAmt("Material Value" , material1 , num);

	if(!stat){
		frmObj.material.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.material.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.material.focus();
		return;
		}

/*--------------material check ends--------------*/

/*--------------damageValue check begins--------------*/

	damageValue = Trim(frmObj.damageValue.value);

	stat = checkNull("Damage Value", damageValue);

	if(!stat){
		frmObj.damageValue.focus();
		return;
	}

	/*stat = checkAmt("Damage Value" , damageValue , num);

	if(!stat){
		frmObj.damageValue.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.damageValue.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.damageValue.focus();
		return;
		}

/*--------------damageValue check ends--------------*/

/*--------------salvageRate check begins--------------*/

	salvageRate = Trim(frmObj.salvageRate.value);

	stat = checkNull("Salvage Rate", salvageRate);

	if(!stat){
		frmObj.salvageRate.focus();
		return;
	}

	/*stat = checkAmt("Salvage Rate" , salvageRate , num);

	if(!stat){
		frmObj.salvageRate.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.salvageRate.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.salvageRate.focus();
		return;
		}

/*--------------salvageRate check ends--------------*/

/*--------------salvageMaterial check begins--------------*/

	salvageMaterial = Trim(frmObj.salvageMaterial.value);

	stat = checkNull("Salvage Material Value", salvageMaterial);

	if(!stat){
		frmObj.salvageMaterial.focus();
		return;
	}

	/*stat = checkAmt("Salvage Material Value" , salvageMaterial , num);

	if(!stat){
		frmObj.grossWt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.salvageMaterial.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.salvageMaterial.focus();
		return;
		}

/*--------------salvageMaterial check ends--------------*/

/*--------------claimAmt check begins--------------*/

	claimAmt = Trim(frmObj.claimAmt.value);

	stat = checkNull("Claim Amount", claimAmt);

	if(!stat){
		frmObj.claimAmt.focus();
		return;
	}

	/*stat = checkAmt("Claim Amount" , claimAmt , num);

	if(!stat){
		frmObj.claimAmt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.claimAmt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.claimAmt.focus();
		return;
		}

/*--------------claimAmt check ends--------------*/

/*--------------cfr check begins--------------*/

	cfr = Trim(frmObj.cfr.value);

	stat = checkNull("CFR", cfr);

	if(!stat){
		frmObj.cfr.focus();
		return;
	}

	/*stat = checkAmt("CFR" , cfr , num);

	if(!stat){
		frmObj.cfr.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.cfr.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.cfr.focus();
		return;
		}

/*--------------cfr check ends--------------*/

/*--------------rewind check begins--------------*/

	rewind = Trim(frmObj.rewind.value);

	stat = checkNull("REWINDING CHARGES", rewind);

	if(!stat){
		frmObj.rewind.focus();
		return;
	}	

/*--------------rewind check ends--------------*/

/*--------------total check begins--------------*/

	total = Trim(frmObj.total.value);

	stat = checkNull("Total", total);

	if(!stat){
		frmObj.total.focus();
		return;
	}

	/*stat = checkAmt("Total" , total , num);

	if(!stat){
		frmObj.total.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.total.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.total.focus();
		return;
		}

/*--------------total check ends--------------*/

/*--------------netAmt check begins--------------*/

	netAmt = Trim(frmObj.netAmt.value);

	stat = checkNull("Net Amount", netAmt);

	if(!stat){
		frmObj.netAmt.focus();
		return;
	}

	/*stat = checkAmt("Net Amount" , grossWt , num);

	if(!stat){
		frmObj.netAmt.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.netAmt.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.netAmt.focus();
		return;
		}

/*--------------netAmt check ends--------------*/
	
/*--------------Check box begins----------------*/

	if(document.getElementById("invoice").checked == true)
		j += 1;
	if(document.getElementById("report").checked == true)
		j += 1;
	if(document.getElementById("lading").checked == true)
		j += 1;
	if(document.getElementById("custom").checked == true)
		j += 1;
	if(document.getElementById("joint").checked == true)
		j += 1;
	if(document.getElementById("gr").checked == true)
		j += 1;
	if(document.getElementById("delivery").checked == true)
		j += 1;
	if(document.getElementById("survey").checked == true)
		j += 1;
	if(document.getElementById("sale").checked == true)
		j += 1;
	if(document.getElementById("photos").checked == true)
		j += 1;
	if(document.getElementById("policy").checked == true)
		j += 1;
	if(document.getElementById("copy").checked == true)
		j += 1;
	if(document.getElementById("letter").checked == true)
		j += 1;
	if(document.getElementById("bill").checked == true)
		j += 1;
	if(document.getElementById("origin").checked == true)
		j += 1;	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		invoice = Trim(frmObj.invoice.value);
		frmObj.invoice.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

/*--------------Attachment check ends--------------*/


	frmObj.action = "../marineInlandClaim/marineInlandInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}



function marine_container_validate(){
	frmObj = document.frmMarineInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;

/*--------------invoiceNo check begins--------------*/
	invoiceNo = Trim(frmObj.invoiceNo.value);
	stat = checkNull("Invoice Number",invoiceNo);

	if(!stat){
	frmObj.invoiceNo.focus();
	return;
	}

	stat = checkJunk("Invoice Number" , invoiceNo, junk);
	
	if(!stat){
		frmObj.invoiceNo.focus();
		return;
	}
/*--------------invoiceNo check Ends--------------*/

/*--------------invoiceDate check begins--------------*/
	invoiceDate = Trim(frmObj.invoiceDate.value);
	stat = checkNull("Invoice Date",invoiceDate);

	if(!stat){
	frmObj.invoiceDate.focus();
	return;
	}

/*--------------invoiceDate check Ends--------------*/

/*--------------blNo check begins--------------*/

	blNo = Trim(frmObj.blNo.value);
	
	stat = checkNull("Bl No", blNo);

	if(!stat){
		frmObj.blNo.focus();
		return;
	}
	
	stat = checkJunk("Bl No", blNo, junk);
	
	if(!stat){
		frmObj.blNo.focus();
		return;
	}

	/*stat = checkAmt("Bl No" , blNo , num);

	if(!stat){
		frmObj.blNo.focus();
		return;
	}*/

	stat1= parseFloat(frmObj.blNo.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.blNo.focus();
		return;
		}

/*--------------blNo check ends--------------*/

/*--------------blDate check begins--------------*/
	blDate = Trim(frmObj.blDate.value);
	stat = checkNull("Bl Date",blDate);

	if(!stat){
	frmObj.blDate.focus();
	return;
	}

/*--------------blDate check Ends--------------*/

/*--------------billNo check begins--------------*/

	billNo = Trim(frmObj.billNo.value);

	stat = checkNull("Bill No", billNo);

	if(!stat){
		frmObj.billNo.focus();
		return;
	}

	stat = checkJunk("Bill No", billNo, junk);
	
	if(!stat){
		frmObj.billNo.focus();
		return;
	}

	/*
	stat = checkAmt("Bill No" , billNo , num);

	if(!stat){
		frmObj.billNo.focus();
		return;
	}
	*/
	stat1= parseFloat(frmObj.billNo.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.billNo.focus();
		return;
		}

/*--------------billNo check ends--------------*/

/*--------------billDate check begins--------------*/
	billDate = Trim(frmObj.billDate.value);
	stat = checkNull("Bill Date",billDate);

	if(!stat){
	frmObj.billDate.focus();
	return;
	}

/*--------------billDate check Ends--------------*/

/*--------------item check begins--------------*/

	item1 = Trim(frmObj.item.value);

	stat = checkNull("Item" , item1);

	if(!stat){
		frmObj.item.focus();
		return;
	}
/*--------------item check ends--------------*/

/*--------------containerNo check begins--------------*/

	//containerNo = Trim(frmObj.containerNo.value);

	//stat = checkAmt("Container No" , containerNo , num);

	/*if(!stat){
		frmObj.containerNo.focus();
		return;
	}*/

/*--------------containerNo check ends--------------*/

/*--------------repair check begins--------------*/

	repair = Trim(frmObj.repair.value);

	/*stat = checkAmt("Repair" , repair , num);

	if(!stat){
		frmObj.repair.focus();
		return;
	}*/

/*--------------repair check ends--------------*/

/*--------------total check begins--------------*/

	total = Trim(frmObj.total.value);	

	/*stat = checkAmt("Total" , total , num);

	if(!stat){
		frmObj.total.focus();
		return;
	}*/

/*--------------total check ends--------------*/

/*--------------netAmt check begins--------------*/

	netAmt = Trim(frmObj.netAmt.value);

	/*stat = checkAmt("Net Amount" , netAmt , num);

	if(!stat){
		frmObj.netAmt.focus();
		return;
	}*/

/*--------------netAmt check ends--------------*/
	
/*--------------Check box begins----------------*/

	if(document.getElementById("invoice").checked == true)
		j += 1;
	if(document.getElementById("report").checked == true)
		j += 1;
	if(document.getElementById("survey").checked == true)
		j += 1;	
	if(document.getElementById("joint").checked == true)
		j += 1;		
	if(document.getElementById("duly").checked == true)
		j += 1;
	if(document.getElementById("sale").checked == true)
		j += 1;
	if(document.getElementById("photos").checked == true)
		j += 1;
	if(document.getElementById("policy").checked == true)
		j += 1;
	if(document.getElementById("copy").checked == true)
		j += 1;
	if(document.getElementById("letter").checked == true)
		j += 1;
	if(document.getElementById("bank").checked == true)
		j += 1;
	if(document.getElementById("origin").checked == true)
		j += 1;	

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		invoice = Trim(frmObj.invoice.value);
		frmObj.invoice.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}
	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

/*--------------Attachment check ends--------------*/


	frmObj.action = "../marineContainerClaim/marineContainerInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}

function generic_validate(){
	//alert("HII");
	frmObj = document.frmGenericInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;
	
	/*--------------companyName check begins--------------*/
	companyName = frmObj.companyName.options[frmObj.companyName.selectedIndex].value;
	stat = checkNull("Company Name",companyName);

	if(!stat){
	frmObj.companyName.focus();
	return;
	}
/*--------------companyName check Ends--------------*/


	frmObj.action = "../genericClaim/genericClaimFormSubmit.jsp";
	frmObj.submit();
}

function allrisk_validate(){
	frmObj = document.frmAllRiskInsuranceClaim;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;

/*--------------insuredName check begins--------------*/
//alert("abc");
	insuredName = frmObj.insuredName.options[frmObj.insuredName.selectedIndex].value;

/*--------------insuredName check Ends--------------*/

/*--------------period check begins--------------*/
	period = Trim(frmObj.period.value);
	stat = checkNull("Period",period);

	if(!stat){
	frmObj.period.focus();
	return;
	}

	stat = checkJunk("Period" , period, junk);
	
	if(!stat){
		frmObj.period.focus();
		return;
	}
/*--------------period check Ends--------------*/

/*--------------insuredOccupation check begins--------------*/
	insuredOccupation = Trim(frmObj.insuredOccupation.value);
	stat = checkNull("Insured Occupation",insuredOccupation);

	if(!stat){
	frmObj.insuredOccupation.focus();
	return;
	}

	stat = checkJunk("Insured Occupation" , insuredOccupation, junk);
	
	if(!stat){
		frmObj.insuredOccupation.focus();
		return;
	}

	stat = checkNumInName("Insured Occupation" , insuredOccupation, num);
	
	if(!stat){
		frmObj.insuredOccupation.focus();
		return;
	}
/*--------------insuredOccupation check Ends--------------*/

/*--------------insuredAddr check begins--------------*/
	/*areaDesc = Trim(frmObj.lossArea.value);
	stat = checkNull("Loss Area",lossArea);

	if(!stat){
	frmObj.lossArea.focus();
	return;
	}*/
/*--------------insuredAddr check Ends--------------*/

/*--------------Contact Phone No. check begins--------------*/

	insuredNo = Trim(frmObj.insuredNo.value);

	stat = checkNull("Contact Number",insuredNo);

	if(!stat){
	frmObj.insuredNo.focus();
	return;
	}

	stat = checkAmt("Contact Number" , insuredNo , num);
	
	if(!stat){
		frmObj.insuredNo.focus();
		return;
	}


/*--------------Contact Phone No. check ends--------------*/

/*--------------lossNature check begins--------------*/

	lossNature = Trim(frmObj.lossNature.value);

	stat = checkNull("Nature of Loss",lossNature);

	if(!stat){
	frmObj.lossNature.focus();
	return;
	}

/*--------------lossNature check ends--------------*/

/*--------------lossAddr check begins--------------*/
	lossAddr = Trim(frmObj.lossAddr.value);
	stat = checkNull("Place and Address where loss took place",lossAddr);

	if(!stat){
	frmObj.lossAddr.focus();
	return;
	}

/*--------------lossAddr check Ends--------------*/

/*--------------missing check begins--------------*/
	missing = Trim(frmObj.missing.value);
	stat = checkNull("Missing Property",missing);

	if(!stat){
	frmObj.missing.focus();
	return;
	}

/*--------------missing check Ends--------------*/

/*--------------lossDate check begins--------------*/
	lossDate = Trim(frmObj.lossDate.value);
	stat = checkNull("Date of Loss",lossDate);

	if(!stat){
	frmObj.lossDate.focus();
	return;
	}

/*--------------lossDate check Ends--------------*/

/*--------------lossTime check begins--------------*/
	lossTime = Trim(frmObj.lossTime.value);
	stat = checkNull("Time of Loss",lossTime);

	if(!stat){
	frmObj.lossTime.focus();
	return;
	}
/*--------------lossTime check Ends--------------*/

/*--------------circumstances check begins--------------*/
	circumstances = Trim(frmObj.circumstances.value);
	stat = checkNull("Circumstances",circumstances);

	if(!stat){
	frmObj.circumstances.focus();
	return;
	}
/*--------------circumstances check Ends--------------*/

/*--------------itemValue check begins--------------*/
	itemValue = Trim(frmObj.itemValue.value);
	stat = checkNull("Item Value",itemValue);

	if(!stat){
	frmObj.itemValue.focus();
	return;
	}

	stat = checkAmt("Item Value" , itemValue , num);
	
	if(!stat){
		frmObj.itemValue.focus();
		return;
	}
/*--------------itemValue check Ends--------------*/

/*--------------reportingDate check begins--------------*/
	reportingDate = Trim(frmObj.reportingDate.value);
	stat = checkNull("Reporting Date",reportingDate);

	if(!stat){
	frmObj.reportingDate.focus();
	return;
	}
/*--------------reportingDate check Ends--------------*/

/*--------------reportingTime check begins--------------*/
	reportingTime = Trim(frmObj.reportingTime.value);
	stat = checkNull("Reporting Time",reportingTime);

	if(!stat){
	frmObj.reportingTime.focus();
	return;
	}
/*--------------reportingTime check Ends--------------*/

/*--------------stationName check begins--------------*/
	stationName = Trim(frmObj.stationName.value);
	stat = checkNull("Station Name",stationName);

	if(!stat){
	frmObj.stationName.focus();
	return;
	}

	stat = checkJunk("Station Name" , stationName, junk);
	
	if(!stat){
		frmObj.stationName.focus();
		return;
	}

	stat = checkNumInName("Station Name" , stationName, num);
	
	if(!stat){
		frmObj.stationName.focus();
		return;
	}
/*--------------stationName check Ends--------------*/

/*--------------stationAddr check begins--------------*/

	stationAddr = Trim(frmObj.stationAddr.value);

	stat = checkNull("Station Address", stationAddr);

	if(!stat){
		frmObj.stationAddr.focus();
		return;
	}

/*--------------stationAddr check ends--------------*/

/*--------------owner check begins--------------*/

	owner = Trim(frmObj.owner.value);

	stat = checkNull("Owner", owner);

	if(!stat){
		frmObj.owner.focus();
		return;
	}

/*--------------owner check ends--------------*/

/*--------------particulars check begins--------------*/
	particulars = Trim(frmObj.particulars.value);
	stat = checkNull("Particulars",particulars);

	if(!stat){
	frmObj.particulars.focus();
	return;
	}
/*--------------particulars check Ends--------------*/

/*--------------other check begins--------------*/

	other = Trim(frmObj.other.value);

	stat = checkNull("Other Details", other);

	if(!stat){
		frmObj.other.focus();
		return;
	}

/*--------------other check ends--------------*/

/*--------------additional check begins--------------*/
	additional = Trim(frmObj.additional.value);
	stat = checkNull("Additional Info",additional);

	if(!stat){
	frmObj.additional.focus();
	return;
	}
/*--------------additional check Ends--------------*/

/*--------------Check box begins----------------*/

	if(document.getElementById("bill").checked == true)
		j += 1;
	if(document.getElementById("policy").checked == true)
		j += 1;
	if(document.getElementById("fir").checked == true)
		j += 1;
	if(document.getElementById("final").checked == true)
		j += 1;

	if(j == 0)
	{
		alert("Kindly select the documents that you are attaching");
		bill = Trim(frmObj.bill.value);
		frmObj.bill.focus();
		return;
	}

/*--------------Attachment check begins--------------*/

	fileSize = Trim(frmObj.hiddDirectorySize.value);
	if(fileSize == 0)
	{
		alert("Kindly attach a file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize > j)
	{
		if(j == 1)
			alert("You can attach only "+j+" file");
		else
			alert("You can attach only "+j+" file");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}

	if(fileSize < j)
	{
		alert("You have to attach "+j+" files");
		fillDate = Trim(frmObj.fillDate.value);
		frmObj.fillDate.focus();
		return;
	}


/*--------------Attachment check ends--------------*/

	frmObj.action = "../allRiskClaim/allRiskInsuranceClaimFormPreview.jsp";
	frmObj.submit();
}

function fire_preview_validate(){
	frmObj = document.frmFireInsuranceClaimPreview;

	frmObj.action = "../fireClaim/fireInsuranceClaimFormSubmit.jsp";
	frmObj.submit();

}

function marine_inland_miscellaneous_preview_validate(){
	frmObj = document.frmMarineInsuranceClaimPreview;

	frmObj.action = "../marineMiscellaneousClaim/marineInlandMiscellaneousClaimFormSubmit.jsp";
	frmObj.submit();

}

function gpa_preview_validate(){
	frmObj = document.frmGpaClaimPreview;

	frmObj.action = "../GPAClaim/GPAClaimFormSubmit.jsp";
	frmObj.submit();

}

function eei_preview_validate(){
	frmObj = document.frmEeiClaimPreview;

	frmObj.action = "../EEIClaim/EEIClaimFormSubmit.jsp";
	frmObj.submit();

}

function gti_preview_validate(){
	frmObj = document.frmGtiClaimPreview;

	frmObj.action = "../GTIClaim/GTIClaimFormSubmit.jsp";
	frmObj.submit();

}

function marine_inland_preview_validate(){
	frmObj = document.frmMarineInsuranceClaimPreview;

	frmObj.action = "../marineInlandClaim/marineInlandInsuranceClaimFormSubmit.jsp";
	frmObj.submit();

}

function marine_import_preview_validate(){
	frmObj = document.frmMarineInsuranceClaimPreview;

	frmObj.action = "../marineImportClaim/marineImportInsuranceClaimFormSubmit.jsp";
	frmObj.submit();

}

function marine_container_preview_validate(){
	frmObj = document.frmMarineInsuranceClaimPreview;

	frmObj.action = "../marineContainerClaim/marineContainerInsuranceClaimFormSubmit.jsp";
	frmObj.submit();

}

function allriskpreview_validate(){
	frmObj = document.frmAllRiskInsuranceClaim;

	frmObj.action = "../allRiskClaim/allRiskInsuranceClaimFormSubmit.jsp";
	frmObj.submit();

}

function next(){
	frmObj = document.frmApproveClaimForm;

	frmObj.action = "../../approver/processInsuranceClaim.jsp";
	frmObj.submit();

}

function return_to_user(){
	frmObj = document.frmProcessInsuranceClaim;

	approverRemark = frmObj.approverRemark.value;

	stat = checkNull("Remark",approverRemark);
	if(!stat){
		frmObj.approverRemark.focus();
		return;
	}
	frmObj.hiddButtonValue.value = "0";

	frmObj.action = "../approver/processInsuranceClaimSubmit.jsp";
	frmObj.submit();

}

function processClaim(){
	frmObj = document.frmProcessInsuranceClaim;

	approverRemark = frmObj.approverRemark.value;

	stat = checkNull("Remark",approverRemark);
	if(!stat){
		frmObj.approverRemark.focus();
		return;
	}
	frmObj.hiddButtonValue.value = "1";

	frmObj.action = "../approver/processInsuranceClaimSubmit.jsp";
	frmObj.submit();

}

function attachmentFile(requestNo,formName)
{
	    var frmObj = eval("document."+formName);

		//uploadFilePath = frmObj.uploadFilePath.value;
		
		//if(uploadFilePath == "") {
		
			var url = "../../upload/uploadFile.jsp?requestNo="+requestNo+"&formName="+formName;
			//alert(formName);

			window.open(url,"File","width=375,height=165, resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");

		//} else {

			//alert("You have already selected file");
		//}
		
}

function deleteFile(formName,fileName,dirPath)
{
    var frmObj = eval("document."+formName);
	var r=confirm("Do you want to delete this file?");
	if (r==true)
	{
		//alert(formName);
		//alert(fileName);
		//alert(dirPath);
		var url = "../../common/deleteFile.jsp?fileName="+fileName+"&formName="+formName+"&dirPath="+dirPath+"&id=delete";

		window.open(url,"File","width=375,height=165, resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
		
		//document.location.href = "../../common/dirListing.jsp?fileName="+fileName+"&formName="+formName+"&dirPath="+dirPath+"&id=delete";
		//frmObj.submit();
	}
	else
	{
        eval("self.opener.document."+formName+".fillDate.focus()");
	}	
}

function deleteSuccess (formName) {

		alert("File has been deleted");
        eval("self.opener.document."+formName+".fillDate.focus()");		
   }

function deleteFailure (formName) {

		alert("File has not been deleted");
        eval("self.opener.document."+formName+".fillDate.focus()");		
   }


// Don't edit beyond this

function onLoadDetail(requestNo,formName)
{	
	//alert("Hi");
	loadFragment("../../common/attachment.jsp?requestNo="+requestNo+'&formName='+formName,"attachment","Attachment");
}



function onLoadAddr(formName)
{	
	if(formName == "frmFireInsuranceClaim")
	{
		addressFire();
	}
	else if(formName == "frmAllRiskInsuranceClaim")
	{
		addressAllRisk();
	}
	else if(formName == "frmMarineInsuranceClaim")
	{
		addressMarine();
	}
}

function onViewLoadDetail(requestNo)
{	//alert(requestNo);
	loadFragment("../../common/viewAttachment.jsp?requestNo="+requestNo,"viewAttachment","Attachment");
}

function loadFragment(fragment_url, element_id, for_what){
    var xmlhttp = "";
    if (window.XMLHttpRequest){
        // code for Mozilla, etc.
        xmlhttp=new XMLHttpRequest();
    }else if (window.ActiveXObject){ 
        // code for IE
        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        alert("Sorry Your Browser is not Supported");
    }
    
    var element = document.getElementById(element_id);

    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
    //alert(processingRequest);    
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
				//alert(message); 
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

function addressFire() {
	//alert("abc");
	if(	document.getElementById("insuredName").value == "BCCL")
	{
		document.getElementById("area").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
	if(	document.getElementById("insuredName").value == "ENIL")
	{
		document.getElementById("area").value = "Entertainment Network India Ltd.,\nTrade Gardens, Ground Floor,\nKamala Mills Compound,\nSenapati Bapat Marg,\nLower Parel(W), Mumbai-4001";
	}
	if(	document.getElementById("insuredName").value == "TVL")
	{
		document.getElementById("area").value = "M/S. TIMES VPL LTD,\nDUPARC TRINITY,NO.17,\n9TH FLOOR,M G ROAD,\nBANGALORE-560 001,\nKARNATAKA";
	}
	if(	document.getElementById("insuredName").value == "TGBCL")
	{
		document.getElementById("area").value = "Times Global Broadcasting Company Ltd, Trade House, Kamala Mill Compound, S.B.Marg, Lower Parel, Mumbai 400 013";
	}
	if(	document.getElementById("insuredName").value == "TIML")
	{
		document.getElementById("area").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
 }

function addressAllRisk() {
	//alert("abc");
	if(	document.getElementById("insuredName").value == "BCCL")
	{
		document.getElementById("insuredAddr").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
	if(	document.getElementById("insuredName").value == "ENIL")
	{
		document.getElementById("insuredAddr").value = "Entertainment Network India Ltd.,\nTrade Gardens, Ground Floor,\nKamala Mills Compound,\nSenapati Bapat Marg,\nLower Parel(W), Mumbai-4001";
	}
	if(	document.getElementById("insuredName").value == "TVL")
	{
		document.getElementById("insuredAddr").value = "M/S. TIMES VPL LTD,\nDUPARC TRINITY,NO.17,\n9TH FLOOR,M G ROAD,\nBANGALORE-560 001,\nKARNATAKA";
	}
	if(	document.getElementById("insuredName").value == "TGBCL")
	{
		document.getElementById("insuredAddr").value = "Times Global Broadcasting Company Ltd, Trade House, Kamala Mill Compound, S.B.Marg, Lower Parel, Mumbai 400 013";
	}
	if(	document.getElementById("insuredName").value == "TIML")
	{
		document.getElementById("insuredAddr").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
 }

 function marine_miscellaneous_validate(){
	frmObj = document.frmMarineInsuranceClaim;
   
	//alert("HIIIII");

	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";
	var j = 0;

/*--------------invoiceNo check begins--------------*/
	invoiceNo = Trim(frmObj.invoiceNo.value);
	stat = checkNull("Invoice Number",invoiceNo);

	if(!stat){
	frmObj.invoiceNo.focus();
	return;
	}

	stat = checkJunk("Invoice Number" , invoiceNo, junk);
	
	if(!stat){
		frmObj.invoiceNo.focus();
		return;
	}
/*--------------invoiceNo check Ends--------------*/

/*--------------invoiceDate check begins--------------*/
	invoiceDate = Trim(frmObj.invoiceDate.value);
	stat = checkNull("Invoice Date",invoiceDate);

	if(!stat){
	frmObj.invoiceDate.focus();
	return;
	}

/*--------------invoiceDate check Ends--------------*/

/*--------------lrNo check begins--------------*/
	lrNo = Trim(frmObj.lrNo.value);
	stat = checkNull("LR Number",lrNo);

	if(!stat){
	frmObj.lrNo.focus();
	return;
	}

	stat = checkJunk("LR Number" , lrNo, junk);
	
	if(!stat){
		frmObj.lrNo.focus();
		return;
	}
/*--------------lrNo check Ends--------------*/

/*--------------lrDate check begins--------------*/
	lrDate = Trim(frmObj.lrDate.value);
	stat = checkNull("LR Date",lrDate);

	if(!stat){
	frmObj.lrDate.focus();
	return;
	}

/*--------------lrDate check Ends--------------*/

/*--------------item check begins--------------*/
	item1 = Trim(frmObj.item.value);
	stat = checkNull("Item",item1);

	if(!stat){
	frmObj.item.focus();
	return;
	}	
/*--------------item check Ends--------------*/

/*--------------Repair cos check begins--------------*/
	repairCos = Trim(frmObj.repairCos.value);
	stat = checkNull("Repair cos / Value of the damaged Item",repairCos);

	if(!stat){
	frmObj.repairCos.focus();
	return;
	}
	
	
/*--------------Repair cos check Ends--------------*/

/*--------------Charges check begins--------------*/
	charges = Trim(frmObj.charges.value);
	stat = checkNull("Add 10.00 % for Misc Charges ( Rs. )",charges);

	if(!stat){
	frmObj.charges.focus();
	return;
	}	
/*--------------Charges check Ends--------------*/

/*--------------Salvage Cost check begins--------------*/
	cost = Trim(frmObj.cost.value);
	stat = checkNull("Less Salvage Cost ( Rs. )",cost);

	if(!stat){
	frmObj.cost.focus();
	return;
	}	
/*--------------Salvage Cost check Ends--------------*/

/*--------------claimAmt check begins--------------*/
	claimAmt = Trim(frmObj.claimAmt.value);
	stat = checkNull("Amount of Claim ( Damaged Value-Salavage Value) Rs",claimAmt);

	if(!stat){
	frmObj.claimAmt.focus();
	return;
	}
/*--------------claimAmt check Ends--------------*/


    frmObj.action = "../marineMiscellaneousClaim/marineInlandMiscellaneousClaimFormPreview.jsp";
	frmObj.submit();
 }

 function addressMarine() {
	//alert("abc");
	if(	document.getElementById("assuredName").value == "BCCL")
	{
		document.getElementById("assuredAddr").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
	if(	document.getElementById("assuredName").value == "ENIL")
	{
		document.getElementById("assuredAddr").value = "Entertainment Network India Ltd.,\nTrade Gardens, Ground Floor,\nKamala Mills Compound,\nSenapati Bapat Marg,\nLower Parel(W), Mumbai-4001";
	}
	if(	document.getElementById("assuredName").value == "TVL")
	{
		document.getElementById("assuredAddr").value = "M/S. TIMES VPL LTD,\nDUPARC TRINITY,NO.17,\n9TH FLOOR,M G ROAD,\nBANGALORE-560 001,\nKARNATAKA";
	}
	if(	document.getElementById("insuredName").value == "TGBCL")
	{
		document.getElementById("assuredAddr").value = "Times Global Broadcasting Company Ltd, Trade House, Kamala Mill Compound, S.B.Marg, Lower Parel, Mumbai 400 013";
	}
	if(	document.getElementById("insuredName").value == "TIML")
	{
		document.getElementById("assuredAddr").value = "9 / 10 \nBahardurshah Jafar Marg, \nNew Delhi - 2";
	}
 }

 /* function noofdays(){

    frmObj = document.frmGtiInsuranceClaim;
    for(ii = 0; ii < 1; ii++) {
	var fromdate = eval("frmObj.fromdate" + ii);
	var todate = eval("frmObj.todate" + ii);
	document.frmGtiInsuranceClaim.noofdays.value = (todate - fromdate).toFixed(2);
    }
  }*/


 
 function addRows(noOfRows, addRows){

    frmObj = document.frmGtiInsuranceClaim;
	//alert(formName);
	var total = 0;
	
	for(ii = 0; ii < noOfRows; ii++) {

          
            /*-------------- check begins--------------*/

            var fromdate = eval("frmObj.fromdate" + ii);
            

            if(fromdate.value==null || fromdate.value=='' ){

				if(total > 0){
					break;
				}else {
					alert("Please enter fromdate !");			
					fromdate.focus();
					return ;
               }
			}

            /*-------------- check begins--------------*/

            var todate = eval("frmObj.todate" + ii);
            

            if(todate.value==null || todate.value=='' ){
				alert("Please enter todate !");	
                todate.focus();
                return ;
            }

            /*--------------check begins--------------*/

		

           var noofdays = eval("frmObj.noofdays" + ii);
            
            if(noofdays.value==null || noofdays.value=='' ){
				alert("Please enter noofdays !");	
                noofdays.focus();
                return ;
            }
            
            /*--------------check ends--------------*/

			 /*--------------check begins--------------*/

            var leavetype = eval("frmObj.leavetype" + ii);
            
            if(leavetype.value=='0' ){
				alert("Please select the leavetype !");	
                leavetype.focus();
                return ;
            }
            
            /*--------------check ends--------------*/

            /*--------------check begins--------------*/
            
            var reasons = eval("frmObj.reasons" + ii);
            

            if(reasons.value==null || reasons.value=='' ){
				alert("Please enter reason !");
                reasons.focus();
                return ;
            }

            /*--------------check ends--------------*/

            /*----------------------------*/

            var resumptiondate = eval("frmObj.resumptiondate" + ii);
           

             if(resumptiondate.value==null || resumptiondate.value=='' ){
				 alert("Please select resumptiondate !");
                resumptiondate.focus();
                return ;
            }

            /*----------------------------*/
            
           
           /*--------------ends--------------*/

            total = total + 1;
			

        }// end of for loop

    if(total < noOfRows){

        alert("Please fill in all rows before adding more");
        var fromdate = eval('frmObj.fromdate' + total);
        fromdate.focus();
		return false;
    }

    frmObj.total.value = noOfRows + addRows;
	
	frmObj.action = "../GTIClaim/Group Term Life Insurance Claim Form.jsp?action=addRows";
	frmObj.submit();
	
}