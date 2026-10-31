function assetValidate(status,frmName)
{

	//var frmObj							= e"document."+frmName;
	var frmObj = eval("document."+frmName);

	var alfa							= "abcdefghijklmnopqrstuvwxyz";
	var num = "0123456789";
	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var junk2 = "!~+%<>?`;#$%^&*()=|[]{}";
	var valid;

	var userDeptArray   = new Array();
	var bncHeadArray   = new Array();
	var supportedHeadArray   = new Array();
	var approvedHeadArray   = new Array();
	var newAllArray   = new Array();

	var userDeptArrayCounter = -1;
	var bncHeadArrayCounter = -1;
	var supportedHeadArrayCounter = -1;
	var approvedHeadArrayCounter = -1;


	var disposalName				= document.getElementById("disposalName").value;

	valid = checkJunk("Disposal Name ", disposalName, junk);
	if(!valid){
		document.getElementById('disposalName').focus();
		document.getElementById('disposalName').value = "";
		return;
	}

	document.getElementById("createdDate").disabled = false;	

	var location1						= document.getElementById("location1").value;
	
	var dispProposedBy					= document.getElementById("dispProposedBy").value;

	var dispApprovedBy					= document.getElementById("dispApprovedBy").value;

	if(dispProposedBy !='' && dispApprovedBy !=''  )
	{
		if(dispProposedBy == dispApprovedBy)
		{
			alert("Disposal proposed by and approved by should not be same!!");
			document.getElementById("dispApprovedBy").focus();				
			return;

		}
	}


	var userTextComments = document.getElementById("userTextComments");

	/*valid = checkJunk("Comments ", userTextComments.value, junk);
	if(!valid){
		document.getElementById('userTextComments').focus();
		document.getElementById('userTextComments').value = "";
		return;
	}*/

	document.getElementById("totalValue").disabled = false;	
	document.getElementById("disposalType").disabled = false;	
	
	//var totalValue = document.getElementsByName("totalValue").value;
	var totalVOMValue = document.getElementById("totalVOMValue").value;
	var totalValue = document.getElementById("totalValue").value;

	var tableSize = document.getElementById("tabSize").value;
	var disposalType = document.getElementById("disposalType").value;

	
	flag = 0;
	
	for(j = 0; j < tableSize; j++) 
	{
		desc = document.getElementById("desc"+j);
		quantity = document.getElementById("quantity"+j);
		valueOfMaterials = document.getElementById("valueOfMaterials"+j);
		finalNegotiatedAmt = document.getElementById("finalNegotiatedAmt"+j);
		finalHighestBidder = document.getElementById("finalHighestBidder"+j);
		comments = document.getElementById("comments"+j);

		if(trim(desc.value)!='')
		{		
			if(trim(quantity.value)=='' || trim(finalNegotiatedAmt.value)=='' || trim(finalHighestBidder.value)=='' || trim(comments.value)=='' ){

				alert("Please fill the values in a respective row!!");
				desc.focus();				
				return;
			}
			
			if(valueOfMaterials.value == '')
			{
				document.getElementById('valueOfMaterials'+j).value = "NA";
			}

			flag++;
		}

		valid = checkNum("Description", desc.value, num);
		if(!valid){
			document.getElementById('desc'+j).focus();
			document.getElementById('desc'+j).value = "";
			return;
		}


		valid = checkJunk("Description", desc.value, junk);
		if(!valid){
			document.getElementById('desc'+j).focus();
			document.getElementById('desc'+j).value = "";
			return;
		}


		if (isNaN(quantity.value))
		{
			alert("Please enter only numbers .");
			document.getElementById("quantity"+j).value="0.00";			
			document.getElementById("quantity"+j).focus();				
			return;
		}
		valid = checkJunk("Value Of Materials", valueOfMaterials.value, junk);
		if(!valid){
			document.getElementById('valueOfMaterials'+j).focus();
			document.getElementById('valueOfMaterials'+j).value = "NA";
			return;
		}


		valid = checkNum("Final Highest Bidder ", finalHighestBidder.value, num);
		if(!valid){
			document.getElementById('finalHighestBidder'+j).focus();
			document.getElementById('finalHighestBidder'+j).value = "";
			return;
		}

		valid = checkJunk("Final Highest Bidder ", finalHighestBidder.value, junk);
		if(!valid){
			document.getElementById('finalHighestBidder'+j).focus();
			document.getElementById('finalHighestBidder'+j).value = "";
			return;
		}


		valid = checkNum("Comments ", comments.value, num);
		if(!valid){
			document.getElementById('comments'+j).focus();
			document.getElementById('comments'+j).value = "";
			return;
		}

		valid = checkJunk("Comments ", comments.value, junk);
		if(!valid){
			document.getElementById('comments'+j).focus();
			document.getElementById('comments'+j).value = "";
			return;
		}
	
	}
	
	if(flag==0)
	{
		alert("Please enter at least one details!");
		document.getElementById("desc0").focus();
		return;
	}

	var userDeptHeadSize = document.getElementById("userDeptHeadSize").value;
	var branchHeadSize = document.getElementById("branchHeadSize").value;
	var supportedHeadSize = document.getElementById("supportedHeadSize").value;
	var approvedBySize = document.getElementById("approvedBySize").value;

	var hiddenDirSizeComp;
	var hiddenDirSizeAdd;

	var hiddenFileNameComp;
	var hiddenFileNameAdd;


	if(disposalType == 'Fixed Asset Disposal')
	{
		hiddenDirSizeComp ="hiddDirectorySizefixedassetcompulsory";
		hiddenDirSizeAdd ="hiddDirectorySizefixedassetadditional";


		hiddenFileNameComp = "hiddFilesName1fixedassetcompulsory";
		hiddenFileNameAdd = "hiddFilesName1fixedassetadditional";
	}
	else if(disposalType == 'One-off Miscellaneous') 
	{

		hiddenDirSizeComp ="hiddDirectorySizeoneoffcompulsory";
		hiddenDirSizeAdd ="hiddDirectorySizeoneoffadditional";

		hiddenFileNameComp = "hiddFilesName1oneoffcompulsory";
		hiddenFileNameAdd = "hiddFilesName1oneoffadditional";


	}else if(disposalType == 'Damaged Newsprint Disposal')
	{
		hiddenDirSizeComp ="hiddDirectorySizedamagedcompulsory";
		hiddenDirSizeAdd ="hiddDirectorySizedamagedadditional";

		hiddenFileNameComp = "hiddFilesName1damagedcompulsory";
		hiddenFileNameAdd = "hiddFilesName1damagedadditional";
		
	}


	var compAttachmentSize = document.getElementById(hiddenDirSizeComp).value;

	var addAttachmentSize = document.getElementById(hiddenDirSizeAdd).value;


	if(status == 'inProcess')
	{
		stat = checkNull("Disposal Name", disposalName);
		if(!stat)
		{
			document.getElementById('disposalName').focus();
			return;
		}

		if(location1=="")
		{
			alert("Please Enter Location");
			document.getElementById('location1').focus();
			return;
		}
	
		stat = checkNull("Location", location1);
		if(!stat)
		{
			document.getElementById('location1').focus();
			return;
		}
		valid = checkJunk("location1", location1, junk2);
		if(!valid){
			document.getElementById('location1').focus();
			document.getElementById('location1').value = "";
			return;
		}

		if(disposalType == 'Damaged Newsprint Disposal')
		{
			document.getElementById('dispProposedBy').val = "NA";
			document.getElementById('dispApprovedBy').val = "NA";

		}else
		{
			if(dispProposedBy=="")
			{
				alert("Please Enter Disposal Proposed By");
				document.getElementById('dispProposedBy').focus();
				return;
			}
			stat = checkNull("Proposed By", dispProposedBy);
			if(!stat)
			{
				document.getElementById('dispProposedBy').focus();
				return;
			}
			if(!checkEmail(dispProposedBy)){			
				alert("Invalid Email Id");	
				document.getElementById('dispProposedBy').focus();
				return;
			}
			valid = checkJunk("Proposed By", dispProposedBy, junk2);
			if(!valid){
				document.getElementById('dispProposedBy').focus();
				document.getElementById('dispProposedBy').value = "";
				return;
			}
			if(dispApprovedBy=="")
			{
				alert("Please Enter Disposal Approved By");
				document.getElementById('dispApprovedBy').focus();
				return;
			}		
			stat = checkNull("Approved By", dispApprovedBy);

			if(!stat)
			{
				document.getElementById('dispApprovedBy').focus();
				return;
			}
			if(!checkEmail(dispApprovedBy)){			
				alert("Invalid Email Id");	
				document.getElementById('dispApprovedBy').focus();
				return;
			}
			valid = checkJunk("Disposal Approved By", dispApprovedBy, junk2);
			if(!valid){
				document.getElementById('dispApprovedBy').focus();
				document.getElementById('dispApprovedBy').value = "";
				return;
			}
		}



		stat = checkNull("Comments", userTextComments.value);
		if(!stat)
		{
			document.getElementById('userTextComments').focus();
			return;
		}
		var vat = $('#vatNtds').val();
		/*var vatNTds = checkNull("VAT & TDS extra", vat);
		if(!stat)
		{
			document.getElementById('vatNtds').focus();
			return;
		}*/

		if(vat=="")
		{
			alert("Please Enter VAT & TDS extra");
			document.getElementById('vatNtds').focus();
			return;
		}	


		
		/*for(var i = 0; i < userDeptHeadSize; i++){
		
		var userDeptHead = document.getElementById("userDeptHead"+i).value;


			stat = checkNull("Department head Emailid", userDeptHead);

			if(!stat)
			{
				document.getElementById('userDeptHead'+i).focus();
				return;
			}
			if(!checkEmail(userDeptHead)){			
				alert("Invalid Email Id");	
				document.getElementById('userDeptHead'+i).focus();
				return;
			}
			valid = checkJunk("Department head Emailid", userDeptHead, junk2);
			if(!valid){
				document.getElementById('userDeptHead'+i).focus();
				document.getElementById('userDeptHead'+i).value = "";
				return;
			}
			userDeptArrayCounter++;
			userDeptArray[userDeptArrayCounter] = document.getElementById("userDeptHead"+i).value;
		}


		for(var j = 0; j <branchHeadSize; j++){

			var branchHead = document.getElementById("branchHead"+j).value;

			stat = checkNull("Branch head Emailid", branchHead);

			if(!stat)
			{
				document.getElementById('branchHead'+j).focus();
				return;
			}
			if(!checkEmail(branchHead)){			
				alert("Invalid Email Id");	
				document.getElementById('branchHead'+j).focus();
				return;
			}
			valid = checkJunk("Branch head Emailid", branchHead, junk2);
			if(!valid){
				document.getElementById('branchHead'+j).focus();
				document.getElementById('branchHead'+j).value = "";
				return;
			}

			document.getElementById('branchHead'+j).disabled = false;	

			bncHeadArrayCounter++;
			bncHeadArray[bncHeadArrayCounter] = document.getElementById("branchHead"+j).value;
		}

		for(var k = 0; k <supportedHeadSize; k++)
		{
			var supportedHead = document.getElementById("supportedHead"+k).value;

			stat = checkNull("Supported by", supportedHead);

			if(!stat)
			{
				document.getElementById('supportedHead'+k).focus();
				return;
			}
			if(!checkEmail(supportedHead)){			
				alert("Invalid Email Id");	
				document.getElementById('supportedHead'+k).focus();
				return;
			}
			valid = checkJunk("Supported by", supportedHead, junk2);
			if(!valid){
				document.getElementById('supportedHead'+k).focus();
				document.getElementById('supportedHead'+k).value = "";
				return;
			}
			supportedHeadArrayCounter++;
			supportedHeadArray[supportedHeadArrayCounter] = document.getElementById("supportedHead"+k).value;
		}

		for(var l = 0; l <approvedBySize; l++)
		{
			var approvedBy = document.getElementById("approvedBy"+l).value;

			stat = checkNull("Approved by", approvedBy);

			if(!stat)
			{
				document.getElementById('approvedBy'+l).focus();
				return;
			}
			if(!checkEmail(approvedBy)){			
				alert("Invalid Email Id");	
				document.getElementById('approvedBy'+l).focus();
				return;
			}
			valid = checkJunk("Approved by", approvedBy, junk2);
			if(!valid){
				document.getElementById('approvedBy'+l).focus();
				document.getElementById('approvedBy'+l).value = "";
				return;
			}
			approvedHeadArrayCounter++;
			approvedHeadArray[approvedHeadArrayCounter] = document.getElementById("approvedBy"+l).value;
		}*/

		var comAttachmentName	 = "";
		var addAttachmentName	 = "";
		if(compAttachmentSize > '0'){
			for(ii=0; ii<compAttachmentSize; ii++){
				comAttachmentName = document.getElementById(hiddenFileNameComp+ii).value;
			}
		}else{

			alert("Please select atleast one Compulsory attachement.");
			return;
		}


		if(addAttachmentSize > '0'){
			for(ii=0; ii<addAttachmentSize; ii++){
				addAttachmentName	= document.getElementById(hiddenFileNameAdd+ii).value;
			}
		}

		document.getElementById('frmStatus').value = 'I';

	}else if(status == 'draft'){
	
			
		document.getElementById('frmStatus').value = 'D';


	}


	if(disposalType == "Fixed Asset Disposal" || disposalType =="One-off Miscellaneous" )
	{
		for(var i = 0; i < userDeptHeadSize; i++){
		
		var userDeptHead = document.getElementById("userDeptHead"+i).value;


			stat = checkNull("Department head Emailid", userDeptHead);

			if(!stat)
			{
				document.getElementById('userDeptHead'+i).focus();
				return;
			}
			if(!checkEmail(userDeptHead)){			
				alert("Invalid Email Id");	
				document.getElementById('userDeptHead'+i).focus();
				return;
			}
			valid = checkJunk("Department head Emailid", userDeptHead, junk2);
			if(!valid){
				document.getElementById('userDeptHead'+i).focus();
				document.getElementById('userDeptHead'+i).value = "";
				return;
			}
			userDeptArrayCounter++;
			userDeptArray[userDeptArrayCounter] = document.getElementById("userDeptHead"+i).value;
		}


		for(var j = 0; j <branchHeadSize; j++){

			var branchHead = document.getElementById("branchHead"+j).value;

			stat = checkNull("B&C Emailid", branchHead);

			if(!stat)
			{
				document.getElementById('branchHead'+j).focus();
				return;
			}
			if(!checkEmail(branchHead)){			
				alert("Invalid Email Id");	
				document.getElementById('branchHead'+j).focus();
				return;
			}
			valid = checkJunk("B&C head Emailid", branchHead, junk2);
			if(!valid){
				document.getElementById('branchHead'+j).focus();
				document.getElementById('branchHead'+j).value = "";
				return;
			}

			document.getElementById('branchHead'+j).disabled = false;	

			bncHeadArrayCounter++;
			bncHeadArray[bncHeadArrayCounter] = document.getElementById("branchHead"+j).value;
		}

		for(var k = 0; k <supportedHeadSize; k++)
		{
			var supportedHead = document.getElementById("supportedHead"+k).value;

			stat = checkNull("MAS / Finance", supportedHead);

			if(!stat)
			{
				document.getElementById('supportedHead'+k).focus();
				return;
			}
			if(!checkEmail(supportedHead)){			
				alert("Invalid Email Id");	
				document.getElementById('supportedHead'+k).focus();
				return;
			}
			valid = checkJunk("MAS / Finance", supportedHead, junk2);
			if(!valid){
				document.getElementById('supportedHead'+k).focus();
				document.getElementById('supportedHead'+k).value = "";
				return;
			}
			supportedHeadArrayCounter++;
			supportedHeadArray[supportedHeadArrayCounter] = document.getElementById("supportedHead"+k).value;
		}

		for(var l = 0; l <approvedBySize; l++)
		{
			var approvedBy = document.getElementById("approvedBy"+l).value;

			stat = checkNull("Approved by", approvedBy);

			if(!stat)
			{
				document.getElementById('approvedBy'+l).focus();
				return;
			}
			if(!checkEmail(approvedBy)){			
				alert("Invalid Email Id");	
				document.getElementById('approvedBy'+l).focus();
				return;
			}
			valid = checkJunk("Approved by", approvedBy, junk2);
			if(!valid){
				document.getElementById('approvedBy'+l).focus();
				document.getElementById('approvedBy'+l).value = "";
				return;
			}
			approvedHeadArrayCounter++;
			approvedHeadArray[approvedHeadArrayCounter] = document.getElementById("approvedBy"+l).value;
		}
	}

	
	if(arrHasDupes(userDeptArray))  
	{
		alert("EmailId should not be same in User department.");
		document.getElementById('userDeptHead0').focus();
		return;
	}


	if(arrHasDupes(bncHeadArray))  
	{
		alert("EmailId should not be same in B&C.");
		document.getElementById('branchHead0').focus();
		return;
	}

	if(arrHasDupes(supportedHeadArray))  
	{
		alert("EmailId should not be same in MAS / Finance.");
		document.getElementById('supportedHead0').focus();
		return;
	}

	if(arrHasDupes(approvedHeadArray))  
	{
		alert("EmailId should not be same in Approved by.");
		document.getElementById('approvedBy0').focus();
		return;
	}


	newAllArray = userDeptArray.concat(bncHeadArray,supportedHeadArray,approvedHeadArray);

	if(arrHasDupes(newAllArray))  
	{
		alert("EmailId should not be same in Approvals.");
		document.getElementById('approvedBy0').focus();
		return;
	}

if(disposalType == "Fixed Asset Disposal" )
	{

		if(totalVOMValue > 0.00 && totalVOMValue < 100000.00)
		{
			if(branchHeadSize < 2)
			{
				alert("The minimum no. of required participants in B&C should be two or more than two, for sales order amount should be greater than 0 and less than 1L. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

		}else if(totalVOMValue >= 100000.00 && totalVOMValue < 2000000.00)
		{
			if(branchHeadSize <3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 1L and less than 20L. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

		}else if(totalVOMValue >= 2000000.00 && totalVOMValue < 10000000.00)
		{
			//if(branchHeadSize <4)
			if(branchHeadSize <3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 20L and less than 1cr. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

			if(supportedHeadSize < 2)
			{
				alert("The minimum no. of required participants in MAS / Finance should be two or more than two, for sales order amount should be greater than 20L and less than 1cr. Please select addtional participant.");
				document.getElementById('supportedHead0').focus();
				return;
			}

		}else if(totalVOMValue >= 10000000.00)
		{
			//if(branchHeadSize < 4)
			if(branchHeadSize < 3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 1cr. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}
			
			if(supportedHeadSize < 3)
			{
				alert("The minimum no. of required participants in MAS / Finance should be three, for sales order amount should be greater than 1cr. Please select addtional participant.");
				document.getElementById('supportedHead0').focus();
				return;
			}

		}else
		{
			//alert("Please fill the values in a respective row!!");
		}
	}

	if(disposalType =="One-off Miscellaneous")
	{

		if(totalValue > 0.00 && totalValue < 100000.00)
		{
			if(branchHeadSize < 2)
			{
				alert("The minimum no. of required participants in B&C should be two or more than two, for sales order amount should be greater than 0 and less than 1L. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

		}else if(totalValue >= 100000.00 && totalValue < 2000000.00)
		{
			if(branchHeadSize <3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 1L and less than 20L. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

		}else if(totalValue >= 2000000.00 && totalValue < 10000000.00)
		{
			//if(branchHeadSize <4)
			if(branchHeadSize <3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 20L and less than 1cr. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}

			if(supportedHeadSize < 2)
			{
				alert("The minimum no. of required participants in MAS / Finance should be two or more than two, for sales order amount should be greater than 20L and less than 1cr. Please select addtional participant.");
				document.getElementById('supportedHead0').focus();
				return;
			}

		}else if(totalValue >= 10000000.00)
		{
			//if(branchHeadSize < 4)
			if(branchHeadSize < 3)
			{
				alert("The minimum no. of required participants in B&C should be three, for sales order amount should be greater than 1cr. Please select addtional participant.");
				document.getElementById('branchHead0').focus();
				return;
			}
			
			if(supportedHeadSize < 3)
			{
				alert("The minimum no. of required participants in MAS / Finance should be three, for sales order amount should be greater than 1cr. Please select addtional participant.");
				document.getElementById('supportedHead0').focus();
				return;
			}

		}else
		{
			//alert("Please fill the values in a respective row!!");
		}
	}


	if(frmName == 'frmCreateFixedAsset'){
		url = "../user/wsDisposalSubmit.jsp";

	}else if(frmName == 'frmDratfView'){

		url = "../common/draftDisposalSubmit.jsp";
	
	}	
	frmObj.action = url;
	frmObj.submit( );
}

function indexCal(row) 
{
	
	var index				= "";

	var  percentage			="";
	var  quantity			="";

	var  addResult			= 0;
	var  addResult1			= 0;
	var  finalNegotiatedAmt1	= 0;
	var  quantity	= 0;
	var  quantity1	= 0;
	var  valueOfMaterials	="";
	var  valueOfMaterials1	= 0;
	var multiOfQuantityFinalNego = 0;
	var multiOfQuantityValOfMat = 0;
	
	var tableSize = document.getElementById("tabSize").value;	
	var disposalTypeFrm					= document.getElementById("disposalType").value;
	var txtAmtName ="";

	for(j = 0; j <  tableSize; j++) 
	{
		
		finalNegotiatedAmt = document.getElementById("finalNegotiatedAmt"+j).value;
		quantity = document.getElementById("quantity"+j).value;
		valueOfMaterials = document.getElementById("valueOfMaterials"+j).value;


		//if(trim(finalNegotiatedAmt)!='' || trim(valueOfMaterials)!='')
		//{	
			if (isNaN(finalNegotiatedAmt))
			{
				alert("Please enter only numbers .");
				document.getElementById("finalNegotiatedAmt"+j).value="0";			
				document.getElementById("finalNegotiatedAmt"+j).focus();				
				return;
			}

			if (isNaN(quantity))
			{
				alert("Please enter only numbers .");
				document.getElementById("quantity"+j).value="0";			
				document.getElementById("quantity"+j).focus();				
				return;
			}

			if (isNaN(valueOfMaterials))
			{
				alert("Please enter only numbers .");
				document.getElementById("valueOfMaterials"+j).value="0";			
				document.getElementById("valueOfMaterials"+j).focus();				
				return;
			}

			finalNegotiatedAmt1 = finalNegotiatedAmt;
			quantity1 = quantity;
			valueOfMaterials1 = valueOfMaterials;
			var totalAmount = document.getElementById("totalValue").value;
			var totalVOMAmount = document.getElementById("totalVOMValue").value;

			if(disposalTypeFrm == "Fixed Asset Disposal")
			{	
				if(trim(valueOfMaterials)!='')
				{
					multiOfQuantityValOfMat = parseFloat(valueOfMaterials1) * parseFloat(quantity1);

					addResult1 = parseFloat(addResult1) + parseFloat(multiOfQuantityValOfMat);
				}

				if(trim(finalNegotiatedAmt)!='')
				{
					multiOfQuantityFinalNego = parseFloat(finalNegotiatedAmt1) * parseFloat(quantity1);
					addResult = parseFloat(addResult) + parseFloat(multiOfQuantityFinalNego);
				}
				
			}else
			{
				if(trim(finalNegotiatedAmt)!='')
				{
					multiOfQuantityFinalNego = parseFloat(finalNegotiatedAmt1) * parseFloat(quantity1);

					addResult = parseFloat(addResult) + parseFloat(multiOfQuantityFinalNego);
				}

				if(trim(valueOfMaterials)!='')
				{
					multiOfQuantityValOfMat = parseFloat(valueOfMaterials1) * parseFloat(quantity1);

					addResult1 = parseFloat(addResult1) + parseFloat(multiOfQuantityValOfMat);
				}
			}


		//}
		
	}

	if (isNaN(totalAmount))
	{
		document.getElementById("totalValue").value="0";
	}
	if (isNaN(totalVOMAmount))
	{
		document.getElementById("totalVOMValue").value="0";
	}

	
	if (isNaN(addResult1))
	{
		document.getElementById("totalVOMValue").value="0";
	}
		
				
	document.getElementById("totalValue").value =  Math.round(addResult);
	document.getElementById("totalVOMValue").value =  Math.round(addResult1);

	if(disposalTypeFrm == "Fixed Asset Disposal")
	{
		//alert("hi----"+disposalTypeFrm);
		changeApprovals(addResult1);

	}else if(disposalTypeFrm =="One-off Miscellaneous")
	{
		//alert("bye--"+disposalTypeFrm);
		changeApprovals(addResult);

	}else
	{
		//alert("dnp==="+disposalTypeFrm);
		changeApprovalsDNP(addResult);
	}

	

	/*if(disposalTypeFrm == "Fixed Asset Disposal")
	{	
		txtAmtName = "valueOfMaterials";

	}else
	{
		txtAmtName = "finalNegotiatedAmt";
	}




	for(j = 0; j <  tableSize; j++) 
	{
		
		finalNegotiatedAmt = document.getElementById(txtAmtName+j).value;

		if(trim(finalNegotiatedAmt)!='')
		{	
			if (isNaN(finalNegotiatedAmt))
			{
				alert("Please enter only numbers .");
				document.getElementById(txtAmtName+j).value="0.00";			
				document.getElementById(txtAmtName+j).focus();				
				return;
			}
			finalNegotiatedAmt1 = finalNegotiatedAmt;
			//alert("finalNegotiatedAmt1-------"+finalNegotiatedAmt1);
			//document.getElementById("totalValue").disabled = false;	

			var totalAmount = document.getElementById("totalValue").value;

			addResult = parseFloat(addResult) + parseFloat(finalNegotiatedAmt1);

				//document.getElementById("totalValue").disabled = true;
		}
		
	}
	if (isNaN(addResult))
	{
		document.getElementById("totalValue").value="0.00";
	}
		
				
	document.getElementById("totalValue").value =  addResult.toFixed(2);

	var totalSales = addResult.toFixed(2);

	if(disposalTypeFrm == "Fixed Asset Disposal" || disposalTypeFrm =="One-off Miscellaneous")
	{

		changeApprovals(addResult);
	}*/

}



function attachmentDisposalFile(attachDetails, str){			
	var url			= "../upload/fixedUploadFile.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=170, left=450,top=200,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");	
}

function onLoadDetail1(str){
	
	if(str == '0'){
		loadFragment2("../common/fixedDirListing.jsp?attachment=fixedassetcompulsory&str="+str,"attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment=fixedassetadditional&str="+str,"attachment1","Attachment");
	}else 	{

		loadFragment2("../common/fixedDirListing.jsp?attachment=fixedassetcompulsory&str=1","attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment=fixedassetadditional&str=1","attachment1","Attachment");
	}
}


function actApproval(act,iid){	 
	
	var frmObj	= document.forms.viewDisposal;

	eval("document.getElementById('"+iid+"')").disabled = true;

	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";

	document.getElementById("createdDate").disabled = false;
	document.getElementById("userTextComments").disabled = false;
	//document.getElementById("location1").disabled = false;
	//document.getElementById("dispProposedBy").disabled = false;
	//document.getElementById("dispApprovedBy").disabled = false;

	var userDeptHeadSize = document.getElementById("userDeptHeadSize").value;
	var branchHeadSize = document.getElementById("branchHeadSize").value;
	var supportedHeadSize = document.getElementById("supportedHeadSize").value;
	var approvedBySize = document.getElementById("approvedBySize").value;
	var remarks = document.getElementById("remarks").value;
/*
	for(var i = 0; i < userDeptHeadSize; i++)
	{
		document.getElementById("userDeptHead"+i).disabled = false;
	}
	
	for(var j = 0; j < branchHeadSize; j++)
	{
		document.getElementById("branchHead"+j).disabled = false;
	}

	for(var k = 0; k < supportedHeadSize; k++)
	{
		document.getElementById("supportedHead"+k).disabled = false;
	}

	for(var l = 0; l < approvedBySize; l++)
	{
		document.getElementById("approvedBy"+l).disabled = false;
	}
*/
	var stat = checkNull("Remarks", remarks);
	if(!stat)
	{
		document.getElementById('remarks').focus();
		enable(iid);
		return;
	}

	var valid = checkJunk("Remarks", remarks, junk);
	if(!valid){
		document.getElementById('remarks').focus();
		document.getElementById('remarks').value = "";
		enable(iid);
		return;
	}

	var url			= "../approvals/approvalDisposalNoteSubmit.jsp?act="+act;

	frmObj.action = url;
	frmObj.submit( );
}

function showDisposalDetails(requestId, status, docId){	
	
	var frmObj	= document.forms.viewAllWasteSalesRequest;
	var url;
	if(status == 'I' || status == 'A' || status == 'CL')
	{
		//url = "../common/disposalWSRequestDetails.jsp?requestId="+requestId;
		url = "../common/disposalWSRequestDetails.jsp?requestId="+requestId+"&docId="+docId;
	}else if(status == 'D' || status == 'R')
	{
		url = "../common/draftDisposalWSRequestDetails.jsp?requestId="+requestId+"&docId="+docId;
		//url = "../common/draftDisposalWSRequestDetails.jsp?requestId="+requestId;
	}
	frmObj.action = url;
	frmObj.submit( );
}


function onLoadFixedDetail(str,compFolderName, addFolderName){	

	if(str == '0'){ 
		//loadFragment2("../common/fixedDirListing.jsp?attachment=fixedasset&str="+str,"attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment="+compFolderName+"&str="+str,"attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment="+addFolderName+"&str="+str,"attachment1","Attachment");

	}else 	{
		//loadFragment2("../common/fixedDirListing.jsp?attachment=fixedasset&str=1","attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment="+compFolderName+"&str=1","attachment","Attachment");
		loadFragment2("../common/fixedDirListing.jsp?attachment="+addFolderName+"&str=1","attachment1","Attachment");
	}
}

function fixedDeleteFile(fileName,dirPath,str){
	
	//var url = "../common/fixedDeleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str;
	var url = "../common/fixedDeleteFile.jsp?fileName="+fileName+"&id=delete";

	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
} 


function showCurrentFile(fileName, emailid,str,attachment){

	var url			= "/timescape/sapep/collaboration/workflow/wastesalesapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	//var url			= "../includes/popupNew.jsp?str=1";
	window.location.href = url;
}


function showFixedAttachmentFile(str, requestId, userEmailId, status, compAttachment, addAttachment){	

	//loadFragment2("../common/showFixedDirListing.jsp?attachment="+compAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	//alert("hi");
	loadFragment2("../common/showFixedDirListing.jsp?attachment="+compAttachment+"&str=1","attachment","Attachment");
	//loadFragment2("../common/showFixedDirListing.jsp?attachment="+addAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment1","Attachment");
	loadFragment2("../common/showFixedDirListing.jsp?attachment="+addAttachment+"&str=1","attachment1","Attachment");
}

function showAttachedFile(fileName, emailid,str,requestId,attachment){


	var url			= "../includes/popupNew.jsp?fileName="+fileName+"&str=1&attachment="+attachment;
	//var url			= "/timescape/sapep/collaboration/workflow/wastesalesapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	//var url			= "../includes/popupNew.jsp?str=1";
	window.location.href = url;
}


function loadFragment2(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}

function arrHasDupes( A ) {                          // finds any duplicate array elements using the fewest possible comparison
	var i, j, n;
	n=A.length;
                                                     // to ensure the fewest possible comparisons
	for (i=0; i<n; i++) {                        // outer loop uses each item i at 0 through n
		for (j=i+1; j<n; j++) {              // inner loop only compares items j at i+1 to n
			if (A[i]==A[j]) return true;
	}	}
	return false;
}

function checkDecimal(val) 
{
	//alert("val----"+val);
	if (val.length >= 3)
		if (/\d*\.\d\d$/.test(val))
			return true;
		else {
			alert("Only two decimal places allowed");
			return false;
			}
}
function lookupAll(inputString,idText,idList,urlText, id) {
	var url;
	if(inputString.length == 0) {
		$('#'+idText).hide();
	} else {		
		
		if(urlText=='email'){
			url = "../common/searchEmail.jsp";
		}
		if(urlText=='dept'){
			url = "../common/searchDeptEmail.jsp";
		}
		if(urlText=='loc'){
			url = "../common/searchLocation.jsp";
		}
		
		$.post(url, {queryString: ""+inputString+"" ,displayId : idText ,hideId : idList,Dispid : id }, function(data){
		if(data.trim().length > 0) {
		$('#'+idText).show();
		$('#'+idList).html(data);
	}else{
		$('#'+idText).hide();
		}
		});
	}
}
function fill(thisValue,id,id1) {
	//$('#dispProposedBy').val(thisValue).focus();
	$('#'+id).val(thisValue).focus();
	//$('#mySuggestions').hide();
	$('#'+id1).hide();
}

function fillLocation(thisValue) {
	$('#location1').val(thisValue).focus();
	$('#myLocSuggestions').hide();
}

function fillDept(thisValue) {
	$('#dispApprovedBy').val(thisValue).focus();
	$('#mySuggestions1').hide();
}


function fillAll(thisValue,displayId,hideId) {
	
	$("#userDeptHead"+displayId).val(thisValue).focus();
	$("#suggestions"+hideId).hide();
	
}
function lookupAll2(inputString,idText,idList,urlText) {
	var url;
	if(inputString.length == 0) {
		$('#suggestions'+idText).hide();  
	} else {		
		
		if(urlText=='userEmail'){
			url = "../common/searchUserEmail.jsp";
		}
		$.post(url, {queryString: ""+inputString+"" ,displayId : ""+idText+"" ,hideId : ""+idList+"" }, function(data){
		if(data.trim().length > 0) {
		$('#suggestions'+idText).show();
		$('#autoSuggestionsList'+idList).html(data);
	}else{
		$('#suggestions'+idText).hide();
		}
		});
	}
}
function fillBNC(thisValue,displayId,hideId) {
	
	$("#branchHead"+displayId).val(thisValue).focus();
	$("#suggestionsBNC"+hideId).hide();
	
}
function lookupAll3(inputString,idText,idList,urlText) {
	var url;
	if(inputString.length == 0) {
		$('#suggestionsBNC'+idText).hide();  
	} else {		
		
		if(urlText=='branchEmail'){
			url = "../common/searchBNCEmail.jsp";
		}
		$.post(url, {queryString: ""+inputString+"" ,displayId : ""+idText+"" ,hideId : ""+idList+"" }, function(data){
		if(data.trim().length > 0) {
		$('#suggestionsBNC'+idText).show();
		$('#autoSuggestionsBNCList'+idList).html(data);
	}else{
		$('#suggestionsBNC'+idText).hide();
		}
		});
	}
}

function fillSupport(thisValue,displayId,hideId) {
	
	$("#supportedHead"+displayId).val(thisValue).focus();
	$("#suggestionsSupp"+hideId).hide();
	
}

function lookupAll4(inputString,idText,idList,urlText) {
	
	var url;
	if(inputString.length == 0) {
		$('#suggestionsSupp'+idText).hide();  
	} else {		
		
		if(urlText=='supportEmail'){
			url = "../common/searchSupportEmail.jsp";
		}
		$.post(url, {queryString: ""+inputString+"" ,displayId : ""+idText+"" ,hideId : ""+idList+"" }, function(data){
		if(data.trim().length > 0) {
		$('#suggestionsSupp'+idText).show();
		$('#autoSuggestionsSuppList'+idList).html(data);
	}else{
		$('#suggestionsSupp'+idText).hide();
		}
		});
	}
}
function fillApprove (thisValue,displayId,hideId) {
	
	$("#approvedBy"+displayId).val(thisValue).focus();
	$("#suggestionsAppr"+hideId).hide();
	
}

function lookupAll5(inputString,idText,idList,urlText) {
	
	var url;
	if(inputString.length == 0) {
		$('#suggestionsAppr'+idText).hide();  
	} else {		
		
		if(urlText=='approveEmail'){
			url = "../common/searchApproveEmail.jsp";
		}
		$.post(url, {queryString: ""+inputString+"" ,displayId : ""+idText+"" ,hideId : ""+idList+"" }, function(data){
		if(data.trim().length > 0) {
		$('#suggestionsAppr'+idText).show();
		$('#autoSuggestionsApprList'+idList).html(data);
	}else{
		$('#suggestionsAppr'+idText).hide();
		}
		});
	}
}

function checkEmail(email)
	{
	var regularExp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	
	if(!trim(email).match(regularExp))
	{
	//	alert("Invalid Email Address, Check  in  "+ email);
	//	document.getElementById(email).focus();
		return false;
	}
	else{
		return true;
	}
}


function changeApprovalsDNP(tolSalesOrder)
{
	var iboHead		= $('#iboHead').val();
	var fdHead		= $('#fdHead').val();
	var exepHead	= $('#exepHead').val();
	var masdHead	= $('#masdHead').val();

	$("#addr71").show();
	$("#add_row3").show();
	$('#approvedBy0').val(fdHead);
	$('#approvedBy0').prop('readonly', true);
	//$('#addr71').html("<td  class='text-center'>2</td> <td><input type='text' class='form-control charLen'  name='approvedBy1' id='approvedBy1' maxlength = '100' placeholder='Enter Email Id' value="+exepHead+" readonly /> </td>");		
	//	$('#tab_logic7').append('<tr id="addr72"></tr>');

	//$('#approvedBySize').val("2");

	$("#add_row7").hide();
	$("#delete_row7").hide();


}

function changeApprovals(tolSalesOrder)
{
	
	var iboHead		= $('#iboHead').val();
	var fdHead		= $('#fdHead').val();
	var exepHead	= $('#exepHead').val();
	var masdHead	= $('#masdHead').val();

	//alert("tolSalesOrder=="+tolSalesOrder);

	if(tolSalesOrder > 0.00 && tolSalesOrder < 100000.00)
	{
		$('#approvedBy0').val(iboHead);
		//$('#approvedBy0').prop('disabled', true);
		$('#approvedBy0').prop('readonly', true);
		

		//$('#branchHead2').prop('disabled', false).val("");
		//$('#branchHead3').prop('disabled', false).val("");
		$("#addr31").html('');
		$("#addr32").html('');
		$("#addr33").html('');
		$("#add_row3").show();
		$('#branchHeadSize').val("1");

		$("#addr51").html('');
		$("#addr52").html('');
		$('#supportedHeadSize').val("1");
		$("#add_row5").show();
		$("#addr71").hide();


	
	}else if(tolSalesOrder >= 100000.00 && tolSalesOrder < 2000000.00)
	{
		$("#addr71").show();
		//$('#approvedBy0').prop('disabled', false);
		$('#approvedBy0').val(fdHead);
		//$('#approvedBy0').prop('disabled', true);
		$('#approvedBy0').prop('readonly', true);

		$("#addr31").html('');
		$("#addr32").html('');
		$("#addr33").html('');

		$('#branchHeadSize').val("1");

		$("#add_row3").show();


		$("#addr51").html('');
		$("#addr52").html('');

		$('#supportedHeadSize').val("1");

		$("#add_row5").show();

		$("#addr71").hide();


	}else if(tolSalesOrder >= 2000000.00 && tolSalesOrder < 10000000.00)
	{
		$("#addr71").show();
		$("#add_row3").show();
		//$('#approvedBy0').prop('disabled', false);
		$('#approvedBy0').val(fdHead);
		//$('#approvedBy0').prop('disabled', true);
		$('#approvedBy0').prop('readonly', true);

		$('#addr71').html("<td  class='text-center'>2</td> <td><input type='text' class='form-control charLen'  name='approvedBy1' id='approvedBy1' maxlength = '100' placeholder='Enter Email Id' value="+exepHead+" readonly /> </td>");		
			$('#tab_logic7').append('<tr id="addr72"></tr>');

		$('#approvedBySize').val("2");

		//$('#approvedBy1').val(exepHead);
		//$('#approvedBy0').prop('disabled', true);
		//$('#approvedBy1').prop('readonly', true);

		$("#add_row5").show();

	}else if(tolSalesOrder >= 10000000.00)
	{
		$("#addr71").show();
		$("#add_row3").show();
		$('#approvedBy0').val(fdHead);
		$('#approvedBy0').prop('readonly', true);
		$('#addr71').html("<td  class='text-center'>2</td> <td><input type='text' class='form-control charLen'  name='approvedBy1' id='approvedBy1' maxlength = '100' placeholder='Enter Email Id' value="+exepHead+" readonly /> </td>");		
			$('#tab_logic7').append('<tr id="addr72"></tr>');

		$('#approvedBySize').val("2");



		//$('#approvedBy0').prop('disabled', false);
		//('#approvedBy1').val(exepHead);
		//$('#approvedBy0').prop('disabled', true);
		//$('#approvedBy1').prop('readonly', true);
	}else
	{
		//alert("Please enter Final Negotiated Amt.");
	}

	$("#add_row7").hide();
	$("#delete_row7").hide();
}

function enable(id)
{
	eval("document.getElementById('"+id+"')").disabled = false;
	return true;
}