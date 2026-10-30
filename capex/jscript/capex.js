
function loadFragment(fragment_url, element_id, for_what) {
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
/*
function checkBlank(fieldName,filedId){

	var fieldValue = document.getElementById(filedId).value;	
	if(fieldValue == null || fieldValue =='' || fieldValue.length=='0'){
		alert(" Kindly Enter "+fieldName + " !");
		document.getElementById(filedId).focus();
		return false;
	}else{
		if (!checkJunk(fieldValue)){
			alert(fieldName+" cannot contain junk characters !");
			//	document.getElementById(filedId).value = "";	
			document.getElementById(filedId).focus();
			return false;
		}else{
			document.getElementById(filedId).value = trim(fieldValue);
			return true;
		}
	}	
}
*/

function checkBlank(fieldName,filedId){

	var fieldValue = document.getElementById(filedId).value;	
	
	if(fieldValue == null || fieldValue ==''){
		alert(" Kindly Enter "+fieldName + " !");
		document.getElementById(filedId).focus();
		return false;
	}else{
		if (!checkJunk(fieldValue)){
			alert(fieldName+" cannot contain junk characters !~<>?`^|[]{}\\");
			//	document.getElementById(filedId).value = "";	
			document.getElementById(filedId).focus();
			return false;
		}else{
			document.getElementById(filedId).value = trim(fieldValue);
			return true;
		}
	}	
}

function BlankNumber(fieldName,filedId){
	var fieldValue = document.getElementById(filedId).value;
	
	if(fieldValue != null || fieldValue !=''){
		
		var finalValue = parseFloat(fieldValue).toFixed(2);
		if(finalValue == 'NaN'){
		  document.getElementById(filedId).value= "";
		}else{
		  document.getElementById(filedId).value= finalValue;
		}
		return true;
	}else {
		document.getElementById(filedId).value= "";

	}
}
function checkBlankNumber(fieldName,filedId){

	var fieldValue = document.getElementById(filedId).value;	
	fieldValue = trim(fieldValue);
	//alert(fieldValue);
	if(fieldValue == null || fieldValue ==''){
		alert(" Kindly Enter "+fieldName + " !");
		document.getElementById(filedId).focus();
		return false;
	}else{
		if(fieldValue.length > 10){
			alert("Maximum 7 digits number accept in "+fieldName+" !");			
			document.getElementById(filedId).focus();
			return false;
		}
		if (isNaN(fieldValue)){
			alert("Please enter only numbers in "+fieldName+" !");
			document.getElementById(filedId).value="0.00";
			document.getElementById(filedId).focus();
			return false;
		}else if (!checkJunkNumber(fieldValue)){
			alert(fieldName+" cannot contain junk characters !");
			document.getElementById(filedId).value="0.00";
			document.getElementById(filedId).focus();
			return false;
		}else{			
			var finalValue = parseFloat(fieldValue).toFixed(2);
			document.getElementById(filedId).value= finalValue;
			return true;
		}
	}
}


function checkBlankSelect(fieldName,filedId){

	var fieldValue = document.getElementById(filedId).value;	
	if(fieldValue == null || fieldValue =='' || fieldValue ==0){
		alert(" Kindly Select "+fieldName + " !");
		document.getElementById(filedId).focus();
		return false;
	}else {
		return true;
	}
}

function checkBlankTextField(fieldName,filedId){

	var fieldValue = document.getElementsByName(filedId)[0].value;	
	if(fieldValue == null || fieldValue ==''){
		alert(" Kindly Enter "+fieldName);
		document.getElementsByName(filedId)[0].focus();
		return false;
	}else{
		if (!checkJunk(fieldValue)){
			alert(fieldName+" cannot contain junk characters !");
			//	document.getElementById(filedId).value = "";	
			document.getElementsByName(filedId)[0].focus();
			return false;
		}else{
			document.getElementsByName(filedId)[0].value = trim(fieldValue);
			return true;
			}
	}	
}


function checkJunk(val)
{
	var junk = "!~<>?`^|[]{}\\";
	for (var i = 0; i <val.length;i++){
		for(var j=0;j < junk.length;j++){
			if(val.charAt(i)==junk.charAt(j)){
				//alert("Remark cannot contain junk characters !");
				return false;
			}
		}
	}
	return true;
}
function checkJunkNumber(val)
{
	var junk = "@!~+%<>?`,;:#$%^&*()=|[]{}/\\-";
	for (var i = 0; i <val.length;i++){
		for(var j=0;j < junk.length;j++){
			if(val.charAt(i)==junk.charAt(j)){
				//alert("Remark cannot contain junk characters !");
				return false;
			}
		}
	}
	return true;
}

function submitProposal(val){
	var frmObj = document.create;
	var counter =  document.getElementById("counter").value;	
	var opexCounter =  document.getElementById("opexCounter").value;
	var proposedAmount =  document.getElementById("proposedAmount").value;	
	var budgetAmount =  document.getElementById("budgetAmount").value;	
	
	if ('Submit' == val){
	
	if (!checkBlank('Project Title','projectTitle')){		
		return false;
	}
	if (!checkBlankSelect('Proposal Date','proposalDate')){		
		return false;
	}
	if (!checkBlankNumber('Proposed Amount','proposedAmount')){		
		return false;
	}
	if (!checkBlankNumber('Opex Amount','opexAmount')){		
		return false;
	}
	
	if (!checkBlank('Location','proLocation')){		
		return false;
	}
	if (!checkBlank('Function','proFunction')){		
		return false;
	}
	if (!checkBlank('Project Manager','projectManager')){		
		return false;
	}
	if (!checkBlankSelect('Project Category','projectCategory')){		
		return false;
	}
	if (!checkBlankSelect('Financial Year','financialYear')){		
		return false;
	}
	if (!checkBlankNumber('Budget Amount','budgetAmount')){		
		return false;
	}
	if (!checkBlankSelect('Project Start Date','projectStartDate')){		
		return false;
	}
	if (!checkBlankSelect('Project End Date','projectEndDate')){		
		return false;
	}
	var reasonAlert = (parseFloat(proposedAmount))-(parseFloat(budgetAmount));
	reasonAlert = parseInt(reasonAlert);
	if(reasonAlert > 0){
		if (!checkBlank('Reason If Unbudgeted','reasonIfUnbudgeted')){		
			return false;
		}
	}
	if (!checkBlankSelect('Project Close Out Report','projectCloseOutReport')){		
		return false;
	}
	var projectStartDate = $('#projectStartDate').val();
	var projectEndDate = $('#projectEndDate').val();
	var projectCloseOutReport = $('#projectCloseOutReport').val();
	
	if (projectStartDate == projectEndDate ){	
		alert("Both dates are same.");
		return false;
	}
	if (projectEndDate == projectCloseOutReport ){	
		alert("Both dates are same.");
		return false;
	}
	if (projectStartDate == projectCloseOutReport ){	
		alert("Both dates are same.");
		return false;
	}
	if (!checkBlankTextField('Rationale','rationale')){		
		return false;
	}
	if (!checkBlankTextField('Project Description','projectDescription')){		
		return false;
	}
	//var projectDescription = $('#projectDescription').val();
	//remarks = remarks.replace(/^\s+|\s+$/g,'');
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Particulars','particulars'+ii)){		
			return false;
		}
	}
	for (jj=0 ; jj<counter; jj++){		
		if (!checkBlankNumber('Estimated Cost','estimatedCost'+jj)){		
			return false;
		}
	}
	
	for (ii=0 ; ii<opexCounter; ii++){		
		if (!checkBlank('Opex Particulars','opexParticulars'+ii)){		
			return false;
		}
	}
	for (jj=0 ; jj<opexCounter; jj++){		
		if (!checkBlankNumber('Opex Estimated Cost','opexEstimatedCost'+jj)){		
			return false;
		}
	}
	
	if (!checkBlankNumber('Asset Disposal','assetDisposal')){		
		return false;
	}
	if (!checkBlankNumber('Savings Envisaged','savingsEnvisaged')){		
		return false;
	}
	if (!checkBlank('Payback Period','paybackPeriod')){		
		return false;
	}
	if (!checkBlank('Project Sponsor','projectSponsor')){		
		return false;
	}
	if (!checkBlankSelect('Project Co-ordinator','projectCoordinator')){		
		return false;
	}

	/*
	var financialYear = $("#financialYear").val();
//	alert(financialYear);
	var fYear = financialYear.split("-",2);
//	alert(fYear.length);
	if(financialYear.length ==7){
		for(i = 0; i < fYear.length; i++)
		{
			if (isNaN(fYear[i])){
				alert("Valid Format of Financial Year is 2015-16 .");			
				return false;
			}else{
				if(i==0){
					if(fYear[0].length > 4|| fYear[0].length < 4){
						alert("Valid Format of Financial Year is 2015-16.");
						document.getElementById("financialYear").focus();
						return false;
					}
				}
				if(i==1){
					if(fYear[1].length > 2|| fYear[1].length < 2){
						alert("Valid Format of Financial Year is 2015-16.");
							document.getElementById("financialYear").focus();
						return false;
					}
				}
			}
		}
	}else{
		alert("Valid Format of Financial Year is 2015-16.");
		document.getElementById("financialYear").focus();
		return false;		
	}
	*/

			frmObj.action = "saveCreateProposalform.jsp?state=L";
	}else{
		if('Draft' == val){
			if (!checkBlank('Project Title','projectTitle')){		
				return false;
			}
			frmObj.action = "saveCreateProposalform.jsp?state=D";
		}		
	}
	document.getElementById("proposalDate").disabled =false;	
	frmObj.submit();
}

