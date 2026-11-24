function questionReport(compCode, frequency, createdDate, criteria) {

	frmObj4 = document.frmReport;

	frmObj4.action = "../includes/questionReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	/*win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;
*/

	frmObj4.submit();
	
	
}


function userReport(compCode, frequency, createdDate, criteria) {

	frmObj5 = document.frmReport;

	frmObj5.action = "../includes/userReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	
	frmObj5.submit();

}

function viewAllReport(compCode, frequency, createdDate) {

	frmObj5 = document.frmMainFunciton;

	frmObj5.action = "../common/downloadNotActedReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate;
	
	frmObj5.submit();

}

function viewSubNotActedReport(compCode, frequency, createdDate) {

	frmObj5 = document.frmMainFunciton;

	frmObj5.action = "../common/downloadSubNotActedReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate;
	
	frmObj5.submit();

}

function viewSubActedReport(compCode, frequency, createdDate) {

	frmObj5 = document.frmMainFunciton;

	frmObj5.action = "../common/downloadSubActedReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate;
	
	frmObj5.submit();

}

function approverReport(compCode, frequency, createdDate, criteria) {

	frmObj6 = document.frmReport;

	frmObj6.action = "../includes/approverReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	
	frmObj6.submit();
}


function functionReport(compCode, frequency, createdDate, Function, criteria) {

	frmObj7 = document.frmReport;

	frmObj7.action = "../includes/functionReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&Function="+Function+"&criteria="+criteria;
	
	frmObj7.submit();
}



function downloadQuestionReport(compCode, frequency, createdDate, criteria) {

	frmObj = document.frmReport;

	frmObj.action = "../includes/downloadQuestionReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	/*win = window.open(url,"Reports","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;
*/

	frmObj.submit();
	
	
}


function downloadUserReport(compCode, frequency, createdDate, criteria) {

	frmObj1 = document.frmReport;

	frmObj1.action = "../includes/downloadUserReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	
	frmObj1.submit();

}


function downloadApproverReport(compCode, frequency, createdDate, criteria) {

	frmObj2 = document.frmReport;

	frmObj2.action = "../includes/downloadApproverReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&criteria="+criteria;
	
	frmObj2.submit();
}


function downloadFunctionReport(compCode, frequency, createdDate, Function, criteria) {

	frmObj3 = document.frmReport;

	frmObj3.action = "../includes/downloadFunctionReport.jsp?compCode="+compCode+"&frequency="+frequency+"&createdDate="+createdDate+"&Function="+Function+"&criteria="+criteria;
	
	frmObj3.submit();
}


function subProcess(Function,process) {

	//frmObj = document.frmMainFunciton;
	frmObj = document.frmMainControl;

   //frmObj.action = "../includes/showSubProcess.jsp?function="+Function+"&process="+process;

   frmObj.submit();

}

function process(Function) {

	//alert(Function);
	//alert(subProcess);
   frmObj = document.frmMainFunciton;
   if (!Function=='' || !Function==null)
   {
	    frmObj.action = "../includes/showProcess.jsp?function="+Function;

		frmObj.submit();
   }
   else
   {
	    frmObj.action = "../includes/showSubProcess.jsp?function="+Function;

		frmObj.submit();
   }
   

}


function control(Function, subProcess) {

	frmObj = document.frmMainControl;

	frmObj.action = "../includes/showControl.jsp?function="+Function+"&subProcess="+subProcess;

	frmObj.submit();

}

function detailControl(policyId) {

	frmObj = document.frmMainControl;

	frmObj.action =
		"../includes/detailControl.jsp?policyId="+policyId;

	frmObj.submit();

}

function changeDate(frequency){
	//alert(frequency);
	frmObj = document.frmReport;
	fromDate = frmObj.fromDate.value;
	toDate = frmObj.toDate.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	if(frequency==1){
	frmObj.action="../reviewer/daily.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==2){
		//alert(fromDate);
	frmObj.action="../reviewer/dashBoardWeekly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==3){
	frmObj.action="../reviewer/dashBoardFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==4){
	frmObj.action="../reviewer/dashBoardMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==5){
	frmObj.action="../reviewer/dashBoardQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==6){
	frmObj.action="../reviewer/dashBoardHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==7){
	frmObj.action="../reviewer/dashBoardAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}
}


function changeDate1(frequency,dayOfWeek){
frmObj = document.frmReport;
selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	if(frequency==2){
	frmObj.action="../reports/dashBoardWeekly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function changeDate2(frequency){
	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	

	if(frequency==3){
	frmObj.action="../reports/dashBoardFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function changeDate3(frequency){
	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	if(frequency==4){
	frmObj.action="../reports/dashBoardMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}

function changeDate4(frequency){

	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	if(frequency==5){
		//alert(fromDate);
	frmObj.action="../reports/dashBoardQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	//frmObj.action="../reviewer/dashBoardQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}
}


function changeDate5(frequency){
	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	if(frequency==6){
		//alert(fromDate);
	frmObj.action="../reports/dashBoardHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function changeDate6(frequency){
	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}

	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	if(frequency==7){
		//alert(fromDate);
	frmObj.action="../reports/dashBoardAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function allReportChange(frequency){
	frmObj = document.frmMainFunciton;
	selectedModule = frmObj.module.value;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;

	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues

				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}

	if(frequency==1){
		//alert(fromDate);
	frmObj.action="../reports/reportDaily.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
	
	if(frequency==2){
		//alert(fromDate);
	frmObj.action="../reports/report.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if(frequency==3){
		//alert(fromDate);
	frmObj.action="../reports/reportFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if(frequency==4){
		//alert(fromDate);
	frmObj.action="../reports/reportMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if(frequency==5){
		//alert(fromDate);
	frmObj.action="../reports/reportQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if(frequency==6){
		//alert(fromDate);
	frmObj.action="../reports/reportHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if(frequency==7){
		//alert(fromDate);
	frmObj.action="../reports/reportAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

}


/*function loadFragment(fragment_url, element_id, for_what){
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
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
}*/