function validate(status,frmName)
{

	//var frmObj							= e"document."+frmName;
	var frmObj = eval("document."+frmName);

	var alfa							= "abcdefghijklmnopqrstuvwxyz";
	var num = "0123456789";
	//var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var junk = "!~<>?`^|{}/\\#";
	var valid;
	var stat;

	var typeOfAgreement				= document.getElementById("typeOfAgreement").value;

	var partyName					= document.getElementById("partyName").value;

	var reasonForSingAgreement		= document.getElementById("reasonForSingAgreement").value;

	var dateOfAgreement				= document.getElementById("dateOfAgreement").value;
	
	//var agreementYear				= document.getElementById("agreementYear").value;
	
	var valueOfAgreement			= document.getElementById("valueOfAgreement").value;

	var agreement					= document.getElementById("agreement").value;

	var natureOfParties				= document.getElementById("natureOfParties").value;

	var address						= document.getElementById("address").value;

	//var termOfAgreement				= document.getElementById("termOfAgreement").value;

	var jurisdiction				= document.getElementById("jurisdiction").value;

	//var considerationOfAgreement	= document.getElementById("considerationOfAgreement").value;

	//var deliverablesNatureOfParty	= document.getElementById("deliverablesNatureOfParty").value;

	var terminationFromDate			= document.getElementById("terminationFromDate").value;

	var terminationToDate			= document.getElementById("terminationToDate").value;

	var userDeptHead				= document.getElementById("userDeptHead").value;

	var legalHead					= document.getElementById('legalHead').value;

	var mainComments				= document.getElementById('mainComments').value;

	if(status == 'inProcess')
	{

		if(typeOfAgreement == '' || typeOfAgreement == '0')
		{
			alert("Please select/enter Type Of Agreement.");
			document.getElementById("typeOfAgreement").focus();				
			return;
		}

		stat = checkNull("Type Of Agreement", typeOfAgreement);
		if(!stat)
		{
			document.getElementById('typeOfAgreement').focus();
			return;
		}

		valid = checkJunk("Type Of Agreement", typeOfAgreement, junk);
		if(!valid){
			document.getElementById('typeOfAgreement').focus();
			document.getElementById('typeOfAgreement').value = "";
			return;
		}

		valid = checkNum("Type Of Agreement", typeOfAgreement, num);
		if(!valid){
			document.getElementById('typeOfAgreement').focus();
			document.getElementById('typeOfAgreement').value = "";
			return;
		}

		stat = checkNull("Party Name", partyName);
		if(!stat)
		{
			document.getElementById('partyName').focus();
			return;
		}

		valid = checkJunk("Party Name", partyName, junk);
		if(!valid){
			document.getElementById('partyName').focus();
			document.getElementById('partyName').value = "";
			return;
		}

		valid = checkNum("Party Name", partyName, num);
		if(!valid){
			document.getElementById('partyName').focus();
			document.getElementById('partyName').value = "";
			return;
		}

		if(natureOfParties == '' || natureOfParties == '0')
		{
			alert("Please select/enter Nature Of Parties.");
			document.getElementById("natureOfParties").focus();				
			return;
		}

		if(agreement == '' || agreement == '0')
		{
			alert("Please select/enter Agreement.");
			document.getElementById("agreement").focus();				
			return;
		}

		if (isNaN(valueOfAgreement))
		{
			alert("Please enter only numbers in Value of Agreement.");
			document.getElementById('valueOfAgreement').value="0";			
			document.getElementById('valueOfAgreement').focus();				
			return;
		}

		stat = checkNull("Value Of Agreement", valueOfAgreement);
		if(!stat)
		{
			document.getElementById('valueOfAgreement').focus();
			return;
		}

		valid = checkJunk("Value Of Agreement", valueOfAgreement, junk);
		if(!valid){
			document.getElementById('valueOfAgreement').focus();
			document.getElementById('valueOfAgreement').value = "";
			return;
		}


		stat = checkNull("Reason For Signing Agreement", reasonForSingAgreement);
		if(!stat)
		{
			document.getElementById('reasonForSingAgreement').focus();
			return;
		}

		valid = checkJunk("Reason For Signing Agreement", reasonForSingAgreement, junk);
		if(!valid){
			document.getElementById('partyName').focus();
			document.getElementById('partyName').value = "";
			return;
		}

		valid = checkNum("Reason For Signing Agreement", reasonForSingAgreement, num);
		if(!valid){
			document.getElementById('reasonForSingAgreement').focus();
			document.getElementById('reasonForSingAgreement').value = "";
			return;
		}

		
		stat = checkNull("Address", address);
		if(!stat)
		{
			document.getElementById('address').focus();
			return;
		}

		valid = checkJunk("Address", address, junk);
		if(!valid){
			document.getElementById('address').focus();
			document.getElementById('address').value = "";
			return;
		}

		/*valid = checkNum("Address", address, num);
		if(!valid){
			document.getElementById('address').focus();
			document.getElementById('address').value = "";
			return;
		}*/

		

		/*valid = checkNum("Value Of Agreement", valueOfAgreement, num);
		if(!valid){
			document.getElementById('valueOfAgreement').focus();
			document.getElementById('valueOfAgreement').value = "";
			return;
		}*/		


	/*	stat = checkNull("Term Of Agreement", termOfAgreement);
		if(!stat)
		{
			document.getElementById('termOfAgreement').focus();
			return;
		}

		valid = checkJunk("Term Of Agreement", termOfAgreement, junk);
		if(!valid){
			document.getElementById('termOfAgreement').focus();
			document.getElementById('termOfAgreement').value = "";
			return;
		}

		valid = checkNum("Term Of Agreement", termOfAgreement, num);
		if(!valid){
			document.getElementById('termOfAgreement').focus();
			document.getElementById('termOfAgreement').value = "";
			return;
		}*/

		if(jurisdiction == '' || jurisdiction == '0')
		{
			alert("Please select/enter Jurisdiction.");
			document.getElementById("jurisdiction").focus();				
			return;
		}

		/*
		stat = checkNull("Consideration Of Agreement", considerationOfAgreement);
		if(!stat)
		{
			document.getElementById('considerationOfAgreement').focus();
			return;
		}

		valid = checkJunk("Consideration Of Agreement", considerationOfAgreement, junk);
		if(!valid){
			document.getElementById('considerationOfAgreement').focus();
			document.getElementById('considerationOfAgreement').value = "";
			return;
		}

		valid = checkNum("Consideration Of Agreement", considerationOfAgreement, num);
		if(!valid){
			document.getElementById('considerationOfAgreement').focus();
			document.getElementById('considerationOfAgreement').value = "";
			return;
		}

		stat = checkNull("Deliverables Nature Of Party", deliverablesNatureOfParty);
		if(!stat)
		{
			document.getElementById('deliverablesNatureOfParty').focus();
			return;
		}

		valid = checkJunk("Deliverables Nature Of Party", deliverablesNatureOfParty, junk);
		if(!valid){
			document.getElementById('deliverablesNatureOfParty').focus();
			document.getElementById('deliverablesNatureOfParty').value = "";
			return;
		}

		valid = checkNum("Deliverables Nature Of Party", deliverablesNatureOfParty, num);
		if(!valid){
			document.getElementById('deliverablesNatureOfParty').focus();
			document.getElementById('deliverablesNatureOfParty').value = "";
			return;
		}
		*/

		stat = checkNull("Department head Emailid", userDeptHead);

		if(!stat)
		{
			document.getElementById('userDeptHead').focus();
			return;
		}

		stat = checkNull("Legal head Emailid", legalHead);

		if(!stat)
		{
			document.getElementById('legalHead').focus();
			return;
		}

		stat = checkNull("Comments", mainComments);
		if(!stat)
		{
			document.getElementById('mainComments').focus();
			return;
		}

		valid = checkJunk("Comments", mainComments, junk);
		if(!valid){
			document.getElementById('mainComments').focus();
			document.getElementById('mainComments').value = "";
			return;
		}

		valid = checkNum("Comments", mainComments, num);
		if(!valid){
			document.getElementById('mainComments').focus();
			document.getElementById('mainComments').value = "";
			return;
		}


		document.getElementById('frmStatus').value = 'I';

	}else if(status == 'draft'){
			
		document.getElementById('frmStatus').value = 'D';
	}

	//alert("termOfAgreement----"+termOfAgreement);

	if(frmName == 'createRequest')
	{
		url = "../user/requestSubmit.jsp";

	}else if(frmName == 'frmDraftRequestDetails'){

		url = "../common/draftRequestSubmit.jsp";
	
	}	
	frmObj.action = url;
	frmObj.submit( );
}


