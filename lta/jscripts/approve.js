function checkDetails () {
	
	frmObj = document.viewallrequest;

	faYear   = frmObj.year.options[frmObj.year.selectedIndex].value;
	
	if ( faYear	==	"0") {

		alert("Please select correct Year");
		frmObj.year.focus();
		return;
	
	}

	month	 = frmObj.month.options[frmObj.month.selectedIndex].value;
	
	if ( month	==	"0") {

		alert("Please select correct month");
		frmObj.month.focus();
		return;

	}
	
	criteria	 = frmObj.criteria.options[frmObj.criteria.selectedIndex].value;

	frmObj.action = "../approver/checkDetails.jsp?faYear="+faYear+"&month="+month+"&criteria="+criteria;

	frmObj.submit();
}

function getMonthlyLtaRecord1()
{
	frmObj = document.viewallrequest;
	var id = frmObj.sapCheck.value;
	var applicationId = frmObj.aapCheck.value;
	var app ="app";

	if(id =="null" && applicationId =="null")
	{ 
		frmObj.action = "../reviewer/excelviewallrequest.jsp?id="+id+"&applicationId="+applicationId;
		frmObj.submit();
	}else if(applicationId !=0)
	{
		frmObj.action = "../reviewer/excelviewallrequest.jsp?applicationId="+applicationId+"&app="+app;
		frmObj.submit();
	}else if(id !=0)
	{
		frmObj.action = "../reviewer/excelviewallrequest.jsp?id="+id;
		frmObj.submit();
	}
}

function getMonthlyLtaRecord()
{
frmObj = document.viewallrequest;
var id = frmObj.sapId.value;
var applicationId = frmObj.applicationId.value;
//alert("id== "+id);
//alert("applicationId== "+applicationId);
if((id == "" && applicationId =="") || (id==0 && applicationId==0))
	{
		alert("Please enter Sap Number or application Id");
	}else if((id!=0 && applicationId!=0)||(id!=0 && applicationId=="0")||(applicationId!=0 && id=="0"))
	{
		alert("Please enter either Sap Number or application id but not both");
	}else{
		if(id == "")
			{
				getApplicationId();
			}

			if(applicationId =="")
				{
				 searchLtaRecord();
				}
}
}
function searchLtaRecord () 
{
	frmObj = document.viewallrequest;
	var id = frmObj.sapId.value;
	if(isNaN(id))
		{
			alert("Please enter numeric value");
			return;
		}
	if(id.indexOf(".")>-1)
		{
			alert("Please enter only Sap number");
			return;
		}
	else if(id=="" || id==null )
		{
			alert("Please enter Sap Number");
			return;
		}
	frmObj.action = "../reviewer/viewallrequest.jsp?id="+id;
	frmObj.submit();
}

function getApplicationId () 
{

	frmObj = document.viewallrequest;
	var applicationId = frmObj.applicationId.value;
	var app ="app";
	if(isNaN(applicationId))
		{
			alert("Please enter numeric value");
			return;
		}
	if(applicationId.indexOf(".")>-1)
		{
			alert("Please enter only Application Id");
			return;
		}
	else if(applicationId=="" || applicationId==null )
		{
			alert("Please enter Application Id");
			return;
		}
	frmObj.action = "../reviewer/viewallrequest.jsp?applicationId="+applicationId+"&app="+app;
	frmObj.submit();
}

function validate(listSize) {

	frmObj = document.frmApproveLta;
	var m = 0;
	breakStat = 0;
	for (i = 0; i < listSize; i++ ){

			expr =  "frmObj.apprRadio"+i+"[1].checked";
			stat  = eval(expr);
			
		
			if(stat){
			
				m = 1;

				expr2 = "frmObj.hrRemarks"+i+".value";
				remark = eval(expr2);

				if((remark == "") || (remark == " " )){

					alert("Please enter a reason for rejection !");
					expr = "frmObj.hrRemarks"+i;
					eval(expr).focus( );
					breakStat = 1;
					break;

				}
			
			} else {
				
				
				expr =  "frmObj.apprRadio"+i+"[0].checked";
				stat  = eval(expr);

				if(stat){
				
					m = 1;
			
				}
			}

		}

	if (m == 0 ) {

		alert("Please Select atleast one record to process");
		return;
	
	}

	if(breakStat == 1){
		
		return;
	
	}
		
	frmObj.action = "../approver/approveSubmit.jsp";

	frmObj.submit();
		
}