function attachmentFile(attachDetails, str,formName){			
	var url	= "../upload/uploadFile.jsp?attachment="+attachDetails+"&str="+str+"&formName="+formName;
	window.open(url,"File","width=600,height=165,resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");	
}

function deleteFile(fileName,dirPath,str,formName){
	var url = "../common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str+"&formName="+formName;
	window.open(url,"File","width=400,height=200, resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function onLoadDetail(str,formName){	
	if(str == '0'){
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment("../common/dirListing.jsp?attachment=additional&str="+str+"&formName="+formName,"attachment1","Attachment");
	}else 	{
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment("../common/dirListing.jsp?attachment=additional&str=1&formName="+formName,"attachment1","Attachment");
	}
}

function showAttachedFile(fileName, emailid,str,requestId,attachment){

	var url	= "/timescape/sapep/collaboration/workflow/capex/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	window.location.href = url;
}


function showAttachmentFile(str, requestId, userEmailId, status,formName){	
	
	loadFragment("../common/showDirListing.jsp?attachment=additional&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status+"&formName="+formName,"attachment1","Attachment");
}

function showAttachmentFiles(str, requestId, userEmailId, status,formName){	
	
	loadFragment("../common/showDirListing.jsp?attachment=additional&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status+"&formName="+formName,"attachment2","Attachment");
}
function calculateTotal(){

 var counter =  document.getElementById("counter").value;
 var total = "0.00";
 var estAmount = "";
	for (i=0; i < counter ;i++){
		estAmount = document.getElementById("estimatedCost"+i).value;
		if (estAmount==''){
				estAmount	= "0.00";
		 }else {
			 if (!(isNaN(estAmount) )){
					 total =  (parseFloat(total))+ (parseFloat(estAmount));				
				 } 
		 }	 
	}
 document.getElementById("totalCapexAmt").value = parseFloat(total).toFixed(2);
}
function calculateOpexTotal(){

 var counter =  document.getElementById("opexCounter").value;
 var total = "0.00";
 var estAmount = "";
	for (i=0; i < counter ;i++){
		estAmount = document.getElementById("opexEstimatedCost"+i).value;
		if (estAmount==''){
				estAmount	= "0.00";
		 }else {
			 if (!(isNaN(estAmount) )){
					 total =  (parseFloat(total))+ (parseFloat(estAmount));				
				 } 
		 }	 
	}
 document.getElementById("totalOpexAmt").value = parseFloat(total).toFixed(2);
}

function editProposalForm(val){

	var frmObj = document.create;
	var counter =  document.getElementById("counter").value;	
	var opexCounter =  document.getElementById("opexCounter").value;	
//	var attachCounter =  document.getElementById("hiddDirectorySizeadditional").value;	
	var proposedAmount =  document.getElementById("proposedAmount").value;	
	var budgetAmount =  document.getElementById("budgetAmount").value;	
	if('Submit' == val){
	
	if (!checkBlank('Project Title','projectTitle')){		
		return false;
	}
	if (!checkBlank('Proposal Date','proposalDate')){		
		return false;
	}
	if (!checkBlankNumber('Proposed Amount','proposedAmount')){		
		return false;
	}
	if (!checkBlankNumber('Opex Amount','opexAmount')){		
		return false;
	}
	if (!checkBlank('Location','proLocation')){		
		return false;
	}
	if (!checkBlank('Function','proFunction')){		
		return false;
	}
	if (!checkBlank('Project Manager','projectManager')){		
		return false;
	}
	if (!checkBlankSelect('Project Category','projectCategory')){		
		return false;
	}
	if (!checkBlankSelect('Financial Year','financialYear')){		
		return false;
	}
	if (!checkBlankNumber('Budget Amount','budgetAmount')){		
		return false;
	}
	if (!checkBlank('Project Start Date','projectStartDate')){		
		return false;
	}
	if (!checkBlank('Project End Date','projectEndDate')){		
		return false;
	}
	var reasonAlert = (parseFloat(proposedAmount))-(parseFloat(budgetAmount));
	
	reasonAlert = parseInt(reasonAlert);
	
	if(reasonAlert > 0){

		if (!checkBlank('Reason If Unbudgeted','reasonIfUnbudgeted')){		
			return false;
		}
	}
	if (!checkBlank('Project Close Out Report','projectCloseOutReport')){		
		return false;
	}
	var projectStartDate = $('#projectStartDate').val();
	var projectEndDate = $('#projectEndDate').val();
	var projectCloseOutReport = $('#projectCloseOutReport').val();
	//alert(  projectStartDate+ " = " +projectEndDate + " = " +projectCloseOutReport);
	if (projectStartDate == projectEndDate ){	
		alert("Both dates are same.");
		return false;
	}
	if (projectEndDate == projectCloseOutReport ){	
		alert("Both dates are same.");
		return false;
	}
	if (projectStartDate == projectCloseOutReport ){	
		alert("Both dates are same.");
		return false;
	}
	if (!checkBlankTextField('Rationale','rationale')){		
		return false;
	}
	if (!checkBlankTextField('Project Description','projectDescription')){		
		return false;
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Particulars','particulars'+ii)){		
			return false;
		}
	}
	for (jj=0 ; jj<counter; jj++){		
		if (!checkBlankNumber('Estimated Cost','estimatedCost'+jj)){		
			return false;
		}
	}
	for (kk=0 ; kk<opexCounter; kk++){		
		if (!checkBlank('Opex Particulars','opexParticulars'+kk)){		
			return false;
		}
	}
	for (jjj=0 ; jjj<opexCounter; jjj++){		
		if (!checkBlankNumber('Opex Estimated Cost','opexEstimatedCost'+jjj)){		
			return false;
		}
	}
	if (!checkBlankNumber('Asset Disposal','assetDisposal')){		
		return false;
	}
	if (!checkBlankNumber('Savings Envisaged','savingsEnvisaged')){		
		return false;
	}
	if (!checkBlank('Payback Period','paybackPeriod')){		
		return false;
	}
	if (!checkBlank('Project Sponsor','projectSponsor')){		
		return false;
	}
	if (!checkBlankSelect('Project Co-ordinator','projectCoordinator')){		
		return false;
	}
	
	/*
	var financialYear = $("#financialYear").val();
//	alert(financialYear);
	var fYear = financialYear.split("-",2);
//	alert(fYear.length);
	if(financialYear.length ==7){
		for(i = 0; i < fYear.length; i++)
		{
			if (isNaN(fYear[i])){
				alert("Please enter only numbers !");			
				return false;
			}else{
				if(i==0){
					if(fYear[0].length > 4|| fYear[0].length < 4){
						alert("Valid Format of Financial Year is 2015-16.");
						document.getElementById("financialYear").focus();
						return false;
					}
				}
				if(i==1){
					if(fYear[1].length > 2|| fYear[1].length < 2){
						alert("Valid Format of Financial Year is 2015-16.");
							document.getElementById("financialYear").focus();
						return false;
					}
				}
			}
		}
	}else{
		alert("Valid Format of Financial Year is 2015-16.");
		document.getElementById("financialYear").focus();
		return false;
		}
		*/
	
		frmObj.action = "saveEditProposalform.jsp?state=L";
	}else {		
		if('Draft' == val){
			frmObj.action = "saveEditProposalform.jsp?state=D";
		}
	}	
	frmObj.submit();

}
function approvedProposal(valRemark){
	var frmObj = document.create;
	var  proposalNo = document.getElementById("proposalNo").value;
	var  remark = document.getElementById("remark").value;
	if (valRemark == 'CR'){
		if (remark == '' || remark == null){
			alert(" Kindly enter  Remark !");
			document.getElementById("remark").focus();
			return false;
		}
	}
	document.getElementById("remarkStatus").value  =  valRemark;
	frmObj.action = "submitViewProposalform.jsp";
	frmObj.submit();
}

function submitCapexWizard(){
	var frmObj = document.createForm;
	var counter =  document.getElementById("counter").value;	
	var revCounter =  document.getElementById("revCounter").value;	
	var appCounter =  document.getElementById("appCounter").value;	

	var attachCounter =  document.getElementById("hiddDirectorySizeadditional").value;
	
	if (!checkBlank('Project Title','projectTitle')){		
		return false;
	}	
	if (!checkBlankSelect('Project Category','projectCategory')){		
		return false;
	}
	if (!checkBlankNumber('Capex Amount','capexAmount')){		
		return false;
	}
	if (!checkBlankNumber('Opex Amount','opexAmount')){		
		return false;
	}
	if (!checkBlank('Location','proLocation')){		
		return false;
	}
	if (!checkBlank('Function','proFunction')){		
		return false;
	}
	if (!checkBlank('Project Manager','projectManager')){		
		return false;
	}	
	if (!checkBlank('Project Duration','projectDuration')){		
		return false;
	}
	if (!checkBlankNumber('Budget Amount','budgetAmount')){		
		return false;
	}
	if (!checkBlank('Keywords','keywords')){		
		return false;
	}
	//if (!checkBlank('Reason If Unbudgeted','reasonIfUnbudgeted')){		
	//	return false;
	//}
	if (!checkBlankNumber('Capex','capex1')){		
		return false;
	}
	if (!checkBlankNumber('Capex','capex2')){		
		return false;
	}
	if (!checkBlankNumber('Capex','capex3')){		
		return false;
	}
	if (!checkBlankNumber('Capex','capex4')){		
		return false;
	}
	if (!checkBlankNumber('Capex','capex5')){		
		return false;
	}
	if (!checkBlankNumber('Opex','opex1')){		
		return false;
	}
	if (!checkBlankNumber('Opex','opex2')){		
		return false;
	}
	if (!checkBlankNumber('Opex','opex3')){		
		return false;
	}
	if (!checkBlankNumber('Opex','opex4')){		
		return false;
	}
	if (!checkBlankNumber('Opex','opex5')){		
		return false;
	}
	if (!checkBlankTextField('Recommendation','background')){		
		return false;
	}	
	if (!checkBlankTextField('Rationale','rationale')){		
		return false;
	}
	if (!checkBlankTextField('Project Scope','projectScope')){		
		return false;
	}
	if (!checkBlankTextField('Alternatives Considered','alternativesConsidered')){		
		return false;
	}
	if (!checkBlankTextField('Risks','risks')){		
		return false;
	}

	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Header','header'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Particulars','particulars'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Quantity','quantity'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlankNumber('Estimated Cost','estimatedCost'+ii)){		
			return false;
		}
	}	
	if (!checkBlankNumber('Savings Envisaged','savingsEnvisaged')){		
		return false;
	}
	
	if (!checkBlank('Payback Period','paybackPeriod')){		
		return false;
	}
	for (jj=0 ; jj<revCounter; jj++){		
		if (!checkBlankSelect('Supported/Recommended By','reviewedBy'+jj)){		
		return false;
		}
	}	
	for (zz=0 ; zz<appCounter; zz++){		
		if (!checkBlankSelect('Approved By','approvedBy'+zz)){		
		return false;
	}
	}	
	if (attachCounter ==0){		
		alert("Please attached atleast one  Document !");
		return false;
	}
	frmObj.action = "saveCapexWizard.jsp";
	frmObj.submit();

}