//function showDetails1(requestId, status, docId, whom){
function showDetails1(requestId, status, whom, encryStatus){
	//var frmObj	= document.frmViewRequest;
	//alert("status--"+status);
	//alert("whom--"+whom);
	var url;
	if((status == 'ACK' || status == 'A' || status == 'R' || status == 'UA' || status == 'US' || status == 'CL') && whom == 'Approver')
	{
		
		url = '../common/legalHeadDashboardDetails.jsp?requestId='+requestId+"&status="+status+"&encryStatus="+encryStatus;

	}else if((status == 'ACK' || status == 'A' || status == 'R' || status == 'UA' || status == 'US' || status == 'CL') && whom == 'User')
	{
		url = '../common/dashboardCordinatorDetails.jsp?requestId='+requestId+"&status="+status+"&encryStatus="+encryStatus;

	}else if(status == 'I' || status == 'A' || status == 'CL' || status == 'C' || status == 'AR')
	{
		url = '../common/requestDetails.jsp?requestId='+requestId+"&status="+status+"&encryStatus="+encryStatus;


	}else if(status == 'D' || status == 'R')
	{
		url = "../common/draftRequestDetails.jsp?requestId="+requestId+"&status="+status+"&encryStatus="+encryStatus;	
	}
	document.location.href = url;
	frmObj.action = url;
	frmObj.submit();
}

