function loadPage()
{
	var error = "";
	var flag  = 0;
	var docType = document.priceApprovalMain.docType.value;


	if(document.priceApprovalMain.docType.value == 0)
	{
		error += "Please Select type of document";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.docType.focus();
				flag = 1;
			}
	}

	if(error!="")
	{
		alert(error);
		return;
	}
	if (document.priceApprovalMain.docType.value == 'PAR')
	{
		
		random1 = Math.random();
		loadFragment('createPar.jsp?random='+random1+"&docType="+docType,'showRequests','Showing All Fields');

	}else if(document.priceApprovalMain.docType.value == 'Summary')
	{
		random1 = Math.random();
		loadFragment('createSummary.jsp?random='+random1,'showRequests','Showing All Fields');
	}
		
}
function isEmpty(length)
{
  	if(parseInt(length)==0)
	{
		return true;
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
    // alert(fragment_url);

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


function upload(attachmentName) {

	window.open('../upload/uploadFile.jsp?attachmentName='+attachmentName,'','resizable=no,tlebar=no,scrollbars=no,toolbar=no,status=no,width=470,height=230,top=80,left=100');
}


function textCounter(field,cntfield,maxlimit)
{
if (field.value.length > maxlimit)
	{
		field.value = field.value.substring(0, maxlimit);
	}
else 
	{
		document.getElementById(cntfield).innerHTML = maxlimit - field.value.length;
	}
}

function saveDraft(queryType)
{
	var error = "";
	var flag  = 0;
			
	counter					=	document.priceApprovalMain.count.value;

		for(i = 1; i<=counter; i++)
		{
			v = eval("document.priceApprovalMain.attach"+i);
			vval = v.value;

			v1 = eval("document.priceApprovalMain.attach"+i+"New");
			vval1 = v1.value;

			if(isEmpty(vval.length))
			{
				v.value = "NA";
				v1.value = "NA.NA_NA";
			}

			file1 = eval("document.priceApprovalMain.fileDesc"+i);
			fileval1 = file1.value;


			if(fileval1.length==0)
			{
				file1.value = "NA";
			}

		}

	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{      
		document.priceApprovalMain.savedraft1.disabled = true;  
        document.priceApprovalMain.savedraft1.value = 'Please Wait...';  

		  
		 if(queryType==1)

		{	

			document.priceApprovalMain.action = "common/saveDraftSubmitCon.jsp";
			document.priceApprovalMain.submit();
		}
		else
		{

			document.priceApprovalMain.action = "common/updateDraftSubmitCon.jsp";
			document.priceApprovalMain.submit();
		}
	}
}
function validateForm(queryType)
{
	var error = "";
	var flag  = 0;
			
	counter					=	document.priceApprovalMain.count.value;


	if(document.priceApprovalMain.category.value == 0)
	{
		error += "Please Select Category\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.category.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.parvalue.value.length))
	{
		error += "Fill Par Value \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.parvalue.focus();
				flag = 1;
			}
	}




	if(isEmpty(document.priceApprovalMain.app7.value.length))
	{				
		error += "B&C 3rd level approver is mandatory\n";	

		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.app7.focus();
				flag = 1;
			}
	}

		if(document.priceApprovalMain.select12.value==0 && document.priceApprovalMain.select13.value!=0)
			{
				error += "Please ensure that Director B&C is selected\n";
				if(parseInt(flag)==0)
					{
						document.priceApprovalMain.select12.focus();
						flag = 1;
					}

			}else if(document.priceApprovalMain.select13.value==0 && document.priceApprovalMain.select15.value!=0){

				error += "Please ensure that EP Supply Chain is selected\n";
				if(parseInt(flag)==0)
					{
						document.priceApprovalMain.select13.focus();
						flag = 1;
					}
			}else if(document.priceApprovalMain.select14.value==0 && document.priceApprovalMain.select15.value!=0){

					//error += "Please ensure that COO is selected\n";
					if(parseInt(flag)==0)
					{
					//	document.priceApprovalMain.select14.focus();
					//	flag = 1;
					}
			}else if(document.priceApprovalMain.select15.value==0 && document.priceApprovalMain.select16.value!=0){

					error += "Please ensure that CEO is selected\n";
					if(parseInt(flag)==0)
					{
						document.priceApprovalMain.select15.focus();
						flag = 1;
					}
			}


		counter = document.priceApprovalMain.count.value

		for(i = 1; i<=counter; i++)
		{
			v = eval("document.priceApprovalMain.attach"+i);
			vval = v.value;

			v1 = eval("document.priceApprovalMain.attach"+i+"New");
			vval1 = v1.value;

			if(isEmpty(vval.length))
			{
				v.value = "NA";
				v1.value = "NA.NA_NA";
			}

			file1 = eval("document.priceApprovalMain.fileDesc"+i);
			fileval1 = file1.value;


			if(fileval1.length==0)
			{
				file1.value = "NA";
			}

		}



	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{      

//alert(document.priceApprovalMain.summarySheetChk.checked);

	if(document.priceApprovalMain.summarySheetChk.checked){

		//document.priceApprovalMain.summarySheetChk.checked = false;
		val = confirm("Are you sure this PAR SHOULD wait for a Summary Sheet ? ");

	}else{
		//	document.priceApprovalMain.summarySheetChk.checked = false;

			val = confirm("Are you sure this PAR SHOULD NOT wait for a Summary Sheet ? ");

	}	

	if(val){
		document.priceApprovalMain.submitForm.disabled = true; 
        document.priceApprovalMain.submitForm.value = 'Please Wait...';  

		  
		if(queryType==1)
		{	

					document.priceApprovalMain.action = "common/insertDataSubmitCon.jsp";
					document.priceApprovalMain.submit();
		}else
			{

				document.priceApprovalMain.action = "common/updateSubmitCon.jsp";
				document.priceApprovalMain.submit();
			}
		}
	}
}


function addUser(forWhom, id) {

	frmObj = document.priceApproval;
	//document.priceApproval.forWhom.value = id;

	//alert(document.priceApproval.forWhom.value);
	
	window.open('../common/search.jsp?forWhom='+forWhom+"&id="+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=600,top=70,left=100');

}

function downloadAttachments(fileName){

	url = "../../common/download.jsp?fileName="+fileName;
	win = window.open(url,"Attachments","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	
}

function showAllRequests()
{
	randome = Math.random();
	loadFragment('common/viewAllStatusCon.jsp?randome='+randome,'allProcess','Showing All Requests');
	loadFragment('common/viewAllSummerycon.jsp?randome='+randome,'allsummeryProcess','Showing All Requests');
	//setTimeout("showStatus()",1000*15);
}


function viewSabCon()
{	
	randome = Math.random();
	loadFragment('common/viewSabCon.jsp?randome='+randome,'sab','Checking Support & Approve');
}

function openRemarks(priceId,userOId,approverType, statusType)
{  
	

	if(approverType=="SD1")
	{
		SD1   = 1;
		flagR = 1;
	}else if(approverType=="SD2")
	{
		SD2   = 1;
		flagR = 1;
	}
	else if(approverType=="AP11")
	{
		AP11 = 1;
		flagR = 1;
	}
	else if(approverType=="AP12")
	{
		AP12 = 1;
		flagR = 1;
	}
	else if(approverType=="AP13")
	{
		AP13 = 1;
		flagR = 1;
	}
	else if(approverType=="AP21")
	{
		AP21 = 1;
		flagR = 1;
	}else if(approverType=="AP22")
	{
		AP22 = 1;
		flagR = 1;
	}
	else if(approverType=="AP23")
	{
		AP23 = 1;
		flagR = 1;
	}
	else if(approverType=="AP31")
	{
		AP31 = 1;
		flagR = 1;
	}else if(approverType=="AP32")
	{
		AP32 = 1;
		flagR = 1;
	}else if(approverType=="AP33")
	{
		AP33 = 1;
		flagR = 1;
	}else if(approverType=="AP34")
	{
		AP34 = 1;
		flagR = 1;
	}else if(approverType=="AP35")
	{
		AP35 = 1;
		flagR = 1;
	}else if(approverType=="AP36")
	{
		AP36 = 1;
		flagR = 1;
	}
	else if(approverType=="AP4")
	{
		AP4 = 1;
		flagR = 1;
	}
	else if(approverType=="AP5")
	{
		AP5 = 1;
		flagR = 1;
	}
	else if(approverType=="AP6")
	{
		AP6 = 1;
		flagR = 1;
	}else if(approverType=="AP7")
	{
		AP7 = 1;
		flagR = 1;

	}else if(approverType=="AP8")
	{
		AP8 = 1;
		flagR = 1;
	}

	window.open('../common/insertRemarksCon.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');
}


function postRemarks(priceId,userOId,approverType,statusType)
{
	
		frmObj = document.postRemarksForm;
	var remarks = frmObj.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');

	
	if(remarks.length!=0 && remarks!='')
	{
		
		var random = Math.random();
	
	}else
	{
		alert("Please enter remarks");
		 return;
	}

	document.postRemarksForm.remarksPost.disabled = true;  
	document.postRemarksForm.remarksPost.value = 'Please Wait...';  

	frmObj.action="../common/insertRemarksSubmitCon.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&remarks='+remarks+'&random='+random;
	frmObj.submit( );
	//self.close();
}


function navigateCallRemarksCon(timescapeUserOId,priceid)
{
	 url = "../common/showDetailsCon.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.opener.location.href=url;
 	 self.close();
}


function submitSummary()
{
	var error = "";
	var flag  = 0;
			


	if(document.priceApprovalMain.parList.value == 0)
	{
		error += "Please Select atleast one price id \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.parList.focus();
				flag = 1;
			}
	}

		counter = document.priceApprovalMain.count.value

		for(i = 1; i<=counter; i++)
		{
			v = eval("document.priceApprovalMain.attach"+i);
			vval = v.value;

			v1 = eval("document.priceApprovalMain.attach"+i+"New");
			vval1 = v1.value;

			if(isEmpty(vval.length))
			{
				v.value = "NA";
				v1.value = "NA.NA_NA";
			}

			file1 = eval("document.priceApprovalMain.fileDesc"+i);
			fileval1 = file1.value;


			if(fileval1.length==0)
			{
				file1.value = "NA";
			}

		}

	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{      			userstatus					=	"UC"

		document.priceApprovalMain.submitForm.disabled = true;  
		document.priceApprovalMain.submitForm.value = 'Please Wait...';  

		document.priceApprovalMain.action = "common/insertSummarySubmitCon.jsp?userstatus="+userstatus;
		document.priceApprovalMain.submit();
	}

}


function saveSummaryDraft(queryType)
{
	var error = "";
	var flag  = 0;

	if(document.priceApprovalMain.parList.value == 0)
	{
		error += "Please Select atleast one price id \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.parList.focus();
				flag = 1;
			}
	}
			
	counter					=	document.priceApprovalMain.count.value;

	userstatus					=	"UCSD"//document.priceApprovalMain.userstatus.value;

		for(i = 1; i<=counter; i++)
		{

			v = eval("document.priceApprovalMain.attach"+i);
			vval = v.value;

			v1 = eval("document.priceApprovalMain.attach"+i+"New");
			vval1 = v1.value;

			if(isEmpty(vval.length))
			{
				v.value = "NA";
				v1.value = "NA.NA_NA";
			}

			file1 = eval("document.priceApprovalMain.fileDesc"+i);
			fileval1 = file1.value;


			if(fileval1.length==0)
			{
				file1.value = "NA";
			}

		}

	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{      

		  
		 if(queryType==1)
		{	


		document.priceApprovalMain.savedraft1.disabled = true;  
        document.priceApprovalMain.savedraft1.value = 'Please Wait...';  


			userstatus					=	"UCSD"//document.priceApprovalMain.userstatus.value;
			document.priceApprovalMain.action = "common/insertSummarySubmitCon.jsp?userstatus="+userstatus;
			document.priceApprovalMain.submit();
		}else  if(queryType==2)
		{
		document.priceApprovalMain.savedraft1.disabled = true;  
        document.priceApprovalMain.savedraft1.value = 'Please Wait...';  


			userstatus					=	"UCSD"
			document.priceApprovalMain.action = "common/updateSummaryCon.jsp?userstatus="+userstatus;
			document.priceApprovalMain.submit();
		}else{

		document.priceApprovalMain.submitForm.disabled = true;  
        document.priceApprovalMain.submitForm.value = 'Please Wait...';  



			userstatus					=	"UC" 
			document.priceApprovalMain.action = "common/updateSummaryCon.jsp?userstatus="+userstatus;
			document.priceApprovalMain.submit();
		}
	}
}