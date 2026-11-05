function update(id , flag)
{
	frmObj = document.frmMasRequests;
	
	adminoid = document.getElementById('adminoid'+id).value;
	questions = document.getElementById('questions'+id).value;
	questionno = document.getElementById('questionno'+id).value;
	requestid = document.getElementById('requestid'+id).value;
	remarks = document.getElementById('remarks'+id).value;

	if(remarks == "")
	{
     remarks="-";
	}
	

if (flag == "AC")
{
	val = confirm("Do you want to Accept this Request ? ");

	if(val){
	   frmObj.action="../mas/masRequestsSubmit.jsp?adminoid="+adminoid+"&questionno="+questionno+"&requestid="+requestid+"&questions="+questions+"&remarks="+remarks+"&flag=AC";
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

		  frmObj.action="../mas/masRequestsSubmit.jsp?adminoid="+adminoid+"&questionno="+questionno+"&requestid="+requestid+"&questions="+questions+"&remarks="+remarks+"&flag=RJ";
		  frmObj.submit();
	}
	
	
}
}

function go(){
	//alert(frequency);
	frmObj = document.frmActivity;
		
	activity = document.getElementById('activity').value;

	if(activity == "apprMatrix"){
	frmObj.action="../mas/compDeptRequest.jsp";
	frmObj.submit();
	}
}


function showAll(cheatCode)
{
    showDepartments();
}

function showDepartments(){

	frmObj = document.frmAdminRequest;
	code = frmObj.compCode.value;
	loadFragment1('../includes/departments.jsp?companyCode='+code,'departments','Departments');
	//loadFragment('../includes/empType.jsp','grades','Grades');
    
}


function subDetails()
{
   frmObj = document.frmAdminRequest;
   code = frmObj.compCode.value;
   
   if(code == '0')
	{
		alert("Please select Company!");
		return;
	}

	deptCode = frmObj.deptCode.value;
	//loadFragment1('../mas/adminRequest.jsp?companyCode='+code+'&deptCode='+deptCode,'details','Details');
	//window.open('../mas/adminRequest.jsp?companyCode='+code+'&deptCode='+deptCode);

   frmObj.action="../mas/adminRequest.jsp?companyCode="+code+"&deptCode="+deptCode;
  
   frmObj.submit();
}


function addUser() {
	
$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "../common/search.jsp?random="+random,
			success : function (data) {
			
				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});

	$(".closeBtn").click(function(){
			$(".QTPopup").css('display', 'none');
		})


}


function add(tOId, emailId ,userOID)
{
	document.getElementById('inputString').value = emailId; 
	/*$("#fade").hide();
	$("#dialog").fadeOut();*/

	$(".QTPopup").css('display', 'none');	
}

function replaceAppr()
{
	frmObj = document.frmadminReq;
	inputString = frmObj.inputString.value;
   
	if(inputString == '')
	{
		alert("Please enter Approver Emailid!");
		return;
	}

	frmObj.action="../mas/replaceRequest.jsp";
    frmObj.submit();
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
