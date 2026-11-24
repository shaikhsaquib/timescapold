function showDepartments() //Quiz Report.
{	
	
	frmObj = document.governanceQuiz;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues
	//alert("showDepartmentsQuiz==="+compCode);
				if(	(compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
	 SelValue = frmObj.module.value;

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}
	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function showDepartmentsCnt() //Code - Total Count Report.
{	
	frmObj = document.frmCntReport;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues;

	 SelValue = frmObj.module.value;

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}
	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


function showDepartmentsCode() //Code - User Wise/PolicyWise N-C,OverRidden Report.
{	
	frmObj = document.frmSaveChklist;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues;

	 SelValue = frmObj.module.value;

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}
	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}



function showDepartmentsShow() //OCA Report.
{	
	frmObj = document.frmMainFunciton;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;
	frequency = frmObj.frequency.value;
	//alert(frequency);
	compCode = compCodeValues;
	 SelValue = frmObj.module.value;

	 //alert("SelValue..."+SelValue);

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}
	company = compCodeValues;
	//alert(compCode);

	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
    
	if((SelValue == "OCA"))
	{
	 if (company == '1000'){	
		selDept = frmObj.selectedDept.value;
		var e = document.getElementById("selectedFunct");
		var funct = e.options[e.selectedIndex].value;

		//alert("hi="+funct);
		if (frequency == "1")
		{
			frmObj.action="../../policycompliance/reports/reportDaily.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "2")
		{
			frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "3")
		{	
			frmObj.action="../../policycompliance/reports/reportFortNightly.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "4")
		{
			frmObj.action="../../policycompliance/reports/reportMonthly.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "5")
		{
			frmObj.action="../../policycompliance/reports/reportQuarterly.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "6")
		{
			frmObj.action="../../policycompliance/reports/reportHalfYearly.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}else if (frequency == "7")
		{
			frmObj.action="../../policycompliance/reports/reportAnnually.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept+"&funct="+funct;
		}
		
		frmObj.submit();
	 }else {			
		frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
		frmObj.submit();
	 }
	}

	/*if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule+"&dept="+selDept;
	frmObj.submit();
	}*/
}

function showDepartmentsShowEx() //OCA Report.
{	
	frmObj = document.frmMainFunciton;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;	
	compCode = compCodeValues;
	SelValue = frmObj.module.value;

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}
	company = compCodeValues;
	//alert(company);
	//alert(compCode);
	//alert(selectedModule);

	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}



function showDepartmentsOca() //OCA Report.
{	
	frmObj = document.frmReport;
	selectedModule = frmObj.module.value;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues;

	SelValue = frmObj.module.value;

				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}

	//alert("Hi22222");

	if((SelValue == "CODE")){
	frmObj.action="../../governancecode/reports/countReport.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "QUIZ")){
	frmObj.action="../../governancequiz/reports/governanceReports.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "OCA")){
	frmObj.action="../../policycompliance/reports/report.jsp?compCode="+compCode+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}

function showAllFunctions(){
	var e = document.getElementById("selectedDept");
	var dept = e.options[e.selectedIndex].value;
	//alert(dept);
	loadFragment('../../common/showFunctions.jsp?deptCode='+dept,'functionDiv','Functions');
	
		//alert("value "+functVal);
	setTimeout("selectElement()",1000);
}

function selectElement() {   
	var functVal = document.getElementById("funct").value;
    var el = document.getElementById("selectedFunct");
	//alert(el.length);
	
	if(functVal === ''){
		el.value = 0;
	}else{
	for (var i = 0; i < el.length-1; i++) 
		if (el[i].value == functVal) el[i].selected = true;
	
    el.value = functVal;
	}
}

