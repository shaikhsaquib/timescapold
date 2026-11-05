/*function update(id, status){

	frmObj = document.frmReviewRequests;

	//alert(status);
	exp = eval("frmObj.updateStatus"+id);
	exp.value = status;
	frmObj.count.value = id;

	//alert(frmObj.count.value);

	//alert(eval("frmObj.updateStatus"+id+".value"));
	
	frmObj.action="../reviewer/reviewRequestsSubmit.jsp";
	frmObj.submit();
}
*/


function validateValues(optValue){

    frmObj = document.frmViewDetails;
	//alert(optValue);
	if(optValue =='ATN'){


		transferCompany = trim(frmObj.transferCompany.value);

	    if(transferCompany=='0'){
		alert("Please Select Company !!");
		frmObj.transferCompany.focus();
		return;
	    }

		transferBranch = trim(frmObj.transferBranch.value);

	    if(transferBranch=='0'){
		alert("Please Select Branch !!");
		frmObj.transferBranch.focus();
		return;
	    }

		transferLocation = trim(frmObj.transferLocation.value);

	    if(transferLocation=='0'){
		alert("Please Select Location !!");
		frmObj.transferLocation.focus();
		return;
	    }

		transferDept = trim(frmObj.transferDept.value);

	    if(transferDept=='0'){
		alert("Please Select Department !!");
		frmObj.transferDept.focus();
		return;
	    }

		ATNJustification = trim(frmObj.ATNJustification.value);
		
		stat = checkNull("Remarks/Justification ", ATNJustification);

		if(!stat){
			frmObj.ATNJustification.focus();
			return;
		}

		senderDeptHead = trim(frmObj.senderDeptHead.value);
		
		stat = checkNull("Transferor Dept. Head ", senderDeptHead);

		if(!stat){
			frmObj.senderDeptHead.focus();
			return;
		}

		branchHead = trim(frmObj.branchHead.value);
		
		stat = checkNull("Transferor Branch Head ", branchHead);

		if(!stat){
			frmObj.branchHead.focus();
			return;
		}

		receiverBranchHead = trim(frmObj.receiverBranchHead.value);
		
		stat = checkNull("Transferee Branch Head ", receiverBranchHead);

		if(!stat){
			frmObj.receiverBranchHead.focus();
			return;
		}

		receiverDeptHead = trim(frmObj.receiverDeptHead.value);
		
		stat = checkNull("Transferee Dept. Head ", receiverDeptHead);

		if(!stat){
			frmObj.receiverDeptHead.focus();
			return;
		}



	}else if(optValue =='ADN'){


		reasonForDisposal = trim(frmObj.reasonForDisposal.value);
		
		stat = checkNull("Reason For Disposal ", reasonForDisposal);

		if(!stat){
			frmObj.reasonForDisposal.focus();
			return;
		}
			
		verifiedBy = trim(frmObj.verifiedBy.value);
		
		stat = checkNull("Authority1 ", verifiedBy);

		if(!stat){
			frmObj.verifiedBy.focus();
			return;
		}

		proposedBy = trim(frmObj.proposedBy.value);
		
		stat = checkNull("Authority2 ", proposedBy);

		if(!stat){
			frmObj.proposedBy.focus();
			return;
		}

		approvedBy = trim(frmObj.approvedBy.value);
		
		stat = checkNull("Finance Head ", approvedBy);

		if(!stat){
			frmObj.approvedBy.focus();
			return;
		}

		
		/*
		adminHead = trim(frmObj.adminHead.value);
		
		stat = checkNull("MAS Head ", adminHead);

		if(!stat){
			frmObj.adminHead.focus();
			return;
		}
		*/

		branchHead = trim(frmObj.branchHead.value);
		
		stat = checkNull("Director ", branchHead);

		if(!stat){
			frmObj.branchHead.focus();
			return;
		}

		/*internalAudit = trim(frmObj.internalAudit.value);
		
		stat = checkNull("Internal Audit ", internalAudit);

		if(!stat){
			frmObj.internalAudit.focus();
			return; 
			
		}*/

	}

	frmObj.action="../user/createNoteSubmit.jsp";
	frmObj.submit( );
}




function showDetails(requestId, assetType, optValue){
	
	url = "../common/requestDetails.jsp?requestId="+requestId+"&assetType="+assetType+"&optValue="+optValue;
	win = window.open(url, "RequestDetails", "top=50,left=100,width=700,height=600,scrollbars=yes,status=no,resizable=yes");
}