function saveEditCapexProposal(){
	
	var frmObj = document.viewWizard;
	var counter =  document.getElementById("counter").value;	
	var revCounter =  document.getElementById("revCounter").value;	
	var appCounter =  document.getElementById("appCounter").value;	

	var attachCounter =  document.getElementById("hiddDirectorySizeadditional").value;
		
	if (!checkBlankSelect('Project Category','projectCategory')){		
		return false;
	}
	if (!checkBlankNumber('Capex Amount','capexAmount')){		
		return false;
	}
	if (!checkBlankNumber('Opex Amount','opexAmount')){		
		return false;
	}
	if (!checkBlank('Location','proLocation')){		
		return false;
	}
	if (!checkBlank('Function','proFunction')){		
		return false;
	}
	if (!checkBlank('Project Manager','projectManager')){		
		return false;
	}	
	if (!checkBlank('Project Duration','projectDuration')){		
		return false;
	}
	if (!checkBlankNumber('Budget Amount','budgetAmount')){		
		return false;
	}
	if (!checkBlank('Keywords','keywords')){		
		return false;
	}
	//if (!checkBlank('Reason If Unbudgeted','reasonIfUnbudgeted')){		
	//	return false;
	//}
	
	if (!checkBlankTextField('Rationale','rationale')){		
		return false;
	}
	if (!checkBlankTextField('Recommendation','background')){		
		return false;
	}	
	if (!checkBlankTextField('Project Scope','projectScope')){		
		return false;
	}
	if (!checkBlankTextField('Alternatives Considered','alternativesConsidered')){		
		return false;
	}
	if (!checkBlankTextField('Risks','risks')){		
		return false;
	}

	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Header','header'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlank('Particulars','particulars'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlankNumber('Quantity','quantity'+ii)){		
			return false;
		}
	}
	for (ii=0 ; ii<counter; ii++){		
		if (!checkBlankNumber('Estimated Cost','estimatedCost'+ii)){		
			return false;
		}
	}	
	if (!checkBlankNumber('Savings Envisaged','savingsEnvisaged')){		
		return false;
	}
	
	if (!checkBlank('Payback Period','paybackPeriod')){		
		return false;
	}
	for (jj=0 ; jj<revCounter; jj++){		
		if (!checkBlankSelect('Supported/Recommended By','reviewedBy'+jj)){		
		return false;
		}
	}	
	for (zz=0 ; zz<appCounter; zz++){		
		if (!checkBlankSelect('Approved By','approvedBy'+zz)){		
		return false;
	}
	}		

	if (attachCounter ==0){		
		alert("Please attached atleast one  Document !");
		return false;
	}
	document.getElementById("projectTitle").disabled =false;
	document.getElementById("proposalNo").disabled =false;
	for (ii=0 ; ii<counter; ii++){		
		document.getElementById("totalCost"+ii).disabled =false;
	}	
	frmObj.action = "saveViewCapexWizard.jsp";
	frmObj.submit();
	
}

