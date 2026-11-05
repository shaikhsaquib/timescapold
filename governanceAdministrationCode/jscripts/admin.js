function update(id , flag , what)
{
	frmObj = document.frmAdminRequests;

	requestoroid = document.getElementById('requestoroid'+id).value;
	approveroid = document.getElementById('approveroid'+id).value;
	remarks = document.getElementById('remarks'+id).value;
	//alert(remarks);

	if(remarks == "")
	{
     remarks="-";
	}


if (flag == "AC")
{
	val = confirm("Do you want to Accept this Request ? ");

	if(val){
	   frmObj.action="../admin/adminRequestsSubmit.jsp?requestoroid="+requestoroid+"&flag=AC"+"&approveroid="+approveroid+"&remarks="+remarks;
	   frmObj.submit();
	}

}
else
{
	if(remarks == "-")
		{
			alert("Please enter remark !");
			eval("frmObj.remarks"+id).focus();
			return;
		}
		else{
	      val = confirm("Do you want to Reject this Request ? ");
		}

	if(val){

   frmObj.action="../admin/adminRequestsSubmit.jsp?requestoroid="+requestoroid+"&flag=RJ"+"&approveroid="+approveroid+"&remarks="+remarks;
   frmObj.submit();
	}
	
	
}
}


function updateAll(id , frequency)
{
	frmObj = document.frmAdminRequests;
	requestoroid = document.getElementById('inputString1'+id).value;
	approveroid = document.getElementById('inputString2'+id).value;
	policy = document.getElementById('policyid'+id).value;
	policymetadataid = document.getElementById('policymetadataid'+id).value;

   frmObj.action="../admin/adminAssignRequestSubmit.jsp?requestoroid="+requestoroid+"&frequency="+frequency+"&flag=AC"+"&approveroid="+approveroid+"&policy="+policy+"&policymetadataid="+policymetadataid;
   frmObj.submit();
	
}

function go(){
	//alert(frequency);
	frmObj = document.frmAdminActivity;
		
	activity = document.getElementById('activity').value;

	if(activity == "editquestion"){
	frmObj.action="../admin/adminEditQuestion.jsp";
	frmObj.submit();
	}else if(activity =="changingmanager"){
		frmObj.action="../admin/allRequestChangeManeger.jsp";
		frmObj.submit();
	}


	

}


function validate(frequency)
{
	frmObj = document.frmAdminRequests;
 
	if ((document.getElementById('question').value) == "" )
	{
       alert("please fill question  ...");
	   return;
	}
	else
	{

		question = document.getElementById('question').value;
		activity = document.getElementById('activity').value;
		subFunction = document.getElementById('subFunctionSelectBox').value;
		policyHead = document.getElementById('policyHeadSelectBox').value;
		policySubHead = document.getElementById('policySubHeadSelectBox').value;
	
		frmObj.action = "../admin/adminCreateRequestsSubmit.jsp?question="+question+"&activity="+activity+"&subFunction="+subFunction+"&policyHead="+policyHead+"&policySubHead="+policySubHead+"&frequency="+frequency+"&action=new";
		frmObj.submit();	
	}

}


function addUser(index,frequency , policymetadatid , policyid) {

	$("#msg").html("");
		$("#dialog").fadeIn();
		$("#fade").show();

		

		var random = Math.random();
		$.ajax({
			url : "../common/search.jsp?random="+random+"&policymetadatid="+policymetadatid+"&frequency="+frequency+"&index="+index,
			success : function (data) {
				
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

		$(".btn_close").click(function(){
		
		$("#fade").hide();
		$("#dialog").fadeOut();
	});
	
	
	
	//window.open('../common/search.jsp?policyid='+policyid+'&frequency='+frequency+'&index='+index,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=300,top=70,left=100');

}


function add(elementId, tOId, emailId ,userOID ,policyid ,frequency)
{
	document.getElementById(elementId).value = emailId; 

	$("#fade").hide();
	$("#dialog").fadeOut();

	
}

function viewDetalis(index,frequency , policymetadatid , requestid)
{

	$("#msg").html("");
		$("#dialog").fadeIn();
		$("#fade").show();

		
		var random = Math.random();
		$.ajax({
			url : "../admin/viewDetails.jsp?random="+random+"&policymetadatid="+policymetadatid+"&frequency="+frequency+"&requestid="+requestid+"&index="+index,
			success : function (data) {
				
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

		$(".btn_close").click(function(){
		
		$("#fade").hide();
		$("#dialog").fadeOut();
	});

}

function editdelete(index)
{
	frmObj = document.frmAdminEdit;
	//alert(document.getElementById('edit'+index).innerText);
	currval = document.getElementById('edit'+index).innerHTML;
	
	   document.getElementById('myTextBox'+index).style.display= 'block';
	   document.getElementById('text'+index).style.display= 'none';
	   document.getElementById('edit'+index).innerHTML = "SEND REQUEST";
	
	
	question = document.getElementById('myTextBox'+index).value;
	questionno = document.getElementById('questionno'+index).value;

	if (currval == "SEND REQUEST")
	{
		val = confirm("Do you want to Send this Request for Approver ? ");
		if(val){
			frmObj.action = "../admin/adminCreateRequestsSubmit.jsp?question="+question+"&questionno="+questionno;
			frmObj.submit();
		}
	}
}

function viewHistory(frequency)
 {
	frmObj = document.frmAdminRequests;

	frmObj.action = "../admin/checkAdminStatus.jsp?frequency="+frequency;
	frmObj.submit( );	
 }


function viewHistoryAdmin(frequency)
 {
	frmObj = document.frmAdminRequests;

	frmObj.action = "../admin/checkAssignAdminStatus.jsp?frequency="+frequency;
	frmObj.submit( );	
 }


