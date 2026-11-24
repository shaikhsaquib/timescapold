function validate(){
	frmObj = document.frmInsuranceClaimApply;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";
	var num = "0123456789";

/*--------------Claim Item check begins--------------*/
	/*
		1) It should not be Null
	*/

	itemName = Trim(frmObj.itemName.value);

	stat = checkNull("Claim Item", itemName);

	if(!stat){
		frmObj.itemName.focus();
		return;
	}

	itemDesc = Trim(frmObj.itemDesc.value);

	stat = checkNull("Claim Item description", itemDesc);

	if(!stat){
		frmObj.itemDesc.focus();
		return;
	}

/*
	claimItem = Trim(frmObj.claimItem.options[frmObj.claimItem.selectedIndex].value);
	claimItemValue = claimItem.split("|",2);
	if(claimItem == "others")
	{
		claimItemName = Trim(frmObj.claimItemText.value);
	}
	else{
		claimItemName = claimItemValue[1];
	}


	// Checking for Null
	stat = checkNull("Claim Item", claimItem);

	if(!stat){
		frmObj.claimItem.focus();
		return;
	}

	stat = checkNull("Other Claim Item", claimItemName);

	if(!stat){
		frmObj.claimItemName.focus();
		return;
	}
*/
/*--------------Claim Item check ends--------------*/

/*--------------Damage Date check begins--------------*/
	/*
		1) It should not be Null
		2) It should not be greater than Current Date
	*/
	damageDate = Trim(frmObj.damageDate.value);

	// Checking for Null
	stat = checkNull("Damage Date", damageDate);
	if(!stat){
		frmObj.damageDate.focus();
		return;
		}
	
/*--------------Damage Date check ends--------------*/


/*--------------Damage Cause check begins--------------*/
	/*
		1) It should not be Null
	*/
	damageCause = Trim(frmObj.damageCause.value);

	// Checking for Null
	stat = checkNull("Damage Cause", damageCause);

	if(!stat){
		frmObj.damageCause.focus();
		return;
	}

/*--------------Damage Cause check ends--------------*/

/*--------------Damage Amount Location check begins--------------*/

	damageAmount = Trim(frmObj.damageAmount.value);

	stat = checkNull("Damage Amount", damageAmount);

	if(!stat){
		frmObj.damageAmount.focus();
		return;
	}

	stat = checkAmt("Probable & Estimated Loss / Damage" , damageAmount , num);

	if(!stat){
		frmObj.damageAmount.focus();
		return;
	}

	stat1= parseFloat(frmObj.damageAmount.value);
	
	if(stat1 < 1){
		alert("The Amount must be greater than 0");
		frmObj.damageAmount.focus();
		return;
	}

/*--------------Damage Amount check ends--------------*/

/*--------------Submission Date check begins--------------*/
	/*
		1) It should not be Null
		2) It should not be less than Current Date
	*/
	/*submissionDate = Trim(frmObj.submissionDate.value);

	stat = checkNull("Submission Date", submissionDate);

	if(!stat){
		frmObj.submissionDate.focus();
		return;
		}*/

/*--------------Submission Date check ends--------------*/

/*--------------Place of Loss check begins--------------*/

	placeOfLoss = Trim(frmObj.placeOfLoss.value);

	stat = checkNull("Place of Loss", placeOfLoss);

	if(!stat){
		frmObj.placeOfLoss.focus();
		return;
	}

	stat = checkJunk("Place of Loss" , placeOfLoss, junk);
	
	if(!stat){
		frmObj.placeOfLoss.focus();
		return;
	}

	stat = checkNumInName("Place of Loss" , placeOfLoss, num);
	
	if(!stat){
		frmObj.placeOfLoss.focus();
		return;
	}

/*--------------Place of Loss check ends--------------*/

/*--------------Contact Name check begins--------------*/

	contactName = Trim(frmObj.contactName.value);

	stat = checkNull("Name", contactName);

	if(!stat){
		frmObj.contactName.focus();
		return;
	}

	stat = checkJunk("Name" , contactName, junk);
	
	if(!stat){
		frmObj.contactName.focus();
		return;
	}

	stat = checkNumInName("Name" , contactName, num);
	
	if(!stat){
		frmObj.contactName.focus();
		return;
	}

/*--------------Contact Name check ends--------------*/

/*--------------Contact Address check begins--------------*/

	contactAddress = Trim(frmObj.contactAddress.value);

	stat = checkNull("Address", contactAddress);

	if(!stat){
		frmObj.contactAddress.focus();
		return;
	}

/*--------------Contact Address check ends--------------*/

/*--------------Contact Phone No. check begins--------------*/

	contactPhoneNo = Trim(frmObj.contactPhoneNo.value);

	if((contactPhoneNo == null) || (contactPhoneNo== "") || (contactPhoneNo =="0")){

		contactPhoneNo= "00000000";
	}

	stat = checkNull("Phone No" , contactPhoneNo);
	
	if(!stat){
		frmObj.contactPhoneNo.focus();
		return;
	}


/*--------------Contact Phone No. check ends--------------*/

/*--------------Contact Fax No. check begins--------------*/

	contactFaxNo = Trim(frmObj.contactFaxNo.value);

	if((contactFaxNo == null) || (contactFaxNo== "") || (contactFaxNo =="0")){

		contactFaxNo= "00000000";
	}

	stat = checkNull("Fax No." , contactFaxNo);
	
	if(!stat){
		frmObj.contactFaxNo.focus();
		return;
	}

/*--------------Contact Fax No. check ends--------------*/

/*--------------Contact Mobile No. check begins--------------*/

	contactMobileNo = Trim(frmObj.contactMobileNo.value);

	stat = checkNull("Mobile No.", contactMobileNo);

	if(!stat){
		frmObj.contactMobileNo.focus();
		return;
	}

	/*stat = checkAmt("Mobile No" , contactMobileNo , num);
	
	if(!stat){
		frmObj.contactMobileNo.focus();
		return;
	}*/

	stat = checkMobileNoLength("Mobile No" , contactMobileNo);
	
	if(!stat){
		frmObj.contactMobileNo.focus();
		return;
	}

/*--------------Contact Mobile No. check ends--------------*/

/*--------------Contact Email Id check begins--------------*/

	contactEmailId = Trim(frmObj.contactEmailId.value);

	stat = checkNull("Email Id", contactEmailId);

	if(!stat){
		frmObj.contactEmailId.focus();
		return;
	}

	stat = checkEmail('contactEmailId');
	if(!stat){

		frmObj.contactEmailId.focus();
		return;
	}

/*--------------Contact Email Id check ends--------------*/


	frmObj.hidContactPhoneNo.value = contactPhoneNo;
	frmObj.hidContactFaxNo.value = contactFaxNo;
	
	frmObj.action = "../requestor/insuranceClaimApplyPreview.jsp";
	frmObj.submit();
}


