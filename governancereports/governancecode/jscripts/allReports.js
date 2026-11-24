function showDepartments()
{	
	frmObj = document.frmCntReport;
	compCodeValues = frmObj.company2.value;
	compCode = compCodeValues.substring(0,compCodeValues.indexOf("|"))
	//alert(compCode);
				if((compCode == null) || (compCode == "" ))
				{
					compCode = 0;
				}
	 loadFragment('../reports/showDepartments.jsp?companyCode='+compCode,'compDepartment','Departments');
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


function changeDate1(select1){
frmObj = document.frmCntReport;
	selectedModule = frmObj.module.value;
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
	
	department = frmObj.department.value;
	dept = department;
	//dept = department.substring(0,department.indexOf("|"));
	if((dept == 0) && (compCode != 0)) {
		dept="all"
	}

	var myindex  = select1.selectedIndex
    var SelValue = select1.options[myindex].value
		//alert("^^^^"+SelValue);
				if((SelValue == 0))
				{
					alert("Please select the Report Type first!!");
				}

	if((SelValue == "nonCompliance")){
	frmObj.action="../reports/reports.jsp?compCode="+compCode+"&dept="+dept+"&SelValue="+SelValue+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "policyWise")){
	frmObj.action="../reports/policyReports.jsp?compCode="+compCode+"&dept="+dept+"&SelValue="+SelValue+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "overridden")){
	frmObj.action="../reports/overriddenReports.jsp?compCode="+compCode+"&dept="+dept+"&SelValue="+SelValue+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}

	if((SelValue == "totalCount")){
	frmObj.action="../reports/countReport.jsp?compCode="+compCode+"&dept="+dept+"&SelValue="+SelValue+"&selectedCompany="+compCode+"&selectedModule="+selectedModule;
	frmObj.submit();
	}
}


/*function changeDate2(select1)
{
	alert("HI");
    frmObj = document.frmCntReport;
	var myindex  = select1.selectedIndex
    var SelValue = select1.options[myindex].value
    alert("^^^^"+SelValue);
    return true;
}*/


function userReport(compCode, Function, prevYear, apprOId, criteria) {

	//alert("Function1---"+Function);

	frmObj = document.frmCntReport;

	//alert("Function---"+Function);

	frmObj.action = "../reports/userReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&apprOId="+apprOId+"&criteria="+criteria;

	frmObj.submit();

}

function compliedReport(compCode, Function, prevYear, apprOId, criteria, userCompliance) {

	//alert("criteria---"+criteria);

	frmObj = document.frmCntReport;

	frmObj.action = "../reports/compliedReport.jsp?compCode="+compCode+"&Function="+Function+"&prevYear="+prevYear+"&userCompliance="+userCompliance+"&apprOId="+apprOId+"&criteria="+criteria;

	frmObj.submit();
}


function returnMainPage(){
frmObj = document.frmCntReport;
	frmObj.action="../../common/governanceAllReports.jsp";
	frmObj.submit();
}