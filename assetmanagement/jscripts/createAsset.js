function validateValues(){

	frmObj = document.frmCreateAsset;
	OCost = frmObj.originalCost.value;
	CCost = frmObj.currentCost.value;

	goodchars ="0123456789.";
	stat = checkPhone("originalCost" , OCost ,goodchars )

		
	if(!stat){
		frmObj.originalCost.focus();
		return;
	}

		stat = checkPhone("currentCost" , CCost ,goodchars )
		if(!stat){
		frmObj.currentCost.focus();
		return;
	}
	
	if(parseFloat(OCost) < parseFloat(CCost))
	{
		alert("Current cost should be lesser than original cost");
		frmObj.originalCost.focus();
		return;
	}

	nameOfAsset = trim(frmObj.nameOfAsset.value);
	
	stat = checkNull("Name Of Asset", nameOfAsset);

	if(!stat){
		frmObj.nameOfAsset.focus();
		return;
	}

	assetNo = trim(frmObj.assetNo.value);
	stat = checkNull("Asset Number", assetNo);

	if(!stat){
		frmObj.assetNo.focus();
		return;
	}

	stat = checkMaxLength("Asset Number", assetNo, "50")
	if(!stat){
		frmObj.assetNo.focus();
		return;
	}

	assetType = trim(frmObj.assetType.value);
	stat = checkNull("Asset Type", assetType);

	if(!stat){
		frmObj.assetType.focus();
		return;
	}


	assetCategory = trim(frmObj.assetCategory.value);
	stat = checkNull("Category", assetCategory);

	if(!stat){
		frmObj.assetCategory.focus();
		return;
	}

	installationDate = trim(frmObj.installationDate.value);
	stat = checkNull("Date Of Installation", installationDate);

	if(!stat){
		frmObj.installationDate.focus();
		return;
	}

	originalCost = trim(frmObj.originalCost.value);
	stat = checkNull("Original Cost", originalCost);

	if(!stat){
		frmObj.originalCost.focus();
		return;
	}

	stat = checkMaxLength("Original Cost", originalCost, "20")
	if(!stat){
		frmObj.originalCost.focus();
		return;
	}

/*	stat = checkAmt("Original Cost" , originalCost ,goodchars )
	if(!stat){
		frmObj.originalCost.focus();
		return;
	}
*/


	currentCost = trim(frmObj.currentCost.value);
	stat = checkNull("Current Value/Cost", currentCost);

	if(!stat){
		frmObj.currentCost.focus();
		return;
	}

	stat = checkMaxLength("Current Value/Cost", currentCost, "20")
	if(!stat){
		frmObj.currentCost.focus();
		return;
	}

/*	stat = checkAmt("Current Value/Cost" , currentCost ,goodchars )
		if(!stat){
		frmObj.currentCost.focus();
		return;
	}
	//alert(originalCost);
	//alert(currentCost);

	if(originalCost < currentCost)
	{
		alert(currentCost);
		alert("Current Cost should be lesser than Original Cost!");
		frmObj.currentCost.focus();
		return;
	}
*/

	assetLocation = trim(frmObj.assetLocation.value);

	if(assetLocation=='0'){
		alert("Please select location !!");
		frmObj.assetLocation.focus();
		return;
	}

	assetModel = trim(frmObj.assetModel.value);
	stat = checkNull("Model", assetModel);

	if(!stat){
		frmObj.assetModel.focus();
		return;
	}

	assetSerialNo = trim(frmObj.assetSerialNo.value);
	stat = checkNull("Serial Number", assetSerialNo);

	if(!stat){
		frmObj.assetSerialNo.focus();
		return;
	}

	assetSpecification = trim(frmObj.assetSpecification.value);
	stat = checkNull("Description", assetSpecification);

	if(!stat){
		frmObj.assetSpecification.focus();
		return;
	}

	assetCondition = trim(frmObj.assetCondition.value);
	stat = checkNull("Present Condition", assetCondition);

	if(!stat){
		frmObj.assetCondition.focus();
		return;
	}

	assetAvailableFromDate = trim(frmObj.assetAvailableFromDate.value);
	stat = checkNull("Date Of Availability", assetAvailableFromDate);

	if(!stat){
		frmObj.assetAvailableFromDate.focus();
		return;
	}


	frmObj.action="../user/createAssetSubmit.jsp";
	frmObj.submit( );
}