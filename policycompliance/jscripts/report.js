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

function process(Function) {

	//alert(Function);
	//alert(subProcess);
   frmObj = document.frmMainFunciton;
   if ((Function=='BUSINESS AND COMMERCIALS') || (Function == 'Production')|| (Function == 'FINANCE')|| (Function == 'TTN')|| (Function == 'OMSL')|| (Function == 'TBSL') || (Function == 'ENIL-CORPORATE') || (Function == 'ENIL-MUMBAI') || (Function == 'TIML') || (Function == 'WWM') || (Function == 'Times Group Books') || (Function == 'TSS') || (Function == 'TOI BRAND')|| (Function == 'Modernisation') || (Function == 'RMD-Lucknow')|| (Function == 'RMD - Chandigarh') 
   || (Function == 'ETBRAND') || (Function == 'RMD - Nasik') || (Function == 'RMD - Patna') || (Function == 'RMD - Coimbatore') || (Function == 'RMD - Hyderabad') || 
   (Function == 'RMD - Jaipur') || (Function == 'RMD - Indore') || (Function == 'RMD - Chennai') || (Function == 'RMD - Kohlapur')|| (Function == 'RMD - Ahemdabad') 
   || (Function == 'RMD - Nagpur') || (Function == 'RMD - Raipur') || (Function == 'RMD - Goa') || (Function == 'RMD - Vizag') || (Function == 'RMD - Pune') || (Function == 'RMD - Bhopal') || (Function == 'RMD - Cochin') || (Function == 'RMD - Bangalore') || (Function == 'RMD - Delhi') || (Function == 'RMD - Kolkata') || (Function == 'RMD - Mumbai') || (Function == 'RMD - Aurangabad') || (Function == 'RMD - Madurai') || (Function == 'ENIL - Lucknow') || (Function == 'ENIL - Hyderabad') || (Function == 'ENIL - Surat') || (Function == 'ENIL - Kolkatta') || (Function == 'ENIL - Bangalore') || (Function == 'ENIL - Chennai') || (Function == 'ENIL - Jaipur') || (Function == 'ENIL - Mumbai') || (Function == 'ENIL - Ahm') || (Function == 'ENIL - Kanpur') || (Function == 'ENIL - Delhi')|| (Function == 'ENIL - Pune') || (Function == 'Response - Ahmedabad') || (Function == 'Response - Bangalore') || (Function == 'Response - Bhopal') || (Function == 'Response - Chandigarh') || (Function == 'Response - Chennai') || (Function == 'Response - Cochin') || (Function == 'Response - Delhi') || (Function == 'Response - Hyderabad') || (Function == 'Response - Jaipur') || (Function == 'Response - Lucknow') || (Function == 'Response - Mumbai') || (Function == 'Response - Patna') || (Function == 'Response - Pune') || (Function == 'Response- Kolkata') || (Function == 'TTN -Admin') || (Function == 'TTN - Sales') || (Function == 'TTN -HR') || (Function == 'TTN -Marketing') || (Function == 'TTN - Legal')|| (Function == 'MAS') || (Function == 'TTN - Finance')  || (Function == 'Times Music - Production') || (Function == 'Times Music - Finance') || (Function == 'Times Music - Warehouse') || (Function == 'Times Music - AnR') || (Function == 'Times Music - Legal') || (Function == 'Times Music - Sales') || (Function == 'Times Music') || (Function == 'MERGERS AND ACQUISITIONS'))
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

function subProcess(Function,process) {

	//alert("function=="+Function);
	//alert("process"+process);

	//frmObj = document.frmMainFunciton;
	frmObj = document.frmMainControl;

   if ((Function=='BUSINESS AND COMMERCIALS') || (Function == 'Production')|| (Function == 'FINANCE')|| (Function == 'TTN')|| (Function == 'OMSL')|| (Function == 'TBSL') || (Function == 'ENIL-CORPORATE') || (Function == 'ENIL-MUMBAI') || (Function == 'TIML') || (Function == 'WWM') || (Function == 'Times Group Books') || (Function == 'TSS') || (Function == 'TOI BRAND')|| (Function == 'Modernisation') || (Function == 'RMD-Lucknow')|| (Function == 'RMD - Chandigarh') 
   || (Function == 'ETBRAND') || (Function == 'RMD - Nasik') || (Function == 'RMD - Patna') || (Function == 'RMD - Coimbatore') || (Function == 'RMD - Hyderabad') || 
   (Function == 'RMD - Jaipur') || (Function == 'RMD - Indore') || (Function == 'RMD - Chennai') || (Function == 'RMD - Kohlapur')|| (Function == 'RMD - Ahemdabad') 
   || (Function == 'RMD - Nagpur') || (Function == 'RMD - Raipur') || (Function == 'RMD - Goa') || (Function == 'RMD - Vizag') || (Function == 'RMD - Pune') || (Function == 'RMD - Bhopal') || (Function == 'RMD - Cochin') || (Function == 'RMD - Bangalore') || (Function == 'RMD - Delhi') || (Function == 'RMD - Kolkata') || (Function == 'RMD - Mumbai') || (Function == 'RMD - Aurangabad') || (Function == 'RMD - Madurai') || (Function == 'ENIL - Lucknow') || (Function == 'ENIL - Hyderabad') || (Function == 'ENIL - Surat') || (Function == 'ENIL - Kolkatta') || (Function == 'ENIL - Bangalore') || (Function == 'ENIL - Chennai') || (Function == 'ENIL - Jaipur') || (Function == 'ENIL - Mumbai') || (Function == 'ENIL - Ahm') || (Function == 'ENIL - Kanpur') || (Function == 'ENIL - Delhi')|| (Function == 'ENIL - Pune') || (Function == 'Response - Ahmedabad') || (Function == 'Response - Bangalore') || (Function == 'Response - Bhopal') || (Function == 'Response - Chandigarh') || (Function == 'Response - Chennai') || (Function == 'Response - Cochin') || (Function == 'Response - Delhi') || (Function == 'Response - Hyderabad') || (Function == 'Response - Jaipur') || (Function == 'Response - Lucknow') || (Function == 'Response - Mumbai') || (Function == 'Response - Patna') || (Function == 'Response - Pune') || (Function == 'Response- Kolkata')|| (Function == 'TTN -Admin') || (Function == 'TTN - Sales') || (Function == 'TTN -HR') || (Function == 'TTN -Marketing') || (Function == 'TTN - Legal')|| (Function == 'MAS') || (Function == 'TTN - Finance')  || (Function == 'Times Music - Production') || (Function == 'Times Music - Finance') || (Function == 'Times Music - Warehouse') || (Function == 'Times Music - AnR') || (Function == 'Times Music - Legal') || (Function == 'Times Music - Sales') || (Function == 'Times Music') || (Function == 'MERGERS AND ACQUISITIONS'))
   {
		frmObj.action = "../includes/showSubProcessVertical.jsp?function="+Function+"&process="+process;

		frmObj.submit();
   }
   else
	{
		frmObj.action = "../includes/showSubProcess.jsp?function="+Function;

		frmObj.submit();
	}
}


function controlVertical(Function, subProcess, process) {

	//alert(Function);
	//alert(subProcess);

	frmObj = document.frmMainControl;

	frmObj.action = "../includes/showControlVertical.jsp?function="+Function+"&subProcess="+subProcess+"&process="+process;

	frmObj.submit();

}


function detailControlVertical(policyId,process,function1) {

	frmObj = document.frmMainControl;

	frmObj.action =
		"../includes/detailControlVertical.jsp?policyId="+policyId+"&process="+process+"&function1="+function1;

	frmObj.submit();

}


function detailControlVertical(function1,process,subProcess,policyId) {

	frmObj = document.frmMainControl;

	//alert(function1);
	//alert(process);
	//alert(subProcess);
	//alert(policyId);

	frmObj.action =
		"../includes/detailControlVertical.jsp?policyId="+policyId+"&process="+process+"&function="+function1+"&subProcess="+subProcess;

	frmObj.submit();

}


/*function subProcess(Function,process) {

	alert(process);


	frmObj = document.frmMainFunciton;

   frmObj.action = "../includes/showSubProcess.jsp?function="+Function+"&process="+process;

   frmObj.submit();

}*/


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

/*function showDepartments()
{	
	//alert("Here");
	frmObj = document.frmMainFunciton;
	//alert("here1");
	compCodeValues = frmObj.company1.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
	
	//department = frmObj.department.value;
		//alert("../includes/showDepartments.jsp?companyCode="+compCode);
	 loadFragment('../includes/showDepartments.jsp?companyCode='+compCode,'compDepartment','Departments');

}*/


/*function showDepartmentsDashboard()
{	
	frmObj = document.frmReport;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
	
	//department = frmObj.department.value;
		//alert("../includes/showDepartments.jsp?companyCode="+compCode);
	 loadFragment('../includes/showDepartments.jsp?companyCode='+compCode,'compDepartment','Departments');

}*/



function changeDate1(frequency,dayOfWeek){
frmObj = document.frmReport;
	fromDate = frmObj.date.value;
	toDate = frmObj.date.value;
	/*compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	dept = department.substring(department.indexOf("|")+1);
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/

		if(frequency==2){
	//frmObj.action="../reviewer/dashBoardWeekly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/dashBoardWeekly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}
}



function changeDate2(frequency){
	//alert(frequency);

	frmObj = document.frmReport;
	fromDate = frmObj.date.value;
	//alert(fromDate);
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	/*compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	dept = department.substring(department.indexOf("|")+1);
	alert(dept);
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/
	
	if(frequency==3){
		//alert(fromDate);
	//frmObj.action="../reviewer/dashBoardFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/dashBoardFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

}


function changeDate3(frequency){
	//alert(frequency);

	frmObj = document.frmReport;
	fromDate = frmObj.date.value;
	//alert(fromDate);
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	/*compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	dept = department.substring(department.indexOf("|")+1);
	alert(dept);
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/

	if(frequency==4){
		//alert(fromDate);
	//frmObj.action="../reviewer/dashBoardMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/dashBoardMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

}

function changeDate4(frequency){
	//alert(frequency);

	frmObj = document.frmReport;
	fromDate = frmObj.date.value;
	//alert(fromDate);
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	/*compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	dept = department.substring(department.indexOf("|")+1);
	alert(dept);
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/

	if(frequency==5){
		//alert(fromDate);
	//frmObj.action="../reviewer/dashBoardQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/dashBoardQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

}


function changeDate5(frequency){
	//alert(frequency);

	frmObj = document.frmReport;
	fromDate = frmObj.date.value;
//alert(fromDate);
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	/*compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	dept = department.substring(department.indexOf("|")+1);
	alert(dept);
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/

	if(frequency==6){
		//alert(fromDate);
	//frmObj.action="../reviewer/dashBoardHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/dashBoardHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

}


function changeDate6(frequency){
	//alert(frequency);

	frmObj = document.frmReport;
	fromDate = frmObj.date.value;
	//alert(fromDate);
	toDate = frmObj.date.value;

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	if(frequency==7){
		//alert(fromDate);
	frmObj.action="../reviewer/dashBoardAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

}


function reportChange(frequency){
	//alert(frequency);
	
	frmObj = document.frmMainFunciton;
	//alert(frmObj.newDate.value);
	fromDate = frmObj.date.value;
	//alert(fromDate);
	toDate = frmObj.date.value;
	//alert(toDate);

	/*compCodeValues = frmObj.company1.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
				if((compCode == 0))
				{
					alert("Please select the Company first!!");
				}
	
	department = frmObj.department.value;
	//alert(department);
	dept = department.substring(department.indexOf("|")+1);
	//alert(dept);
	
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}*/

	if(fromDate == "" || toDate == ""){
		alert("Please select all dates to proceed!!");
		frmObj.fromDate.focus();
		return;
	}
	
	if(frequency==2){
		//alert(fromDate);
	//frmObj.action="../reviewer/report.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/report.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==3){
		//alert(fromDate);
	//frmObj.action="../reviewer/reportFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/reportFortNightly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==4){
		//alert(fromDate);
	//frmObj.action="../reviewer/reportMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/reportMonthly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==5){
		//alert(fromDate);
	//frmObj.action="../reviewer/reportQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/reportQuarterly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==6){
		//alert(fromDate);
	//frmObj.action="../reviewer/reportHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/reportHalfYearly.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
	}

	if(frequency==7){
		//alert(fromDate);
	//frmObj.action="../reviewer/reportAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate+"&compCode="+compCode+"&dept="+dept;
	frmObj.action="../reviewer/reportAnnually.jsp?fromDate="+fromDate+"&toDate="+toDate;
	frmObj.submit();
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
}