function calculateTotalQuantity(){

 var counter =  document.getElementById("counter").value;
 var total = "0.00";
 var subTotal ="0.00";
 var estAmount = "";
 var quantity = "";
	for (i=0; i < counter ;i++){
		estAmount = document.getElementById("estimatedCost"+i).value;
		quantity = document.getElementById("quantity"+i).value;
		if (estAmount==''){
				estAmount	= "0.00";
		 }else {
			 if(estAmount !="" && quantity !=""){
			 if (!(isNaN(estAmount) && !(iaNAN(quantity) ))){
					 total =  (parseFloat(quantity))* (parseFloat(estAmount));				
					  document.getElementById("totalCost"+i).value = parseFloat(total).toFixed(2);
					   subTotal = parseFloat(subTotal) + parseFloat(total);
				 }
		    }
		 }		
	}
	document.getElementById("totalCapexAmt").value = parseFloat(subTotal).toFixed(2);
}

function dateFormat(incomingData) { 
	
	var monthName	= new Array( "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData	= incomingData.split("-");
	var day			= incomingData[0];
	var month		= incomingData[1];
	var year		= incomingData[2];
	var monthValue	= 0;

	if (month >= 1 || month <= 12) {


		month = monthName[month-1];

	}

	for(var i=0; i < monthName.length ;i++)	{

		if(monthName[i] == month) {

			var monthValue = i;

		}

	}
	var revisedFormat = new Date(year, monthValue ,day);
	return revisedFormat;
}	
function validatePeriod(date1, date2) {
  // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();
    // Calculate the difference in milliseconds
	
    var difference_ms = Math.abs(date1_ms - date2_ms);
    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)
}
function closeProposalForm(){
		history.back();
}

