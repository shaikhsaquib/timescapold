
function loadFragment2(fragment_url, element_id, for_what) {
	//alert(fragment_url);
	//alert(fragment_url+" inside loadFragment");
	var xmlhttp = "";
	if (window.XMLHttpRequest) {
		//alert("Inside Mozilla")
		// code for Mozilla, etc.
		xmlhttp = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		// code for IE
		//alert("Inside IE");
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}else {
		alert("Sorry Your Browser is not Supported");
	}
	var element = document.getElementById(element_id);
	//alert("element_id "+element_id);
	var message = "";
	var processingRequest = '<table id="loadFragment" width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	//$("#"+element_id).html(processingRequest);
	//alert(processingRequest);
	//alert(element_id);
	//document.getElementById(element_id).innerHTML = processingRequest;
	//element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url,false);
		xmlhttp.onreadystatechange = function(){
				//alert(xmlhttp.readyState+"  "+xmlhttp.status);
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				$("#"+element_id).html(message);
				/*if(element_id == "viewData"){
					$("#"+element_id).html("<span>This is a test</span>");
				}else{
					$("#"+element_id).html(message);
				}*/
				
				//alert("after message is loaded");
				//document.getElementById(element_id).innerHTML = message;
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
function attachmentFile(str){			
	//alert("abc");
	var url			= "../upload/uploadFile.jsp?str="+str;
	window.open(url,"File","width=1000,height=500, left=200,right=200,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");	
}

function validateFields() 
{
	
	document.getElementById("uploadGIF").innerHTML = '<img src="../images/uploadLoading.gif" width="90%" height="30%">';
	var frmObj = document.frmUploadFile;
	var uploadFile = frmObj.uploadFile.value;

	var fileName =uploadFile.substring(uploadFile.lastIndexOf("\\")+1);	
	var fileExtn =uploadFile.substring(uploadFile.lastIndexOf(".")+1).toLowerCase();	

	//alert(uploadFile);
	//alert(fileExtn);

	/*stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		enableSubmit();
		return;
	}*/

	if(fileExtn!="xlsx" && fileExtn!="xls" ){
		//alert("Please Upload xlsx file only!!");
		alert("Please Upload excel file only");
		//enableSubmit();
		return;
	}

	//alert("../upload/uploadFileSubmit.jsp?budgetId="+budgetId+"&costCenter="+costCenter+"&version="+version+"&userRemarks="+userRemarks);
	frmObj.action="../upload/uploadFileRequest.jsp";
    frmObj.submit();
}

function attachmentFileSubord(attachDetails,str)
{
	//alert("attachDetails"+attachDetails);
	var url			= "../upload/uploadFileSubordinate.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=200, left=200,right=300,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}
function test(str,txnId,mailId)
{
	var combStr = "attachment"+str;
	loadFragment2("../common/showDirListing.jsp?attachment="+txnId+"&str="+combStr+"&ma="+mailId,"attachment"+str,"Attachment");
}
function validateAttachment(a,b){
	var frmObj = document.frmUploadFileSubordinate;
	var uploadFile = frmObj.uploadFile.value;
	var fileName =uploadFile.substring(uploadFile.lastIndexOf("\\")+1);	
	var fileExtn =uploadFile.substring(uploadFile.lastIndexOf(".")+1).toLowerCase();

	if(!(fileExtn == "pdf" || fileExtn == "xls" || fileExtn == "xlsx" || fileExtn == "docx" || fileExtn == "msg" || fileExtn == "pptx" || fileExtn == "zip")){
		alert("Please upload the file in pdf/xlsx/docx/msg/pptx/zip format only");
		return;
	}
	frmObj.action="../upload/uploadFileRequestSubord.jsp";
    frmObj.submit();
}

function onLoadFixedDetail(str,compFolderName){	
//$(".abc").hide();
//alert("test");
	//alert("compFolderName"+compFolderName);
	var combStr = "attachment"+str;
	//alert("combStr"+combStr);
	loadFragment2("../common/fixedDirListing.jsp?attachment="+compFolderName+"&str="+combStr,"attachment"+str,"Attachment");
	
	
}

function showCurrentFile(fileName, emailid,str,attachment){
//alert(fileName+"==="+emailid+"==="+str+"===="+attachment);
	var url			= "/timescape/sapep/employeeselfservice/ervm/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	//var url			= "../includes/popupNew.jsp?str=1";
	window.location.href = url;
}
function showCurrentFile1(fileName, emailid,str,attachment){
//alert(fileName+"==="+emailid+"==="+str+"===="+attachment);
	var url			= "/timescape/sapep/employeeselfservice/ervm/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	//var url			= "../includes/popupNew.jsp?str=1";
	window.location.href = url;
}
function fixedDeleteFile(fileName,dirPath,str){
	
	var url = "../common/fixedDeleteFile.jsp?fileName="+fileName+"&id=delete"+"&str="+str;
	window.open(url,"File","width=500,height=200, left=200,right=300,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}
function showAttachmentFile(str, txnId){	
	
	//loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1","myFile","Attachment");
	
}

function isValidEmailAddress(emailAddress) {
	    var pattern = new RegExp(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/);
	    return pattern.test(emailAddress);
	}	 


function validateEmail() {
                 var email = $("#userResp").val();
               if(email != 0 || email != null || email != "")
               {
                   if(isValidEmailAddress(email))
                   {
                     $("#errorEmail").hide();
                     $("#validEmail").show();
                            $("#validEmail").html("Valid email");
                            $("#userResp").focus();                       
                     return true;
                   } else {
                     $("#validEmail").hide();
                     $("#errorEmail").show();
                            $("#errorEmail").html("Invalid email");
                            $("#userResp").focus();
                            return false;
                       
                   }
               } else {
                     $("#validEmail").hide();
                     $("#errorEmail").show();
                     $("#errorEmail").html("Please enter a valid email");
                     $("#userResp").focus();
                     return false;
                     
               }
          }

function validateEmail1() {
                 var email = $("#superResp").val();
               if(email != 0 || email != null || email != "")
               {
                   if(isValidEmailAddress(email))
                   {
                     $("#errorEmail1").hide();
                     $("#validEmail1").show();
                            $("#validEmail1").html("Valid email");
                            $("#superResp").focus();                       
                     return true;
                   } else {
                     $("#validEmail1").hide();
                     $("#errorEmail1").show();
                            $("#errorEmail1").html("Invalid email");
                            $("#superResp").focus();
                            return false;
                       
                   }
               } else {
                     $("#validEmail1").hide();
                     $("#errorEmail1").show();
                     $("#errorEmail1").html("Please enter a valid email");
                     $("#superResp").focus();
                     return false;
                     
               }
          }


function singleUpload ()
{
	//alert("test");
	var area = document.getElementById("area").value;
	//alert("area"+area);
	var recommendation = document.getElementById("recommendation").value;
	var mangComments = document.getElementById("mangComments").value;
	var mitigationPlan = document.getElementById("mitigationPlan").value;
	var severety = document.getElementById("severety").value;
	var userResp = document.getElementById("userResp").value;
	var superResp = document.getElementById("superResp").value;
	var year = document.getElementById("year").value;
	var dept = document.getElementById("dept").value;
	var frmName = "frmSingle";
	var frmObj = eval("document."+frmName);
	
	if (area.length === 0 ){
            alert("Please Enter Area");
			document.getElementById('area').focus();
            return false;
    }else if (recommendation.length === 0 ) {
            alert("Please Enter Recommendation");
			document.getElementById('recommendation').focus();
            return false;
    }else if (mangComments.length === 0 ) {
            alert("Please Enter Management Comments");
			document.getElementById("mangComments").focus();
            return false;
    }else if (mitigationPlan.length === 0 ) {
        alert("Please Enter Mitigation Plan");
		document.getElementById("mitigationPlan").focus();
        return false;
    }else if (severety === 'Select' ) {
            alert("Please Select severity");
            document.getElementById('severety').focus();
			return false;
    }else if (userResp.length === 0 ) {
            alert("Please Enter Subordinate Email Id");
			document.getElementById('userResp').focus();
            return false;
    }else if (superResp.length === 0 ) {
            alert("Please Enter Supervisor Email Id");
			document.getElementById('superResp').focus();
            return false;
    }else if(year.length === 0){
    	alert("Please fill the year field");
    	document.getElementById('year').focus();
    	return false;
    }else if(!validateYear(year)){
    	alert("Please provide the year in YYYY-YY Format. (eg: 2018-19)");
    	document.getElementById('year').focus();
    	return false;
    }else if(dept == "select"){
    	alert("Please select the department to proceed further.");
    	document.getElementById('dept').focus();
    	return false;
    }else {
			frmObj.action = "../user/singleUploadSubmit.jsp";
			frmObj.submit();	
	}
}

function getTodayDate(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd = '0'+dd
	} 

	if(mm<10) {
	    mm = '0'+mm
	} 

	today = mm + '/' + dd + '/' + yyyy;
	return today;
}

function subordinateDetails(size) {
	var size = document.getElementById("size").value;
	var temp = 0;
	var bool = true;
	var validate = "";
	var test = 0;
	//var todayDate = new Date(); //Today Date
	var todayDate = getTodayDate();
	todayDate = new Date(todayDate);

	for (i = 0; i < size; i++) {
		validate = "";
		test = 0;

		var txnId = $("#txnId" + i).val();
		var reviseTargetDate = document.getElementById("reviseTargetDate" + i).value;
		var Status = document.getElementById("Status" + i).value;
		var Remarks = document.getElementById("Remarks" + i).value;
		var dateOne = new Date(document.getElementById("hiddenTargetImpDate" + i).value);
		
		dateOne = new Date(dateOne);
		
		//alert("dateOne for "+i+" is "+dateOne);
		//todayDate = formatDate(todayDate);
		//dateOne = formatDate(dateOne);
				//dateOne = new Date(dateOne);
		//alert("dateOne -> "+dateOne);
		//alert("todayDate for "+i+" is "+todayDate);
		if(reviseTargetDate != "")
			reviseTargetDate = new Date(reviseTargetDate);
		//alert("reviseTargetDate "+reviseTargetDate);
		//alert("(todayDate < dateOne) "+(todayDate < dateOne));
		//alert("(todayDate > dateOne) "+(todayDate > dateOne));
		//alert("(todayDate < reviseTargetDate) "+(todayDate < reviseTargetDate));
		//alert("(todayDate > reviseTargetDate) "+(todayDate > reviseTargetDate));
		
		//alert("status -> "+Status);
		if(Status != 'I'){
			//alert(i+": status is not equal to I and reviseTargetDate is "+reviseTargetDate);
			if (reviseTargetDate == "" || reviseTargetDate == undefined) {
				//alert("Inside if of undefined ");
				
				if(todayDate > dateOne){
					alert("Original target date has elapsed for Recommendation No " + (i + 1) + ". \nRevised target date is compulsory.");
					return false;
				}
				
			}else{
				
				reviseTargetDate = new Date(reviseTargetDate);
				//alert("revised TargetDate -> "+reviseTargetDate);
				if(reviseTargetDate < todayDate){
					alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
							return false;
				}
				//alert("Inside else");
				/* var arr_dateText = reviseTargetDate.split("/");
				var startmonth = arr_dateText[0];
				var startday = arr_dateText[1];
				var startyear = arr_dateText[2];
				
				//alert(startmonth+" "+startday+" "+startyear);
				//alert(startday+" :"+(todayDate.getDate() > startday)+" "+((todayDate.getMonth()+1) >= startmonth)+": "+(todayDate.getFullYear() >= startyear));
				
				
					
				
				if(todayDate.getFullYear() == startyear){
					if((todayDate.getMonth()+1) == startmonth){
						if(todayDate.getDate() > startday){
							alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
							return false;
						}
					}else if((todayDate.getMonth()+1) > startmonth){
						alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
						return false;
					}
				}else if(todayDate.getFullYear() > startyear){
					alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
					return false;
				} */
			}
		}

		/*if (Status == "I" || reviseTargetDate != "") {
			test++;
		} else
			validate += "Date,";
		if (Remarks != "") {
			test++;
		} else
			validate += "Remarks,";

		
															 
	 

		if (test > 0 && test != 2) {
			alert("Please fill " + validate + " for Recommendation  No "
					+ (i + 1))
			return false;

		}
		if (test == 0) {
			bool = true;
		} else {
			bool = false;
		}

		
		  
	 
		if ((Status == "I" && Remarks != "") || (reviseTargetDate != "" && Remarks != "")) {
			temp++;
		}*/
  
											   
							  
																																								  
				 
	
   
		
																																					
		
								   
																										 
				
   
			
		
		/*var arr_dateText = reviseTargetDate.split("/");
		var startmonth = arr_dateText[0];
		var startday = arr_dateText[1];
		var startyear = arr_dateText[2];
		
		//alert(startday+" :"+(todayDate.getDate() > startday)+" "+((todayDate.getMonth()+1) >= startmonth)+": "+(todayDate.getFullYear() >= startyear));
		
		if (reviseTargetDate != ""){
			if(todayDate.getFullYear() == startyear){
				if((todayDate.getMonth()+1) == startmonth){
					if(todayDate.getDate() > startday){
						alert("Revised target date should be equals to or past today's date for Recommendation No " + (i + 1));
						return false;
					}
				}else if((todayDate.getMonth()+1) > startmonth){
					alert("Revised target date should be equals to or past today's date for Recommendation No " + (i + 1));
					return false;
				}
			}else if(todayDate.getFullYear() > startyear){
				alert("Revised target date should be equals to or past today's date for Recommendation No " + (i + 1));
				return false;
			}
		}*/
		
		/*if (reviseTargetDate != "" && reviseTargetDate < todayDate){
			alert("Original target date has elapsed for Recommendation No " + (i + 1) + ". \nRevised target date is compulsory. \nRevised target date should be equals to or past today's date.");
			return false;
		}*/
	}
	
	/*if (bool == true && temp == 0) {
		alert("Please fill atleast one question");
		return false;
	}*/

	var frmName = "frmSubordinate";
	var frmObj = eval("document." + frmName);
	
	frmObj.action = "../user/subordinateSubmit.jsp";
	frmObj.submit();
}

function superviserDetails() {
	var size = document.getElementById("size").value;
	var size1 = document.getElementById("size1").value;
	var size2 = document.getElementById("size2").value;
	var size3 = document.getElementById("size3").value;												
	//alert("size "+size);

	var temp = 0;
	var bool = true;
	var validate = "";
	var test = 0;
	
    var i = 0;
	while(i < size3){
		
		//alert("i is "+i);
		validate = "";
		test = 0;

		var txnId = $("#txnId" + i).val();
		var Status = $("#Status" + i).val();
		//alert("status "+Status);
		var supRemarks = $("#supRemarks" + i).val();
		var dateOne = $("#hiddenTargetImpDate"+ i).val();
		
		var reviseTargetDate = $("#reviseTargetDate" + i).val();
		//var todayDate = new Date();
		
		var todayDate = getTodayDate();
		todayDate = new Date(todayDate);
		
		//alert("check "+(reviseTargetDate < todayDate));
		//alert(reviseTargetDate);
		//alert((reviseTargetDate != "") && (reviseTargetDate != undefined));
		
		/*if (reviseTargetDate != "" && reviseTargetDate != undefined) {
			alert("Inside if");
			var arr_dateText = reviseTargetDate.split("/");
			var startmonth = arr_dateText[0];
			var startday = arr_dateText[1];
			var startyear = arr_dateText[2];
			
			alert(todayDate.getFullYear() == startyear);
		}else{
			alert("Inside else");
		}*/
		
		if(reviseTargetDate != "")
			reviseTargetDate = new Date(reviseTargetDate);
		dateOne = new Date(dateOne);
		//alert("dateOne for "+i+" is "+dateOne);
		//todayDate = formatDate(todayDate);
		//dateOne = formatDate(dateOne);
		//alert("todayDate for "+i+" is "+todayDate);
				
		//alert("reviseTargetDate "+reviseTargetDate);
		//alert("(todayDate < dateOne) "+(todayDate < dateOne));
		//alert("(todayDate > dateOne) "+(todayDate > dateOne));
		if(Status != 'I' && Status != 'NMA'){
			//alert(i+": status is not equal to I and reviseTargetDate is "+reviseTargetDate);
			if (reviseTargetDate == "" || reviseTargetDate == undefined) {
				//alert("Inside if of undefined ");
				
				if(todayDate > dateOne){
					alert("Original target date has elapsed for Recommendation No " + (i + 1) + ". \nRevised target date is compulsory.");
					$("#reviseTargetDate" + i).focus();
					return false;
				}
				
			}else{
				
				reviseTargetDate = new Date(reviseTargetDate);
				//alert("revised TargetDate -> "+reviseTargetDate);
				if(reviseTargetDate < todayDate){
					alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
					$("#reviseTargetDate" + i).focus();
					return false;
				}
				//alert("Inside else");
				/* var arr_dateText = reviseTargetDate.split("/");
				var startmonth = arr_dateText[0];
				var startday = arr_dateText[1];
				var startyear = arr_dateText[2];
				
				//alert(startmonth+" "+startday+" "+startyear);
				//alert(startday+" :"+(todayDate.getDate() > startday)+" "+((todayDate.getMonth()+1) >= startmonth)+": "+(todayDate.getFullYear() >= startyear));
				
				
					
				
				if(todayDate.getFullYear() == startyear){
					if((todayDate.getMonth()+1) == startmonth){
						if(todayDate.getDate() > startday){
							alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
							return false;
						}
					}else if((todayDate.getMonth()+1) > startmonth){
						alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
						return false;
					}
				}else if(todayDate.getFullYear() > startyear){
					alert("Revised target date should be equal to or past today's date for Recommendation No " + (i + 1));
					return false;
	            } */
			}
		}
		//alert("dateOne "+dateOne+" reviseTargetDate "+reviseTargetDate);

		/*if (supRemarks != "") {
			test++;
		} else
			validate += "Superviser Remarks,";*/

		/*
		 * if (Status != 'NI') { test++; } else validate += "Superviser Status";
		 */

		/*if (test > 0 && test != 1) {
			var fullName = $("#fullName" + i).val();
			var tmque = 0;
			if (i < size1)
				tmque = i + 1;
			else {
				tmque = (i) % size1 + 1;
				if (tmque == 0) {
					tmque = 1;
				}

			}

			alert("Please fill " + validate + " for Question No" + tmque
					+ " of " + fullName);
			return false;

		}
		if (test == 0) {
			bool = true;
		} else {
			bool = false;
		}

		

		if (supRemarks != "") {
			temp++;
		}*/
   i++;
  }

	/*if (bool == true && temp == 0) {
		alert("Please fill atlest one question");
		return false;
	}*/

	var frmName = "frmSuperviser";
	var frmObj = eval("document." + frmName);
	frmObj.action = "../user/supervisorSubmit.jsp";
	frmObj.submit();
}


function getHistory(){
	var company = document.getElementById("company").value;
	var department = document.getElementById("department").value;
	var area = document.getElementById("area").value;
	var year = document.getElementById("year").value;
	//alert(company+" "+department+" "+area);
	//alert(document.getElementById("department").options[document.getElementById("department").selectedIndex].text);
	/*if(company == 'Select'){
		alert("Please select a Company");
		return;
	}
	if(department == 'Select' ){
		alert("Please Select a Department");
		department.focus();
		return;

	}*/
	$(".imgHide").show();
	var random = Math.random();
	//alert("department is "+department);
	//loadFragment2("reportsLoad.jsp?random="+random+"&company="+company+"&department="+department+"&area="+area+"&year="+year,"showData", "Data");
	makeJqueryAjaxCall("showData","reportsLoad.jsp?random="+random+"&company="+company+"&department="+department+"&area="+area+"&year="+year);
	setTimeout(function () {  
		$('#loadFragment').html("");
	}, 5000); 

	setTimeout(function () {  
		var reportlstsize = $("#sizeReport").val();
	if(reportlstsize == '0') $("#download").hide();
		else $("#download").show();
		}, 100); 
}

function getAreaHistory(){
	var area = document.getElementById("area").value;
	
	//alert(document.getElementById("area").options[document.getElementById("area").selectedIndex].text);
	if(area == 'Select' )
	{
		alert("Please Select Area");
		area.focus();
		return;
	}
	$(".areaImgHide").show();
	var random = Math.random();
	loadFragment2("reportsAreaLoad.jsp?random="+random+"&area="+area,"showAreaData", "Data");
		
	setTimeout(function () {  
		$('#loadFragment').html("");
	}, 5000); 

	setTimeout(function () {  
		var reportlstsize = $("#sizeReport").val();
	if(reportlstsize == '0') $("#downloadAreaReport").hide();
		else $("#downloadAreaReport").show();
		}, 100); 
}


function getViewUploadData(){
	var company = document.getElementById("company").value;
	var department = document.getElementById("department").value;
	var area = document.getElementById("area").value;
	var year = document.getElementById("year").value;
	//alert("department"+department);
	if(company == 'Select' )
	{
		alert("Please Select Company");
		department.focus();
		return;

	}
	if(department == 'Select' )
	{
		alert("Please Select Department");
		department.focus();
		return;

	}
	//alert("before random");
	var random = Math.random();
	//alert(random+" "+department);
	//alert("uploadViewLoad.jsp?random="+random+"&department="+department);
	//loadFragment2("uploadViewLoad.jsp?random="+random+"&company="+company+"&department="+department+"&area="+area+"&year="+year,"viewData", "Data");
	//loadFragment2("uploadViewLoad.jsp?random="+random+"&company="+company+"&department="+department+"&area="+encodeURIComponent(area)+"&year="+year,"viewData", "Data");
	makeJqueryAjaxCall("viewData","uploadViewLoad.jsp?random="+random+"&company="+company+"&department="+department+"&area="+encodeURIComponent(area)+"&year="+year);

	
}
function getMainHistory(){

	var random = Math.random();
	$("#myDiv").show();
	loadFragment2("mainReportsLoad.jsp?random="+random,"showReportData", "Data");

}


function questionHistory(count){
	
	var userId = $("#userId"+count).val();
	
	var random = Math.random();
	loadFragment2("questionsLoad.jsp?random="+random+"&userId="+userId,"qustionsShow", "Data");

}

function statusHistoryI(counter){
	
	var status = $("#countI"+counter).val();
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	//alert("status"+status);
	//alert("userId"+userId);
	loadFragment2("questionsLoad.jsp?random="+random+"&userId="+userId+"&stat="+status,"qustionsShow", "Data");

}

function statusHistoryNI(counter){
	
	var status = $("#countNI"+counter).val();	
	//alert(status);
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	loadFragment2("questionsLoad.jsp?random="+random+"&userId="+userId+"&stat="+status,"qustionsShow", "Data");

}
function statusHistoryIP(counter){
	
	var status = $("#countIP"+counter).val();	
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	loadFragment2("questionsLoad.jsp?random="+random+"&userId="+userId+"&stat="+status,"qustionsShow", "Data");

}
function statusHistoryNMA(counter){
	
	var status = $("#countNMA"+counter).val();	
	//alert("status"+status);
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	loadFragment2("questionsLoad.jsp?random="+random+"&userId="+userId+"&stat="+status,"qustionsShow", "Data");

}

function questionAdminHistory(count,deptCode,area,year){
	
	var userId = $("#userId"+count).val();
	
	var random = Math.random();
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId+"&deptCode="+deptCode+"&area="+area+"&year="+year,"qustionsShow", "Data");

}

function questionAdminHistoryArea(count){
	//alert(count);
	var userId = $("#userId"+count).val();
	
	var random = Math.random();
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId,"qustionsAreaShow", "Data");

}

function statusAdminHistoryI(counter,deptCode,area,year){
	
	var status = $("#countI"+counter).val();
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	//alert("status"+status);
	///alert("userId"+userId);
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId+"&stat=I&deptCode="+deptCode+"&area="+area+"&year="+year,"qustionsShow", "Data");

}

function statusAdminHistoryNI(counter,deptCode,area,year){
	//alert(deptCode+" "+area);
	var status = $("#countNI"+counter).val();	
	//alert(status);
	var userId = $("#userId"+counter).val();
	//alert("userId "+userId);
	var random = Math.random();
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId+"&stat=NI&deptCode="+deptCode+"&area="+area+"&year="+year,"qustionsShow", "Data");

}
function statusAdminHistoryIP(counter,deptCode,area,year){
	
	var status = $("#countIP"+counter).val();	
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId+"&stat=IP&deptCode="+deptCode+"&area="+area+"&year="+year,"qustionsShow", "Data");

}

