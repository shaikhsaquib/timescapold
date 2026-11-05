function sendMail(txnId, appln, name, emailId, companyCode)
{
	frmObj = document.frmProcessRequest;

	frmObj.txnId.value	= txnId;
	frmObj.appln.value	= appln;
	frmObj.requestorName.value	= name;
	frmObj.requestorEmailId.value	= emailId;
    frmObj.compCode.value= companyCode;
	
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

function process(listSize,companyCode)
{
	frmObj = document.frmProcessRequest;
    frmObj.compCode.value= companyCode;
    stat=false;
	for (var i = 0; i <listSize;i++){
		for(var j=0; j <=1; j++){
			expr =  "frmObj.process"+i+"["+j+"].checked";
            stat  = stat||eval(expr);
        }
	}
   if(!stat){
        alert("Please select atleast one application to process!!!");
        return;
	}
    
            frmObj.action="../processor/processSubmit.jsp?listSize="+listSize;
            frmObj.submit();
  
}



function onClickCheck(rows,amount, kk)
{
	frmObj = document.frmProcessDetails;

	var nightAllowance = parseInt(frmObj.nightAllowance.value);

	var fieldAllowance = parseInt(frmObj.fieldAllowance.value);
	
	var count= 0;
	
	for(var i=0; i<rows;i++)
	{
	if(eval('frmObj.particularsChk'+i+'.checked') == false)  
		{
			if(eval('frmObj.type'+i+'.value') =="Field Allowance")
			{	 
				amount = amount - fieldAllowance;
				
			}else if(eval('frmObj.type'+i+'.value') =="Night Allowance")
			{
				amount = amount - nightAllowance;
			}
				
				document.getElementById("approverAmount").value = amount;
		
		}

		else if(eval('frmObj.particularsChk'+i+'.checked') == true)  
		{
		
				document.getElementById("approverAmount").value = amount;		
		}
		
		
	}
}


function requestAccept(rows)
{
	frmObj = document.frmProcessDetails;

	for(var i=0; i<rows;i++)
	{		
		var approverRemarks = eval('frmObj.approverRemarks'+i+'.value');
		if((eval('frmObj.particularsChk'+i+'.checked') == false) && (eval('frmObj.approverRemarks'+i+'.value') ==''))
		{						
				alert("Please enter the Reason");
				eval('frmObj.approverRemarks'+i).focus();				
				return;
		 } 
	}
			 
				frmObj.action="../common/processorAcceptDetails.jsp";
				frmObj.submit();
}

function requestReject()
{
	frmObj = document.frmProcessDetails;

	var msg= "Are you sure you want to Reject this Transaction ? ";
	var agree=confirm(msg);
	if (agree)
		{
			 
			frmObj.action="../common/processorRejectDetails.jsp";
			frmObj.submit();
		}
		else{

			return ;
		}

}