function saveComments(strVal){	
	
	if(strVal =='0'){		
		var emailId = '0';
		var commentText = '0';
		var requestId = document.getElementById("requestId").value;
		var keyword = '0';
		var keywords = document.getElementById("keywords").value;		
		var status = document.getElementById("status").value;	
		var projectTitle = document.getElementById("projectTitle").value;	
		var mode = $('#mode').val();		
	}else{
		var emailId = document.getElementById("email_id").value;
		var commentText = document.getElementsByName("keyComments")[0].value;
		var requestId = document.getElementById("requestId").value;
		var keyword = document.getElementById("keyword").value;
		var keywords = document.getElementById("keywords").value;
		var status = document.getElementById("status").value;
		var projectTitle = document.getElementById("projectTitle").value;	
		var mode = $('#mode').val();		
		}		
	
		commentText = commentText.replace(/&|_/g,'%26'); 
		if (commentText == null || commentText == ""){	
				alert(" Kindly Enter Comment .");
				$('#keyComments').focus();		
			return false;
		}
	if(!checkJunk(commentText)){
			alert("Comments cannot contain junk characters !");	
			//document.getElementsByName("keyComments")[0].focus();
			$('#keyComments').focus();
			return false;
	}else{
		loadFragment("saveComments.jsp?requestId="+requestId+"&newKeyword="+keyword+"&email_id="+emailId+"&keyComments="+commentText+"&keywords="+keywords+"&state="+status+"&title="+projectTitle+"&mode="+mode,"displayComments","Comments");		
	}
	return false;
}

