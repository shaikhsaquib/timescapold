function acceptClaim(){
	frmObj = document.frmCheckRequestDetails;
	frmObj.action = "../approver/acceptInsuranceClaim.jsp";
	frmObj.submit( );
}

function rejectClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/rejectInsuranceClaim.jsp";
	frmObj.submit( );	
}

function submitClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/submitInsuranceClaim.jsp";
	frmObj.submit( );	
}

function settleClaim()
{
	frmObj = document.frmCheckRequestDetails;

	frmObj.action = "../approver/settleInsuranceClaim.jsp";
	frmObj.submit( );	
}

function rejectClaimRemark(){

	frmObj = document.frmCheckRequestDetails;

	self.close();
	requestNo = frmObj.hiddRequestNo.value;
	window.open('../approver/rejectInsuranceClaim.jsp?requestNo='+requestNo,'');
}
function companyRejectClaimRemark(){

	frmObj = document.frmCheckRequestDetails;

	self.close();
	requestNo = frmObj.hiddRequestNo.value;
	claimNo = frmObj.hiddClaimNo.value;
	window.open("../approver/companyRejectInsuranceClaim.jsp?requestNo="+requestNo+"&claimNo="+claimNo);
}

function holdClaimRemark(){

	frmObj = document.frmCheckRequestDetails;

	self.close();
	requestNo = frmObj.hiddRequestNo.value;
	claimNo = frmObj.hiddClaimNo.value;
	window.open("../approver/holdInsuranceClaim.jsp?requestNo="+requestNo+"&claimNo="+claimNo);
}

function updateUserClaimField(){
	frmObj = document.frmCheckRequestDetails;
	requestNo = frmObj.hiddRequestNo.value;
	claimNo = frmObj.hiddClaimNo.value;
	var updatedAmount = document.getElementById("updatedDamageValue").value;
	//alert(updatedAmount);
	//window.open("../common/updateRequestDetails.jsp?requestNo="+requestNo+"&claimNo="+claimNo+"&updatedDamageValue="+updatedAmount,"","resizable=yes,toolbars=no,scrollbars=yes,width=800,height=600,top=50,left=50");
	//loadFragment("../common/updateRequestDetails.jsp?requestNo="+requestNo+"&claimNo="+claimNo+"&updatedDamageValue="+updatedAmount, "resultArea" , "");
	//setTimeout(location.reload(true), 2000);
	
	frmObj.action = "../common/updateRequestDetails.jsp?requestNo="+requestNo+"&claimNo="+claimNo+"&updatedDamageValue="+updatedAmount;
	frmObj.submit( );	
}

document.getElementById("updatedDamageValue").addEventListener("click", function(event){
  event.preventDefault()
});

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