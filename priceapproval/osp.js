function getOspDetails()
{
	var error = "";
	var flag  = 0;

	var frmObj2 = document.priceApprovalMain;
	var sanctionedRefType = document.getElementById('sanctionedRefType').value;
	var refNumber = document.getElementById('refNumber').value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;
	var company = document.getElementById('company').value;
	
	if(document.priceApprovalMain.company.value == 0)
	{
		error += "Please Select Company\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.company.focus();
				flag = 1;
			}
	}
	if(document.priceApprovalMain.sanctionedRefType.value == 0)
	{
		error += "Please Select Sanctioned Reference Type\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.sanctionedRefType.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.refNumber.value.length))
	{
		error += "Fill Reference Number\n";
	if(parseInt(flag)==0)
		{
			document.priceApprovalMain.refNumber.focus();
			flag = 1;
		}
	}else if ((document.priceApprovalMain.refNumber.value.length >=150))
	{
		error += "Reference Number cannot exceed more then 150 characters \n";
	}


	if(isEmpty(document.priceApprovalMain.dateOfApproval.value.length))
	{
		error += "Fill Date of Approval\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.dateOfApproval.focus();
				flag = 1;
			}
	}
	
	if(error!="")
	{
		alert(error);
	}
	else
	{
		//$("#showRequests").show();
		randome = Math.random();
		loadFragment1('createRequestOsp.jsp?randome='+randome+'&company='+company,'showRequests','Showing All Fields');
	}
	
}

function showSabOsp()
{	
	//alert("ghgh");
	randome = Math.random();
	loadFragment1('../priceapproval/OSP/common/viewSabOsp.jsp?randome='+randome,'sabOsp','Pending Requests');
	//setTimeout("showSAB()",1000*15);
}