function statusAdminHistoryNMA(counter,deptCode,area,year){
	
	var status = $("#countNMA"+counter).val();	
	//alert("status"+status);
	var userId = $("#userId"+counter).val();
	var random = Math.random();
	loadFragment2("admminQuestionsLoad.jsp?random="+random+"&userId="+userId+"&stat=NMA&deptCode="+deptCode+"&area="+area+"&year="+year,"qustionsShow", "Data");

}


function addUser(id) {

	//frmObj = document.priceApproval;
	//document.priceApproval.forWhom.value = id;

	//alert(document.priceApproval.forWhom.value);
	
	window.open('../common/search.jsp?id='+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=200,top=70,left=100');

}
function addUser1(id) {

	//frmObj = document.priceApproval;
	//document.priceApproval.forWhom.value = id;

	//alert(document.priceApproval.forWhom.value);
	
	window.open('../common/search.jsp?id='+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=200,top=70,left=100');

}

function validateUser(tblId){

	
//alert("test..");
	frmObj = document.singlefupload;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}\\";
    var goodchars="0123456789";
	var selectedOption = '';
	var choice = 0;

    var name = trim(frmObj.email.value);

    if((name.indexOf('@')) > -1||(name.indexOf('.')) > -1){

        // Check for valid email address
        stat = checkEmail('email')

        if(!stat){
            return;
        }

        selectedOption = "emailId";
    }else{
      
 		// Check Name for Null
		stat = checkNull("Name / Email-Id", name);

		if(!stat){
			frmObj.email.focus();
			return;
		}

       // Check Name for Junk
        stat = checkJunk("Name",  name ,junk);
        if(!stat){
            frmObj.email.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", name, goodchars);
        if(!stat){
            frmObj.email.focus( );
            return;
        }

        selectedOption = "name";
    }

    //alert("hi");
   loadFragment2('../common/contacts.jsp?name='+name+'&selectedOpt='+selectedOption+"&tblId="+tblId,'members','Members');

}
function add(tblId,emailId,NewtblId,tOId)
{
    junk1= "!~+%<>?;`:#$%^&*()=|[]{}\\";
    frmObj= document.singlefupload;
    //value = frmObj.outputText.value;
    //userOId= frmObj.userOId.value;

    // Check Members List for Null
    //frmObj.members.value=value;
	self.opener.document.getElementById(tblId).value    = emailId; 
    self.opener.document.getElementById(NewtblId).value = emailId;
    self.close();
}
function clear()
{
	//alert("hi");
	frmObj = document.singlefupload;
	frmObj.reset();
}


 function closeWindowFixed(str){

	//var size = document.getElementById("size").value;
		//alert("str---------"+str);
	var frmname;
	frmname = "frmSubordinate";
	//added
	window.opener.document.getElementById("submitForm").click();
	//added
	self.close();
	//	document.getElementByName("Remarks"+str).focus();
	//$("#Remarks"+str).focus();
	eval("self.opener.document."+frmname+".Remarks"+str+".focus()");
//	eval("self.opener.document."+frmname+".demo"+str+".focus()");
   }
 function closeWindowFixed1(requestStr){

	//var size = document.getElementById("size").value;
	//	alert("str---------"+str);
	var frmname;
	frmname = "frmSubordinate";
	self.close();
	
	//	document.getElementByName("Remarks"+str).focus();
	//$("#Remarks"+str).focus();
	eval("self.opener.document."+frmname+".Remarks"+requestStr+".focus()");
//	eval("self.opener.document."+frmname+".demo"+str+".focus()");

   }
 
 /*NOTE : The windowName parameter should not contain spaces else it won't work with IE5*/
 
 
 function openWindow(url, windowName, windowSpecifications, windowtitle){
	 var newWindow = window.open(url,windowName,windowSpecifications);
	 newWindow.document.title = windowtitle;
	 return false;
 }
 
 function getUploadedHistoryData(){
	document.getElementById('viewData').innerHTML = '';
	var company = document.getElementById("company").value;
	var department = document.getElementById("department").value;
	var area = document.getElementById("area").value;
	var year = document.getElementById("year").value;
	if(company == 'Select' )
	{
		alert("Please Select a Company");
		department.focus();
		return;

	}
	var random = Math.random();
	makeJqueryAjaxCall('viewData',"FetchReportsForEditOrDeleteAdmin.jsp?random="+random+"&company="+company+"&department="+department+"&area="+encodeURIComponent(area)+"&year="+year);
 }
 
 function enableSubmitButton(element){
	 element.parentElement.parentElement.querySelector('#submitEditionButton').disabled = false;
 }
 
 function updateReport(element,transId){
	
	 var parent_tr_tag = element.parentElement.parentElement;

	 var userId = parent_tr_tag.querySelector('.userId').value;
	 var supervisorId = parent_tr_tag.querySelector('.supervisorId').value;
	 var currentDepartment = parent_tr_tag.querySelector('#editDepartment').value;
	 var previousDepartment = document.getElementById("department").value;
	 
	 var message = makeAjaxCall("../user/SubmitEditedData.jsp?transId="+transId+"&userId="+userId+"&supervisorId="+supervisorId+"&currentDepartment="+currentDepartment);
	 if(message == "Updation successful")
		 if(previousDepartment != "all" && currentDepartment != previousDepartment)
			 parent_tr_tag.setAttribute("style", "display: none;");
	 alert(message);
 }

 function makeAjaxCall(url){
	 if(window.XMLHttpRequest){
		 xmlhttp = new XMLHttpRequest();
	 } else if (window.ActiveXObject) {
		 xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	 }else {
		 alert("Sorry Your Browser is not Supported");
	 }
	 
	 var message;
	 
	 try {
			xmlhttp.open("GET",url,false);
			xmlhttp.onreadystatechange = function(){
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					message = xmlhttp.responseText;
				}
			}
			xmlhttp.send(null);
		}
		catch (e) {
			alert("Can't connect to server:\n" + e.toString());
		}
		
		return message;
 }
 
 
 function makeJqueryAjaxCall(loadGIFDivId,url){
	 jQuery.ajax({
		    url: url,                      
		    type: "GET",
		    dataType: "html",
		    async:true,
		    onLoading:jQuery("#"+loadGIFDivId).html('<img src="../images/uploadLoading.gif" height="50"  width="100">').show(),
		    success: function(data){ 
		    	//alert("data is "+data);
		    	document.getElementById(loadGIFDivId).innerHTML = data;
		    	//$("#"+loadGIFDivId).lazyload();
		    	//jQuery("#"+loadGIFDivId).fadeOut();
		    }
		});
 }
 
 function deleteReportRecord(element,transId){
	 var parent_tr_tag = element.parentElement.parentElement;
	 var message = makeAjaxCall("../user/DeleteRecord.jsp?transId="+transId);
	 if(message == "Record deleted successfully")
		 parent_tr_tag.setAttribute("style", "display: none;");
 }
 
 function validateYear(year){
	 var reg = /^\d{4}-\d{2}$/;
	 return reg.test(year);
 }
 
 function getReport(requestType){
	 var random = Math.random();
	 makeJqueryAjaxCall("showData","FetchReport.jsp?random="+random+"&requestType="+requestType);
 }
 
 function loadUploadTable(){
	 if(document.getElementById('company').value == 'select'){
		 alert("Please select a company first");
		 return false;
	 }
	 var deptVal = document.getElementById('department').value;
	 //console.log(deptVal);
	 var year = document.getElementById('year').value;
	 makeJqueryAjaxCall("loadUploadTable","../upload/UploadTable.jsp?deptVal="+deptVal+"&year="+year);
 }
 
 function loadUploadTableFA(deptVal){
	 var year = document.getElementById('year').value;
	 makeJqueryAjaxCall("loadUploadTable","../upload/UploadTable.jsp?deptVal="+deptVal+"&year="+year);
 }
 
 function afterChildClose(){
	 $('#submitForm').click();
 }
 
 function attach(type){
	var dept = document.getElementById('department').value;
	var year = document.getElementById('year').value;
	var folderName;
	if(dept === ""){
		folderName = year;
	}else{
		folderName = dept+"-"+year;
	}
	 //var folderName = document.getElementById('department').value+"-"+document.getElementById('year').value;
	//attachmentFileSubord(folderName,type);
	var url			= "../upload/uploadFileSubordinate.jsp?attachment="+folderName+"&str="+type;
	var win = window.open(url,"File","width=500,height=200, left=200,right=300,top=100,resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
	win.onunload = afterChildClose; // afterChildClose() is the function.
 }
 
 
 function deleteFile(element,filePath){
	 var message = makeAjaxCall("../common/deleteAttachment.jsp?filePath="+filePath);
	 if(message == "successful"){
		 alert("The file has been deleted");
		 $('#submitForm').click();
	 }
 }
 
 function downloadAttachment(folder,file){
	 var temp = folder+file;
	 makeAjaxCall("../common/downloadAttachment.jsp?filePath="+temp+"&fileName="+file);
 }
 
 function uploadInfoTable(){
	 var company = document.getElementById("company").value;
	 if(company == 'select'){
		 alert("Please select a company");
		 return false;
	 }
	 var year = document.getElementById("year").value;
	 var random = Math.random();
	 makeJqueryAjaxCall("uploadInfoTable","FetchAttachmentInfo.jsp?random="+random+"&company="+company+"&year="+year);
 }
 
 function fixElementPositionOnScroll(ceilingTop,element,width){
	 //var ceilingTop = element.offset().top;
	 var sticky = element.offset().top;
	 console.log("ceilingTop : "+ceilingTop+" :: sticky : "+sticky);
	/*if (ceilingTop > sticky) {
		element.css("position", "fixed");
		element.css("top", ceilingTop-1);
		element.css("width", width);
	} else if(ceilingTop == sticky) {
		element.css("position", "");
		element.css("top", "");
		element.css("width", "");
	}*/
 }
