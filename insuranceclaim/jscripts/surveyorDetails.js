
function showSurveyorName(){

	frmObj = document.frmSurveyorDetails;
	surveyorLocation = frmObj.surveyorLocation.value;	
	loadFragment('../includes/surveyorNameDetail.jsp?surveyorLocation='+surveyorLocation,'id:surveyorName','Surveyor Name');		
}

function showSurveyorDetails(){

	frmObj = document.frmSurveyorDetails;
	surveyorName = frmObj.surveyorName.value;	
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation='+surveyorLocation+'&surveyorName='+surveyorName+'&text=1','id:surveyorAddress','Surveyor Address');		
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation='+surveyorLocation+'&surveyorName='+surveyorName+'&text=2','id:surveyorPhone','Surveyor Phone');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation='+surveyorLocation+'&surveyorName='+surveyorName+'&text=3','id:surveyorMobile','Surveyor Mobile');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation='+surveyorLocation+'&surveyorName='+surveyorName+'&text=4','id:surveyorFax','Surveyor Fax');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation='+surveyorLocation+'&surveyorName='+surveyorName+'&text=5','id:surveyorEmailid','Surveyor Email Id');
}


function onLoadDetail()
{
	frmObj = document.frmSurveyorDetails;
	surveyorLocation = frmObj.surveyorLocation.value;
	loadFragment('../includes/surveyorNameDetail.jsp?surveyorLocation=0','id:surveyorName','Surveyor Name');
	/*loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0','id:surveyorDetail','Surveyor Details');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0&text=1','id:surveyorAddress','Surveyor Address');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0&text=2','id:surveyorPhone','Surveyor Phone');	
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0&text=3','id:surveyorMobile','Surveyor Mobile');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0&text=4','id:surveyorFax','Surveyor Fax');
	loadFragment('../includes/surveyorDetails.jsp?surveyorLocation=0&surveyorName=0&text=5','id:surveyorEmailid','Surveyor Email Id');*/
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
				}
             }
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
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
			/* check for surveyorName begins */
				surveyorName = frmObj.surveyorName.value;

				stat = checkNull("Surveyor Name", surveyorName);

				if(!stat){
					frmObj.surveyorName.focus();
					return;
				}

				stat = checkJunk("Surveyor Name" , surveyorName, junk);
		
				if(!stat){
					frmObj.surveyorName.focus();
					return;
				}

				stat = checkNumInName("Surveyor Name" , surveyorName, num);
	
				if(!stat){
					frmObj.surveyorName.focus();
					return;
				}

			/* check for surveyorName ends */

			/* check for surveyorPhoneNo begins */
				phoneNo = frmObj.phoneNo.value;

				stat = checkNull("Surveyor Phone No", phoneNo);

				if(!stat){
					frmObj.phoneNo.focus();
					return;
				}

				stat = checkMobileNoLength("Phone No" , phoneNo);
		
				if(!stat){
					frmObj.phoneNo.focus();
					return;
				}
			/* check for surveyorPhoneNo ends */

			/* check for surveyorMobileNo begins */
				mobileNo = frmObj.mobileNo.value;

				stat = checkNull("Surveyor Mobile No", mobileNo);

				if(!stat){
					frmObj.mobileNo.focus();
					return;
				}

				stat = checkMobileNoLength("Mobile No" , mobileNo);
		
				if(!stat){
					frmObj.mobileNo.focus();
					return;
				}
			/* check for surveyorMobileNo ends */

			/* check for surveyorEmailId begins */
				emailId = frmObj.emailId.value;

				stat = checkNull("Surveyor Emailid", emailId);

				if(!stat){
					frmObj.emailId.focus();
					return;
				}

				stat = checkEmail('emailId');
				if(!stat){

					frmObj.emailId.focus();
					return;
				}
			/* check for surveyorEmailId ends */

		}
	/* check for Surveyor Details ends */

	frmObj.action = "../approver/surveyorDetailsSubmit.jsp";
	frmObj.submit();


}