function loadFragment1(fragment_url, element_id, for_what){
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
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

function showAttachedFile(fileName, emailid,str,requestId,attachment){
	var url			= "/timescape/sapep/employeeselfservice/priceapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	window.location.href = url;
}





function changeLable()
{
	var company = $("#company").val();
	if(company  != '1000'){
		$("#label1").html("<b>Group Company CEO<b>");
		$("#label2").html("<b>Director B&C<b>");
		$("#label3").html("<b>EP Supply Chain<b>");
		$("#label4").html("<b>CEO(Publishing)<b>");
	}else{
		$("#label1").html("<b>Director B&C<b>");
		$("#label2").html("<b>EP Supply Chain<b>");
		$("#label3").html("<b>COO<b>");
		$("#label4").html("<b>CEO(Publishing)<b>");
	}
}

function isEmpty(length)
{
  	if(parseInt(length)==0)
	{
		return true;
	}
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

 function validateForm(queryType)
	{
		//alert("fdg");
		var error = "";
		var flag  = 0;


	if(isEmpty(document.priceApprovalMain.projectName.value.length))
	{
		error += "Fill Project Name \n";
		if(parseInt(flag)==0)
		{
			document.priceApprovalMain.projectName.focus();
			flag = 1;
		}
	}

/*	if(isEmpty(document.priceApprovalMain.contractValidity.value.length))
	{
		error += "Fill contract validity \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.contractValidity.focus();
				flag = 1;
			}
	}
*/

	var fromDates   = document.priceApprovalMain.fromContractValidity.value;
	var toDates     = document.priceApprovalMain.toContractValidity.value;

	var fromDates1       = dateFormat(fromDates);
	var toDates1         = dateFormat(toDates);
 	if(toDates1 < fromDates1 ){

		error +="Contract Validity to Date cannot be earlier than From Date! \n";
		if(parseInt(flag)==0)
		{			
			document.priceApprovalMain.toContractValidity.focus();
			flag = 1;
		}
	}

	if(isEmpty(document.priceApprovalMain.description.value.length))
	{
		error += "Fill description \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.description.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.contractValue.value.length))
	{
		error += "Fill contract value \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.contractValue.focus();
				flag = 1;
			}
	}
	if(isNaN(document.priceApprovalMain.contractValue.value))
	{
		error += "Fill Numerics in contract value \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.contractValue.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.userGroup.value.length))
	{
		error += "Fill user group \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.userGroup.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.vendorName.value.length))
	{
		error += "Fill vendor name \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.vendorName.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.totalBudget.value.length))
	{
		error += "Fill total aop budget \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalBudget.focus();
				flag = 1;
			}
	}
	if(isNaN(document.priceApprovalMain.totalBudget.value))
	{
		error += "Fill Numerics in total budget \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.totalBudget.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.paymentTerms.value.length))
	{
		error += "Fill payment terms \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.paymentTerms.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.sanctionNote.value.length))
	{
		error += "Fill sanction note status\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.sanctionNote.focus();
				flag = 1;
			}
	}


	if(isEmpty(document.priceApprovalMain.savings.value.length))
	{
		error += "Fill savings \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.savings.focus();
				flag = 1;
			}
	}
	if(isNaN(document.priceApprovalMain.savings.value))
	{
		error += "Fill Numerics in savings \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.savings.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.background.value.length))
	{
		document.priceApprovalMain.background.value = "NA";
	}


//for loop fo offers add row
	countTech					=	document.priceApprovalMain.countTech.value;
	countCom					=	document.priceApprovalMain.countCom.value;
	countEs						=	document.priceApprovalMain.countEs.value;
	countIn						=	document.priceApprovalMain.countIn.value;
	for(i = 1; i<=countTech; i++)
	{
		v = eval("document.priceApprovalMain.tvendor"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}
		machine = eval("document.priceApprovalMain.tmachine"+i);
		machineVal = machine.value;

		if(machineVal.length==0)
		{
			machine.value = "NA";
		}
		pagination = eval("document.priceApprovalMain.pagination"+i);
		paginationVal = pagination.value;

		if(paginationVal.length==0)
		{
			pagination.value = "NA";
		}
		ctp = eval("document.priceApprovalMain.ctp"+i);
		ctpVal = ctp.value;

		if(ctpVal.length==0)
		{
			ctp.value = "NA";
		}
		speed = eval("document.priceApprovalMain.speed"+i);
		speedVal = speed.value;

		if(speedVal.length==0)
		{
			speed.value = "NA";
		}
	}

	for(i = 1; i<=countCom; i++)
	{
		cvendor = eval("document.priceApprovalMain.cvendor"+i);
		cvendorVal = cvendor.value;

		if(cvendorVal.length==0)
		{
			cvendor.value = "NA";
		}

		colourPage = eval("document.priceApprovalMain.colourPage"+i);
		colourPageVal = colourPage.value;

		if(colourPageVal.length==0)
		{
			colourPage.value = "NA";
		}

		bAndw = eval("document.priceApprovalMain.bAndw"+i);
		bAndwVal = bAndw.value;

		if(bAndwVal.length==0)
		{
			bAndw.value = "NA";
		}

		plateCost = eval("document.priceApprovalMain.plateCost"+i);
		plateCostVal = plateCost.value;

		if(plateCostVal.length==0)
		{
			plateCost.value = "NA";
		}

		bundling = eval("document.priceApprovalMain.bundling"+i);
		bundlingVal = bundling.value;

		if(bundlingVal.length==0)
		{
			bundling.value = "NA";
		}

		insertion = eval("document.priceApprovalMain.insertion"+i);
		insertionVal = insertion.value;

		if(insertionVal.length==0)
		{
			insertion.value = "NA";
		}

		otherMisc = eval("document.priceApprovalMain.otherMisc"+i);
		otherMiscVal = otherMisc.value;

		if(otherMiscVal.length==0)
		{
			otherMisc.value = "NA";
		}
	}
	for(i = 1; i<=countEs; i++)
	{
		esVendor = eval("document.priceApprovalMain.esVendor"+i);
		esVendorVal = esVendor.value;

		if(esVendorVal.length==0)
		{
			esVendor.value = "NA";
		}

		alp = eval("document.priceApprovalMain.alp"+i);
		alpVal = alp.value;

		if(alpVal.length==0)
		{
			alp.value = "NA";
		}
/*
		esBandW = eval("document.priceApprovalMain.esBandW"+i);
		esBandWVal = esBandW.value;

		if(esBandWVal.length==0)
		{
			esBandW.value = "NA";
		}
*/
		po = eval("document.priceApprovalMain.po"+i);
		poVal = po.value;

		if(poVal.length==0)
		{
			po.value = "NA";
		}

		totalSpend = eval("document.priceApprovalMain.totalSpend"+i);
		totalSpendVal = totalSpend.value;

		if(totalSpendVal.length==0)
		{
			totalSpend.value = "NA";
		}

		esPagination = eval("document.priceApprovalMain.esPagination"+i);
		esPaginationVal = esPagination.value;

		if(esPaginationVal.length==0)
		{
			esPagination.value = "NA";
		}

		lprs = eval("document.priceApprovalMain.lprs"+i);
		lprsVal = lprs.value;

		if(lprsVal.length==0)
		{
			lprs.value = "NA";
		}

		waste = eval("document.priceApprovalMain.waste"+i);
		wasteVal = waste.value;

		if(wasteVal.length==0)
		{
			waste.value = "NA";
		}
	}
	for(i = 1; i<=countIn; i++)
	{

		inVendor = eval("document.priceApprovalMain.inVendor"+i);
		inVendorVal = inVendor.value;

		if(inVendorVal.length==0)
		{
			inVendor.value = "NA";
		}

		inPo = eval("document.priceApprovalMain.inPo"+i);
		inPoVal = inPo.value;

		if(inPoVal.length==0)
		{
			inPo.value = "NA";
		}

		inTotalSpend = eval("document.priceApprovalMain.inTotalSpend"+i);
		inTotalSpendVal = inTotalSpend.value;

		if(inTotalSpendVal.length==0)
		{
			inTotalSpend.value = "NA";
		}

		inMisc = eval("document.priceApprovalMain.inMisc"+i);
		inMiscVal = inMisc.value;

		if(inMiscVal.length==0)
		{
			inMisc.value = "NA";
		}
	}
	if(isEmpty(document.priceApprovalMain.recommendation.value.length))
	{
		document.priceApprovalMain.recommendation.value = "NA";
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
payrollTypeStr="";
toId2="0";
toId5="0";
toId8="0";
//alert(error	+ " " + (document.priceApprovalMain.app6.value.length==0));

	if(isEmpty(document.priceApprovalMain.app1.value.length))
	{	
		//alert("1");
		document.priceApprovalMain.app1H.value = "0";
	}else{
			info = document.priceApprovalMain.app1H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app1H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}

	if(isEmpty(document.priceApprovalMain.app2.value.length))
	{ 
		document.priceApprovalMain.app2H.value = "0";
	}else{
			info = document.priceApprovalMain.app2H.value;
			document.priceApprovalMain.app2H.value = info;
			infoArr = info.split("|");
			toId2 = infoArr[0];			
			payrollType =  infoArr[1];
			payrollTypeStr += payrollType;

	}
	//alert("2="+document.priceApprovalMain.app2H.value);

	if(isEmpty(document.priceApprovalMain.app4.value.length))
	{
		document.priceApprovalMain.app4H.value = "0";
	}else{
			info = document.priceApprovalMain.app4H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app4H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}

	if(isEmpty(document.priceApprovalMain.app5.value.length))
	{ 
		document.priceApprovalMain.app5H.value = "0";
	}else{
			info = document.priceApprovalMain.app5H.value;
			document.priceApprovalMain.app5H.value = info;
			infoArr = info.split("|");
			toId5 = infoArr[0];			
			payrollType =  infoArr[1];
			payrollTypeStr += payrollType;

	}
	//alert("5="+ document.priceApprovalMain.app2.value);
	//alert("55="+ payrollTypeStr);
	
	if(isEmpty(document.priceApprovalMain.app7.value.length))
	{
		document.priceApprovalMain.app7H.value = "0";
	}else{
			info = document.priceApprovalMain.app7H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app7H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;
	}

	if(isEmpty(document.priceApprovalMain.app8.value.length))
	{ 
		document.priceApprovalMain.app8H.value = "0";
	}else{
			info = document.priceApprovalMain.app8H.value;
			document.priceApprovalMain.app8H.value = info;
			infoArr = info.split("|");
			toId8 = infoArr[0];			
			payrollType =  infoArr[1];
			payrollTypeStr += payrollType;

	}
	//alert("8="+document.priceApprovalMain.app8H.value);
	

	if(isEmpty(document.priceApprovalMain.app11.value.length))
	{
		document.priceApprovalMain.app11H.value = "0";
	}else{
			info = document.priceApprovalMain.app11H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app11H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}
	if(isEmpty(document.priceApprovalMain.app12.value.length))
	{
		document.priceApprovalMain.app12H.value = "0";
	}else{
			info = document.priceApprovalMain.app12H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app12H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}
	if(!document.priceApprovalMain.app2.value == "" || !document.priceApprovalMain.app5.value == "" || !document.priceApprovalMain.app8.value == ""){

    //alert("payrollTypeStr = "+payrollTypeStr);

	//if(queryType==1)
	//{	
		
		if(payrollTypeStr!="")
			{
				if(payrollTypeStr.length >= 4){
				
					//alert(payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length));

					if((payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length)) != "ADIR" && (payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length)) != "NANA"){				
						error += "Please ensure that last approver at the User Level is a Director\n";
						document.priceApprovalMain.app2.focus();
						flag = 1;
					}
				}else{
					error += "Please ensure that last approver at the User Level is a Director\n";
					document.priceApprovalMain.app2.focus();
					flag = 1;
				}
			}
	//}
	}
//alert("payrollTypeStr= "+payrollTypeStr);
		if(document.priceApprovalMain.company.value==1000){
			if(document.priceApprovalMain.select12.value==0 && document.priceApprovalMain.select13.value!=0)
				{
					error += "Please ensure that Director B&C is selected\n";
					if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select12.focus();
							flag = 1;
						}

				}else if(document.priceApprovalMain.select13.value==0 && document.priceApprovalMain.select14.value!=0){

					error += "Please ensure that EP Supply Chain is selected\n";
					if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select13.focus();
							flag = 1;
						}
				}else if(document.priceApprovalMain.select14.value==0 && document.priceApprovalMain.select15.value!=0){

						error += "Please ensure that COO is selected\n";
						if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select14.focus();
							flag = 1;
						}
				}else if(document.priceApprovalMain.select15.value==0 && document.priceApprovalMain.select16.value!=0){

						error += "Please ensure that CEO(Publishing) is selected\n";
						if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select15.focus();
							flag = 1;
						}
				}
		}else{
			if(document.priceApprovalMain.select12.value==0 &&  document.priceApprovalMain.select13.value!=0)
				{
					error += "Please ensure that Group Company CEO(Publishing) selected\n";
					if(parseInt(flag)==0)
					{
						document.priceApprovalMain.select12.focus();
						flag = 1;
					}
				}
		}



	if(error!=""){
		alert(error);
		return false;
	}else{


			if(queryType==1)
			{	
				document.priceApprovalMain.company.disabled=false;
				document.priceApprovalMain.submitForm.disabled = true;  
				document.priceApprovalMain.submitForm.value = 'Please Wait...';  

				document.priceApprovalMain.action = "/timescape/sapep/employeeselfservice/priceapproval/OSP/common/insertDataSubmitOsp.jsp";
				document.priceApprovalMain.submit();
			}
			else if(queryType==2)
			{
				document.priceApprovalMain.company.disabled=false;
				document.priceApprovalMain.submitForm1.disabled = true;  
				document.priceApprovalMain.submitForm1.value = 'Please Wait...';  
				//document.priceApprovalMain.origin.disabled=false;
				var priceid = document.priceApprovalMain.priceid.value;
				document.priceApprovalMain.action = "/timescape/sapep/employeeselfservice/priceapproval/OSP/common/updateDataSubmitOsp.jsp?priceid="+priceid;
				document.priceApprovalMain.submit();
			}else if(queryType==3)
				{	

					var priceid = document.priceApprovalMain.priceid.value;
					//document.priceApprovalMain.action = "common/updateDraftSubmitnp.jsp?priceid="+priceid;
					//document.priceApprovalMain.submit();
				}
				
	}
}
function addUser(forWhom, id) {

	frmObj = document.priceApproval;
	//document.priceApproval.forWhom.value = id;

	//alert(document.priceApproval.forWhom.value);
	
	window.open('/timescape/sapep/employeeselfservice/priceapproval/common/search.jsp?forWhom='+forWhom+"&id="+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=600,top=70,left=100');

}


function attachmentFile(attachDetails, str){			
	var url			= "/timescape/sapep/employeeselfservice/priceapproval/OSP/uploadOsp/uploadFile.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}

function deleteFile(fileName,dirPath,str){
	var url = "/timescape/sapep/employeeselfservice/priceapproval/OSP/common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}
//function deleteFile(fileName,dirPath,str){
//	var url = "/timescape/sapep/employeeselfservice/priceapproval/OSP/common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str;
//	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
//}
function onLoadDetail(str){	
	
	if(str == '0'){
		loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/dirListing.jsp?attachment=additional&str="+str,"attachment1","Attachment");
	}else 	{
		loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/dirListing.jsp?attachment=additional&str=1","attachment1","Attachment");
	}

	
}


function openRemarksOsp(priceId,userOId,approverType, statusType,company)
{     

	if(approverType=="AP11")
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

	window.open('/timescape/sapep/employeeselfservice/priceapproval/OSP/common/insertRemarksOsp.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&company='+company,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');
}

function postRemarksOsp(priceId,userOId,approverType,statusType,company)
{
	var remarks = document.postRemarksForm.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');

	if(remarks.length!=0 && remarks!='')
	{
				if (window.XMLHttpRequest)
				  { // code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				  }
				else
				  {// code for IE6, IE5
				  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
			
				  xmlhttp.onreadystatechange=function()
					{
						if (xmlhttp.readyState==4 && xmlhttp.status==200)
						{
							//alert("Done");
							document.getElementById('poststatus').innerHTML = "Remarks Posted Successfully!!!";
							window.close();				    									
						}
					}
				  var random = Math.random();
				  var URL    = '/timescape/sapep/employeeselfservice/priceapproval/OSP/common/insertRemarksSubmitOsp.jsp?priceId='+priceId+'&userId='+userOId+'&approverType='+approverType+'&remarks='+remarks+'&random='+random+'&company='+company;
				 // alert(URL);
				  xmlhttp.open("GET",URL,true);
		    	  xmlhttp.send();
	}
}

function postRemarksOsp1(priceId,userOId,approverType,statusType,company)
{
	frmObj = document.postRemarksForm;
	var remarks = frmObj.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');

	if(remarks.length!=0 && remarks!='')
	{
		var random = Math.random();
		//var uri = "../common/insertRemarksSubmitOsp.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&random="+random;
		//var res = encodeURIComponent(uri);
		
		//loadURL(uri , priceId, userOId, approverType, remarks , statusType);
		//window.open(uri , priceId, userOId, approverType, remarks , statusType);
	}else
	{
		alert("Please enter remarks");
		 return;
	}

	frmObj.action="/timescape/sapep/employeeselfservice/priceapproval/OSP/common/insertRemarksSubmitOsp.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&random='+random+'&company='+company;
	frmObj.submit( );
	//self.close();
}


function showAllRequestsOsp()
{
	randome = Math.random();
	loadFragment('/timescape/sapep/employeeselfservice/priceapproval/OSP/common/viewAllStatusOsp.jsp?randome='+randome,'allProcessOsp','Showing All Requests');
	//setTimeout("showStatus()",1000*15);
}
function navigateCallRemarksOsp(timescapeUserOId,priceid)
{
	 url = "/timescape/sapep/employeeselfservice/priceapproval/OSP/common/showDetailsOsp.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.opener.location.href=url;
 	 self.close();
}
function showFixedAttachmentFile(str, requestId, userEmailId, status, compAttachment, addAttachment){	

	loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/showDirListing.jsp?attachment="+compAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	loadFragment("/timescape/sapep/employeeselfservice/priceapproval/OSP/common/showDirListing.jsp?attachment="+addAttachment+"&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment1","Attachment");
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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center"><span class="loading normal"><img src="images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
        
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

function showAttachedFile(fileName, emailid,str,requestId,attachment){
	var url			= "/timescape/sapep/employeeselfservice/priceapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	window.location.href = url;
}

function saveDraftOsp(queryType)
{

	var frmObj = document.priceApprovalMain;

	var fromDates   = document.priceApprovalMain.fromContractValidity.value;
	var toDates     = document.priceApprovalMain.toContractValidity.value;

	var fromDates1       = dateFormat(fromDates);
	var toDates1         = dateFormat(toDates);
 	if(toDates1 < fromDates1 ){

		error +="Contract Validity to Date cannot be earlier than From Date! \n";
		if(parseInt(flag)==0)
		{			
			document.priceApprovalMain.toContractValidity.focus();
			flag = 1;
		}
	}



	if(isEmpty(document.priceApprovalMain.app1.value.length))
	{	
		document.priceApprovalMain.app1H.value = "0";
	}
	if(isEmpty(document.priceApprovalMain.app2.value.length))
	{ 
		document.priceApprovalMain.app2H.value = "0";
	}
	/*if(isEmpty(document.priceApprovalMain.app3.value.length))
	{//
		document.priceApprovalMain.app3H.value = "0";
	}*/
	if(isEmpty(document.priceApprovalMain.app4.value.length))
	{
		document.priceApprovalMain.app4H.value = "0";
	}
	if(isEmpty(document.priceApprovalMain.app5.value.length))
	{ 
		document.priceApprovalMain.app5H.value = "0";
	}
	/*if(isEmpty(document.priceApprovalMain.app6.value.length))
	{
		document.priceApprovalMain.app6H.value = "0";
	}*/
	if(isEmpty(document.priceApprovalMain.app7.value.length))
	{
		document.priceApprovalMain.app7H.value = "0";
	}
	if(isEmpty(document.priceApprovalMain.app8.value.length))
	{ 
		document.priceApprovalMain.app8H.value = "0";
	}
	/*if(isEmpty(document.priceApprovalMain.app9.value.length))
	{
		document.priceApprovalMain.app9H.value = "0";
	}
	if(isEmpty(document.priceApprovalMain.app10.value.length))
	{
		document.priceApprovalMain.app10H.value = "0";
	}*/
		if(isEmpty(document.priceApprovalMain.app11.value.length))
	{
		document.priceApprovalMain.app11H.value = "0";
	}
	if(isEmpty(document.priceApprovalMain.app12.value.length))
	{
		document.priceApprovalMain.app12H.value = "0";
	}



	countTech					=	document.priceApprovalMain.countTech.value;
	countCom					=	document.priceApprovalMain.countCom.value;
	countEs						=	document.priceApprovalMain.countEs.value;
	countIn						=	document.priceApprovalMain.countIn.value;
	for(i = 1; i<=countTech; i++)
	{
		v = eval("document.priceApprovalMain.tvendor"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}
		machine = eval("document.priceApprovalMain.tmachine"+i);
		machineVal = machine.value;

		if(machineVal.length==0)
		{
			machine.value = "NA";
		}
		pagination = eval("document.priceApprovalMain.pagination"+i);
		paginationVal = pagination.value;

		if(paginationVal.length==0)
		{
			pagination.value = "NA";
		}
		ctp = eval("document.priceApprovalMain.ctp"+i);
		ctpVal = ctp.value;

		if(ctpVal.length==0)
		{
			ctp.value = "NA";
		}
		speed = eval("document.priceApprovalMain.speed"+i);
		speedVal = speed.value;

		if(speedVal.length==0)
		{
			speed.value = "NA";
		}
	}

	for(i = 1; i<=countCom; i++)
	{
		cvendor = eval("document.priceApprovalMain.cvendor"+i);
		cvendorVal = cvendor.value;

		if(cvendorVal.length==0)
		{
			cvendor.value = "NA";
		}

		colourPage = eval("document.priceApprovalMain.colourPage"+i);
		colourPageVal = colourPage.value;

		if(colourPageVal.length==0)
		{
			colourPage.value = "NA";
		}

		bAndw = eval("document.priceApprovalMain.bAndw"+i);
		bAndwVal = bAndw.value;

		if(bAndwVal.length==0)
		{
			bAndw.value = "NA";
		}

		plateCost = eval("document.priceApprovalMain.plateCost"+i);
		plateCostVal = plateCost.value;

		if(plateCostVal.length==0)
		{
			plateCost.value = "NA";
		}

		bundling = eval("document.priceApprovalMain.bundling"+i);
		bundlingVal = bundling.value;

		if(bundlingVal.length==0)
		{
			bundling.value = "NA";
		}

		insertion = eval("document.priceApprovalMain.insertion"+i);
		insertionVal = insertion.value;

		if(insertionVal.length==0)
		{
			insertion.value = "NA";
		}

		otherMisc = eval("document.priceApprovalMain.otherMisc"+i);
		otherMiscVal = otherMisc.value;

		if(otherMiscVal.length==0)
		{
			otherMisc.value = "NA";
		}
	}
	for(i = 1; i<=countEs; i++)
	{
		esVendor = eval("document.priceApprovalMain.esVendor"+i);
		esVendorVal = esVendor.value;

		if(esVendorVal.length==0)
		{
			esVendor.value = "NA";
		}

		alp = eval("document.priceApprovalMain.alp"+i);
		alpVal = alp.value;

		if(alpVal.length==0)
		{
			alp.value = "NA";
		}

/*		esBandW = eval("document.priceApprovalMain.esBandW"+i);
		esBandWVal = esBandW.value;

		if(esBandWVal.length==0)
		{
			esBandW.value = "NA";
		}
*/
		po = eval("document.priceApprovalMain.po"+i);
		poVal = po.value;

		if(poVal.length==0)
		{
			po.value = "NA";
		}

		totalSpend = eval("document.priceApprovalMain.totalSpend"+i);
		totalSpendVal = totalSpend.value;

		if(totalSpendVal.length==0)
		{
			totalSpend.value = "NA";
		}

		esPagination = eval("document.priceApprovalMain.esPagination"+i);
		esPaginationVal = esPagination.value;

		if(esPaginationVal.length==0)
		{
			esPagination.value = "NA";
		}

		lprs = eval("document.priceApprovalMain.lprs"+i);
		lprsVal = lprs.value;

		if(lprsVal.length==0)
		{
			lprs.value = "NA";
		}

		waste = eval("document.priceApprovalMain.waste"+i);
		wasteVal = waste.value;

		if(wasteVal.length==0)
		{
			waste.value = "NA";
		}
	}
	for(i = 1; i<=countIn; i++)
	{

		inVendor = eval("document.priceApprovalMain.inVendor"+i);
		inVendorVal = inVendor.value;

		if(inVendorVal.length==0)
		{
			inVendor.value = "NA";
		}

		inPo = eval("document.priceApprovalMain.inPo"+i);
		inPoVal = inPo.value;

		if(inPoVal.length==0)
		{
			inPo.value = "NA";
		}

		inTotalSpend = eval("document.priceApprovalMain.inTotalSpend"+i);
		inTotalSpendVal = inTotalSpend.value;

		if(inTotalSpendVal.length==0)
		{
			inTotalSpend.value = "NA";
		}

		inMisc = eval("document.priceApprovalMain.inMisc"+i);
		inMiscVal = inMisc.value;

		if(inMiscVal.length==0)
		{
			inMisc.value = "NA";
		}
	}

payrollTypeStr="";
toId2="0";
toId5="0";
toId8="0";
//alert(error	+ " " + (document.priceApprovalMain.app6.value.length==0));

	if(isEmpty(document.priceApprovalMain.app1.value.length))
	{	
		//alert("1");
		document.priceApprovalMain.app1H.value = "0";
	}else{
			info = document.priceApprovalMain.app1H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app1H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}

	if(isEmpty(document.priceApprovalMain.app2.value.length))
	{ 
		document.priceApprovalMain.app2H.value = "0";
	}else{
			info = document.priceApprovalMain.app2H.value;
			document.priceApprovalMain.app2H.value = info;
			infoArr = info.split("|");
			toId2 = infoArr[0];			
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}
	//alert("2="+document.priceApprovalMain.app2H.value);

	if(isEmpty(document.priceApprovalMain.app4.value.length))
	{
		document.priceApprovalMain.app4H.value = "0";
	}else{
			info = document.priceApprovalMain.app4H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app4H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}

	if(isEmpty(document.priceApprovalMain.app5.value.length))
	{ 
		document.priceApprovalMain.app5H.value = "0";
	}else{
			info = document.priceApprovalMain.app5H.value;
			document.priceApprovalMain.app5H.value = info;
			infoArr = info.split("|");
			toId5 = infoArr[0];			
			payrollType =  infoArr[1];
			payrollTypeStr += payrollType;

	}
	//alert("5="+ document.priceApprovalMain.app5H.value);
	
	if(isEmpty(document.priceApprovalMain.app7.value.length))
	{
		document.priceApprovalMain.app7H.value = "0";
	}else{
			info = document.priceApprovalMain.app7H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app7H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;
	}

	if(isEmpty(document.priceApprovalMain.app8.value.length))
	{ 
		document.priceApprovalMain.app8H.value = "0";
	}else{
			info = document.priceApprovalMain.app8H.value;
			document.priceApprovalMain.app8H.value = info;
			infoArr = info.split("|");
			toId8 = infoArr[0];			
			payrollType =  infoArr[1];
			payrollTypeStr += payrollType;

	}
	//alert("8="+document.priceApprovalMain.app8H.value);
	

	if(isEmpty(document.priceApprovalMain.app11.value.length))
	{
		document.priceApprovalMain.app11H.value = "0";
	}else{
			info = document.priceApprovalMain.app11H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app11H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}
	if(isEmpty(document.priceApprovalMain.app12.value.length))
	{
		document.priceApprovalMain.app12H.value = "0";
	}else{
			info = document.priceApprovalMain.app12H.value;
			infoArr = info.split("|");
			toId = infoArr[0];
			document.priceApprovalMain.app12H.value = toId;
			payrollType =  infoArr[1];
			//payrollTypeStr += payrollType;

	}


	//document.priceApprovalMain.sanctionedRefType.disabled=false;
	if(queryType==1)
	{	
		document.priceApprovalMain.savedraft1.disabled = true;  
		document.priceApprovalMain.savedraft1.value = 'Please Wait...';  

		frmObj.action="/timescape/sapep/employeeselfservice/priceapproval/OSP/common/insertDraftSubmitOsp.jsp";
		frmObj.submit();
	}
	else if(queryType==2)
	{
		document.priceApprovalMain.savedraft2.disabled = true;  
		document.priceApprovalMain.savedraft2.value = 'Please Wait...';  

		frmObj.action="/timescape/sapep/employeeselfservice/priceapproval/OSP/common/updateDraftSubmitOsp.jsp";
		frmObj.submit();
	}

}



function dateFormat(incomingData)
{
	var monthName = new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	incomingData = incomingData.split("-");
	var day = incomingData[0];
	var month= incomingData[1];
	var year  = incomingData[2];

	var monthValue = 0;

	for(var i=0; i < monthName.length ;i++)
	{
		if(monthName[i] == month)
		{
			var monthValue = i;
		}
	}
	var revisedFormat = new Date(year, monthValue ,day);
	return revisedFormat;
}


    