function lookup(inputString,idName) {

	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var goodchars="0123456789";

	 if((inputString.indexOf('@')) > -1)
	 {
        selectedOption = "emailId";
    }else{
    
       // Check Name for Junk
        stat = checkJunk("Name",  inputString ,junk);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", inputString, goodchars);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }

        selectedOption = "name";
    }
	//alert("selectedOption---"+selectedOption);


	if(inputString.length == 0) {
		$('#suggestions').hide();
	} else {
		   
		$.post("../common/searchEmail.jsp", {queryString: ""+inputString+"",idName: ""+idName+"",selectedOption: ""+selectedOption+""}, function(data){
		
		//alert("data----"+data);
		if(typeof String.prototype.trim !== 'function') {
		  String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, ''); 
		  };
		}
		

		if(data.trim().length > 0) {
		$('#suggestions').show();
		$('#autoSuggestionsList').html(data);
	}else{
		$('#suggestions').hide();
		}
		});
	}
}


function fill(thisValue,idName) {

	$('#userDeptHead').val(thisValue).focus();
	$('#suggestions').hide();
}

function lookup1(inputString,idName) {

	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var goodchars="0123456789";


	 if((inputString.indexOf('@')) > -1){
        selectedOption = "emailId";
    }else{
      
       // Check Name for Junk
        stat = checkJunk("Name",  inputString ,junk);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", inputString, goodchars);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }

        selectedOption = "name";
    }

	if(inputString.length == 0) {
		$('#suggestions1').hide();
	} else {
		$.post("../common/searchEmail.jsp", {queryString: ""+inputString+"",idName: ""+idName+"",selectedOption: ""+selectedOption+""}, function(data){

		
		//alert("data111----"+data);
		if(typeof String.prototype.trim !== 'function') {
		  String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, ''); 
		  };
		}
		
		if(data.trim().length > 0) {
		$('#suggestions1').show();
		$('#autoSuggestionsList1').html(data);
	}else{
		$('#suggestions1').hide();
		}
		});
	}
}


function fill1(thisValue,idName) {
	$('#legalHead').val(thisValue).focus();
	$('#suggestions1').hide();
}

function runScript(e) {
    if (e.keyCode == 13) {
       getSearchDetails();
    }
}



function actionOnRequest(requestId,docId,reqStatus)
{
	var frmObj = eval("document.frmViewRequest");

	var url;
	url = "../common/actionRequestDetails.jsp?requestId="+requestId+"&reqStatus="+reqStatus;	
	frmObj.action = url;
	frmObj.submit( );
}



function actionOnRequest1(requestId,docId,reqStatus,pos)
{
	//var frmObj	= document.forms.frmViewRequest;
	var frmObj = eval("document.frmViewRequest");
	var remarks		= document.getElementById("remarks"+pos).value;
	var url;
	if(reqStatus == 'AR' ){

		if(remarks == "")
		{
			alert("Please enter Remarks");
			document.getElementById("remarks"+pos).focus();
			return;
		}
	}

		
	document.getElementById('reqStatus').value = reqStatus;
	url = "../common/legalActionRequestDetails.jsp?pos="+pos;
	
	frmObj.action = url;
	frmObj.submit( );
}


function actionOnDash(requestId,docId,reqStatus,pos)
{
	//var frmObj	= document.forms.frmViewRequest;
	var frmObj = eval("document.frmDashBoard");
	var url;

	if(reqStatus == 'US')
	{
		var signOffDireSize		= document.getElementById("hiddDirectorySizesignoff").value;
		if(signOffDireSize == '0')
		{
			alert("It seems that you have not upload the singed-off document in pdf format.\n Please attach the signed-off document!");
			return;
		}
		//alert("signOffDireSize====="+signOffDireSize);
	}

	
	document.getElementById('reqStatus').value = reqStatus;
	url = "../common/dashBoardDetailsSubmit.jsp";
	
	frmObj.action = url;
	frmObj.submit( );
}


