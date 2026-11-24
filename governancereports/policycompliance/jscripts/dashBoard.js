function showTable(){
	//alert("true");
	//frmObj = document.frmCreateRequest;
	frmObj = document.getElementById("tableToShow");
	//alert(frmObj);
	if(frmObj.style.visibility =='hidden'){
		frmObj.style.visibility = 'visible';
	}else{
		frmObj.style.visibility = 'hidden';
	
	}
	//frmObj.reset();
}

function changeDate(){
	frmObj = document.frmCreateRequest;
	dateVal = frmObj.date.value;
	frmObj.action="../reviewer/dashBoardDaily.jsp?date="+dateVal;
	frmObj.submit();
}

function loadCount(srNo){
	frmObj = document.frmCreateRequest;
	policyId = eval("frmObj.policyId"+srNo+".value");
	assurerfdbk = eval("frmObj.assurerfdbk"+srNo+".value");
	ensurerfdbk = eval("frmObj.ensurerfdbk"+srNo+".value");
	dateVal = frmObj.date.value;
//alert(policyId);
	loadFragment('../common/showCount.jsp?policyId='+policyId+'&assurerfdbk='+assurerfdbk+'&ensurerfdbk='+ensurerfdbk+'&date='+dateVal+'&srNo='+srNo, 'count'+srNo,'Count');
}

function showCount(size){
	frmObj = document.frmCreateRequest;
	for(i=0;i<size;i++){
	policyId = eval("frmObj.policyId"+i+".value");
	assurerfdbk = eval("frmObj.assurerfdbk"+i+".value");
	ensurerfdbk = eval("frmObj.ensurerfdbk"+i+".value");
	dateVal = frmObj.date.value;
	//alert('../common/showCount.jsp?policyId='+policyId+'&assurerfdbk='+assurerfdbk+'&ensurerfdbk='+ensurerfdbk+'&date='+dateVal+'&srNo='+i, 'count'+i,'Count');
	loadFragment('../common/showCount.jsp?policyId='+policyId+'&assurerfdbk='+assurerfdbk+'&ensurerfdbk='+ensurerfdbk+'&date='+dateVal+'&srNo='+i, 'count'+i,'Count');
	}
}

function viewData(srNo){
	frmObj = document.frmCreateRequest;
	policyId = eval("frmObj.policyId"+srNo+".value");
	assurerfdbk = eval("frmObj.assurerfdbk"+srNo+".value");
	ensurerfdbk = eval("frmObj.ensurerfdbk"+srNo+".value");
	dateVal = frmObj.date.value;
	loadFragment('../common/showData.jsp?policyId='+policyId+'&assurerfdbk='+assurerfdbk+'&ensurerfdbk='+ensurerfdbk+'&date='+dateVal, 'showingData','Data');
}


function downloadData(srNo){
	frmObj = document.frmCreateRequest;
	policyId = eval("frmObj.policyId"+srNo+".value");
	assurerfdbk = eval("frmObj.assurerfdbk"+srNo+".value");
	ensurerfdbk = eval("frmObj.ensurerfdbk"+srNo+".value");
	dateVal = frmObj.date.value;

	url = "../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}

function downloadSearchReport(frequency, riskCat, Function, fromDate, toDate){

	frmObj = document.frmSearchRequest;

	url = "../common/downloadSearchReports.jsp?fromDate="+fromDate+"&toDate="+toDate+"&frequency="+frequency+"&riskCat="+riskCat+"&Function="+Function;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}