function loadDetailsTab1(){
	
	var requestId = document.getElementById("proposalNo").value;	
	//alert ( " requestId"+ requestId );
	if(requestId ==0){
		$('#proposalNo').val(0);
		$('#projectTitle').val("");
		$('#projectCategory').val(0);
		$('#capexAmount').val("");
		$('#opexAmount').val("");
		$('#proLocation').val(0);
		$('#proFunction').val(0);
		$('#projectManager').val(0);
		$('#projectDuration').val("");
		$('#budgetAmount').val("");
		$('#keywords').val("");
		$('#reasonIfUnbudgeted').val("");			
	}else{	
		loadFragment("loadCapexNoteTab1.jsp?requestId="+requestId,"tab1","Capex Note");
	}
}
function loadDetailsTab3(){
	
	var requestId = document.getElementById("proposalNo").value;	
	//alert ( " requestId"+ requestId );
	if(requestId ==0){
		$('#background').val("");
		$('#rationale').val("");
		$('#projectScope').val("");
		$('#alternativesConsidered').val("");
		$('#risks').val("");			
	}else{	
		loadFragment("loadCapexNoteTab3.jsp?requestId="+requestId,"tab3","Capex Note");
	}
}
function loadDetailsTab5(){
	
	var requestId = document.getElementById("proposalNo").value;	
	//alert ( " requestId"+ requestId );
	if(requestId ==0){
		$('#savingsEnvisaged').val("");
		$('#paybackPeriod').val("");				
	}else{	
		loadFragment("loadCapexNoteTab5.jsp?requestId="+requestId,"tab5","Capex Note");
	}
}

function lookup(inputString) {
	if(inputString.length == 0) {
		$('#suggestions').hide();
	} else {
		$.post("../common/searchEmail.jsp", {queryString: ""+inputString+""}, function(data){
		if(data.trim().length > 0) {
		$('#suggestions').show();
		$('#autoSuggestionsList').html(data);
	}else{
		$('#suggestions').hide();
		}
		});
	}
}
function lookupAll(inputString,idText,idList,urlText) {
	var url;
	if(inputString.length == 0) {
		$('#'+idText).hide();
	} else {
		
		if(urlText=='loc'){
			url = "../common/searchLocation.jsp";
		}
		if(urlText=='email'){
			url = "../common/searchManager.jsp";
		}
		if(urlText=='dept'){
			url = "../common/searchDepartment.jsp";
		}
		if(urlText=='coor'){
			url = "../common/searchCoordinator.jsp";
		}
		$.post(url, {queryString: ""+inputString+""}, function(data){
		if(data.length > 0) {
		$('#'+idText).show();
		$('#'+idList).html(data);
	}else{
		$('#'+idText).hide();
		}
		});
	}
}
function fillDepartment(thisValue) {
	$('#proFunction').val(thisValue).focus();
	$('#suggestions2').hide();
}
function fillCoordinator(thisValue) {
	$('#projectSponsor').val(thisValue).focus();
	$('#suggestions3').hide();
}
function fillProjectManager(thisValue) {
	$('#projectManager').val(thisValue).focus();
	$('#suggestions1').hide();
}
function fillLocation(thisValue) {
	$('#proLocation').val(thisValue).focus();
	$('#suggestions').hide();
}

function fill(thisValue) {
	$('#recommendedBy').val(thisValue).focus();
	$('#suggestions').hide();
}

function runScript(e) {
    if (e.keyCode == 13) {
       getSearchDetails();
    }
}



function saveRecommendation(){
	
	var random = Math.random();	
	var recommBy = $('#recommendedBy').val();
	var requestId = $('#requestId').val();
	var projectTitle = document.getElementById("projectTitle").value;
	var proposalNo = document.getElementById("proposalNo").value;
	var capexAmount = document.getElementById("capexAmount").value;
	var opexAmount = document.getElementById("opexAmount").value;
	var projectCategory = document.getElementById("projectCategory").value;
	var createdBy = document.getElementById("createdBy").value;
	var createdOn = document.getElementById("createdOn").value;
	var projectCoordinator = document.getElementById("projectCoordinator").value;
	
//	alert(requestId + " : "+projectTitle + " : "+proposalNo + " : "+capexAmount + " : "+opexAmount + " : "+projectCategory + " : "+createdBy + " : "+createdOn + " : "+projectCoordinator );
	if (recommBy != null || recommBy != ''){
		
		$.post("../common/saveRecommendation.jsp",
		{		
			recommBy : recommBy,
			title : projectTitle,		
			requestId : requestId,	
			findStr : "reviewedBy",
			actionPro : "Review",
			projectTitle :projectTitle,
			proposalNo : proposalNo,
			capexAmount : capexAmount,
			opexAmount : opexAmount,
			projectCategory : projectCategory,
			createdBy : createdBy,
			createdOn : createdOn,
			projectCoordinator : projectCoordinator			
		},function(data){						
				data = $.trim(data);
			//	alert(data);
				if(data){
					alert(" Additional Recommendation Successfully Updated.");
					document.location.href = "../view/reviewDashboardCoodinator.jsp?number="+random;
				}else{
					alert(" Some Error Occured While Processing Your Request.");
				}
			
		});		
	}else{
		return false;
	}	
}

