var flg = 0;
function showPolicyDetail(){

	frmObj = document.frmAcceptInsuranceClaim;
	entity = frmObj.entity.value;
	loadFragment('../includes/policyNameDetail.jsp?entity='+entity,'id:policyName','Policy');
}

/*
function showPolicySumAssured(){

	frmObj = document.frmAcceptInsuranceClaim;
	policyId = frmObj.policyName.value;
	policyIdValue = policyId.split("|",1);
	loadFragment('../includes/policySumAssuredDetail.jsp?policyId='+policyIdValue[0],'id:policySumAssured','Sum Assured');
}
*/

function showPolicyNumber(){

	frmObj = document.frmAcceptInsuranceClaim;
	policyName = frmObj.policyName.value;
	policyNameValue = policyName.split("|",2);
	//alert(policyNameValue[1]);
	loadFragment('../includes/policyNumberDetail.jsp?entity='+entity+'&policyName='+policyNameValue[1],'id:policyNo','Policy Number');
	flg = 1;
		
}

function showInsuCompany(){
	frmObj = document.frmAcceptInsuranceClaim;
	entity = frmObj.entity.value;
	policyNumber = frmObj.policyNumber.value;
	policyName = frmObj.hiddPolicyName.value;
	//alert(policyNumber);
	//policyNumberValue = policyNumber.split("|",3);
	loadFragment('../includes/policyInsuCompanyDetail.jsp?entity='+entity+'&policyNo='+policyNumber+'&policyName='+policyName,'id:insuranceCompany','Insurance Company');
}


function onLoadDetail()
{
	frmObj = document.frmAcceptInsuranceClaim;
	entity = frmObj.entity.value;
	loadFragment('../includes/policyNameDetail.jsp?entity='+entity,'id:policyName','Policy');
	loadFragment('../includes/policyNumberDetail.jsp?policyName=0','id:policyNo','Policy Number');
	loadFragment('../includes/policyInsuCompanyDetail.jsp?entity=0&policyId=0&policyNo=0','id:insuranceCompany','Insurance Company');
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
    //alert(processingRequest);    
    element.innerHTML = processingRequest;

    try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;
                   
                element.innerHTML = message;
				if(parseInt(flg)==1){flg=0;showInsuCompany();}
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

function approveClaim(){
	frmObj = document.frmAcceptInsuranceClaim;
	var num = "0123456789";
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";

	/* check for Entity begins */
		entity = frmObj.entity.value;

		stat = checkNull("Entity", entity);

		if(!stat){
			frmObj.entity.focus();
			return;
		}
	/* check for Entity ends */

	/* check for policyName begins */
		policyName = frmObj.policyName.value;

		stat = checkNull("Type of Policy", policyName);

		if(!stat){
			frmObj.policyName.focus();
			return;
		}
	/* check for policyName ends */

	/* check for policyNo begins */
		policyNumber = frmObj.policyNumber.value;

		stat = checkNull("Policy Number", policyNumber);

		if(!stat){
			frmObj.policyNumber.focus();
			return;
		}
	/* check for policyNo ends */

	/* check for insuranceCompany begins */
		policyInsuComapny = frmObj.policyInsuComapny.value;

		stat = checkNull("Insurance Company", policyInsuComapny);

		if(!stat){
			frmObj.policyInsuComapny.focus();
			return;
		}
	/* check for insuranceCompany ends */

	/* check for claimFormValue begins */
		claimFormValue = frmObj.claimFormValue.value;

		stat = checkNull("Claim Form", claimFormValue);

		if(!stat){
			frmObj.claimFormValue.focus();
			return;
		}
	/* check for claimFormValue ends */

	frmObj.action = "../approver/acceptInsuranceClaimSubmit.jsp";
	frmObj.submit();


}

function surveyorAppDetail(){

	frmObj = document.frmSurveyorInsuranceClaim;

	for (i=frmObj.surveyorApp.length-1; i > -1; i--) 
	{		
		if (frmObj.surveyorApp[i].checked) 
		{
			surveyorApp = frmObj.surveyorApp[i].value;
			i = -1;	
		}		
	}
	if(surveyorApp == 0){
		loadFragment('../includes/surveyorAppDetail.jsp','surveyorAppDetail','Surveyor Details');
	}
	else{
		var text1 = "" ;
		document.getElementById("surveyorAppDetail").innerHTML = text1;

	}

}


function showSurveyorName(){

	frmObj = document.frmSurveyorInsuranceClaim;
	surveyorLocation = frmObj.surveyorLocation.value;
	//nocache = Math.random();
	//alert(surveyorLocation);
	//alert(document.getElementById('surveyorName').innerHTML);
	loadFragment('../includes/surveyorNameDetail.jsp?surveyorLocation='+surveyorLocation,'surveyorName','Surveyor Name');		
}

function showSurveyorDetails(idValue,locationValue){
	loadFragment('../includes/surveyorRemainingDetails.jsp?surveyorLocation='+locationValue+'&surveyorName='+idValue+'&text=1','surveyorAddress','Surveyor Address');		
	loadFragment('../includes/surveyorRemainingDetails.jsp?surveyorLocation='+locationValue+'&surveyorName='+idValue+'&text=2','surveyorPhone','Surveyor Phone');
	loadFragment('../includes/surveyorRemainingDetails.jsp?surveyorLocation='+locationValue+'&surveyorName='+idValue+'&text=3','surveyorMobile','Surveyor Mobile');
	loadFragment('../includes/surveyorRemainingDetails.jsp?surveyorLocation='+locationValue+'&surveyorName='+idValue+'&text=4','surveyorFax','Surveyor Fax');
	loadFragment('../includes/surveyorRemainingDetails.jsp?surveyorLocation='+locationValue+'&surveyorName='+idValue+'&text=5','surveyorEmailid','Surveyor Email Id');
}

function approveSurveyor(){
	frmObj = document.frmSurveyorInsuranceClaim;
	var num = "0123456789";
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\_";

	/* check for Surveyor Details begins */
	var surveyorApp = -1;
	var i ;
		for (i=frmObj.surveyorApp.length-1; i > -1; i--) 
		{	
			if (frmObj.surveyorApp[i].checked) 
			{
				surveyorApp = frmObj.surveyorApp[i].value;
				i = -1;	
			}		
		}
		if(surveyorApp == -1)
		{
			alert("Kindly select \"Appoint of Surveyor\" field! ");
			return;
		}
		if(surveyorApp == 0){

			/* check for surveyorLocation begins */
				//alert(frmObj.surveyorLocation.value);
				surveyorLocation = frmObj.surveyorLocation.value;

				if(surveyorLocation == 0){

					alert("Kindly select the Surveyor Location");
					frmObj.surveyorLocation.focus();
					return;
				}
				else{
			/* check for surveyorName begins */
					//alert(frmObj.surveyorName.value);
					surveyorNm =frmObj.surveyorName.value;

					if(surveyorNm == 0){

						alert("Kindly select the Surveyor Name");
						frmObj.surveyorName.focus();
						return;
					}				
			/* check for surveyorName ends */
				}										
							
		}

	frmObj.action = "../approver/surveyorDetailsSubmit.jsp";
	frmObj.submit();

}