function showDetails(empName, compName, sapNumber, deptName) {

	alert("Name: "+empName+ "\n\n" + "Company: "+compName+"\n\n"+"Department: "+deptName+"\n\n"+
		"SAP Number: "+sapNumber);

}


function pendingDetails(applicationId)
{     
	window.open('../processor/showrequestdetails.jsp?applicationId='+applicationId,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,resizable=no,scrollbars=yes,toolbars=no,status=yes,width=1280,height=560,top=20,left=50');
}
function navigateCall()
{

	url = "../processor/pendingforapproval.jsp";
	 window.opener.location.href=url;
	self.close();
}

/*-----------------------------------------------------------------------------------------------------------------------------------*/
function getPendingRecord(){
frmObj = document.annualltacheckstatus;
var year = frmObj.year.value;
//alert("year"+year);

	if((year == "" )||(year==0))
		{
			alert("Please enter year");
			return;
		}

		frmObj.action = "../processor/pendingforapproval.jsp?year="+year;
		frmObj.submit();
}
function getAnnualRecord()
{
frmObj = document.processorviewallrequest;
var id = frmObj.sapId.value;
var applicationId = frmObj.applicationId.value;
var year = frmObj.year.value;
//alert("year"+year);

//alert("id== "+id);
//alert("applicationId== "+applicationId);
if((year == "" )||(year==0))
	{
		alert("Please enter year");
		return;
	}
if((id == "" && applicationId =="") || (id==0 && applicationId==0))
	{
		alert("Please enter SAP Number or application Id");
	}else if((id!=0 && applicationId!=0)||(id!=0 && applicationId=="0")||(applicationId!=0 && id=="0"))
	{
		alert("Please enter either SAP Number or application id but not both");
	}else{
		if(id == "")
			{
			
				getAppId();
			}

			if(applicationId =="")
				{
				alert("here");
				 getSapId();
				}
}
}

function getSapId () 
{
	frmObj = document.processorviewallrequest;
	var id = frmObj.sapId.value;
	if(isNaN(id))
		{
			alert("Please enter numeric value");
			return;
		}
	else if(id=="" || id==null )
		{
			alert("Please enter SAP Number");
			return;
		}
	frmObj.action = "../processor/processorviewallrequest.jsp?id="+id;
	frmObj.submit();
}

function getAppId () 
{
	alert("111");

	frmObj = document.processorviewallrequest;
	var applicationId = frmObj.applicationId.value;
	var app ="app";
	if(isNaN(applicationId))
		{
			alert("Please numeric value");
			return;
		}
	else if(applicationId=="" || applicationId==null )
		{
			alert("Please enter Application Id");
			return;
		}
	frmObj.action = "../processor/processorviewallrequest.jsp?applicationId="+applicationId+"&app="+app;
	frmObj.submit();
}
function getAnnualRecord1()
{
	frmObj = document.processorviewallrequest;
	var id = frmObj.sapCheck.value;
	var applicationId = frmObj.aapCheck.value;
	var app ="app";

	if(id =="null" && applicationId =="null")
	{ 
		frmObj.action = "../processor/excelviewallrequestannual.jsp?id="+id+"&applicationId="+applicationId;
		frmObj.submit();
	}else if(applicationId !=0)
	{
		frmObj.action = "../processor/excelviewallrequestannual.jsp?applicationId="+applicationId+"&app="+app;
		frmObj.submit();
	}else if(id !=0)
	{
		frmObj.action = "../processor/excelviewallrequestannual.jsp?id="+id;
		frmObj.submit();
	}
}

/*-----------------------------------------------------------------------------------------------------------------------------------*/
function getAnnualReviewer()
{
frmObj = document.reviewerviewallrequest;
var id = frmObj.sapId.value;
var applicationId = frmObj.applicationId.value;
//alert("id== "+id);
//alert("applicationId== "+applicationId);
if((id == "" && applicationId =="") || (id==0 && applicationId==0))
	{
		alert("Please enter SAP Number or application Id");
	}else if((id!=0 && applicationId!=0)||(id!=0 && applicationId=="0")||(applicationId!=0 && id=="0"))
	{
		alert("Please enter either SAP Number or application id but not both");
	}else{
		if(id == "")
			{
				getAppIdReviewer();
			}

			if(applicationId =="")
				{
				 getSapIdReviewer();
				}
}
}
function getSapIdReviewer () 
{
	frmObj = document.reviewerviewallrequest;
	var id = frmObj.sapId.value;
	if(isNaN(id))
		{
			alert("Please numeric value");
			return;
		}
	else if(id=="" || id==null )
		{
			alert("Please enter SAP Number");
			return;
		}
	frmObj.action = "../reviewer/reviewerviewallrequest.jsp?id="+id;
	frmObj.submit();
}

function getAppIdReviewer () 
{
	frmObj = document.reviewerviewallrequest;
	var applicationId = frmObj.applicationId.value;
	var app ="app";
	if(isNaN(applicationId))
		{
			alert("Please numeric value");
			return;
		}
	else if(applicationId=="" || applicationId==null )
		{
			alert("Please enter Application Id");
			return;
		}
	frmObj.action = "../reviewer/reviewerviewallrequest.jsp?applicationId="+applicationId+"&app="+app;
	frmObj.submit();
}

function getAnnualReviewer1()
{
	frmObj = document.reviewerviewallrequest;
	var id = frmObj.sapCheck.value;
	var applicationId = frmObj.aapCheck.value;
	var app ="app";

	if(id =="null" && applicationId =="null")
	{ 
		frmObj.action = "../reviewer/excelviewallrequestannual.jsp?id="+id+"&applicationId="+applicationId;
		frmObj.submit();
	}else if(applicationId !=0)
	{
		frmObj.action = "../reviewer/excelviewallrequestannual.jsp?applicationId="+applicationId+"&app="+app;
		frmObj.submit();
	}else if(id !=0)
	{
		frmObj.action = "../reviewer/excelviewallrequestannual.jsp?id="+id;
		frmObj.submit();
	}
}


function processAction(status)
{


var remarks ="";
	remarks = document.annualltashowrequest.rejectremarks.value;
   //alert(approvedamount);
		remarks = remarks.replace(/^\s+|\s+$/g,'');

if(status == 'R'){
		if(remarks=='')
		{	
			alert("Please enter reject remarks");
			return;
		}else{
			document.annualltashowrequest.rejectremarks.value=remarks;

			document.annualltashowrequest.action = "../processor/submitapprove.jsp?status="+status;
			document.annualltashowrequest.submit();
		}
	}else if(status == 'A'){

			remarks=="NA";
		if(document.annualltashowrequest.approvedamount.value.length==0){
					alert("Please enter approved amount");
				return;

			}else if(document.annualltashowrequest.approvedamount.value.length>0){
				if(isNaN(document.annualltashowrequest.approvedamount.value))
				{
					document.annualltashowrequest.approvedamount.focus();
					alert("Please enter numeric value");
					return;
				}
			}

var amount ="";
var approvedamount ="";

	amount			= document.annualltashowrequest.fixltaamount.value;
	approvedamount	= document.annualltashowrequest.approvedamount.value;
 
	/*if(parseInt(approvedamount) > parseInt(amount))
	//if(approvedamount > amount)
		{
			document.annualltashowrequest.approvedamount.focus();
			alert("Approved amount cannot be greater than the LTA Amount");
			return;
		}*/

			document.annualltashowrequest.action = "../processor/submitapprove.jsp?status="+status;
			document.annualltashowrequest.submit();
		}
}

function negValCheck()
{

	if(isNaN(document.annualltashowrequest.approvedamount.value))
	{
		document.annualltashowrequest.approvedamount.focus();
		alert("Please enter numeric value");
		return;
	}

}

function exemValCheck(exemption)
{
	
	frmObj					= document.annualltashowrequest;
	//alert(exemption);
	var value = document.annualltashowrequest.approvedamount.value;
	if (exemption=="YPB")
	{
		exempted = ((value)/3).toFixed();
	}else if (exemption=="YTB"){
		exempted = value;
	}
	
	
	document.getElementById("exemptedamount").value=exempted;


}

function approveAmtChk()
{
var amount ="";
var approvedamount ="";

	amount			= document.annualltashowrequest.amount.value;
	approvedamount	= document.annualltashowrequest.approvedamount.value;

	if(parseInt(approvedamount)>parseInt(amount))
		{
			document.annualltashowrequest.approvedamount.focus();
			alert("Approved amount cannot be greater than the Bill Amount");
			return;
		}
}