function onLoadComments(str,formName,folderName){	
	if(str == '0'){
		loadFragment("../common/dirListing.jsp?attachment="+folderName+"&str="+str+"&formName="+formName,"attachment1","Attachment");
	}else 	{
		loadFragment("../common/dirListing.jsp?attachment="+folderName+"&str=1&formName="+formName,"attachment1","Attachment");
	}
}

function showAttachFile(str,formName,folderName,requestId, userEmailid)
{
	if(str == '0'){
		var url = "../common/showDirListing1.jsp?attachment="+folderName+"&str="+str+"&formName="+formName+"&requestId="+requestId+"&userEmailid="+userEmailid; 
		
		
		window.open(url,"File","width=100,height=75, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}else 	{
		
	var url = "../common/showDirListing1.jsp?attachment="+folderName+"&str=1&formName="+formName+"&requestId="+requestId+"&userEmailid="+userEmailid; 
		
		window.open(url,"File","width=100,height=75, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}
}

function showComments(strVal){	
	
	if(strVal =='0'){		
		var emailId = '0';
		var commentText = '0';					
		var requestId = document.getElementById("requestId").value;
		var keyword = '0';
		var keywords = document.getElementById("keywords").value;		
		var status = document.getElementById("status").value;	
		var projectTitle = document.getElementById("projectTitle").value;	
		var countFile = "0";
		var addtionalAttachName1 ="";
		var addtionalAttachName = "-";
		
	}else{
		var emailId = document.getElementById("email_id").value;
		var commentText = document.getElementsByName("keyComments")[0].value;
		var requestId = document.getElementById("requestId").value;
		var keyword = document.getElementById("keyword").value;
		var keywords = document.getElementById("keywords").value;
		var status = document.getElementById("status").value;	
		var countFile = $('#hiddDirectorySizeadditional').val();
		var projectTitle = document.getElementById("projectTitle").value;	
		var addtionalAttachName1 ="";
		var addtionalAttachName = "";
		for(ii=0; ii < countFile; ii++){
			addtionalAttachName1	= $('#hiddFilesName1additional'+ii).val();
			addtionalAttachName	= addtionalAttachName1+","+addtionalAttachName;
		}  		
	}
		commentText = commentText.replace(/&|_/g,'%26'); 

	if(!checkJunk(commentText)){
			alert("Comments cannot contain junk characters !");	
			//document.getElementsByName("keyComments")[0].focus();
			$('#keyComments').focus();
			return false;
	}else{
		loadFragment("saveCommentsCoodinator.jsp?requestId="+requestId+"&newKeyword="+keyword+"&email_id="+emailId+"&keyComments="+commentText+"&keywords="+keywords+"&state="+status+"&data="+addtionalAttachName+"&title="+projectTitle,"displayComments","Comments");	
		for(ii=0; ii < countFile; ii++){
			$('#hiddFilesName1additional'+ii).val("");
		} 
		$('#hiddDirectorySizeadditional').val("");
		
	/*
		$.post("saveComments.jsp", {
			requestId: requestId,
			newKeyword :keyword,
			email_id: emailId,
			keyComments:commentText,
			keywords:keywords
			}, function(data){
				if(data.trim().length > 0) {
				
				//alert(data);
				$('#displayComments').show().html(data);	
				
				}else{
				
				}
			});
		*/	
	}
	return false;
}

function startApproval(){
	var random = Math.random();	
	var requestId = $('#requestId').val();
	//var title = $('#projectTitle').val();	
	var title = document.getElementById("projectTitle").value;
	var proposalNo = document.getElementById("proposalNo").value;
	var capexAmount = document.getElementById("capexAmount").value;
	var opexAmount = document.getElementById("opexAmount").value;
	var projectCategory = document.getElementById("projectCategory").value;
	var createdBy = document.getElementById("createdBy").value;
	var createdOn = document.getElementById("createdOn").value;
	var projectCoordinator = document.getElementById("projectCoordinator").value;
	
	
	
	
	$.post("../common/updateRecommendation.jsp", {
			requestId: requestId,
			title:title,		
			proposalNo : proposalNo,
			capexAmount : capexAmount,
			opexAmount : opexAmount,
			projectCategory : projectCategory,
			createdBy : createdBy,
			createdOn : createdOn,
			projectCoordinator : projectCoordinator			
			}, function(data){
			
				if(data.trim().length > 0){				
					alert(" Approval Process Start.");						
				//	$('#Approved').hide();
					document.location.href = "reviewDashboardCoodinator.jsp?number="+random;
				}else{
						alert(" Some Error occured Kindly try again later .");
				}
			});
}
function clickHere(mStatus,requestId){
//	alert(mStatus + " : "+requestId);
	$('#id').val(requestId);
	$('#status').val(mStatus);
	var frmObj = document.viewList2;
	frmObj.action = "viewProposalform.jsp";
	frmObj.submit();	
}
function clickViewCapex(mStatus,requestId){
	$('#id').val(requestId);
	$('#status').val(mStatus);
	var frmObj = document.viewCapex;
	frmObj.action = "../creation/viewCapexWizard.jsp";
	frmObj.submit();	
}

function clickViewProposal(mStatus,requestId){
	$('#id').val(requestId);
	$('#status').val(mStatus);
	var frmObj = document.viewProposal;
	frmObj.action = "../creation/editProposalform.jsp";
	frmObj.submit();	
}
function clickViewDashBoard(mStatus,requestId){
	$('#id').val(requestId);
	$('#status').val(mStatus);
	var frmObj = document.viewDashboard;
	//frmObj.action = "../view/dashboardCoodinator.jsp";
	frmObj.action = "../view/newCapexEview.jsp";
	frmObj.submit();	
}
/*
function finalStatus(strVal,actionPro){
	
	if(strVal =='0'){		
			var emailId = '0';
			var commentText = '0';
			var requestId = document.getElementById("requestId").value;
			var keyword = '0';
			var keywords = document.getElementById("keywords").value;		
			var status = document.getElementById("status").value;	
			var projectTitle = document.getElementById("projectTitle").value;	
			var mode = $('#mode').val();		
		}else{
			var emailId = document.getElementById("email_id").value;
			var commentText = document.getElementsByName("keyComments")[0].value;
			var requestId = document.getElementById("requestId").value;
			var keyword = document.getElementById("keyword").value;
			var keywords = document.getElementById("keywords").value;
			var status = document.getElementById("status").value;	
			var countFile = $('#hiddDirectorySizeadditional').val();
			var projectTitle = document.getElementById("projectTitle").value;	
			var mode = $('#mode').val();	
			}		
	
			commentText = commentText.replace(/&|_/g,'%26'); 
			
		if (commentText == null || commentText == ""){	
				alert(" Kindly Enter Comment .");
				$('#keyComments').focus();		
			return false;
		}

		if(!checkJunk(commentText)){
				alert("Comments cannot contain junk characters !");	
				
				$('#keyComments').focus();
				return false;
		}else{
			
			loadFragment("saveComments.jsp?requestId="+requestId+"&newKeyword="+keyword+"&email_id="+emailId+"&keyComments="+commentText+"&keywords="+keywords+"&state="+status+"&title="+projectTitle+"&mode="+mode+"&actionPro="+actionPro,"displayComments","Comments");	
			$('#myComments').hide();
		
		}
		return false;
}
*/
function ltrim(str)
{
	for(var k = 0; k < str.length && isWhitespace(str.charAt(k)); k++);
	return str.substring(k, str.length);
}
function rtrim(str){
	for(var j=str.length-1; j>=0 && isWhitespace(str.charAt(j));j--);
	return str.substring(0,j+1);
	}

function trim(str){
	return ltrim(rtrim(str));
	}
function finalStatus(strVal,actionPro){
			
		
		var random = Math.random();	
		var requestId = document.getElementById("requestId").value;
		var projectTitle = document.getElementById("projectTitle").value;
		var proposalNo = document.getElementById("proposalNo").value;
		var capexAmount = document.getElementById("capexAmount").value;
		var opexAmount = document.getElementById("opexAmount").value;
		var projectCategory = document.getElementById("projectCategory").value;
		var createdBy = document.getElementById("createdBy").value;
		var createdOn = document.getElementById("createdOn").value;
		var projectCoordinator = document.getElementById("projectCoordinator").value;
		
	//	alert(requestId + " : "+projectTitle + " : "+proposalNo + " : "+capexAmount + " : "+opexAmount + " : "+projectCategory + " : "+createdBy + " : "+createdOn + " : "+projectCoordinator + " : "+actionPro);
		
		var commentText = "";		
		var keyword = "";
		
		if(actionPro == 'Accept') {
			commentText = document.getElementsByName("keyCommentsAc")[0].value;	
			keyword = document.getElementById("keywordAc").value;
		}
		if(actionPro == 'Reject'){
			commentText = document.getElementsByName("keyCommentsRj")[0].value;
			keyword = document.getElementById("keywordRj").value;
		}
		if(actionPro == 'Review'){
			commentText = document.getElementsByName("keyCommentsRe")[0].value;
			keyword = document.getElementById("keywordRe").value;
		}
	
	
	//	alert(requestId +" : "+keyword+" : " +commentText+ " : " +actionPro);
		
	
	$.post("finalAction.jsp",
	{		
		requestId : requestId,
		keyword : keyword,		
		commentText : commentText,	
		actionPro : actionPro,
		projectTitle :projectTitle,
		proposalNo : proposalNo,
		capexAmount : capexAmount,
		opexAmount : opexAmount,
		projectCategory : projectCategory,
		createdBy : createdBy,
		createdOn : createdOn,
		projectCoordinator : projectCoordinator
		
	},function(data){		
		//	alert($.trim(data));	
			if(actionPro == 'Accept' || actionPro == 'Reject'){
				document.location.href = "newapprovalDashboard.jsp?number="+random;
			}	
			if(actionPro == 'Review'){
				document.location.href = "reviewDashboard.jsp?number="+random;
			}
			});	
}
	
	function clickHereForAction(id,mStatus,mode){
	$('#requestId').val(id);
	$('#mStatus').val(mStatus);
	$('#mode').val(mode);
	//alert(id + " : "+mStatus + " : "+mode);
	var frmObj = document.viewApprovals;
	frmObj.action = "newCapexEview.jsp?id="+id+"&status="+mStatus+"&mode="+mode;
	frmObj.submit();	
}
function  openFile(fileName,emailId,requestId,attachmentName){
		
	var url = "../common/popup.jsp?fileName="+fileName+"&emailid="+emailId+"&str=1&requestNo="+requestId+"&attachment="+attachmentName;
	win = window.open(url,"Attachments","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
}
	