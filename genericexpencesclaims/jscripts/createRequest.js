
function validate(noOfRows,action)
 {
	 
	frmObj = document.frmCreateRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var allowNum = "0123456789.";
	var actionRequest = action;

	var entitlementCode = document.getElementById('entitlementCode').value;
	//alert("entitlementCode---"+entitlementCode);

	//var noOfRows = 6;

    forMonth=frmObj.forMonth.value;
    forYear=frmObj.forYear.value;
    
    selectDate = new Date(forYear, forMonth-1);
	currentDate= new Date();

	var i, j;
	var playernames = [];
	if(typeof(document.getElementById("fileSize")) != 'undefined' && document.getElementById("fileSize") != null){
		for(i=1; i <= noOfRows; i++){
			for(j=0; j<=i; j++){
				if(typeof(document.getElementById("hiddFilesName1"+i+j)) != 'undefined' && document.getElementById("hiddFilesName1"+i+j) != null){
					if((typeof(document.getElementById("billAttachment"+i)) != 'undefined') && (document.getElementById("billAttachment"+i) != null)){
						document.getElementById("billAttachment"+i).value = document.getElementById("hiddFilesName1"+i+j).value;
					}
					playernames.push(document.getElementById("hiddFilesName1"+i+j).value);
				}
			}
		}
	}

   
    if(selectDate > currentDate){
        alert("Please enter/select the month and year properly !!!!");
        //cannot be greater than the Current Date
        frmObj.forMonth.focus( );
		return;	
    }else{
   
for(ii=1; ii<=noOfRows; ii++)
 {
	var billDateValue = 'frmObj.billDate'+ ii+'.value';
	billDateValue = eval(billDateValue);
	stat1 = checkNextNull("Bill Number", billDateValue);

	var billNoValue = 'frmObj.billNo'+ ii+'.value';
	billNoValue = eval(billNoValue);
	stat2 = checkNextNull("Bill Number", billNoValue);

	var billDescValue = 'frmObj.billDesc'+ ii+'.value';
	billDescValue = eval(billDescValue);
	stat3 = checkNextNull("Bill Description", billDescValue);

	var amountValue = 'frmObj.billAmount'+ ii+'.value';
	amountValue = eval(amountValue);
	stat4 = checkNextNull("Amount", amountValue);

		 if(stat1 || stat2 || stat3 || stat4) {

/*--------------Bill Date Field check begins------*/
var billDate = 'frmObj.billDate'+ ii;
billDate = eval(billDate);
value1 = trim(billDateValue);
	// Checking for null
	valid = checkNull("Bill Date.", value1);
	if(!valid){
		billDate.focus( );
		return;
	}
/*--------------Bill Date Field check ends--------------*/
/*--------------Bill No Field check begins------*/
var billNo = 'frmObj.billNo'+ ii;
billNo = eval(billNo);
value1 = trim(billNoValue);
	// Checking for null
	valid = checkNull("Bill No.", value1);
	if(!valid){
		billNo.focus( );
		return;
	}
/*--------------Bill No Field check ends--------------*/

/*--------------Amount Field check begins--------------------*/
var billAmount = 'frmObj.billAmount'+ ii;
billAmount = eval(billAmount);
	amt = trim(amountValue);
	// Checking for null
	valid = checkNull("Amount", amt);
	if(!valid){
		billAmount.focus( );
		return;
	}
		// Checking for Allowed characters
	valid = checkAmt("Amount" , amt , allowNum);
	if(!valid){
		billAmount.focus( );
		return;
	}
		valid= parseFloat(amountValue.value);
	if(valid<1)
		{alert("The Amount must be greater than 0");
		billAmount.focus( );
		return;
		}
/*--------------Amount Field check ends--------------*/
				/*--------------Amount Field check ends--------------*/
				
				if((document.getElementById("anchorAttachment" + ii) != undefined) || (document.getElementById("anchorAttachment" + ii) != null)){
					if(!(document.getElementById("anchorAttachment" + ii).style.display == "none")){
						alert("Please attach the corresponding bill.");
						return;
					}
				}
			}// end of if
    	}// end of for loop

 

addAll(noOfRows);

	/*----------------To check completion of atleast one row--------*/
	var total = frmObj.total.value;
	if(total == "0")
	{alert("Please Complete atleast one Row!!");
	 frmObj.billDate1.focus();
	 return;
	}
/*--------------End of check of completion of atleast one row---*/
	frmObj.actionNumber.value = action;
    if(action=="add_req"){
        frmObj.action = "../requestor/addBills.jsp";
	    frmObj.submit( );
    }else{
        frmObj.action = "../requestor/previewRequest.jsp";
        frmObj.submit( );
    }

    }//end of main else
}// end of validate function

function clear()
{	frmObj = document.frmCreateRequest;
	frmObj.reset();
}

function addAll(noOfRows) // function to add all Bill Amounts
{	frmObj = document.frmCreateRequest;
	var allowNum = ".0123456789";	
billAmount = eval(billAmount);
	for(kkk=1; kkk<=noOfRows; kkk++){
	var billAmount = 'frmObj.billAmount'+ kkk;
	billAmount = eval(billAmount);
	var amountValue = 'frmObj.billAmount'+ kkk+'.value';
	amountValue = eval(amountValue);
	var price = trim(amountValue);
		valid = checkAmt("Amount" , price , allowNum);
		if(!valid)
			{billAmount.focus( );
			return;
			}  // end of if 
	} // end of for loop	

	summation = 0;
	for(kkk=1; kkk<=noOfRows; kkk++)
	{
	var amountValue = 'frmObj.billAmount'+ kkk+'.value';
	amountValue = eval(amountValue);
	currentAmount = ((amountValue) != '') ?parseFloat(amountValue) : 0;
		summation = summation + currentAmount;
	}// end of for loop
	 summation = RoundTo(summation);
	 frmObj.total.value = summation;
	 frmObj.amountTotal.value = summation;
} // end of add

