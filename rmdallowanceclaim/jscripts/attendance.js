
function validateDate(fromYear,fromMonth,empNumber) {

	//frmObj = document.frmAttendance;

    loadFragment('../common/attendanceDetails.jsp?selMonth='+fromMonth+'&selYear='+fromYear+'&empNumber='+empNumber+'&random='+Math.random(),'loadData','Attendance');

}

function valRequest()
{
	frmObj = document.frmAttendance;

	var fromYear = frmObj.fromYear.value;
	var fromMonth = frmObj.fromMonth.value;

	
    frmObj.action = "../employee/viewShiftDetails.jsp?selMonth="+fromMonth+"&selYear="+fromYear;
	frmObj.submit();

	
}

function toCreateLeave( i ) {
	
	frmObj		=	document.frmAttendance;
	
	attendanceDate	=	eval("frmObj.attendanceDate"+i+".value");
		
	frmObj.fromDate.value = attendanceDate;

	frmObj.action = "../employee/createLeave.jsp";

	frmObj.submit( );

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
    
    var element = document.getElementById(element_id);
	
    var message = "";

	processingRequest='<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="small"><img src="../images/loading.gif" >&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
       
    element.innerHTML = processingRequest;

    try{
        
		xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){
		//alert(xmlhttp.status);
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
                var gotresponse	=	xmlhttp.responseText;
                
				message =  gotresponse;

                element.innerHTML = message;
				//alert(message);
             }
		}
		xmlhttp.send(null);
		//alert("testing2");
	 }// display an error in case of failure
	 catch (e){
	  alert("Can't connect to server:\n" + e.toString());
	 }
}

function showDetails(emailId){

    loadFragment('../includes/empInfo.jsp?emailId='+emailId, 'tooltip','Info');
}