function showUsers(requestId){

	review = document.getElementById("review");
	//alert(review);
	if(review==null||review==''){
		review ="user";
	}else{
		review = "reviewer";
	}
	//alert(review);
	
	url = "../user/showUsers.jsp?requestId="+requestId+"&review="+review;
	win = window.open(url, "UserDetails", "top=50,left=100,width=800,height=300,scrollbars=yes,status=no,resizable=yes");
}

function showInterest(divno, requestId){

	if(document.getElementById("mark"+divno).checked){

		url = "../user/createRemark.jsp?requestId="+requestId+"&divno="+divno;

		win = window.open(url, "UserDetails", "top=200,left=500,width=450,height=150,scrollbars=no,status=no,resizable=no");

	}

}

function markInterest(){

	frmObj =document.frmCreateRemark;
	
	val = frmObj.userRemarks.value;
	stat = checkNull("userRemarks", val)
	if(!stat){
		frmObj.userRemarks.focus();
		return;
	}

	frmObj.action = "../user/showInterest.jsp";
	frmObj.submit();


	/*requestId = frmObj.requestId.value;
	divno = document.getElementsByName("divno");
	userRemarks = document.getElementsByName("userRemarks");
	*/


	//loadFragment("../user/showInterest.jsp?requestId="+requestId+"&userRemarks="+userRemarks, "markResp"+divno, "updating..");

}

function respond(divno, likeId, requestId, status, page){

	var URL = "../user/updateInterest.jsp?requestId="+requestId+"&likeId="+likeId+"&status="+status+"&page="+page+"&divno="+divno;
	
	loadFragment(URL,"markResp"+divno, "updating..");
}


function updateInterest(divno, likeId, requestId, page){

	frmObj = document.frmViewMyRequest;
	
	//optValue = document.getElementsByName("assetType");

	optValue = eval("frmObj.assetType"+divno).value;
	status=optValue;

	//status = optValue[divno-1].value;


	if(status =='UD' || status == 'UR'){

		var URL = "../user/updateInterest.jsp?requestId="+requestId+"&likeId="+likeId+"&status="+status+"&page="+page+"&divno="+divno;
		
		loadFragment(URL,"markResp"+divno, "updating..");
	
	}else if(status =='ATN' || status == 'ADN'){

		url = "../user/createNote.jsp?requestId="+requestId+"&optValue="+status;
		win = window.open(url, "RequestDetails", "top=50,left=100,width=700,height=600,scrollbars=yes,status=no,resizable=yes");
		//alert("../user/createNote.jsp?requestId="+requestId+"&optValue="+status);

		//frmObj.action="../user/createNote.jsp?requestId="+requestId+"&optValue="+status;
		//frmObj.submit();

	}
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center" class="nav"><span class="bluesmall"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</span></div></td></tr></table>';
        
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

function addUser(forWhom, id) {

	window.open('../common/search.jsp?forWhom='+forWhom+"&id="+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=300,top=70,left=100');

}

function printDetails(requestId) {

	win = window.open('../common/printRequestDetails.jsp?requestId='+requestId,'RequestDetails','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=700,height=600,top=70,left=100');

}

function printNClose() {

	window.print();
	window.close();
}

function updateStatus(formname){

	if(formname === "viewRequest"){
		frmObj = document.frmViewMyRequest;
	}else if(formname === "viewAllRequest"){
		frmObj = document.frmViewAllRequests;
	}else if(formname === "frmViewProcessedRequest"){
		frmObj = document.frmViewProcessedRequest;
	}else if(formname === "viewAssets"){
		frmObj = document.viewAssets;
	}
	
	if(formname != "viewAssets"){
	reqStatus = frmObj.reqStatus.value;
	frmObj.selectedStatus.value = reqStatus;
	}
	
	month = frmObj.month.value;
	year = frmObj.year.value;
	
	frmObj.selectedMonth.value = month;
	frmObj.selectedYear.value = year;
	
	if(formname === "viewRequest"){
		frmObj.action = "../user/viewMyRequests.jsp";
	}else if(formname === "viewAllRequest"){
		frmObj.action = "../admin/viewAllRequests.jsp";
	}else if(formname === "frmViewProcessedRequest"){
		frmObj.action = "../processor/viewProcessedRequests.jsp";
	}else if(formname === "viewAssets"){
		frmObj.action = "../user/viewAssets.jsp";
	}
	
	//frmObj.action = "../admin/viewAllRequests.jsp";
	frmObj.submit();
	
}