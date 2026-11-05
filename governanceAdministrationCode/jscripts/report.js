function addUser() {

/*	$("#msg").html("");
		$("#dialog").fadeIn();
		$("#fade").show();

	*/	
		$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "../common/search.jsp?random="+random,
			success : function (data) {
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

	/*	$(".btn_close").click(function(){
		
		$("#fade").hide();
		$("#dialog").fadeOut();
	});*/
	
	
	
	//window.open('../common/search.jsp?policyid='+policyid+'&frequency='+frequency+'&index='+index,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=300,top=70,left=100');

}

function change()
 {
	frmObj = document.frmActivity;
 
	if ((document.getElementById('inputString').value) == "" )
	{
       alert("please select Emailid ...");
	   return;
	}

		approverEmailid = document.getElementById('inputString').value;
		currentapproveremailid = document.getElementById('currentapproveremailid').value;
		
		remarks = document.getElementById('remarks').value;
		if((remarks == null) || (remarks== " ") || (remarks== "") || (remarks =="0"))
		{
			alert("Please enter remark !");
			eval("frmObj.remarks").focus();
			return;
		}

		frmObj.action = "../common/createRequestSubmit.jsp?ApproverEmailid="+approverEmailid+"&currentapproveremailid="+currentapproveremailid+"&remarks="+remarks;
		frmObj.submit( );	

}


function add(tOId, emailId ,userOID)
{
	
	document.getElementById('inputString').value = emailId; 

	/*$("#fade").hide();
	$("#dialog").fadeOut();*/
//	alert('m here');
	$(".QTPopup").css('display', 'none');

	
}

/*function goBack(){

	frmObj = document.frmStatus;

	frmObj.action = "../user/allRequestChangeManeger.jsp";
	frmObj.submit();

}*/