function getDataOnClick(requestId)
{
	var random = Math.random();
	loadFragment2("../common/viewChatDetails.jsp?id=0"+"&random="+random, "chatDetails", "Details");
	
}

var counter=1;

function sendOnDash(requestId,userStat)
{	
	//var frmObj	= document.frmDashboardDeatails;
	//var msg		= document.getElementById("msg").value;
	var msg = $.trim($("#msg").val());
	var legalHeadEmailid = $.trim($("#legalHeadEmailid").val());
	
	var stat = checkNull("Message", msg);

	if(!stat)
	{
		$("#msg").focus();
		//document.getElementById('msg').focus();
		return;
	}
	
	var random = Math.random();
	var id = '1';

	if(msg.length != 0)
	{
	   /*Disables the input box*/
		 // $('#msg').attr({'disabled':'true'});
	   /*Disables the post button*/
		 // $('#send').attr({'disabled':'true'});

	   /*Send ajax request*/
	  $.ajax({
		 'url':'../common/chatDetails.jsp',
		'data':{'comment': msg,'id': id,'legalHeadEmailid': legalHeadEmailid},
		 'type':'POST',
		 'success':function(data)
		 {
			
		  if(data.length)
		  {
		   /*Create new table for new post*/
		 /*  var htm = '<table class="new_comment_table" id="new_comment_table'+counter+'" align="center">';
			htm += '<tr class="new_comment_row" id="'+counter+'">';
		 htm += '<td class="new_comment_img" id="new_comment_img"><img src="web.PNG" height="50" width="50"></td>';
		 htm += '<td class="new_comment_text" id="new_comment_text"><b>Arvind : </b>'+ data;
		 htm += '<br /><div class="comment_del_but" id="'+counter+'" align="right""><a href="#">Delete</a></div>';
		 htm += '</td>';
		 htm += '</tr>';
		 htm += '</table>';*/

		var res = data.split('@'); 
		var dis;
		var dis1;

		if(userStat == 'U')
		{
			dis='';
			dis1='media-left';
		}else
		{

			dis ='speech-right';
			dis1 ='media-right';

		}

		   var htm = '<li class="mar-btm">';
				htm += '<div class="'+dis1+'">';
				htm += '<img src="../images/user_2.png" class="img-circle img-sm" alt="Profile Picture">';
				htm += '</div>';
				htm += '<div class="media-body pad-hor '+dis+'">';
				htm += '<div class="speech">';
				htm += '<a href="#" class="media-heading">'+res[1]+'</a>';
				htm += '<p>'+res[0]+'</p>';
				htm += '<p class="speech-time">';
				htm += '<i class="fa fa-clock-o fa-fw"></i> '+res[2]+'';
				htm += '</p>';
				htm += '</div>';
				htm += '</div>';
				htm += '</li>';

		   /*Append new table in predefined area*/
		    $('#chatDetails').append(htm);
			  $('#msg').val("");
			//  $('#send').removeAttr('disabled');
		  counter++;
		}
   }
   });
  }

}


function attachmentFile(attachDetails, str, userEmailid){			
	var url			= "../upload/uploadFile.jsp?attachment="+attachDetails+"&str="+str+"&userEmailid="+userEmailid;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}

//function userAttachmentFile(attachDetails, str, userEmailid, status){	
function userAttachmentFile(attachDetails,status){	
	
	if(status == 'A')
	{
		attachDetails = "signoff";
	}
	
	var url			= "../upload/userUploadFile.jsp?attachment="+attachDetails;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}



function showAttachmentFile(str){	

	loadFragment2("../upload/showDirListing.jsp?attachment=current&str=1","attachment","Attachment");
	loadFragment2("../upload/showDirListing.jsp?attachment=archive&str=1","attachment1","Attachment");
	loadFragment2("../upload/showDirListing.jsp?attachment=signoff&str=1","attachment2","Attachment");
	loadFragment2("../upload/showDirListing.jsp?attachment=current&str=1","attachment3","Attachment");
}


//function showCurrentAttachmentFile(str, requestId, userEmailId, status){	
function showCurrentAttachmentFile(str, status){	

	if(status == 'CL')
	{
		attachDetails = "signoff";

	}else
	{
		attachDetails = "current";
	}
	loadFragment2("../upload/showCurrentDirListing.jsp?attachment="+attachDetails+"&str=1","attachment3","Attachment");
}

