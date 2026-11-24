function legacyData(txnId,compCode,payId,name,effMonth,claimAmt)
{
	frmObj = document.frmProcessRequest;
	frmObj.txnId.value			= txnId;
	frmObj.compCode.value	    = compCode;
	frmObj.payId.value			= payId;
    frmObj.requestorName.value	= name;
	frmObj.effectiveMonth.value = effMonth;
	frmObj.claimAmount.value	= claimAmt;

	

	frmObj.action = "../processor/viewRequest.jsp";
	frmObj.submit( );
}


function sendMail(txnId, appln, name, emailId,compCode)
{
	frmObj = document.frmProcessRequest;
	frmObj.txnId.value	= txnId;
	frmObj.appln.value	= appln;
	frmObj.requestorName.value	= name;
	frmObj.requestorEmailId.value	= emailId;
	frmObj.compCode.value	    = compCode;
	
	val = confirm("Do you wish to send email? ");
	if(val){
		frmObj.action = "../processor/sendMail.jsp";
		frmObj.submit( );
	}
	else{
		return;
	}
}

function showData()
{
	frmObj = document.frmProcessRequest;
    
   	var companyCode		= frmObj.companyCode.value;
    if(companyCode==0){
        alert("Please select a company!!!");
        frmObj.companyCode.focus();
        return;
    }
    frmObj.compCode.value= companyCode;
	frmObj.option.value="getData";

	frmObj.action = "../processor/processRequest.jsp";
	frmObj.submit();
}

breakStat = 0;
function process(listSize){
	frmObj = document.frmProcessRequest;
    stat=false;
	for (var i = 0; i <listSize;i++){
		expr =  "frmObj.process"+i+".checked";
        stat  = stat||eval(expr);
	}
    if(!stat){
        alert("Please select atleast one application to process!!!");
        return;
	}
    else if(breakStat == 0){
            breakStat = 1;
            frmObj.submit2.disabled=true;
	        frmObj.option.value="submit";
            frmObj.action="../processor/processSubmit.jsp";
            frmObj.submit();
    }
}