function removeBill(kkk,txnId,newFilledRows){
	frmObj = document.frmCreateRequest;

    if(newFilledRows <=1){
        alert("This is the only bill left, please add bill/s first!!!");
        return;
    }else{
        val = confirm("Do you wish delete this Bill?");
        if(val){ 
            var billNumber = 'frmObj.billNo'+kkk+'.value';
            billNumber = eval(billNumber);
            frmObj.delBillNo.value = billNumber;
            
            var amountValue = 'frmObj.billAmount'+kkk+'.value';
            amountValue = eval(amountValue);
            frmObj.delBillAmt.value = amountValue;

            var billDate = 'frmObj.billDate'+kkk+'.value';
            billDate = eval(billDate);
            frmObj.delBillDate.value = billDate;

            frmObj.id2.value = "del_bil";

            frmObj.action = "../requestor/updateRequestSubmit.jsp";
            frmObj.submit( );
        }
    }
}

function attachmentFileSubord(attachDetails,str) {
	var url			= "../upload/uploadFileSubordinate.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=200, left=200,right=300,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function validateFieldsSubordinate() {
	var frmObj 		= document.frmUploadFileSubordinate;
	var uploadFile 	= frmObj.uploadFile.value;
	var fileName 	= uploadFile.substring(uploadFile.lastIndexOf("\\")+1);	
	var fileExtn 	= uploadFile.substring(uploadFile.lastIndexOf(".")+1);	
	
	/*if(fileExtn!="jpg" && fileExtn!="jpeg" && fileExtn!="pdf" && fileExtn!="png" && fileExtn!="bmp" ){
		alert("Please upload valid file (.jpg, .png, .bmp, .jpeg, .pdf) only");
		return;
	}*/
	fileExtn = fileExtn.toLowerCase();

	if(fileExtn!="jpg" && fileExtn!="jpeg" && fileExtn!="pdf" && fileExtn!="png"){
		alert("Please upload valid file (.jpg, .png, .jpeg, .pdf) only");
		return;
	}
	
	if(fileName.length > 100){
		alert("File name allowed only upto 100 characters");
		return;
	}
	//alert("File " + uploadFile + " fileName: " + fileName);
	frmObj.action="../upload/uploadFileRequestSubord.jsp";
    frmObj.submit();
}

function closeWindowFixed(str){
	//alert(str+":"+(self.opener.document.getElementById("newBillAttachment"+str).value)+":"+document.getElementById("hiddenSavedFileName").value);
	var valueStr = document.getElementById("hiddenSavedFileName").value;
	//alert(valueStr);
	if ((typeof(self.opener.document.getElementById("newBillAttachment"+str)) != 'undefined') && (self.opener.document.getElementById("newBillAttachment"+str) != null)) {
		self.opener.document.getElementById("newBillAttachment"+str).value = valueStr;
	}
	
	if ((typeof(self.opener.document.getElementById("billAttachment"+str)) != 'undefined') && (self.opener.document.getElementById("billAttachment"+str) != null)) {
		self.opener.document.getElementById("billAttachment" + str).value = valueStr;
	}
	//var frmname = "frmCreateRequest";
	self.close();
	self.opener.document.getElementById("anchorAttachment"+str).style.display = 'none';
	self.opener.onLoadFixedDetail(str,str);
}

function closeWindowFixed1(requestStr){
	self.close();
	self.opener.document.getElementById("anchorAttachment"+requestStr).style.display = 'block';
	/*self.opener.document.getElementById("attachment"+requestStr).style.display = 'none';*/
	self.opener.onLoadFixedDetail(requestStr,requestStr);
}

function closeWindowFixedNormal(requestStr){
	self.close();
	/*self.opener.document.getElementById("anchorAttachment"+requestStr).style.display = 'block';*/
	/*self.opener.document.getElementById("attachment"+requestStr).style.display = 'none';*/
	/*self.opener.onLoadFixedDetail(requestStr,requestStr);*/
}

function onLoadFixedDetail(str,compFolderName){
	var combStr = "attachment"+str;
	var random = Math.random();
	loadFragment2("../common/fixedDirListing.jsp?random="+random+"&attachment="+compFolderName+"&str="+combStr,"attachment"+str,"Attachment");
}

function showCurrentFile(fileName, emailid,str,attachment){
	var url			= "../common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	window.location.href = url;
}

function showCurrentFile1(fileName, emailid,str,attachment){
	var url			= "../common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	window.location.href = url;
}

function fixedDeleteFile(fileName,dirPath,str){
	var url = "../common/fixedDeleteFile.jsp?dirPath="+dirPath+"&fileName="+fileName+"&id=delete"+"&str="+str;
	window.open(url,"File","width=500,height=200, left=200,right=300,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function showAttachmentFile(str, txnId){
	//loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1","myFile","Attachment");
}

function loadFragment2(fragment_url, element_id, for_what) {
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert(element);
	var message = "";
	var processingRequest = '<table id="loadFragment" width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	$("#"+element_id).html(processingRequest);
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				//alert(gotresponse);
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}

			//alert("test");
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}

function delAttachment(displayAttachment, deleteAttachment, insertAttachment){
	//alert("Hi " + displayAttachment + ":" + deleteAttachment + ":" + insertAttachment);
	document.getElementById(displayAttachment).style.display = 'none';
	document.getElementById(deleteAttachment).style.display = 'none';
	document.getElementById(insertAttachment).style.display = 'block';
}