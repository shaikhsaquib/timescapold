function downloadReport(i, criteria, prevYear, currYear){
//	alert("here")
	frmObj = document.frmSaveChklist;
//	policyId = eval("frmObj.policyId"+i+".value");
//	fromDate = eval("frmObj.disDate"+i+".value");
//	selectedOption = frmObj.selectedOption.value;
//    selectedOptionVal = frmObj.selectedOptionVal.value;

	url = "../common/downloadReports.jsp?prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}

function downloadReportForReviewer(i, criteria, prevYear, currYear){
	
	frmObj = document.frmSaveChklist;
	if(i==1){
		url = "../common/downloadReportsForReviewer.jsp?prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;
		win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}
	else if(i==2){
		url = "../common/downloadReportsForReviewer1.jsp?prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;
		win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}	
	else if(i==3){
		url = "../common/downloadReportsForReviewer2.jsp?prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;
		win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	}	
}

function downloadReportAll(compCode, Function, prevYear, apprOId, criteria){
//	alert("here")
	frmObj = document.frmSaveChklist;
//	policyId = eval("frmObj.policyId"+i+".value");
//	fromDate = eval("frmObj.disDate"+i+".value");
//	selectedOption = frmObj.selectedOption.value;
//    selectedOptionVal = frmObj.selectedOptionVal.value;

	url = "../common/downloadReportsAll.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&apprOId="+apprOId+"&criteria="+criteria;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}


function downloadReportComplied(compCode, Function, prevYear, apprOId, criteria, userCompliance){
//	alert("here")
	frmObj = document.frmSaveChklist;
//	policyId = eval("frmObj.policyId"+i+".value");
//	fromDate = eval("frmObj.disDate"+i+".value");
//	selectedOption = frmObj.selectedOption.value;
//    selectedOptionVal = frmObj.selectedOptionVal.value;

	url = "../common/downloadReportsComplied.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&apprOId="+apprOId+"&criteria="+criteria+"&userCompliance="+userCompliance;
	win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}

function userReport(compCode, Function, prevYear, apprOId, criteria) {

	//alert("Function1---"+Function);

	frmObj = document.frmCntReport;

	//alert("Function---"+Function);

	frmObj.action = "../includes/userReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&apprOId="+apprOId+"&criteria="+criteria;

	frmObj.submit();

}

function compliedReport(compCode, Function, prevYear, apprOId, criteria, userCompliance) {

	//alert("criteria---"+criteria);

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/compliedReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&userCompliance="+userCompliance+"&apprOId="+apprOId+"&criteria="+criteria;

	frmObj.submit();

	//url = "../includes/compliedReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&userCompliance="+userCompliance+"&apprOId="+apprOId+"&criteria="+criteria;
	//win = window.open(url,"Reports","top=20,left=0,width=800,height=700,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");

}

function nonCompliedReport(compCode, Function, prevYear, apprOId, criteria, currYear) {

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/nonCompliedReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&currYear="+currYear+"&apprOId="+apprOId+"&criteria="+criteria;

	frmObj.submit();

}

function apprReport(compCode, Function, prevYear, currYear, criteria) {

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/apprReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;

	frmObj.submit();

}

function apprComplied(compCode, Function, prevYear, currYear, criteria) {

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/apprComplied.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;

	frmObj.submit();

}

function apprNonComplied(compCode, Function, prevYear, currYear, criteria) {

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/apprNonComplied.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;

	frmObj.submit();

}

function apprReport(compCode, Function, prevYear, currYear, criteria) {

	frmObj = document.frmCntReport;

	frmObj.action = "../includes/apprReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&currYear="+currYear+"&criteria="+criteria;

	frmObj.submit();

}