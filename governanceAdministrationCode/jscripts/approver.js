function update(id , flag , what)
{
	frmObj = document.frmApproverRequests;

	requestoremailid = document.getElementById('requestoremailid'+id).value;
	remarks = document.getElementById('remarks'+id).value;

	if (remarks == "")
	{
     remarks = "-";
	}


if (flag == "AC")
{
	val = confirm("Do you want to Accept this Request ? ");

	if(val){
	   frmObj.action="../approver/approverRequestsSubmit.jsp?requestoremailid="+requestoremailid+"&remarks="+remarks+"&flag=AC";
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
		else
		{
			val = confirm("Do you want to Reject this Request ? ");
		}

	if(val){

   frmObj.action="../approver/approverRequestsSubmit.jsp?requestoremailid="+requestoremailid+"&remarks="+remarks+"&flag=RJ";
   frmObj.submit();
	}
	
	
}
}

function viewUserDetails()
{
	frmObj = document.frmManagerActivity;

	activity = document.getElementById('activity').value;


	if(activity == "userDetails"){
	frmObj.action="../approver/approverAuthoriseWeekly.jsp";
	frmObj.submit();
	}
}

function daleteUser(index,userOId) {

 frmObj = document.frmApproverAuthorise;
//var userId = 0;
	/*if(what == "daleteQuestion")
	{

		 var input_element = document.getElementsByName("userId"+policyid);

		 for(var i=0; i<input_element.length; i++) {
			 userId = input_element[i].value ;
			}
			alert(userId);

	}
	else
	{
	 userId = userOId;

	 }*/

  val = confirm("Do you want to delete this User ? ");

	if(val){

	/*$("#msg").html("");
		$("#dialog").fadeIn();
		$("#fade").show();
	*/
		$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "../approver/approverAuthoriseSubmit.jsp?random="+random+"&index="+index+"&userId="+userOId,
			success : function (data) {
				
				$("#msg").removeClass("msgProfile").addClass("msgOthers").show();
				$("#msg").html(data);
			}
		});

		$(".closeBtn").click(function(){
			document.location.href = "../approver/approverAuthorise.jsp";
			$(".QTPopup").css('display', 'none');
		})

	/*	$(".btn_close").click(function(){

		document.location.href = "../approver/approverAuthoriseWeekly.jsp";
		
		$("#fade").hide();
		$("#dialog").fadeOut();
	
	}); */
		
	}else{

		return;
	}
	

}


function addNewUser(what, index) {

	/*$("#msg").html("");
		$("#dialog").fadeIn();
		$("#fade").show();
		*/
		$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "../common/search1.jsp?random="+random+"&what="+what+"&index="+index,
			success : function (data) {
			
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

		$(".closeBtn").click(function(){
			document.location.href = "../approver/approverAuthorise.jsp";
			$(".QTPopup").css('display', 'none');
		})

		

	/*	$(".btn_close").click(function(){
		
		$("#fade").hide();
		$("#dialog").fadeOut();
	});*/
	
	
	
	//window.open('../common/search.jsp?policyid='+policyid+'&frequency='+frequency+'&index='+index,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=300,top=70,left=100');

}

function add(elementId, tOId, emailId ,userOID, what)
{
	//alert("what--"+what+"---index--"+elementId+"---tOId--"+tOId+"----emailId--"+emailId+"--userOID--"+userOID);

	if (what == "R")
	{
		document.getElementById(elementId).value = emailId;
		document.getElementById("OId"+elementId).value = tOId;

	}  else if(what == "N")
	{	
	//alert(emailId);
	document.getElementById('addUser').value = emailId; 
	}

/*	$("#fade").hide();
	$("#dialog").fadeOut();
*/$(".QTPopup").css('display', 'none');
	
}
function changeUser()
 {
	 
	frmObj = document.frmApproverAuthorise;

		if (document.getElementById('addUser') && !(document.getElementById('addUser').value) == "" )
		{
		  addUser = document.getElementById('addUser').value;
	//	  alert(addUser);
		  frmObj.action = "../approver/addNewUser.jsp?addUser="+addUser;
		  frmObj.submit( );	
		} 
		
		
			}

function replacingUser(i)
{
	frmObj = document.frmApproverAuthorise;
	if (document.getElementById('replaceuser' +i) && !(document.getElementById('replaceuser' +i).value) == "" )
	{
	//	alert("ready to replace");
		replaceUser = document.getElementById('replaceuser'+i).value;
		replaceUserOId = document.getElementById('OIdreplaceuser'+i).value;
		oldUserOId = document.getElementById('userId'+i).value;
		//alert(replaceUser+"--"+replaceUserOId);
		//frmObj.action = "../approver/addNewUser1.jsp?replaceuser="+replaceuser;
	      frmObj.action = "../approver/addNewUser1.jsp?replaceUser="+replaceUser+"&replaceUserOId="+replaceUserOId+"&oldUserOId="+oldUserOId;
		//frmObj.action="../approver/approverRequestsSubmit.jsp?requestoremailid="+requestoremailid+"&remarks="+remarks+"&flag=RJ";
	    frmObj.submit( );

		

		       

		/*$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "../approver/addNewUser1.jsp?random="+random+"&replaceUser="+replaceUser+"&replaceUserOId="+replaceUserOId+"&oldUserOId="+oldUserOId,
			success : function (data) {
				alert(data);
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

		$(".closeBtn").click(function(){
			document.location.href = "../approver/approverAuthorise.jsp";
			$(".QTPopup").css('display', 'none');
		})
	*/

	}
}







 

 