/*function addTextParent(name)
{
	document.getElementById('nominee').value+=name;
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
    
    //var element = document.getElementById(element_id);

    var message = "";
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
    //alert(processingRequest);    
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

function attachmentFile()
{
	    var frmObj = document.frmNomination;

		uploadFilePath = frmObj.uploadFilePath.value;
		
		if(uploadFilePath == "") {
		
			var url = "../upload/uploadFile.jsp?index=false";
			//alert(url);

			window.open(url,"File","width=375,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");

		} else {

			alert("You have already selected file");
		}
		
}

function countNomPerCat()
{
	frmObj = document.frmNomination;
	category = Trim(frmObj.category.value);
	categoryValues = category.split("|",3);

	month		= frmObj.month.options[frmObj.month.selectedIndex].value;
	year 		= frmObj.year.options[frmObj.year.selectedIndex].value;
	//alert(month+ "  "+ year);
	//alert('../includes/countNomPerCategory.jsp?parentCatCode='+categoryValues[1]+'&categoryCode='+categoryValues[2]+'&month='+month+'&year='+year,'checkNomCount','Count');
	//loadFragment('../includes/countNomPerCategory.jsp?parentCatCode='+categoryValues[1],'checkNomCount','Count');
	loadFragment('../includes/countNomPerCategory.jsp?parentCatCode='+categoryValues[1]+'&categoryCode='+categoryValues[2]+'&month='+month+'&year='+year,'checkNomCount','Count');
}

function otherItems(){

	frmObj = document.frmInsuranceClaimApply;

	claimItem = Trim(frmObj.claimItem.value);

	if(claimItem == "others")
	{
		var text1 = "<input type = \"text\" name = \"claimItemText\" >";
		document.getElementById("otherItem").innerHTML = text1;
	}
	else
	{
		var text1 = "";
		document.getElementById("otherItem").innerHTML = text1;
	}
}*/