function showParticipants()
{
	var url			= "../legalHead/showParticipants.jsp";
	window.open(url,"File","width=750,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
}


function searchUsers()
{
	var frmObj = eval("document.frmParticipants");
	var rolesCriteria = $.trim($("#rolesCriteria").val());

	var rolesText = $.trim($("#rolesText").val());
	
	if(rolesText=='')
	{
		alert("Please enter the user name or EmailId!!!");
		$("#rolesText").focus();
		return;
	}
	loadFragment2("../legalHead/viewParticipantList.jsp?rolesText="+rolesText+"&rolesCriteria="+rolesCriteria,"showEmailid","Attachment");
}

function submitUser(emailid)
{
	var frmObj = eval("document.frmParticipants");
	url = "../legalHead/assignRole.jsp?userEmailid="+emailid;
	
	frmObj.action = url;
	frmObj.submit();
	
}



function showApproverAttachment(str){	

	loadFragment2("../upload/showApproverDirListing.jsp?attachment=current,archive,signoff&str=1","attachment","Attachment");
	loadFragment2("../upload/showDirListing.jsp?attachment=current&str=1","attachment3","Attachment");
}


//function showAttachedFile(fileName, emailid,str,requestId,attachment){
function showAttachedFile(fileName,attachment){
	var url	= "/timescape/sapep/collaboration/workflow/legal/common/popup.jsp?str=1&fileName="+fileName+"&attachment="+attachment;
	window.location.href = url;
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
	
	var message = "";
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
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
				$("#"+element_id).html(message);
				//element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}

function arrHasDupes( A ) {                          // finds any duplicate array elements using the fewest possible comparison
	var i, j, n;
	n=A.length;
                                                     // to ensure the fewest possible comparisons
	for (i=0; i<n; i++) {                        // outer loop uses each item i at 0 through n
		for (j=i+1; j<n; j++) {              // inner loop only compares items j at i+1 to n
			if (A[i]==A[j]) return true;
	}	}
	return false;
}

function checkDecimal(val) 
{
	//alert("val----"+val);
	if (val.length >= 3)
		if (/\d*\.\d\d$/.test(val))
			return true;
		else {
			alert("Only two decimal places allowed");
			return false;
		}
}


function lookupDeptApproval(inputString,idName) {

	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var goodchars="0123456789";

	 if((inputString.indexOf('@')) > -1)
	 {       
        selectedOption = "emailId";
    }else{
    
       // Check Name for Junk
        stat = checkJunk("Name",  inputString ,junk);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", inputString, goodchars);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }

        selectedOption = "name";
    }
	//alert("selectedOption---"+selectedOption);


	if(inputString.length == 0) {
		$('#suggestions').hide();
	} else {
		   
		$.post("../common/searchDeptApproverEmail.jsp", {queryString: ""+inputString+"",idName: ""+idName+"",selectedOption: ""+selectedOption+""}, function(data){
		
		//alert("data----"+data);
		if(typeof String.prototype.trim !== 'function') {
		  String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, ''); 
		  };
		}
		

		if(data.trim().length > 0) {
		$('#suggestions').show();
		$('#autoSuggestionsList').html(data);
	}else{
		$('#suggestions').hide();
		}
		});
	}
}
function lookupRepresentative(inputString,idName) {

	var junk = "@!~+%<>?`;#$%^&*()=|[]{}";
	var goodchars="0123456789";

	 if((inputString.indexOf('@')) > -1){
		 selectedOption = "emailId";
	 }else{
      
       // Check Name for Junk
        stat = checkJunk("Name",  inputString ,junk);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }
        // Check Name for Numbers
        stat = checkNum("Name", inputString, goodchars);
        if(!stat){
            frmObj.userDeptHead.focus( );
            return;
        }

        selectedOption = "name";
    }

	if(inputString.length == 0) {
		$('#suggestions1').hide();
	} else {
		$.post("../common/searchRepresentativeEmail.jsp", {queryString: ""+inputString+"",idName: ""+idName+"",selectedOption: ""+selectedOption+""}, function(data){
	
		//alert("data111----"+data);
		if(typeof String.prototype.trim !== 'function') {
		  String.prototype.trim = function() {
			return this.replace(/^\s+|\s+$/g, ''); 
		  };
		}
		
		if(data.trim().length > 0) {
		$('#suggestions1').show();
		$('#autoSuggestionsList1').html(data);
	}else{
		$('#suggestions1').hide();
		}
		});
	}
}
