// Price Approval

var flag  = 0;
var flagR = 0; 
var SD1   = 1;
var SD2   = 1;
var AP11  = 1;
var AP12  = 1;
var AP13  = 1;
var AP21  = 1;
var AP22  = 1;
var AP23  = 1;
var AP31  = 1;
var AP32  = 1;
var AP33  = 1;
var AP4   = 1;
var AP5   = 1;
var AP6   = 1;
var AP34  = 1;
var AP7   = 1;

var SD1Remarks  = "No Remarks";
var SD2Remarks  = "No Remarks";
var AP11Remarks = "No Remarks";
var AP12Remarks = "No Remarks";
var AP13Remarks = "No Remarks";
var AP21Remarks = "No Remarks";
var AP22Remarks = "No Remarks";
var AP23Remarks = "No Remarks";
var AP31Remarks = "No Remarks";
var AP32Remarks = "No Remarks";
var AP33Remarks = "No Remarks";
var AP4Remarks  = "No Remarks";
var AP5Remarks  = "No Remarks";
var AP6Remarks  = "No Remarks";


function add(tblId,emailId,NewtblId,tOId)
{
    junk1= "!~+%<>?;`:#$%^&*()=|[]{}\\";
    frmObj= document.priceApproval;
    //value = frmObj.outputText.value;
    //userOId= frmObj.userOId.value;

    // Check Members List for Null
    //frmObj.members.value=value;
	self.opener.document.getElementById(tblId).value    = emailId; 
    self.opener.document.getElementById(NewtblId).value = tOId;
    self.close();
}

function autoFillBalanceBudget()
{
	var error = "";
	var flg   = 0;


		if(document.priceApprovalMain.requestedBy5.value.length>0)
		{
		if(isNaN(document.priceApprovalMain.requestedBy5.value))
		{
			document.priceApprovalMain.requestedBy5.focus();
			error += "Fill Numerics in total budget \n";
		}
		}
		if(document.priceApprovalMain.fqtNumber.value.length>0)
		{	
		if(isNaN(document.priceApprovalMain.fqtNumber.value))
		{
			document.priceApprovalMain.fqtNumber.focus();
			error += "Fill Numerics in committed date \n";
		}
		}
	
	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{
		if(document.priceApprovalMain.fqtNumber.value.length>0 && document.priceApprovalMain.requestedBy5.value.length>0)
		{
		  document.priceApprovalMain.requestedBy6.value = document.priceApprovalMain.requestedBy5.value - document.priceApprovalMain.fqtNumber.value;
		}
	}

}

function negValCheck()
{
	
	//alert(document.priceApprovalMain.category.value);
	
	var error = "";
	var flg   = 0;


	if(document.priceApprovalMain.requestedBy7.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.requestedBy7.value))
		{
				document.priceApprovalMain.requestedBy7.focus();
				error += "Fill only numerics in Negotiated Value \n";
		}//else	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1)
		//{
		//		document.priceApprovalMain.requestedBy7.focus();
		//		error += "Negotiated value cannot be in decimal format";
				//return;
		//}
	}
			
	if(error!="")
	{
		alert(error);
		return;
	}
	
		if(document.priceApprovalMain.requestedBy7.value.length>0 && document.priceApprovalMain.requestedBy7.value <=1999999 && (!(document.priceApprovalMain.company.value ==1033 || document.priceApprovalMain.company.value ==1501 || document.priceApprovalMain.company.value ==1005|| document.priceApprovalMain.company.value ==1006 || document.priceApprovalMain.company.value ==1042  )) )
		{
			//alert("abcccccccccccc");
			
			document.priceApprovalMain.select14.disabled=true;
			document.priceApprovalMain.select16.disabled=true;
			document.priceApprovalMain.select15.disabled=true;
			document.priceApprovalMain.app3.disabled=true;
			//document.priceApprovalMain.app3H.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			//document.priceApprovalMain.app6H.disabled=true;
			document.priceApprovalMain.app9.disabled=true;
			//document.priceApprovalMain.app9H.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
			//document.priceApprovalMain.app10H.disabled=true;
			//document.priceApprovalMain.app11.disabled=true;
			//document.priceApprovalMain.app11H.disabled=true;
			//document.priceApprovalMain.app12.disabled=true;
			//document.priceApprovalMain.app12H.disabled=true;
			//document.priceApprovalMain.apprChk.value="0";
			//alert(document.priceApprovalMain.apprChk.value);
		}
		else
		{
		    if(!(document.priceApprovalMain.company.value ==1033))	
		    {
			document.priceApprovalMain.select14.disabled=false;
			
			//alert(document.priceApprovalMain.category.value);
			
			if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "Projects" || document.priceApprovalMain.category.value == "IT buying")){
				document.priceApprovalMain.app3.disabled=false;			
				document.priceApprovalMain.app6.disabled=false;			
				document.priceApprovalMain.app9.disabled=false;			
				document.priceApprovalMain.app10.disabled=false;			
				document.priceApprovalMain.app11.disabled=false;			
				document.priceApprovalMain.app12.disabled=false;		
				document.priceApprovalMain.select16.disabled=false;
				document.priceApprovalMain.select15.disabled=false;

			}else if(document.priceApprovalMain.company.value == 1501 || document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006){
				document.priceApprovalMain.app9.disabled=false;

			}else if(document.priceApprovalMain.company.value == 1042 ){
				//alert("hiii");
				document.priceApprovalMain.app9.disabled=false;
				document.priceApprovalMain.app10.disabled=false;

			}else {

				document.priceApprovalMain.app3.disabled=false;			
				document.priceApprovalMain.app6.disabled=false;			
				document.priceApprovalMain.app9.disabled=false;			
				document.priceApprovalMain.app10.disabled=false;			
				document.priceApprovalMain.app11.disabled=false;			
				document.priceApprovalMain.app12.disabled=false;		
				document.priceApprovalMain.select16.disabled=false;
				document.priceApprovalMain.select15.disabled=false;
			
			}
		   }

		}
	

}


function showDetails(groupId){
loadFragment('includes/viewMembers.jsp?groupId='+groupId,'viewMembers','Members');
}

function addNew(groupId,size){
    junk1= "!~+%<>?;`:#$%^&*()=|[]{}\\";
    frmObj= document.priceApproval;
    value= frmObj.outputText.value;

    // Check Members List for Null
    stat = checkNull("Members List", value);

    if(!stat){
        frmObj.outputText.focus();
        return;
    }

   // Check Members List for Junk
    stat = checkJunk("Members List",  value ,junk1);
    if(!stat){
        frmObj.outputText.focus( );
        return;
    }
    
    //create this function
    String.prototype.count=function(s1) { 
        return (this.length - this.replace(new RegExp(s1,"g"), '').length) / s1.length;
    }

    numberOfCommas = value.count(',');

    size+=numberOfCommas;
    if(size > 500){
        alert("You have exceeded the size limit(250) \n Please remove some members from List !!");
        frmObj.outputText.focus( );
        return;
    }

    frmObj.action="../requestor/addMembersSubmit.jsp?groupId="+groupId;
	frmObj.submit( );

}
/*
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
*/
function loadFragment(fragment_url, element_id, for_what) {
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
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	//$("#"+element_id).html(processingRequest);
	element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
				 
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				//$("#"+element_id).html(message);
				element.innerHTML = message;
			}
		}
		xmlhttp.send(null);
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
	}
}

function validateNumericData(elementId, elementValue)
{
/*	var spclChars = "!@#$%^'\"&*{}[]()\\/<>-+`~?:;=."; 

	var i = 0;
	
	while(i < elementValue.length)
	{
		if (spclChars.indexOf(elementValue.charAt(i)) != -1) 
		{
			var character = elementValue.charAt(i);
			elementValue = elementValue.replace(character,'');
			document.getElementById(elementId).value = elementValue;
			i=0;
		}
		else if(isNaN(elementValue.charAt(i)))
		{
			var character = elementValue.charAt(i);
			elementValue = elementValue.replace(character,'');
			document.getElementById(elementId).value = elementValue;
			i=0;
		}
		else
		{
			i++;
		}
}
*/	
	counter					=	document.priceApprovalMain.count.value;
	for(i = 1; i<=counter; i++)
	{

		ii = eval("document.priceApprovalMain.i"+i);
		ff = eval("document.priceApprovalMain.f"+i);
		//iival = ii.value;
		//alert("ii"+ii);

		if(isNaN(ii.value))
		{
				ii.focus();
				alert("Fill only numerics in INITIAL OFFER (Rs)  \n");
		}
		if(isNaN(ff.value))
		{
				ff.focus();
				alert("Fill only numerics in FINAL OFFER (Rs) \n");
		}
	}

			if(isNaN(document.priceApprovalMain.fromDateAir1.value))
		{
				document.priceApprovalMain.fromDateAir1.focus();
				alert( "Fill only numerics in RATE (Rs.) \n");
		}else
		if(isNaN(document.priceApprovalMain.fromDateAir2.value))
		{
				document.priceApprovalMain.fromDateAir2.focus();
				alert("Fill only numerics in RATE (Rs.) \n");
		}else
		if(isNaN(document.priceApprovalMain.fromDateAir3.value))
		{
				document.priceApprovalMain.fromDateAir3.focus();
				alert("Fill only numerics in RATE (Rs.) \n");
		}

}

function validateForm(queryType)
{
	
	
	//alert("queryType....."+queryType);
	var error = "";
	var flag  = 0;
			
	counter					=	document.priceApprovalMain.count.value;
	if(queryType != '2'){
	category				=   document.priceApprovalMain.category.value;
	}
	Negotiation				=	document.priceApprovalMain.requestedBy.value;	
	Product					=	document.priceApprovalMain.requestedBy2.value;
	Meeting_Venue			=	document.priceApprovalMain.reason4.value;
	Indented_User			=	document.priceApprovalMain.requestedBy3.value;
	Negotiated_value		=	document.priceApprovalMain.requestedBy7.value;
	Validity_period			=	document.priceApprovalMain.validity.value;
	Package_Name			=	document.priceApprovalMain.requestedBy4.value;
	Finalized				=	document.priceApprovalMain.requestedBy8.value;
	Total_Budget			=	document.priceApprovalMain.requestedBy5.value;
	Payment_Terms			=	document.priceApprovalMain.reason.value;
	Commited_Till_Date		=	document.priceApprovalMain.fqtNumber.value;
	Savings					=	document.priceApprovalMain.requestedBy9.value;
	Cost_Avoidance			=	document.priceApprovalMain.requestedBy10.value;
	Balance_Budget			=	document.priceApprovalMain.requestedBy6.value;
	
	var categoryVal			= 	document.priceApprovalMain.category.value;
	
	//alert(category);
	if(queryType!='2'){
	if(document.priceApprovalMain.category.value == 0)
	{
		error += "Please Select Category\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.category.focus();
				flag = 1;
			}
	}
}

	if(isEmpty(document.priceApprovalMain.requestedBy.value.length))
	{
		error += "Fill Negotiation/PC meeting date \n";
		if(parseInt(flag)==0)
		{
			document.priceApprovalMain.requestedBy.focus();
			flag = 1;
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy2.value.length))
	{
		error += "Fill Description \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy2.focus();
				flag = 1;
			}
	}


/*	if(isEmpty(document.priceApprovalMain.validity.value.length))
	{
		error += "Fill Validity Period \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.validity.focus();
				flag = 1;
			}
	}*///13-Jan-15

	if(isEmpty(document.priceApprovalMain.reason4.value.length))
	{
		error += "Fill Negotiation/PC meeting venue \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.reason4.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy3.value.length))
	{
		error += "Fill Intended User/ User group \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy3.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy7.value.length))
	{
		error += "Fill Negotiated Value \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy7.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy7.value))
		{
			document.priceApprovalMain.requestedBy7.focus();
			error += "Fill Numerics in Negotiated Value \n";
		}
		if(document.priceApprovalMain.requestedBy7.value>2147483000)
		{
			document.priceApprovalMain.requestedBy7.focus();
			error += "Negotiated Value is allowed only upto Rs.2147483000 \n";
		}
	}
	/*if(isEmpty(document.priceApprovalMain.requestedBy4.value.length))
	{
		error += "Fill Package \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy4.focus();
				flag = 1;
			}
	}*/
	if(isEmpty(document.priceApprovalMain.requestedBy8.value.length))
	{
		error += "Fill Finalized vendor(s) name \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy8.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy5.value.length))
	{
		error += "Fill Total Budget (Rs.) / Sanction \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy5.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy5.value))
		{
			document.priceApprovalMain.requestedBy5.focus();
			error += "Fill Numerics in total budget \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.reason.value.length))
	{
		error += "Fill Payment Terms \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.reason.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.fqtNumber.value.length))
	{
		error += "Fill PO's Commited till date \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.fqtNumber.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.fqtNumber.value))
		{
			document.priceApprovalMain.fqtNumber.focus();
			error += "Fill Numerics in committed date \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy9.value.length))
	{
		error += "Fill Hard Savings \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy9.focus();
				flag = 1;
			}
	}
	else
	{//alert("vg");
		if(isNaN(document.priceApprovalMain.requestedBy9.value))
		{
			document.priceApprovalMain.requestedBy9.focus();
			error += "Fill Numerics in Hard Savings \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy10.value.length))
	{
		error += "Fill Cost Avoidance \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy10.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy10.value))
		{
			document.priceApprovalMain.requestedBy10.focus();
			error += "Fill Numerics in Cost Avoidance \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy6.value.length))
	{
		error += "Fill balance budget \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy6.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy6.value))
		{
			document.priceApprovalMain.requestedBy6.focus();
			error += "Fill Numerics in balance budget \n";
		}
	}

	if((document.priceApprovalMain.reason1.value=="NA" || isEmpty(document.priceApprovalMain.attach1.value.length)) &&
		(document.priceApprovalMain.reason2.value=="NA" || isEmpty(document.priceApprovalMain.attach2.value.length))&&
		(document.priceApprovalMain.reason3.value=="NA" || isEmpty(document.priceApprovalMain.attach3.value.length))&&
		(document.priceApprovalMain.reason44.value=="NA" || isEmpty(document.priceApprovalMain.attach4.value.length))&&
		(document.priceApprovalMain.reason5.value=="NA" || isEmpty(document.priceApprovalMain.attach5.value.length))&&
		(document.priceApprovalMain.reason6.value=="NA" || isEmpty(document.priceApprovalMain.attach6.value.length))&&
		(document.priceApprovalMain.reason7.value=="NA" || isEmpty(document.priceApprovalMain.attach7.value.length))&&
		(document.priceApprovalMain.reason8.value=="NA" || isEmpty(document.priceApprovalMain.attach8.value.length))&&
		(document.priceApprovalMain.reason9.value=="NA" || isEmpty(document.priceApprovalMain.attach9.value.length))&&
		(document.priceApprovalMain.reason10.value=="NA" || isEmpty(document.priceApprovalMain.attach10.value.length)))
	{
		
	if(document.priceApprovalMain.reason1.value=="NA"){
		error += "Please select description\n ";
				if(parseInt(flag)==0)
				{
					document.priceApprovalMain.reason1.focus();
					flag = 1;
				}
	}
	if(isEmpty(document.priceApprovalMain.attach1.value.length)){
		error += "Please select attachment file\n ";
				if(parseInt(flag)==0)
				{
					document.priceApprovalMain.attach1.focus();
					flag = 1;
				}
	}
		//error += "Please select atleast one attachment \n ";
		//document.priceApprovalMain.reason1.focus();
		//document.priceApprovalMain.attach1.focus();
		//error += "Please select atleast one description and attachment file\n ";
	}

// Auto Background

for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if(iival.length==0)
		{
			ii.value = "0";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.length==0)
		{
			f.value = "0";
		}

		d = eval("document.priceApprovalMain.d"+i);
		dval = d.value;

		if(dval.length==0)
		{
			d.value = "NA";
		}

		//w = eval("document.priceApprovalMain.w"+i);
		//wval = w.value;

		//if(wval.length==0)
		//{
		//	w.value = "NA";
		//}
		
		pt = eval("document.priceApprovalMain.pt"+i);
		ptval = pt.value;

		if(ptval.length==0)
		{
			pt.value = "NA";
		}
		
		va = eval("document.priceApprovalMain.va"+i);
		vaval = va.value;

		if(vaval.length==0)
		{
			va.value = "NA";
		}

	}

        if(isEmpty(document.priceApprovalMain.req.value.length))
		{
			document.priceApprovalMain.req.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.recommendation.value.length))
		{
			document.priceApprovalMain.recommendation.value = "NA";
		}

// Attachments
//alert(document.priceApprovalMain.attach1New.value);
		/*if(isEmpty(document.priceApprovalMain.reason1.value.length))
		{
			document.priceApprovalMain.reason1.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach1.value.length))
		{
			document.priceApprovalMain.attach1.value = "NA";
			document.priceApprovalMain.attach1New.value = "NA.NA_NA";
		}*/
		if(isEmpty(document.priceApprovalMain.reason14.value.length))
		{
			document.priceApprovalMain.reason14.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir1.value.length))
		{
			document.priceApprovalMain.fromDateAir1.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.UOM1.value.length))
		{
			document.priceApprovalMain.UOM1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem1.value.length))
		{
			document.priceApprovalMain.rem1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM2.value.length))
		{
			document.priceApprovalMain.UOM2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem2.value.length))
		{
			document.priceApprovalMain.rem2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM3.value.length))
		{
			document.priceApprovalMain.UOM3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem3.value.length))
		{
			document.priceApprovalMain.rem3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName1.value.length))
		{
			document.priceApprovalMain.compName1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName2.value.length))
		{
			document.priceApprovalMain.compName2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName3.value.length))
		{
			document.priceApprovalMain.compName3.value = "NA";
		}
		/*if(isEmpty(document.priceApprovalMain.fromDateAir4.value.length))
		{
			document.priceApprovalMain.fromDateAir4.value = "NA";
		}*/


		if(isEmpty(document.priceApprovalMain.reason2.value.length))
		{
			document.priceApprovalMain.reason2.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach2.value.length))
		{
			document.priceApprovalMain.attach2.value = "NA";
			document.priceApprovalMain.attach2New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason15.value.length))
		{
			document.priceApprovalMain.reason15.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir2.value.length))
		{
			document.priceApprovalMain.fromDateAir2.value = 0;
		}
		/*if(isEmpty(document.priceApprovalMain.fromDateAir8.value.length))
		{
			document.priceApprovalMain.fromDateAir8.value = "NA";
		}*/

		if(isEmpty(document.priceApprovalMain.reason3.value.length))
		{
			document.priceApprovalMain.reason3.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach3.value.length))
		{
			document.priceApprovalMain.attach3.value = "NA";
			document.priceApprovalMain.attach3New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason44.value.length))
		{
			document.priceApprovalMain.reason44.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach4.value.length))
		{
			document.priceApprovalMain.attach4.value = "NA";
			document.priceApprovalMain.attach4New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason5.value.length))
		{
			document.priceApprovalMain.reason5.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach5.value.length))
		{
			document.priceApprovalMain.attach5.value = "NA";
			document.priceApprovalMain.attach5New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason6.value.length))
		{
			document.priceApprovalMain.reason6.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach6.value.length))
		{
			document.priceApprovalMain.attach6.value = "NA";
			document.priceApprovalMain.attach6New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason7.value.length))
		{
			document.priceApprovalMain.reason7.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach7.value.length))
		{
			document.priceApprovalMain.attach7.value = "NA";
			document.priceApprovalMain.attach7New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason8.value.length))
		{
			document.priceApprovalMain.reason8.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach8.value.length))
		{
			document.priceApprovalMain.attach8.value = "NA";
			document.priceApprovalMain.attach8New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason9.value.length))
		{
			document.priceApprovalMain.reason9.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach9.value.length))
		{
			document.priceApprovalMain.attach9.value = "NA";
			document.priceApprovalMain.attach9New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason10.value.length))
		{
			document.priceApprovalMain.reason10.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach10.value.length))
		{
			document.priceApprovalMain.attach10.value = "NA";
			document.priceApprovalMain.attach10New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason16.value.length))
		{
			document.priceApprovalMain.reason16.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir3.value.length))
		{
			document.priceApprovalMain.fromDateAir3.value = 0;
		}



		/*validation for blank spaces */

    if (document.priceApprovalMain.requestedBy7.value.match(/\s/g,"")) {
		
		document.priceApprovalMain.requestedBy7.focus();
        error +="Blank spaces are not allowed in Negotiated value \n";
    }
	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiated value cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy5.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy5.focus();
        error +="Blank spaces are not allowed in Total Budget \n";
    }
	if(document.priceApprovalMain.requestedBy5.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy5.focus();
		error += "Total Budget cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fqtNumber.value.match(/\s/g,"")) {

		document.priceApprovalMain.fqtNumber.focus();
        error +="Blank spaces are not allowed in PO's Commited till date \n";
    }
	if(document.priceApprovalMain.fqtNumber.value.indexOf(".")>-1){

		document.priceApprovalMain.fqtNumber.focus();
		error += "PO's Commited till date cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy9.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy9.focus();
        error +="Blank spaces are not allowed in Hard Savings \n";

    }
	if(document.priceApprovalMain.requestedBy9.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy9.focus();
		error += "Hard Savings cannot be in decimal format \n";

    }
    if (document.priceApprovalMain.requestedBy10.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy10.focus();
        error +="Blank spaces are not allowed in Cost Avoidance \n";
    }
	if(document.priceApprovalMain.requestedBy10.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy10.focus();
		error += "Hard Savings cannot be in decimal format \n";
    }

for(i = 1; i<=counter; i++)
	{
		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if (iival.match(/\s/g,"")) {
			ii.focus();
			error +="Blank spaces are not allowed in Initial Offer \n";
		}
		if (iival.indexOf(".")>-1) {

			ii.focus();
			error += "Initial Offer cannot be in decimal format \n";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.match(/\s/g,""))
		{
			f.focus();
			error +="Blank spaces are not allowed in Final Offer \n";
		}
		if(fval.indexOf(".")>-1)
		{
			f.focus();
			error += "Final Offer cannot be in decimal format \n";
		}
	}
    if (document.priceApprovalMain.fromDateAir1.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir1.focus();
		error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir1.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir1.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir2.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir2.focus();
        error +="Blank spaces are not allowed in Rate \n";
        //return false;
    }
	if(document.priceApprovalMain.fromDateAir2.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir2.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir3.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir3.focus();
        error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir3.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir3.focus();
		error += "Rate cannot be in decimal format \n";
    }

	if(isEmpty(document.priceApprovalMain.company.value ==1033 && (document.priceApprovalMain.app1.value.length 
		&& document.priceApprovalMain.app4.value.length && document.priceApprovalMain.app7.value.length )))
	{				
		error += "Artha Procurement - All level approvers are mandatory\n";	

		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.app1.focus();
				flag = 1;
			}
	}
	
	else if (isEmpty(document.priceApprovalMain.app7.value.length))
	{				
		if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects"))){
			
			error += "Requisitioner 3rd level approver is mandatory\n";	
		}else{
			error += "B&C 3rd level approver is mandatory\n";	
		}

		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.app7.focus();
				flag = 1;
			}
	}

	if (isEmpty(document.priceApprovalMain.app8.value.length))
	{				
		if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects"))){
			error += "HOD 3rd level approver is mandatory\n";	
		}else {
			error += "User 3rd level approver is mandatory\n";
		}

		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.app8.focus();
				flag = 1;
			}
	}


	if((document.priceApprovalMain.company.value == 1033 && ( document.priceApprovalMain.requestedBy7.value > 100000 
		&& document.priceApprovalMain.requestedBy7.value < 500000 && document.priceApprovalMain.select12.value=="0") ))

		
	{
	 				
		error += "Please select CEO/COO Artha\n ";	

		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
	
	
	}

	if((document.priceApprovalMain.company.value == 1033 && (document.priceApprovalMain.requestedBy7.value>= 500000
		&& document.priceApprovalMain.requestedBy7.value < 2500000 ) ))

		
	 {		
		 if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select CEO/COO Artha\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select President Artha\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}
	
	}

	if((document.priceApprovalMain.company.value == 1033 && document.priceApprovalMain.requestedBy7.value>= 2500000
		 && document.priceApprovalMain.select14.value=="0" ))
	
	 {	
		 if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select CEO/COO Artha\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		 if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select President Artha\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}
		/* if(document.priceApprovalMain.select14.value=="0")
			{
			error += "Please select MD Artha\n ";
				document.priceApprovalMain.select14.focus();
				flag = 1;
			}*/
		
	}

	if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (document.priceApprovalMain.requestedBy7.value<= 50000) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} 	
		
		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	} else if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (document.priceApprovalMain.requestedBy7.value<= 50000) && ((document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Supported by Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} 	
		
		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	}

	else if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) && (document.priceApprovalMain.requestedBy7.value> 50000
		&& document.priceApprovalMain.requestedBy7.value <= 500000 ) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		} 
		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	} else if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && ((document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) && (document.priceApprovalMain.requestedBy7.value> 50000
		&& document.priceApprovalMain.requestedBy7.value <= 500000 ) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Supported by Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		} 
		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Group Company CEO\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	}
	else if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) && (document.priceApprovalMain.requestedBy7.value> 500000
		&& document.priceApprovalMain.requestedBy7.value <= 2500000 ) ))
	 {		
		 
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		}

		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select COO – E.P. – Finance\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value=="0")
			{
			error += "Please select value for Budget Team from Commercial Column\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}*/

	}else if(((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && ((document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) && (document.priceApprovalMain.requestedBy7.value> 500000
		&& document.priceApprovalMain.requestedBy7.value <= 2500000 ) ))
	 {		
		 
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Supported by Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		}

		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Group Company CEO\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select COO – E.P. – Finance\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value=="0")
			{
			error += "Please select value for Budget Team from Commercial Column\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}*/

	}
	else if(( (document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) && (document.priceApprovalMain.requestedBy7.value> 2500000) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		} 
		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		 if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select COO – E.P. – Finance\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select14.value=="0")
			{
			error += "Please select MD / CEO\n ";
				document.priceApprovalMain.select14.focus();
		}

		/*if(document.priceApprovalMain.app12.value=="0")
			{
			error += "Please select value for Budget Team from Commercial Column\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}*/
	}else if(( (document.priceApprovalMain.company.value == 1501 ) && (document.priceApprovalMain.requestedBy7.value> 2500000) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		} 
		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		 if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select COO – E.P. – Finance\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select14.value=="0")
			{
			error += "Please select MD / CEO\n ";
				document.priceApprovalMain.select14.focus();
		}

	
	}else if(((document.priceApprovalMain.company.value == 1501 ) && (document.priceApprovalMain.requestedBy7.value<= 50000) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} 	
		
		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	}else if(((document.priceApprovalMain.company.value == 1501 ) && (document.priceApprovalMain.requestedBy7.value> 50000
		&& document.priceApprovalMain.requestedBy7.value <= 500000 ) ))
	 {		
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		} 
		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value ==0){
		
			error += "Please select value for Budget Team from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;
		} */
	}else if(((document.priceApprovalMain.company.value == 1501 ) && (document.priceApprovalMain.requestedBy7.value> 500000
		&& document.priceApprovalMain.requestedBy7.value <= 2500000 ) ))
	 {		
		 
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1 from Commercial Column \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		}

		if(document.priceApprovalMain.select12.value=="0")
			{
			error += "Please select Sr VP Finance\n ";
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
		if(document.priceApprovalMain.select13.value=="0")
			{
			error += "Please select COO – E.P. – Finance\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}

		/*if(document.priceApprovalMain.app12.value=="0")
			{
			error += "Please select value for Budget Team from Commercial Column\n ";
				document.priceApprovalMain.select13.focus();
				flag = 1;
			}*/

	}else if(document.priceApprovalMain.company.value == 1042 ) 
	 {		
		 
		if(document.priceApprovalMain.app9.value ==0){
		
			error += "Please select value for Finance 1. \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		}

		if(document.priceApprovalMain.app10.value ==0){
		
			error += "Please select value for Finance 2. \n";
			document.priceApprovalMain.app9.focus();
			flag = 1;

		}

	}
	
	

	if(document.priceApprovalMain.company.value!=1000 && document.priceApprovalMain.company.value!=1033 && document.priceApprovalMain.company.value!=1501 && document.priceApprovalMain.company.value!=1005 && document.priceApprovalMain.company.value!=1006)	{

	//if(document.priceApprovalMain.requestedBy7.value > 300000 && document.priceApprovalMain.requestedBy7.value < 2000000)//13-01-2015 by sachin mehta
	if(document.priceApprovalMain.requestedBy7.value > 300000)//09-01-2017 by sachin mehta
	{
		if(document.priceApprovalMain.select12.value=="0")	{

				error += "Please select Group Company CEO \n ";
				if(parseInt(flag)==0)
				{
					document.priceApprovalMain.select12.focus();
					flag = 1;
				}
		}else if(document.priceApprovalMain.select13.value=="0")	{
				error += "Please select Director B&C \n ";
				if(parseInt(flag)==0)
				{
					document.priceApprovalMain.select12.focus();
					flag = 1;
				}
			}	
	}
	}

	if(document.priceApprovalMain.company.value==1000 || (categoryVal == "Group Company related buying" || categoryVal == "IT buying" || categoryVal == "Projects"  && (document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006)))	{

	//if(document.priceApprovalMain.select12.value=="0" && document.priceApprovalMain.requestedBy7.value > 300000 && document.priceApprovalMain.requestedBy7.value < 2000000)//13-01-2015 by sachin mehta
	if(document.priceApprovalMain.select12.value=="0" && document.priceApprovalMain.requestedBy7.value > 300000)//09-01-2017 by sachin mehta
	{
		
			error += "Please select Director B&C \n ";
			if(parseInt(flag)==0)
			{
				document.priceApprovalMain.select12.focus();
				flag = 1;
			}
			
	}
	}

	/*if ((document.priceApprovalMain.company.value == 1005) && (document.priceApprovalMain.app9.value ==0 || document.priceApprovalMain.app10.value ==0 ))
	{
		//alert("FFFFFF");
		error += "Please select value for Finance Approvers from Supported By Column \n";
	}*/


if(document.priceApprovalMain.category.value =="Capex")
	{
		//alert("this is capex"+document.priceApprovalMain.company.value);
	if(document.priceApprovalMain.app9.value ==0 && document.priceApprovalMain.app10.value !=0){
		if(document.priceApprovalMain.requestedBy7.value > 50000000){

			error += "Please select value for Finance 1 from Supported By Column \n";
		}	
	}else 	if(document.priceApprovalMain.app9.value !=0 && document.priceApprovalMain.app10.value ==0){
		if(document.priceApprovalMain.requestedBy7.value > 50000000){

			error += "Please select value for Finance 2 from Supported By Column \n";
		}	
	}

}else{
	//alert("this is not capex"+document.priceApprovalMain.company.value);
		//if(( document.priceApprovalMain.company.value != 1033 && document.priceApprovalMain.company.value != 1501 && document.priceApprovalMain.company.value != 1005 && document.priceApprovalMain.company.value != 1006 && document.priceApprovalMain.app3.value ==0 && document.priceApprovalMain.app6.value ==0 ) && (document.priceApprovalMain.app9.value ==0 && document.priceApprovalMain.app10.value ==0 )  && document.priceApprovalMain.requestedBy7.value > 1999999)
		if(( document.priceApprovalMain.company.value != 1033 && document.priceApprovalMain.company.value != 1501 && document.priceApprovalMain.company.value != 1005 && document.priceApprovalMain.company.value != 1006 && document.priceApprovalMain.app3.value ==0 && document.priceApprovalMain.app6.value ==0 ) && (document.priceApprovalMain.app9.value ==0 && document.priceApprovalMain.app10.value ==0 )  && document.priceApprovalMain.requestedBy7.value > 4999999)
	{
			//alert("gkdj");
		error += "Please select value for either Finance or MAS from Supported By Column \n";
	}
 if(document.priceApprovalMain.app3.value !=0 && document.priceApprovalMain.app6.value ==0){
	error += "Please select value for MAS 2 from Supported By Column \n";
	}
	if(document.priceApprovalMain.app9.value ==0 && document.priceApprovalMain.app10.value !=0){
		if(document.priceApprovalMain.requestedBy7.value > 50000000){

			error += "Please select value for Finance 1 from Supported By Column \n";
		}	
	}else 	if(document.priceApprovalMain.app9.value !=0 && document.priceApprovalMain.app10.value ==0){
		if(document.priceApprovalMain.requestedBy7.value > 50000000){

			error += "Please select value for Finance 2 from Supported By Column \n";
		}	
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

	/* This is for first theree column senctionedtype, ref number and approvals date*/
	/* Start here*/
	var sanctionedRefType		= document.getElementById('sanctionedRefType').value;
	var refNumber				= document.getElementById('refNumber').value;
	var dateOfApproval			= document.getElementById('dateOfApproval').value;
	var company					= document.getElementById('company').value;
	
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
		document.priceApprovalMain.refNumber.focus();
		flag = 1;
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



	if(!document.priceApprovalMain.app2.value == "" || !document.priceApprovalMain.app5.value == "" || !document.priceApprovalMain.app8.value == ""){

    //alert("payrollTypeStr = "+payrollTypeStr);

	//if(queryType==1)
	//{	
		
		if(payrollTypeStr!="")
			{
				if(payrollTypeStr.length >= 4){
				
					//alert(payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length));

					if((payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length)) != "ADIR" && (payrollTypeStr.substring(payrollTypeStr.length - 4, payrollTypeStr.length)) != "NANA"){				
						//error += "Please ensure that last approver at the User Level is a Director\n";
						error += "Please ensure that last approver at the User Level is a Director / Highest level of approval authority\n";
						document.priceApprovalMain.app2.focus();
						flag = 1;
					}
				}else{
					//error += "Please ensure that last approver at the User Level is a Director\n";
					error += "Please ensure that last approver at the User Level is a Director / Highest level of approval authority\n";
					document.priceApprovalMain.app2.focus();
					flag = 1;
				}
			}
	//}
	}
//alert("payrollTypeStr= "+payrollTypeStr);
		if(document.priceApprovalMain.company.value==1000 || (categoryVal == "Group Company related buying" || categoryVal == "IT buying" || categoryVal == "Projects"  && ( document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006))){

			if(document.priceApprovalMain.select12.value==0 && document.priceApprovalMain.select13.value!=0)
				{
					error += "Please ensure that Director B&C is selected\n";
					if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select12.focus();
							flag = 1;
						}

				}else if(document.priceApprovalMain.select13.value==0 && document.priceApprovalMain.select15.value!=0){

					error += "Please ensure that EP Supply Chain is selected\n";
					if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select13.focus();
							flag = 1;
						}
				}else if(document.priceApprovalMain.select14.value==0 && document.priceApprovalMain.select15.value!=0){

						//error += "Please ensure that COO is selected\n";
						if(parseInt(flag)==0)
						{
						//	document.priceApprovalMain.select14.focus();
						//	flag = 1;
						}
				}else if(document.priceApprovalMain.select15.value==0 && document.priceApprovalMain.select16.value!=0){

						error += "Please ensure that CEO is selected\n";
						if(parseInt(flag)==0)
						{
							document.priceApprovalMain.select15.focus();
							flag = 1;
						}
				}
		}else{
			if( document.priceApprovalMain.company.value !=1033 && document.priceApprovalMain.company.value != 1501 && document.priceApprovalMain.company.value != 1005 && document.priceApprovalMain.company.value != 1006 && document.priceApprovalMain.select12.value==0 &&  document.priceApprovalMain.select13.value!=0)
				{
					error += "Please ensure that Group Company CEO selected\n";
					if(parseInt(flag)==0)
					{
						document.priceApprovalMain.select12.focus();
						flag = 1;
					}
				}
		}
	/* end here*/
			var recommendation = document.priceApprovalMain.recommendation.value;
			var req = document.priceApprovalMain.req.value;

			recommendation = recommendation.replace(/^\s+|\s+$/g,'');
			req = req.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.recommendation.value= recommendation;
		document.priceApprovalMain.req.value= req;

 if(!(document.priceApprovalMain.company.value ==1033))
	{
		if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) ) {
			document.priceApprovalMain.app9.disabled=false;

		}else {

			document.priceApprovalMain.app3.disabled=false;
			document.priceApprovalMain.app6.disabled=false;
			document.priceApprovalMain.app9.disabled=false;
			document.priceApprovalMain.app10.disabled=false;
		}
	}

	if(error!="")
	{
		alert(error);
		return;
	}
	else
	{      
		document.priceApprovalMain.submitForm.disabled = true;  
        document.priceApprovalMain.submitForm.value = 'Please Wait...';  

		  
		 if(queryType==1)

		{	
			//alert("Abhi..........");
			if(document.priceApprovalMain.requestedBy7.value >= 50000000)
			{				
				if((!(document.priceApprovalMain.company.value ==1033 || ((document.priceApprovalMain.company.value ==1005 || document.priceApprovalMain.company.value ==1006)  && (!(document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects"))))))	
	   		       {
					document.priceApprovalMain.app6.disabled=false;
					document.priceApprovalMain.app10.disabled=false;
					//document.priceApprovalMain.select15.disabled=false;
			       }
			}
			document.priceApprovalMain.action = "common/insertDataSubmit.jsp";
			document.priceApprovalMain.submit();
		}
		else
		{
			//alert("Done By Abhi.");
			var priceid = document.priceApprovalMain.priceid.value;
			if(document.priceApprovalMain.requestedBy7.value >= 50000000)
			{
				document.priceApprovalMain.app6.disabled=false;
				document.priceApprovalMain.app10.disabled=false;
			}

			//alert("priceid--"+document.priceApprovalMain.app2.value);
			document.priceApprovalMain.action = "common/updateDataSubmit.jsp?priceid="+priceid;
			document.priceApprovalMain.submit();
		}
	}
}

function savedraft(){
		var error = "";
		var frmObj = document.priceApprovalMain;
		var select12 = frmObj.select12.value;

	counter					=	document.priceApprovalMain.count.value;
		
	/*if(document.priceApprovalMain.requestedBy7.value==0)
		{
			document.priceApprovalMain.requestedBy7.focus();
			alert( "Fill Numerics in N Value \n");
			return;
		}*/
		//alert(document.priceApprovalMain.requestedBy7.value);

		if(document.priceApprovalMain.category.value == 0)
	{
		alert( "Please Select Category \n");
		return;
	}
  for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if(iival.length==0)
		{
			ii.value = "0";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.length==0)
		{
			f.value = "0";
		}

		d = eval("document.priceApprovalMain.d"+i);
		dval = d.value;

		if(dval.length==0)
		{
			d.value = "NA";
		}

		//w = eval("document.priceApprovalMain.w"+i);
		//wval = w.value;

		//if(wval.length==0)
		//{
		//	w.value = "NA";
		//}
		
		pt = eval("document.priceApprovalMain.pt"+i);
		ptval = pt.value;

		if(ptval.length==0)
		{
			pt.value = "NA";
		}
		
		va = eval("document.priceApprovalMain.va"+i);
		vaval = va.value;

		if(vaval.length==0)
		{
			va.value = "NA";
		}

	}
   if(isEmpty(document.priceApprovalMain.req.value.length))
		{
			document.priceApprovalMain.req.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.recommendation.value.length))
		{
			document.priceApprovalMain.recommendation.value = "NA";
		}

// Attachments

		if(isEmpty(document.priceApprovalMain.reason1.value.length))
		{
			document.priceApprovalMain.reason1.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach1.value.length))
		{
			document.priceApprovalMain.attach1.value = "NA";
			document.priceApprovalMain.attach1New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason14.value.length))
		{
			document.priceApprovalMain.reason14.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir1.value.length))
		{
			document.priceApprovalMain.fromDateAir1.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.UOM1.value.length))
		{
			document.priceApprovalMain.UOM1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem1.value.length))
		{
			document.priceApprovalMain.rem1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM2.value.length))
		{
			document.priceApprovalMain.UOM2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem2.value.length))
		{
			document.priceApprovalMain.rem2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM3.value.length))
		{
			document.priceApprovalMain.UOM3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem3.value.length))
		{
			document.priceApprovalMain.rem3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName1.value.length))
		{
			document.priceApprovalMain.compName1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName2.value.length))
		{
			document.priceApprovalMain.compName2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName3.value.length))
		{
			document.priceApprovalMain.compName3.value = "NA";
		}
		/*if(isEmpty(document.priceApprovalMain.fromDateAir4.value.length))
		{
			document.priceApprovalMain.fromDateAir4.value = "NA";
		}*/


		if(isEmpty(document.priceApprovalMain.reason2.value.length))
		{
			document.priceApprovalMain.reason2.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach2.value.length))
		{
			document.priceApprovalMain.attach2.value = "NA";
			document.priceApprovalMain.attach2New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason15.value.length))
		{
			document.priceApprovalMain.reason15.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir2.value.length))
		{
			document.priceApprovalMain.fromDateAir2.value = 0;
		}
		/*if(isEmpty(document.priceApprovalMain.fromDateAir8.value.length))
		{
			document.priceApprovalMain.fromDateAir8.value = "NA";
		}*/

		if(isEmpty(document.priceApprovalMain.reason3.value.length))
		{
			document.priceApprovalMain.reason3.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach3.value.length))
		{
			document.priceApprovalMain.attach3.value = "NA";
			document.priceApprovalMain.attach3New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason44.value.length))
		{
			document.priceApprovalMain.reason44.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach4.value.length))
		{
			document.priceApprovalMain.attach4.value = "NA";
			document.priceApprovalMain.attach4New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason5.value.length))
		{
			document.priceApprovalMain.reason5.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach5.value.length))
		{
			document.priceApprovalMain.attach5.value = "NA";
			document.priceApprovalMain.attach5New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason6.value.length))
		{
			document.priceApprovalMain.reason6.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach6.value.length))
		{
			document.priceApprovalMain.attach6.value = "NA";
			document.priceApprovalMain.attach6New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason7.value.length))
		{
			document.priceApprovalMain.reason7.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach7.value.length))
		{
			document.priceApprovalMain.attach7.value = "NA";
			document.priceApprovalMain.attach7New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason8.value.length))
		{
			document.priceApprovalMain.reason8.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach8.value.length))
		{
			document.priceApprovalMain.attach8.value = "NA";
			document.priceApprovalMain.attach8New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason9.value.length))
		{
			document.priceApprovalMain.reason9.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach9.value.length))
		{
			document.priceApprovalMain.attach9.value = "NA";
			document.priceApprovalMain.attach9New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason10.value.length))
		{
			document.priceApprovalMain.reason10.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach10.value.length))
		{
			document.priceApprovalMain.attach10.value = "NA";
			document.priceApprovalMain.attach10New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason16.value.length))
		{
			document.priceApprovalMain.reason16.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir3.value.length))
		{
			document.priceApprovalMain.fromDateAir3.value = 0;
		}
		/*validation for blank spaces */

    if (document.priceApprovalMain.requestedBy7.value.match(/\s/g,"")) {
		
		document.priceApprovalMain.requestedBy7.focus();
        error +="Blank spaces are not allowed in Negotiated value \n";
    }
	if(document.priceApprovalMain.requestedBy7.value>2147483000)
	{
		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiation Value is allowed only upto Rs.2147483000 \n";
	}
	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiated value cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy5.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy5.focus();
        error +="Blank spaces are not allowed in Total Budget \n";
    }
	if(document.priceApprovalMain.requestedBy5.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy5.focus();
		error += "Total Budget cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fqtNumber.value.match(/\s/g,"")) {

		document.priceApprovalMain.fqtNumber.focus();
        error +="Blank spaces are not allowed in PO's Commited till date \n";
    }
	if(document.priceApprovalMain.fqtNumber.value.indexOf(".")>-1){

		document.priceApprovalMain.fqtNumber.focus();
		error += "PO's Commited till date cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy9.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy9.focus();
        error +="Blank spaces are not allowed in Hard Savings \n";

    }
	if(document.priceApprovalMain.requestedBy9.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy9.focus();
		error += "Hard Savings cannot be in decimal format \n";

    }
    if (document.priceApprovalMain.requestedBy10.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy10.focus();
        error +="Blank spaces are not allowed in Cost Avoidance \n";
    }
	if(document.priceApprovalMain.requestedBy10.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy10.focus();
		error += "Hard Savings cannot be in decimal format \n";
    }

for(i = 1; i<=counter; i++)
	{
		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if (iival.match(/\s/g,"")) {
			ii.focus();
			error +="Blank spaces are not allowed in Initial Offer \n";
		}
		if (iival.indexOf(".")>-1) {

			ii.focus();
			error += "Initial Offer cannot be in decimal format \n";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.match(/\s/g,""))
		{
			f.focus();
			error +="Blank spaces are not allowed in Final Offer \n";
		}
		if(fval.indexOf(".")>-1)
		{
			f.focus();
			error += "Final Offer cannot be in decimal format \n";
		}
	}
    if (document.priceApprovalMain.fromDateAir1.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir1.focus();
		error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir1.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir1.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir2.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir2.focus();
        error +="Blank spaces are not allowed in Rate \n";
        //return false;
    }
	if(document.priceApprovalMain.fromDateAir2.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir2.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir3.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir3.focus();
        error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir3.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir3.focus();
		error += "Rate cannot be in decimal format \n";
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
 	if(isEmpty(document.priceApprovalMain.requestedBy.value.length))
		{
			document.priceApprovalMain.requestedBy.value = "";
		}	
 	if(isEmpty(document.priceApprovalMain.requestedBy4.value.length))
		{
			document.priceApprovalMain.requestedBy4.value = "";
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
	if(error!="")
	{
		alert(error);
		return;
	}else{ 	
	//alert("hello----"+document.priceApprovalMain.app1H.value);
	if(document.priceApprovalMain.requestedBy7.value >= 50000000)
	{
		document.priceApprovalMain.app6.disabled=false;
		document.priceApprovalMain.app10.disabled=false;
	}

		var recommendation = document.priceApprovalMain.recommendation.value;
		var req = document.priceApprovalMain.req.value;

			recommendation = recommendation.replace(/^\s+|\s+$/g,'');
			req = req.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.recommendation.value= recommendation;
		document.priceApprovalMain.req.value= req;

			document.priceApprovalMain.savedraft1.disabled = true;  
        document.priceApprovalMain.savedraft1.value = 'Please wait..';  
		//alert("hello----"+document.priceApprovalMain.app9.value);
	frmObj.action="common/saveDraftSubmit.jsp";
	frmObj.submit();
	}
}

function negValCheck1()
{
	//alert("hiii");
	var error = "";
	var flg   = 0;


	if(document.priceApprovalMain.requestedBy7.value.length>0)
	{
		if(isNaN(document.priceApprovalMain.requestedBy7.value))
		{
				document.priceApprovalMain.requestedBy7.focus();
				error += "Fill only numerics in Negotiated Value \n";
		}
		/*else	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1)
		{
				document.priceApprovalMain.requestedBy7.focus();
				error += "Negotiated value cannot be in decimal format";
				//return;
		}*/
	}	
	if(error!="")
	{
		alert(error);
		return;
	}

		if(document.priceApprovalMain.requestedBy7.value.length>0 && document.priceApprovalMain.requestedBy7.value <=1999999 && (!(document.priceApprovalMain.company.value ==1033 || document.priceApprovalMain.company.value ==1501 || document.priceApprovalMain.company.value ==1005 || document.priceApprovalMain.company.value ==1006 || document.priceApprovalMain.company.value ==1042 )) )
		{
			//alert("hiii");
			
			document.priceApprovalMain.select14.disabled=true;
			document.priceApprovalMain.select16.disabled=true;
			document.priceApprovalMain.select15.disabled=true;
			document.priceApprovalMain.app3.disabled=true;
			//document.priceApprovalMain.app3H.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			//document.priceApprovalMain.app6H.disabled=true;
			document.priceApprovalMain.app9.disabled=true;
			//document.priceApprovalMain.app9H.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
			//document.priceApprovalMain.app10H.disabled=true;
			//document.priceApprovalMain.app11.disabled=true;
			//document.priceApprovalMain.app11H.disabled=true;
			//document.priceApprovalMain.app12.disabled=true;
			//document.priceApprovalMain.app12H.disabled=true;
			//document.priceApprovalMain.apprChk.value="0";
			//alert(document.priceApprovalMain.apprChk.value);
		}
		else
		{
			if(!(document.priceApprovalMain.company.value ==1033))	
		      {

			document.priceApprovalMain.select14.disabled=false;
			
			
			if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && (document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects" )){
				document.priceApprovalMain.app3.disabled=false;			
				document.priceApprovalMain.app6.disabled=false;			
				document.priceApprovalMain.app9.disabled=false;			
				document.priceApprovalMain.app10.disabled=false;			
				document.priceApprovalMain.app11.disabled=false;			
				document.priceApprovalMain.app12.disabled=false;		
				document.priceApprovalMain.select16.disabled=false;
				document.priceApprovalMain.select15.disabled=false;

			}else if(document.priceApprovalMain.company.value == 1501 || document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006){
				document.priceApprovalMain.app9.disabled=false;
				document.priceApprovalMain.app12.disabled=false;

			}else if(document.priceApprovalMain.company.value == 1042 ){
				document.priceApprovalMain.app9.disabled=false;
				document.priceApprovalMain.app10.disabled=false;
				

			}else {

				document.priceApprovalMain.app3.disabled=false;			
				document.priceApprovalMain.app6.disabled=false;			
				document.priceApprovalMain.app9.disabled=false;			
				document.priceApprovalMain.app10.disabled=false;			
				document.priceApprovalMain.app11.disabled=false;			
				document.priceApprovalMain.app12.disabled=false;		
				document.priceApprovalMain.select16.disabled=false;
				document.priceApprovalMain.select15.disabled=false;
			
			}

		     }

		}
	

}


function savedraft2(){

	var error = "";

var priceid = document.priceApprovalMain.priceid.value;

	var sanctionedRefType = document.getElementById('sanctionedRefType').value;
	var refNumber = document.getElementById('refNumber').value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;
counter					=	document.priceApprovalMain.count.value;

for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;
		if(vval.length==0)
		{
			v.value = "NA";
		}

		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if(iival.length==0)
		{
			ii.value = "0";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.length==0)
		{
			f.value = "0";
		}

		d = eval("document.priceApprovalMain.d"+i);
		dval = d.value;

		if(dval.length==0)
		{
			d.value = "NA";
		}

		//w = eval("document.priceApprovalMain.w"+i);
		//wval = w.value;

		//if(wval.length==0)
		//{
		//	w.value = "NA";
		//}
		
		pt = eval("document.priceApprovalMain.pt"+i);
		ptval = pt.value;

		if(ptval.length==0)
		{
			pt.value = "NA";
		}
		
		va = eval("document.priceApprovalMain.va"+i);
		vaval = va.value;

		if(vaval.length==0)
		{
			va.value = "NA";
		}

	}

	if(isEmpty(document.priceApprovalMain.fromDateAir2.value.length))
		{
			document.priceApprovalMain.fromDateAir2.value = 0;
		}
		/*if(isEmpty(document.priceApprovalMain.fromDateAir8.value.length))
		{
			document.priceApprovalMain.fromDateAir8.value = "NA";
		}*/
		if(isEmpty(document.priceApprovalMain.reason1.value.length))
		{
			document.priceApprovalMain.reason1.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach1.value.length))
		{
			document.priceApprovalMain.attach1.value = "NA";
			document.priceApprovalMain.attach1New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason2.value.length))
		{
			document.priceApprovalMain.reason2.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach2.value.length))
		{
			document.priceApprovalMain.attach2.value = "NA";
			document.priceApprovalMain.attach2New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason3.value.length))
		{
			document.priceApprovalMain.reason3.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach3.value.length))
		{
			document.priceApprovalMain.attach3.value = "NA";
			document.priceApprovalMain.attach3New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason44.value.length))
		{
			document.priceApprovalMain.reason44.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach4.value.length))
		{
			document.priceApprovalMain.attach4.value = "NA";
			document.priceApprovalMain.attach4New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason5.value.length))
		{
			document.priceApprovalMain.reason5.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach5.value.length))
		{
			document.priceApprovalMain.attach5.value = "NA";
			document.priceApprovalMain.attach5New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason6.value.length))
		{
			document.priceApprovalMain.reason6.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach6.value.length))
		{
			document.priceApprovalMain.attach6.value = "NA";
			document.priceApprovalMain.attach6New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason7.value.length))
		{
			document.priceApprovalMain.reason7.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach7.value.length))
		{
			document.priceApprovalMain.attach7.value = "NA";
			document.priceApprovalMain.attach7New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason8.value.length))
		{
			document.priceApprovalMain.reason8.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach8.value.length))
		{
			document.priceApprovalMain.attach8.value = "NA";
			document.priceApprovalMain.attach8New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason9.value.length))
		{
			document.priceApprovalMain.reason9.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach9.value.length))
		{
			document.priceApprovalMain.attach9.value = "NA";
			document.priceApprovalMain.attach9New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.reason10.value.length))
		{
			document.priceApprovalMain.reason10.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach10.value.length))
		{
			document.priceApprovalMain.attach10.value = "NA";
			document.priceApprovalMain.attach10New.value = "NA.NA_NA";
		}

		if(isEmpty(document.priceApprovalMain.fromDateAir1.value.length))
		{
			document.priceApprovalMain.fromDateAir1.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir2.value.length))
		{
			document.priceApprovalMain.fromDateAir2.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir3.value.length))
		{
			document.priceApprovalMain.fromDateAir3.value = 0;
		}

		if(isEmpty(document.priceApprovalMain.compName1.value.length))
		{
			document.priceApprovalMain.compName1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName2.value.length))
		{
			document.priceApprovalMain.compName2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName3.value.length))
		{
			document.priceApprovalMain.compName3.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.reason14.value.length))
		{
			document.priceApprovalMain.reason14.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.reason15.value.length))
		{
			document.priceApprovalMain.reason15.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.reason16.value.length))
		{
			document.priceApprovalMain.reason16.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM1.value.length))
		{
			document.priceApprovalMain.UOM1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem1.value.length))
		{
			document.priceApprovalMain.rem1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM2.value.length))
		{
			document.priceApprovalMain.UOM2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem2.value.length))
		{
			document.priceApprovalMain.rem2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM3.value.length))
		{
			document.priceApprovalMain.UOM3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem1.value.length))
		{
			document.priceApprovalMain.rem1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem2.value.length))
		{
			document.priceApprovalMain.rem2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM3.value.length))
		{
			document.priceApprovalMain.UOM3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem3.value.length))
		{
			document.priceApprovalMain.rem3.value = "NA";
		}

				/*validation for blank spaces */

    if (document.priceApprovalMain.requestedBy7.value.match(/\s/g,"")) {
		
		document.priceApprovalMain.requestedBy7.focus();
        error +="Blank spaces are not allowed in Negotiated value \n";
    }
	
	if(document.priceApprovalMain.requestedBy7.value>2147483000)
	{
		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiated Value is allowed only upto Rs.2147483000 \n";
	}
	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiated value cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy5.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy5.focus();
        error +="Blank spaces are not allowed in Total Budget \n";
    }
	if(document.priceApprovalMain.requestedBy5.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy5.focus();
		error += "Total Budget cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fqtNumber.value.match(/\s/g,"")) {

		document.priceApprovalMain.fqtNumber.focus();
        error +="Blank spaces are not allowed in PO's Commited till date \n";
    }
	if(document.priceApprovalMain.fqtNumber.value.indexOf(".")>-1){

		document.priceApprovalMain.fqtNumber.focus();
		error += "PO's Commited till date cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy9.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy9.focus();
        error +="Blank spaces are not allowed in Hard Savings \n";

    }
	if(document.priceApprovalMain.requestedBy9.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy9.focus();
		error += "Hard Savings cannot be in decimal format \n";

    }
    if (document.priceApprovalMain.requestedBy10.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy10.focus();
        error +="Blank spaces are not allowed in Cost Avoidance \n";
    }
	if(document.priceApprovalMain.requestedBy10.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy10.focus();
		error += "Hard Savings cannot be in decimal format \n";
    }

for(i = 1; i<=counter; i++)
	{
		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if (iival.match(/\s/g,"")) {
			ii.focus();
			error +="Blank spaces are not allowed in Initial Offer \n";
		}
		if (iival.indexOf(".")>-1) {

			ii.focus();
			error += "Initial Offer cannot be in decimal format \n";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.match(/\s/g,""))
		{
			f.focus();
			error +="Blank spaces are not allowed in Final Offer \n";
		}
		if(fval.indexOf(".")>-1)
		{
			f.focus();
			error += "Final Offer cannot be in decimal format \n";
		}
	}
    if (document.priceApprovalMain.fromDateAir1.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir1.focus();
		error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir1.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir1.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir2.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir2.focus();
        error +="Blank spaces are not allowed in Rate \n";
        //return false;
    }
	if(document.priceApprovalMain.fromDateAir2.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir2.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir3.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir3.focus();
        error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir3.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir3.focus();
		error += "Rate cannot be in decimal format \n";
    }

	if(document.priceApprovalMain.sanctionedRefType.value == 0)
	{
		//error += "Please Select Sanctioned Reference Type\n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.sanctionedRefType.focus();
				flag = 1;
			}
	}
	//alert("fghfhf"+sanctionedRefType);
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
 		if(error!="")
	{
		alert(error);
		return;
	}else{
	//alert("hello----"+document.priceApprovalMain.app1H.value);
	var recommendation = document.priceApprovalMain.recommendation.value;
	var req = document.priceApprovalMain.req.value;

			recommendation = recommendation.replace(/^\s+|\s+$/g,'');
			req = req.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.recommendation.value= recommendation;
		document.priceApprovalMain.req.value= req;


			if(document.priceApprovalMain.requestedBy7.value >= 50000000)
			{
				document.priceApprovalMain.app6.disabled=false;
				document.priceApprovalMain.app10.disabled=false;
			}
				document.priceApprovalMain.savedraft1.disabled = true;  
				document.priceApprovalMain.savedraft1.value = 'Please wait..';  
			document.priceApprovalMain.action = "common/updateDraftSubmit.jsp?priceid="+priceid;
			document.priceApprovalMain.submit();
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


function addUser(forWhom, id) {

	frmObj = document.priceApproval;
	//document.priceApproval.forWhom.value = id;

	//alert(document.priceApproval.forWhom.value);
	
	window.open('common/search.jsp?forWhom='+forWhom+"&id="+id,'','resizable=yes,scrollbars=yes,toolbars=no,status=yes,width=600,height=600,top=70,left=100');

}


function validateUser(tblId){

	

	frmObj = document.priceApproval;
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
   loadFragment('../includes/contacts.jsp?name='+name+'&selectedOpt='+selectedOption+"&tblId="+tblId,'members','Members');

}

function clear()
{
	//alert("hi");
	frmObj = document.priceApproval;
	frmObj.reset();
}

/*function addtext(a,b)
{
//alert("ashu");
}*/

function callme()
{
	document.test.action = "test.jsp";
	document.test.submit();
}

// File Upload code

function upload(attachmentName) {

	//alert(attachmentName);

	//var frmObj = document.priceApprovalMain;
	
	//var projectName = frmObj.attachmentName.value;
	
	//stat = checkNull("Project ",projectName);

	//if(!stat){
	//	frmObj.project.focus();
	//	return;
	//}	
	//alert('../upload/uploadFile.jsp?attachmentName='+attachmentName+'&projectName='+projectName,'','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=120,top=70,left=100');
	window.open('upload/uploadFile.jsp?attachmentName='+attachmentName,'','resizable=no,tlebar=no,scrollbars=no,toolbar=no,status=no,width=470,height=230,top=80,left=100');
}

function uploadMD(attachmentName,priceId) {

	//alert(attachmentName);

	//var frmObj = document.priceApprovalMain;
	
	//var projectName = frmObj.attachmentName.value;
	
	//stat = checkNull("Project ",projectName);

	//if(!stat){
	//	frmObj.project.focus();
	//	return;
	//}	
	//alert('../upload/uploadFile.jsp?attachmentName='+attachmentName+'&projectName='+projectName,'','resizable=yes,scrollbars=no,toolbars=no,status=yes,width=350,height=120,top=70,left=100');
	window.open('../uploadMD/uploadFile.jsp?attachmentName='+attachmentName+'&priceId='+priceId,'','resizable=no,tlebar=no,scrollbars=no,toolbar=no,status=no,width=470,height=230,top=80,left=100');
}

function validateFields(attachmentName) {

	//alert(attachmentName);
	var frmObj = document.frmUploadFile;
	//var stat = "";
	var fileExtn ="";	
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";
	var stats = "";

	var uploadFile = attachmentName;//frmObj.uploadFile.value;

	stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}
    
    // Check Attachment for Ampersand (&)
        stat = checkAmp("Attached File ",  uploadFile , "&");
        if(!stat){
            frmObj.uploadFile.focus( );
            return;
        }		
	frmObj.action="../upload/uploadFileRequest.jsp?attachmentName="+attachmentName;
    frmObj.submit();
}

function validateFieldsMD(attachmentName,priceId) {

	//alert(attachmentName);
	var frmObj = document.frmUploadFile;
	//var stat = "";
	var fileExtn ="";	
	var junk = "@!~+%<>?`;#$%^&*=|[]{}";
	var stats = "";

	var uploadFile = attachmentName;//frmObj.uploadFile.value;

	stat = checkNull("File ",uploadFile);
	if(!stat){
		frmObj.uploadFile.focus();
		return;
	}
    
    // Check Attachment for Ampersand (&)
        stat = checkAmp("Attached File ",  uploadFile , "&");
        if(!stat){
            frmObj.uploadFile.focus( );
            return;
        }		
	frmObj.action="../uploadMD/uploadFileRequest.jsp?attachmentName="+attachmentName+'&priceId='+priceId;
    frmObj.submit();
}

function checkAmp(fieldName, val, junkString)
{
	for (var i = 0; i <val.length;i++){
			for(var j=0;j < junkString.length;j++){
				if(val.charAt(i)==junkString.charAt(j)){
					alert(fieldName + " should not contain ampersand (&) !");
					return false;
				}
			}
		}
	return true;
}

function showAllRequests()
{
	//alert("JJJJ");
	randome = Math.random();
	loadFragment('common/viewAllStatus.jsp?randome='+randome,'allProcess','Showing All Requests');
	//setTimeout("showStatus()",1000*15);
}

function showStatus()
{
	randome = Math.random();
	//loadFragment('common/viewStatus.jsp?randome='+randome,'status','Showing Status');
	//setTimeout("showStatus()",1000*15);
}
function showSAB()
{	

	randome = Math.random();
	loadFragment('common/viewSAB.jsp?randome='+randome,'sab','Checking Support & Approve');
	//setTimeout("showSAB()",1000*15);
}

function downloadAttachments(fileName){
	alert("here"+fileName)
//	frmObj = document.frmSaveChklist;
//	policyId = eval("frmObj.policyId"+i+".value");
//	fromDate = eval("frmObj.disDate"+i+".value");
//	selectedOption = frmObj.selectedOption.value;
//    selectedOptionVal = frmObj.selectedOptionVal.value;

	url = "download.jsp?fileName="+fileName;
	win = window.open(url,"Attachments","top=20,left=0,width=470,height=600,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");
	//frmObj.action="../common/downloadReports.jsp?policyId="+policyId+"&assurerfdbk="+assurerfdbk+"&ensurerfdbk="+ensurerfdbk+"&date="+dateVal;

	//frmObj.submit();
	
}

// Remarks 

function loadRemarks(priceId, userOId, elementId, approverType)
{
			  //alert(userOId);

				//document.getElementById(elementId).innerHTML = "Loading remarks...";

			   if(userOId==0)
				{
					document.getElementById(elementId).innerHTML = "No Remarks";
					return;
				} 

				//alert(approverType);

				if(approverType=="SD1")
				{
					if(SD1==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.SD1Remarks.value;
						SD1Remarks = document.priceApprovalMain.SD1Remarks.value;
						SD1   = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = SD1Remarks;
					}
				}else if(approverType=="SD2")
				{
					if(SD2==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.SD2Remarks.value;
						SD2Remarks = document.priceApprovalMain.SD2Remarks.value;
						SD2   = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = SD2Remarks;
					}
				}else if(approverType=="AP11")
				{
					if(AP11==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP11Remarks.value;
						AP11Remarks = document.priceApprovalMain.AP11Remarks.value;
						AP11  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP11Remarks;
					}
				}else if(approverType=="AP12")
				{
					if(AP12==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP12Remarks.value;
						AP12Remarks = document.priceApprovalMain.AP12Remarks.value;
						AP12  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP12Remarks;
					}
				}else if(approverType=="AP13")
				{
					if(AP13==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP13Remarks.value;
						AP13Remarks = document.priceApprovalMain.AP13Remarks.value;
						AP13  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP13Remarks;
					}
				}else if(approverType=="AP21")
				{
					if(AP21==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP21Remarks.value;
						AP21Remarks = document.priceApprovalMain.AP21Remarks.value;
						AP21  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP21Remarks;
					}
				}else if(approverType=="AP22")
				{
					if(AP22==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP22Remarks.value;
						AP22Remarks = document.priceApprovalMain.AP22Remarks.value;
						AP22  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP22Remarks;
					}
				}else if(approverType=="AP23")
				{
					if(AP23==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP23Remarks.value;
						AP23Remarks = document.priceApprovalMain.AP23Remarks.value;
						AP23  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP23Remarks;
					}
				}else if(approverType=="AP31")
				{
					if(AP31==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP31Remarks.value;
						AP31Remarks = document.priceApprovalMain.AP31Remarks.value;
						AP31  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP31Remarks;
					}
				}else if(approverType=="AP32")
				{
					if(AP32==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP32Remarks.value;
						AP32Remarks = document.priceApprovalMain.AP32Remarks.value;
						AP32  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP32Remarks;
					}
				}else if(approverType=="AP33")
					{
					if(AP33==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP33Remarks.value;
						AP33Remarks = document.priceApprovalMain.AP33Remarks.value;
						AP33  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP33Remarks;
					}
				}else if(approverType=="AP34")
					{
					if(AP34==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP34Remarks.value;
						AP34Remarks = document.priceApprovalMain.AP34Remarks.value;
						AP34  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP34Remarks;
					}
				}else if(approverType=="AP35")
					{
					if(AP35==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP35Remarks.value;
						AP35Remarks = document.priceApprovalMain.AP35Remarks.value;
						AP35  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP35Remarks;
					}
				}else if(approverType=="AP36")
					{
					if(AP36==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP36Remarks.value;
						AP36Remarks = document.priceApprovalMain.AP36Remarks.value;
						AP36  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP35Remarks;
					}
				}else if(approverType=="AP4")
				{
					if(AP4==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP4Remarks.value;
						AP4Remarks = document.priceApprovalMain.AP4Remarks.value;
						AP4   = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP4Remarks;
					}
				}else if(approverType=="AP5")
				{
					if(AP5==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP5Remarks.value;
						AP5Remarks = document.priceApprovalMain.AP5Remarks.value;
						AP5   = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP5Remarks;
					}
				}else if(approverType=="AP6")
				{
					if(AP6==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP6Remarks.value;
						AP6Remarks = document.priceApprovalMain.AP6Remarks.value;
						AP6   = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP6Remarks;
					}
				}else if(approverType=="AP7")
					{
					if(AP7==1)
					{
						document.getElementById(elementId).innerHTML = document.priceApprovalMain.AP7Remarks.value;
						AP7Remarks = document.priceApprovalMain.AP7Remarks.value;
						AP7  = 0;
					}
					else
					{
						document.getElementById(elementId).innerHTML = AP7Remarks;
					}
				}



				if(flagR==1)
				{
				 flagR = 0;

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
							
							var text = xmlhttp.responseText;
							   
							if(approverType=="SD1")
							{	
								SD1Remarks = text;
							}else if(approverType=="SD2")
							{	
								SD2Remarks = text;
							}else if(approverType=="AP11")
							{	
								AP11Remarks = text;
							}else if(approverType=="AP12")
							{	
								AP12Remarks = text;
							}else if(approverType=="AP13")
							{	
								AP13Remarks = text;
							}else if(approverType=="AP21")
							{	
								AP21Remarks = text;
							}else if(approverType=="AP22")
							{	
								AP22Remarks = text;
							}else if(approverType=="AP23")
							{	
								AP23Remarks = text;
							}else if(approverType=="AP31")
							{	
								AP31Remarks = text;
							}else if(approverType=="AP32")
							{	
								AP32Remarks = text;
							}else if(approverType=="AP33")
							{	
								AP33Remarks = text;
							}else if(approverType=="AP33")
							{	
								AP33Remarks = text;
							}else if(approverType=="AP34")
							{	
								AP34Remarks = text;
							}else if(approverType=="AP35")
							{	
								AP35Remarks = text;
							}else if(approverType=="AP36")
							{	
								AP36Remarks = text;
							}
							else if(approverType=="AP4")
							{	
								AP4Remarks = text;
							}else if(approverType=="AP5")
							{	
								AP5Remarks = text;
							}else if(approverType=="AP6")
							{	
								AP6Remarks = text;
							}

							document.getElementById(elementId).innerHTML = test;									
						}
					}

				  var random = Math.random();
				var URL    = '../common/loadRemarks.jsp?priceId='+priceId+'&userId='+userOId+'&approverType='+approverType+'&random='+random;
              //  var URL    = '../common/new.jsp';
				  //alert(URL);
				  xmlhttp.open("GET",URL,true);
		    	  xmlhttp.send();
				}

}

function openRemarks(priceId,userOId,approverType, statusType,company)
{     

	if(approverType=="SD1")
	{
		SD1   = 1;
		flagR = 1;
	}else if(approverType=="SD2")
	{
		SD2   = 1;
		flagR = 1;
	}
	else if(approverType=="AP11")
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

	window.open('../common/insertRemarks.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&company='+company,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=750,height=300,top=80,left=100');
}

function postRemarks(priceId,userOId,approverType,statusType,company)
{
	
/*	var remarks = document.postRemarksForm.remarksContainer.value;

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
				  var URL    = '../common/insertRemarksSubmit.jsp?priceId='+priceId+'&userId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&remarks='+remarks+'&random='+random+'&company='+company;
				 //alert(URL);
				  xmlhttp.open("GET",URL,true);
		    	  xmlhttp.send();
				//url = '../common/showDetails.jsp?tOId='+userOId+'&priceid='+priceId;
				// window.opener.location.href=url;
				 //window.opener.location.reload();

	}*/

	frmObj = document.postRemarksForm;
	var remarks = frmObj.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');

	
	if(remarks.length!=0 && remarks!='')
	{
		

		var random = Math.random();
		//var uri = "../common/insertRemarksSubmit.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&random="+random;
		//var res = encodeURIComponent(uri);
		
		//loadURL(uri , priceId, userOId, approverType, remarks , statusType);
		
		

		//window.open(uri , priceId, userOId, approverType, remarks , statusType);
	
	}else
	{
		alert("Please enter remarks");
		 return;

	}
	frmObj.remarks.value = remarks;

	document.postRemarksForm.remarksPost.disabled = true;  
	document.postRemarksForm.remarksPost.value = 'Please Wait...';  


	frmObj.action="../common/insertRemarksSubmit.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&random='+random+'&company='+company;
	frmObj.submit( );
	//self.close();

}

function postRemarks1(priceId,userOId,approverType,statusType,company)
{
	
	frmObj = document.postRemarksForm;
	var remarks = frmObj.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');

	
	if(remarks.length!=0 && remarks!='')
	{
		

		var random = Math.random();
		//var uri = "../common/insertRemarksSubmit.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&random="+random;
		//var res = encodeURIComponent(uri);
		
		//loadURL(uri , priceId, userOId, approverType, remarks , statusType);
		
		

		//window.open(uri , priceId, userOId, approverType, remarks , statusType);
	
	}else
	{
		alert("Please enter remarks");
		 return;

	}

	frmObj.action="../common/insertRemarksSubmit.jsp?priceId="+priceId+'&userId='+userOId+'&approverType='+approverType+'&statusType='+statusType+'&random='+random+'&company='+company;
	frmObj.submit( );
	//self.close();
}
function navigateCallRemarks(timescapeUserOId,priceid)
{
	 url = "../common/showDetails.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.opener.location.href=url;
document.write("You will be redirected to a new page in 5 seconds"); 
setTimeout('Redirect()', 5000);
self.close();
}
function navigateCallReview()
{	 url = "../index.jsp";
	 window.opener.location.href=url;
 	 self.close();
}

function navigateCallbuyersStatus(timescapeUserOId,priceid)
{
	 url = "../common/viewStatus.jsp?tOId="+timescapeUserOId+"&priceid="+priceid;
	 window.location.href=url;
 	 //self.close();
}
function loadURL(fragment_url ,priceId ,userOId ,approverType,remarks ,statusType){

	//alert("rand="+Math.random());
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
	
	var message = "";
   
        
	try{
        xmlhttp.open("GET", fragment_url);
        xmlhttp.onreadystatechange = function(){

            if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//alert(xmlhttp.responseText);
				var text = xmlhttp.responseText;
					text = text.replace(/[^a-zA-Z 0-9]+/g,'');
					text = text.replace(/^\s+|\s+$/g,'');
				//var gotresponse	=	xmlhttp.responseText;
                
				//message =  gotresponse;
               // element.innerHTML = message;
				var URL = "";
				document.getElementById('poststatus').innerHTML = "Remarks Posted Successfully!!!";	
				window.close();
				
				if(text == "true")
				{
					opener.location.href = "../common/supportApprove.jsp?priceid="+priceId+"&appType="+approverType+"&statusType="+statusType;								
					//document.location.href = "../common/supportApprove.jsp";
				}
						
		}
		}
		xmlhttp.send(null);
	 }// display an error in case of failure
	 catch (e){

		alert("Can't connect to server:\n" + e.toString());
	 }
}

function project()
{   
	var opts = document.getElementById('category').value;
	var frmObj2 = document.priceApprovalMain;
	//alert(opts)
	if(opts == "Projects"){
		document.getElementById('requestedBy4').disabled = false;
	$(".QTPopup").animate({width: 'show'}, 'slow');
		var random = Math.random();
		$.ajax({
			url : "includes/projects.jsp?random="+random,
			success : function (data) {

				$("#msg").removeClass("msgOthers").addClass("msgProfile").show();
				$("#msg").html(data);
			}
		});
	}
	else
	{	//alert("hi");
		document.getElementById('requestedBy4').disabled = true;
		document.getElementById('requestedBy4').value ="";
		document.getElementById('requestedBy5').value ="";
	}
}

function readValues(){
	var frmObj1 = document.projectSub;
	var frmObj2 = document.priceApprovalMain;
	var projectName;
	var budget;

	if(frmObj1.projectList.value != 0){
	
	var projnbudg	= frmObj1.projectList.value;
	var res			= projnbudg.split(",");
	projectName		= res[0];
	budget			= res[1];
	
	document.getElementById('requestedBy4').value = projectName;
	document.getElementById('requestedBy5').value = budget;
	
	$(".QTPopup").css('display', 'none');
	}

	else if(document.getElementById("pname").value==null){

	}
	else
	{
	
	projectName		= frmObj1.pname.value ;
	budget			= frmObj1.pbudg.value ;

	document.getElementById('requestedBy4').value = projectName;
	document.getElementById('requestedBy5').value = budget;
	
	$(".QTPopup").css('display', 'none');
	}


}

function addData()
{
	frmObj = document.projectSub;
	document.getElementById("data").style.display='block';
	var projnbudg	= document.getElementById('projectList').value;
	var res			= projnbudg.split(",");
	projectName		= res[0];
	budget			= res[1];

	loadFragment1('includes/showRequest.jsp?random='+Math.random()+'&projectName='+projectName+'&budget='+budget,'data', "loading..");
	

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
    var processingRequest='<table width="30%" height="100%"><tr><td align="center"><div align="center" class="nav"><span class="bluesmall"><img src="images/logo2.jpg" valign="absmiddle">&nbsp;&nbsp;'+for_what+'</span></div></td></tr></table>';
        
    //alert(processingRequest);
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

/* function asd()
{
	frmObj = document.priceApprovalMain;
	frmObj.action="../common/mynew.jsp";
	frmObj.submit();
	
}
*/

function savingsChk(){


	var error = "";
	var flg   = 0;
	//var frmObj = document.priceApprovalMain;
	if(isNaN(document.priceApprovalMain.requestedBy9.value))
	{
		document.priceApprovalMain.requestedBy9.focus();
		error += "Fill Numerics value in Hard Savings \n";
	}
	if(isNaN(document.priceApprovalMain.requestedBy10.value))
	{
		document.priceApprovalMain.requestedBy10.focus();
		error += "Fill Numerics value in Cost Avoidance \n";
	}

	if(/*!isEmpty(document.priceApprovalMain.requestedBy9.value.length) &&*/ document.priceApprovalMain.requestedBy9.value>0){
		document.priceApprovalMain.requestedBy10.value='0';
	}
	 if(/*!isEmpty(document.priceApprovalMain.requestedBy10.value.length) &&*/ document.priceApprovalMain.requestedBy10.value>0){
		document.priceApprovalMain.requestedBy9.value='0';
	}

	if(error!="")
	{
		alert(error);
		return;
	}

}


function getDetails()
{
	var error = "";
	var flag  = 0;

	var frmObj2				= document.priceApprovalMain;
	var sanctionedRefType	= document.getElementById('sanctionedRefType').value;
	var refNumber			= document.getElementById('refNumber').value;
	var dateOfApproval		= document.getElementById('dateOfApproval').value;
	var company				= document.getElementById('company').value;
	//alert(document.priceApprovalMain.company.value);
	//alert("company"+company);

	if(company == 0)
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
		return;
	}
	else
	{
		randome = Math.random();
		loadFragment('createRequest.jsp?randome='+randome+'&company='+company,'showRequests','Showing All Fields');
	}
	
}

function visibleAttach() {
    document.getElementById("myP").style.visibility = "visible";
   //alert("dfsdf");
}


function loadApprove()
{
	
		if (window.XMLHttpRequest)
		  { // code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
	
		 // xmlhttp.onreadystatechange=function()
		  var random = Math.random();
		  var URL    = '../common/mynew.jsp';
	  //  var URL    = '../common/new.jsp';
		 // alert(URL);
		  xmlhttp.open("GET",URL,true);
		  xmlhttp.send();	
}

function remarkspop(priceId,userOId,approverType)
{     
	window.open('../common/splReview.jsp?priceId='+priceId+'&userOId='+userOId+'&approverType='+approverType,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,resizable=no,scrollbars=yes,toolbars=no,status=yes,width=1000,height=550,top=20,left=50');
}

function specialReview1()
{
var category = document.specialReview.review;
  var check1 = 0;
  for(i=0;i<category.length;i++){
    if(category[i].checked){
      check1++;
      break;
    }
  }// alert("selected: = "+document.specialReview.review.value);
  if(check1){
  }else{
    alert("please select atleast one approver");
    return false;
  }
	var remarks = document.specialReview.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');
		if(isEmpty(remarks.length))
	{	alert("Please enter remarks");
		 return;
	}else{

		document.specialReview.remarksContainer.value=remarks;


			document.specialReview.action = "../common/specialreviewSubmit.jsp";
			document.specialReview.submit();
}
}
function navigateCall(tOId,priceId)
{
	//alert('HDFC');
	//alert(tOId);
	//window.opener.location.reload();
	//frmObj = document.addPipeline;
	url = "../index.jsp";
	 window.opener.location.href=url;
	//window.opener.location.reload();
	self.close();
}
function createdForUpdate()
{
	var remarks = document.createdfor.remarksContainer1.value;
	remarks = remarks.replace(/^\s+|\s+$/g,'');
	if(isEmpty(remarks.length))
	{	
		alert("Please enter remarks");
		return;
	}else{
		document.createdfor.remarksContainer1.value=remarks;
		document.createdfor.action = "../common/createdForSubmit.jsp";
		document.createdfor.submit();
	}
}
function freezcpx(){

	if((document.priceApprovalMain.category.value =="Capex"))
	{
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
	}else{

			document.priceApprovalMain.app3.disabled=false;
			document.priceApprovalMain.app6.disabled=false;
	}
}

function disableMasFin(){
	//alert("g");


	document.priceApprovalMain.app3.disabled=true;
	document.priceApprovalMain.app6.disabled=true;
	document.priceApprovalMain.app9.disabled=true;
	document.priceApprovalMain.app10.disabled=true;

}


function setSelectedIndex()
{
	//alert("Hello.....byeeeeee");
	var element3 = document.getElementById("app3");
	var element = document.getElementById("app6");
	var element1 = document.getElementById("app10");
	var element4 = document.getElementById("app9");
	var opt = document.getElementById("category");
	
	var selectedCategoryValue = "";
	
	//alert(opt.selectedIndex);
	
	if(typeof(opt.selectedIndex) != 'undefined'){
	selectedCategoryValue= opt.options[opt.selectedIndex].value;
	}else{
		selectedCategoryValue = document.priceApprovalMain.category.value;
	}
//alert("selectedCategoryValue"+document.priceApprovalMain.category.value);
//alert("document.priceApprovalMain.company.value...."+document.priceApprovalMain.company.value);
	if(document.priceApprovalMain.requestedBy7.value >= 50000000 && document.priceApprovalMain.company.value == 1000)
	{
		//element.value = "21929";
		//element1.value = "24683";
		if(document.priceApprovalMain.category.value =="Capex"){
			//alert("Hello...00001..");
			element3.value = "0";
			element.value = "0";
			element1.value = "24683";
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
		}else{
			//alert("Hello...1..");
			element.value = "21929";
			element1.value = "24683";
			element3.value = "0";
			document.priceApprovalMain.app3.disabled=false;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
		}
	}else if(document.priceApprovalMain.company.value == 1501 ){
		//document.getElementById("app9").value = "31243";
		//alert("kkk");
		element4.value = "31243";
		document.priceApprovalMain.app9.disabled=true;

	}else if((document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && ((document.priceApprovalMain.category.value == "Group Company related buying" || document.priceApprovalMain.category.value == "IT buying" || document.priceApprovalMain.category.value == "Projects")) ){
		//document.getElementById("app9").value = "31243";
		//alert("kkk");
		element4.value = "0";
		document.priceApprovalMain.app9.disabled=false;

	}else if(document.priceApprovalMain.requestedBy7.value >= 2000000 && document.priceApprovalMain.requestedBy7.value < 50000000 )
	{
		//alert("HII");
		if(document.priceApprovalMain.category.value =="Capex"){
			//alert("Hello...21111..");
			element3.value = "0";
			element.value = "0";
			element1.value = "0";
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app10.disabled=true;

		}
		/*if(document.priceApprovalMain.company.value == 1033 && document.priceApprovalMain.requestedBy7.value <= 50000000)
		{
			//alert("KKKK");
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app9.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
		}else*/ if(document.priceApprovalMain.company.value == 1001 && document.priceApprovalMain.requestedBy7.value <= 50000000)
		{
			//alert("HHHHHH");
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app9.disabled=false;
			document.priceApprovalMain.app10.disabled=false;
		}else {
			//alert("Hello...2..");
			element3.value = "0";
			element.value = "0";
			element1.value = "0";
			document.priceApprovalMain.app3.disabled=false;
			document.priceApprovalMain.app6.disabled=false;
			document.priceApprovalMain.app10.disabled=true;
	   		}
	}if(document.priceApprovalMain.company.value == 1033 && document.priceApprovalMain.requestedBy7.value <= 50000000)
		{
			//alert("KKKmmmmK");
			document.priceApprovalMain.app3.disabled=true;
			document.priceApprovalMain.app6.disabled=true;
			document.priceApprovalMain.app9.disabled=true;
			document.priceApprovalMain.app10.disabled=true;
		}
}


function delAttach1(jj)
{
	//if(position== "1"){
	//document.priceApprovalMain.reason1.value;
	//document.priceApprovalMain.attach1.value="";
	//document.priceApprovalMain.attach1.focus();

			//var attachName   = eval("document.priceApprovalMain.reason"+jj+".value");
			var attachFile   = eval("document.priceApprovalMain.attach"+jj+".value");
			//alert("attachName "+attachName);
			 //attachName	="NA";
			 //attachName.value = 'NA';
			// eval("document.priceApprovalMain.reason"+jj).value ="NA";
			 eval("document.priceApprovalMain.attach"+jj).value ="";
			  //eval("document.priceApprovalMain."+attachName) ;

			//alert("attachName "+attachName);
}
function delAttach44()
{
	//document.priceApprovalMain.reason44.value="NA";
	document.priceApprovalMain.attach4.value="";
	document.priceApprovalMain.attach4.focus();
}
//check


function cancelPar(priceId,userOId, statusType)
{
		frmObj = document.viewStatus;

	/*	alert(priceId);
		alert(userOId);
		alert(approverType);
		alert(statusType);
	*/
	val = confirm("Do you wish to cancel your price approval request ? ");

	if(val){
		//If "yes" then submit the page
		frmObj.action = "../common/cancelPar.jsp?priceId="+priceId+'&userOId='+userOId+'&statusType='+statusType;
		frmObj.submit();
	
	}else{
		return;
	}
}


function bncEdit(userOId,priceId)
{     

//alert("dsfds");
	window.open('../indexUpdateEdit.jsp?tOId='+userOId+'&priceid='+priceId,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,width=1080,height=650,top=10,left=100');
}




function updateEdit()
{
	var error = "";
	var flag  = 0;
			
	counter					=	document.priceApprovalMain.count.value;
	
	category				=   document.priceApprovalMain.category.value;
	
	Negotiation				=	document.priceApprovalMain.requestedBy.value;	
	Product					=	document.priceApprovalMain.requestedBy2.value;
	Meeting_Venue			=	document.priceApprovalMain.reason4.value;
	Indented_User			=	document.priceApprovalMain.requestedBy3.value;
	Negotiated_value		=	document.priceApprovalMain.requestedBy7.value;
	Validity_period			=	document.priceApprovalMain.validity.value;
	Package_Name			=	document.priceApprovalMain.requestedBy4.value;
	Finalized				=	document.priceApprovalMain.requestedBy8.value;
	Total_Budget			=	document.priceApprovalMain.requestedBy5.value;
	Payment_Terms			=	document.priceApprovalMain.reason.value;
	Commited_Till_Date		=	document.priceApprovalMain.fqtNumber.value;
	Savings					=	document.priceApprovalMain.requestedBy9.value;
	Cost_Avoidance			=	document.priceApprovalMain.requestedBy10.value;
	Balance_Budget			=	document.priceApprovalMain.requestedBy6.value;
	//alert(category);
	if(isEmpty(document.priceApprovalMain.requestedBy.value.length))
	{
		error += "Fill Negotiation \n";
		document.priceApprovalMain.requestedBy.focus();
		flag = 1;
	}
	if(isEmpty(document.priceApprovalMain.requestedBy2.value.length))
	{
		error += "Fill Product \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy2.focus();
				flag = 1;
			}
	}

	if(document.priceApprovalMain.category.value == 0)
	{
		error += "Please Select Category \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.category.focus();
				flag = 1;
			}
	}

	if(isEmpty(document.priceApprovalMain.reason4.value.length))
	{
		error += "Fill Meeting Venue \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.reason4.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy3.value.length))
	{
		error += "Fill Indented User \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy3.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy7.value.length))
	{
		error += "Fill N Value \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy7.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy7.value))
		{
			document.priceApprovalMain.requestedBy7.focus();
			error += "Fill Numerics in N Value \n";
		}
	}
	/*if(isEmpty(document.priceApprovalMain.requestedBy4.value.length))
	{
		error += "Fill Package \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy4.focus();
				flag = 1;
			}
	}*/
	if(isEmpty(document.priceApprovalMain.requestedBy8.value.length))
	{
		error += "Fill finalized \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy8.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy5.value.length))
	{
		error += "Fill total budget \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy5.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy5.value))
		{
			document.priceApprovalMain.requestedBy5.focus();
			error += "Fill Numerics in total budget \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.reason.value.length))
	{
		error += "Fill Payment Terms \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.reason.focus();
				flag = 1;
			}
	}
	if(isEmpty(document.priceApprovalMain.fqtNumber.value.length))
	{
		error += "Fill committed date \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.fqtNumber.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.fqtNumber.value))
		{
			document.priceApprovalMain.fqtNumber.focus();
			error += "Fill Numerics in committed date \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy9.value.length))
	{
		error += "Fill Hard Savings \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy9.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy9.value))
		{
			document.priceApprovalMain.requestedBy9.focus();
			error += "Fill Numerics in Hard Savings \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy10.value.length))
	{
		error += "Fill Cost Avoidance \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy10.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy10.value))
		{
			document.priceApprovalMain.requestedBy10.focus();
			error += "Fill Numerics in Cost Avoidance \n";
		}
	}
	if(isEmpty(document.priceApprovalMain.requestedBy6.value.length))
	{
		error += "Fill balance budget \n";
		if(parseInt(flag)==0)
			{
				document.priceApprovalMain.requestedBy6.focus();
				flag = 1;
			}
	}
	else
	{
		if(isNaN(document.priceApprovalMain.requestedBy6.value))
		{
			document.priceApprovalMain.requestedBy6.focus();
			error += "Fill Numerics in balance budget \n";
		}
	}

	if((document.priceApprovalMain.reason1.value=="NA" || isEmpty(document.priceApprovalMain.attach1.value.length)) &&
		(document.priceApprovalMain.reason2.value=="NA" || isEmpty(document.priceApprovalMain.attach2.value.length))&&
		(document.priceApprovalMain.reason3.value=="NA" || isEmpty(document.priceApprovalMain.attach3.value.length))&&
		(document.priceApprovalMain.reason44.value=="NA" || isEmpty(document.priceApprovalMain.attach4.value.length))&&
		(document.priceApprovalMain.reason5.value=="NA" || isEmpty(document.priceApprovalMain.attach5.value.length))&&
		(document.priceApprovalMain.reason6.value=="NA" || isEmpty(document.priceApprovalMain.attach6.value.length))&&
		(document.priceApprovalMain.reason7.value=="NA" || isEmpty(document.priceApprovalMain.attach7.value.length))&&
		(document.priceApprovalMain.reason8.value=="NA" || isEmpty(document.priceApprovalMain.attach8.value.length))&&
		(document.priceApprovalMain.reason9.value=="NA" || isEmpty(document.priceApprovalMain.attach9.value.length))&&
		(document.priceApprovalMain.reason10.value=="NA" || isEmpty(document.priceApprovalMain.attach10.value.length)))
	{
		//error += "Please select atleast one attachment \n ";
		document.priceApprovalMain.attach1.focus();
		error += "Please select atleast one description and attachment file\n ";
		//document.priceApprovalMain.reason1.focus();
	}

// Auto Background

for(i = 1; i<=counter; i++)
	{
		v = eval("document.priceApprovalMain.v"+i);
		vval = v.value;

		if(vval.length==0)
		{
			v.value = "NA";
		}

		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if(iival.length==0)
		{
			ii.value = "0";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.length==0)
		{
			f.value = "0";
		}

		d = eval("document.priceApprovalMain.d"+i);
		dval = d.value;

		if(dval.length==0)
		{
			d.value = "NA";
		}

		//w = eval("document.priceApprovalMain.w"+i);
		//wval = w.value;

		//if(wval.length==0)
		//{
		//	w.value = "NA";
		//}
		
		pt = eval("document.priceApprovalMain.pt"+i);
		ptval = pt.value;

		if(ptval.length==0)
		{
			pt.value = "NA";
		}
		
		va = eval("document.priceApprovalMain.va"+i);
		vaval = va.value;

		if(vaval.length==0)
		{
			va.value = "NA";
		}

	}

        if(isEmpty(document.priceApprovalMain.req.value.length))
		{
			document.priceApprovalMain.req.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.recommendation.value.length))
		{
			document.priceApprovalMain.recommendation.value = "NA";
		}

// Attachments

		if(isEmpty(document.priceApprovalMain.reason14.value.length))
		{
			document.priceApprovalMain.reason14.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir1.value.length))
		{
			document.priceApprovalMain.fromDateAir1.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.UOM1.value.length))
		{
			document.priceApprovalMain.UOM1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem1.value.length))
		{
			document.priceApprovalMain.rem1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM2.value.length))
		{
			document.priceApprovalMain.UOM2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem2.value.length))
		{
			document.priceApprovalMain.rem2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.UOM3.value.length))
		{
			document.priceApprovalMain.UOM3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.rem3.value.length))
		{
			document.priceApprovalMain.rem3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName1.value.length))
		{
			document.priceApprovalMain.compName1.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName2.value.length))
		{
			document.priceApprovalMain.compName2.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.compName3.value.length))
		{
			document.priceApprovalMain.compName3.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.reason2.value.length))
		{
			document.priceApprovalMain.reason2.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach2.value.length))
		{
			document.priceApprovalMain.attach2.value = "NA";
			document.priceApprovalMain.attach2New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason15.value.length))
		{
			document.priceApprovalMain.reason15.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir2.value.length))
		{
			document.priceApprovalMain.fromDateAir2.value = 0;
		}
		if(isEmpty(document.priceApprovalMain.reason3.value.length))
		{
			document.priceApprovalMain.reason3.value = "NA";
		}

		if(isEmpty(document.priceApprovalMain.attach3.value.length))
		{
			document.priceApprovalMain.attach3.value = "NA";
			document.priceApprovalMain.attach3New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason44.value.length))
		{
			document.priceApprovalMain.reason44.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.attach4.value.length))
		{
			document.priceApprovalMain.attach4.value = "NA";
			document.priceApprovalMain.attach4New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason5.value.length))
		{
			document.priceApprovalMain.reason5.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach5.value.length))
		{
			document.priceApprovalMain.attach5.value = "NA";
			document.priceApprovalMain.attach5New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason6.value.length))
		{
			document.priceApprovalMain.reason6.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach6.value.length))
		{
			document.priceApprovalMain.attach6.value = "NA";
			document.priceApprovalMain.attach6New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason7.value.length))
		{
			document.priceApprovalMain.reason7.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach7.value.length))
		{
			document.priceApprovalMain.attach7.value = "NA";
			document.priceApprovalMain.attach7New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason8.value.length))
		{
			document.priceApprovalMain.reason8.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach8.value.length))
		{
			document.priceApprovalMain.attach8.value = "NA";
			document.priceApprovalMain.attach8New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason9.value.length))
		{
			document.priceApprovalMain.reason9.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach9.value.length))
		{
			document.priceApprovalMain.attach9.value = "NA";
			document.priceApprovalMain.attach9New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason10.value.length))
		{
			document.priceApprovalMain.reason10.value = "NA";

		}
		if(isEmpty(document.priceApprovalMain.attach10.value.length))
		{
			document.priceApprovalMain.attach10.value = "NA";
			document.priceApprovalMain.attach10New.value = "NA.NA_NA";
		}
		if(isEmpty(document.priceApprovalMain.reason16.value.length))
		{
			document.priceApprovalMain.reason16.value = "NA";
		}
		if(isEmpty(document.priceApprovalMain.fromDateAir3.value.length))
		{
			document.priceApprovalMain.fromDateAir3.value = 0;
		}

		/*validation for blank spaces */

    if (document.priceApprovalMain.requestedBy7.value.match(/\s/g,"")) {
		
		document.priceApprovalMain.requestedBy7.focus();
        error +="Blank spaces are not allowed in Negotiated value \n";
    }
	if(document.priceApprovalMain.requestedBy7.value>2147483000)
	{
		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiation Value is allowed only upto Rs.2147483000 \n";
	}
	if(document.priceApprovalMain.requestedBy7.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy7.focus();
		error += "Negotiated value cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy5.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy5.focus();
        error +="Blank spaces are not allowed in Total Budget \n";
    }
	if(document.priceApprovalMain.requestedBy5.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy5.focus();
		error += "Total Budget cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fqtNumber.value.match(/\s/g,"")) {

		document.priceApprovalMain.fqtNumber.focus();
        error +="Blank spaces are not allowed in PO's Commited till date \n";
    }
	if(document.priceApprovalMain.fqtNumber.value.indexOf(".")>-1){

		document.priceApprovalMain.fqtNumber.focus();
		error += "PO's Commited till date cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.requestedBy9.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy9.focus();
        error +="Blank spaces are not allowed in Hard Savings \n";

    }
	if(document.priceApprovalMain.requestedBy9.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy9.focus();
		error += "Hard Savings cannot be in decimal format \n";

    }
    if (document.priceApprovalMain.requestedBy10.value.match(/\s/g,"")) {

		document.priceApprovalMain.requestedBy10.focus();
        error +="Blank spaces are not allowed in Cost Avoidance \n";
    }
	if(document.priceApprovalMain.requestedBy10.value.indexOf(".")>-1){

		document.priceApprovalMain.requestedBy10.focus();
		error += "Hard Savings cannot be in decimal format \n";
    }

for(i = 1; i<=counter; i++)
	{
		ii = eval("document.priceApprovalMain.i"+i);
		iival = ii.value;

		if (iival.match(/\s/g,"")) {
			ii.focus();
			error +="Blank spaces are not allowed in Initial Offer \n";
		}
		if (iival.indexOf(".")>-1) {

			ii.focus();
			error += "Initial Offer cannot be in decimal format \n";
		}

		f = eval("document.priceApprovalMain.f"+i);
		fval = f.value;

		if(fval.match(/\s/g,""))
		{
			f.focus();
			error +="Blank spaces are not allowed in Final Offer \n";
		}
		if(fval.indexOf(".")>-1)
		{
			f.focus();
			error += "Final Offer cannot be in decimal format \n";
		}
	}
    if (document.priceApprovalMain.fromDateAir1.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir1.focus();
		error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir1.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir1.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir2.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir2.focus();
        error +="Blank spaces are not allowed in Rate \n";
        //return false;
    }
	if(document.priceApprovalMain.fromDateAir2.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir2.focus();
		error += "Rate cannot be in decimal format \n";
    }
    if (document.priceApprovalMain.fromDateAir3.value.match(/\s/g,"")) {

		document.priceApprovalMain.fromDateAir3.focus();
        error +="Blank spaces are not allowed in Rate \n";
    }
	if(document.priceApprovalMain.fromDateAir3.value.indexOf(".")>-1){

		document.priceApprovalMain.fromDateAir3.focus();
		error += "Rate cannot be in decimal format \n";
    }

	/* This is for first theree column senctionedtype, ref number and approvals date*/
	/* Start here*/
	var sanctionedRefType = document.getElementById('sanctionedRefType').value;
	var refNumber = document.getElementById('refNumber').value;
	var dateOfApproval = document.getElementById('dateOfApproval').value;
	
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
		document.priceApprovalMain.refNumber.focus();
		flag = 1;
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


var priceid =  document.priceApprovalMain.priceid.value;
//alert(priceid);

	if(error!="")
	{
		alert(error);
		return;
	}
		var recommendation = document.priceApprovalMain.recommendation.value;
		var req = document.priceApprovalMain.req.value;

			recommendation = recommendation.replace(/^\s+|\s+$/g,'');
			req = req.replace(/^\s+|\s+$/g,'');
		document.priceApprovalMain.recommendation.value= recommendation;
		document.priceApprovalMain.req.value= req;

			document.priceApprovalMain.action = "common/updateBncSubmit.jsp?priceid="+priceid;
			document.priceApprovalMain.submit();
}


function spaceAlert(field)
{

	//var f = field;
    if (field.match(/\s/g,"")) {
        alert("Blank spaces are not allowed in any numeric field");
        return false;
    }
	if(field.indexOf(".")>-1)
		{
				//document.priceApprovalMain.requestedBy7.focus();
				 alert("Negotiated value cannot be in decimal format");
				//return;
		}
}


function hideShowMsg() {
	//alert(document.priceApprovalMain.requestedBy7.value);
	
	
	if(document.priceApprovalMain.requestedBy7.value <=1999999)
		{
		//alert("ghjghjgj");
			document.getElementById("negval").style.visibility = "hidden";
		}
	if((document.priceApprovalMain.company.value == 1033 || document.priceApprovalMain.company.value == 1501 || document.priceApprovalMain.company.value == 1005 || document.priceApprovalMain.company.value == 1006) && document.priceApprovalMain.requestedBy7.value <= 50000000)
		{
		//alert("testpranita");
			document.getElementById("negval").style.visibility = "visible";
		}

	else
		{
		document.getElementById("negval").style.visibility = "visible";
		}
}


function changeApprover()
{
var priceid =  document.delegateAdmin.priceid.value;



	var remarks = document.delegateAdmin.remarksContainer.value;

	remarks = remarks.replace(/^\s+|\s+$/g,'');
	if(isEmpty(remarks.length))
	{	
		document.delegateAdmin.remarksContainer.focus();
		 alert("Please enter remarks");
		 return;
	}else{
		
			document.delegateAdmin.app1.disabled=false;
			document.delegateAdmin.app4.disabled=false;
			document.delegateAdmin.app7.disabled=false;
			document.delegateAdmin.app2.disabled=false;
			document.delegateAdmin.app5.disabled=false;
			document.delegateAdmin.app8.disabled=false;
			document.delegateAdmin.app11.disabled=false;
			document.delegateAdmin.app12.disabled=false;
			document.delegateAdmin.app3.disabled=false;
			document.delegateAdmin.app6.disabled=false;
			document.delegateAdmin.app9.disabled=false;
			document.delegateAdmin.app10.disabled=false;
			document.delegateAdmin.select12.disabled=false;
			document.delegateAdmin.select13.disabled=false;
			document.delegateAdmin.select14.disabled=false;
			document.delegateAdmin.select15.disabled=false;
			document.delegateAdmin.select16.disabled=false;

			document.delegateAdmin.remarksContainer.value=remarks;

			document.delegateAdmin.action = "common/delegateAdminSubmit.jsp?priceid="+priceid;
			document.delegateAdmin.submit();
	}
}



function delegateAdminPage(priceId,userOId)
{     
	window.open('../delegateAdmin.jsp?priceId='+priceId+'&userOId='+userOId,'','resizable=no,scrollbars=yes,toolbars=no,status=yes,resizable=no,scrollbars=yes,toolbars=no,status=yes,width=1300,height=550,top=20,left=30');
}


function arthaDisable(){
	//alert("abcddddddddddd");
	if(document.priceApprovalMain.company.value ==1033 )

	{
		//alert("abc1");
		document.priceApprovalMain.app2.disabled=true;
		document.priceApprovalMain.app5.disabled=true;
		document.priceApprovalMain.app8.disabled=true;
		document.priceApprovalMain.app3.disabled=true;
		document.priceApprovalMain.app6.disabled=true;
		document.priceApprovalMain.app9.disabled=true;
		document.priceApprovalMain.app10.disabled=true;
		document.priceApprovalMain.app11.disabled=true;
		document.priceApprovalMain.app12.disabled=true;
		
		document.priceApprovalMain.select14.disabled=false;
		document.priceApprovalMain.select15.disabled=true;
		document.priceApprovalMain.select16.disabled=true;
		//alert("abc");

	}else if(document.priceApprovalMain.company.value ==1501 || document.priceApprovalMain.company.value ==1005 || document.priceApprovalMain.company.value ==1006)

	{
		
		document.priceApprovalMain.app1.disabled=true;
		document.priceApprovalMain.app2.disabled=true;
		document.priceApprovalMain.app3.disabled=true;
		document.priceApprovalMain.app4.disabled=true;
		document.priceApprovalMain.app10.disabled=true;
		document.priceApprovalMain.app11.disabled=true;
		//document.priceApprovalMain.app12.disabled=true;
		document.priceApprovalMain.app12.disabled=false;
		document.priceApprovalMain.app5.disabled=true;
		document.priceApprovalMain.app6.disabled=true;		
		document.priceApprovalMain.select15.disabled=true;
		document.priceApprovalMain.select16.disabled=true;
		

	}

	else
	{
		document.priceApprovalMain.app1.disabled=false;
		document.priceApprovalMain.app2.disabled=false;
		document.priceApprovalMain.app3.disabled=false;
		document.priceApprovalMain.app4.disabled=false;
		document.priceApprovalMain.app5.disabled=false;
		document.priceApprovalMain.app6.disabled=false;
		document.priceApprovalMain.app8.disabled=false;
		document.priceApprovalMain.app9.disabled=false;
		document.priceApprovalMain.app10.disabled=false;		
		document.priceApprovalMain.app11.disabled=false;
		document.priceApprovalMain.app12.disabled=false;

		document.priceApprovalMain.select14.disabled=true;
		document.priceApprovalMain.select15.disabled=false;
		document.priceApprovalMain.select16.disabled=false;
	}
		
		
}

function changeApproverSec(){
	var opt = document.getElementById("category");
	var selectedValue = opt.options[opt.selectedIndex].value;
	var company				= document.getElementById('company').value;
	if(selectedValue == "Group Company related buying"){
		
		randome = Math.random();
		loadCustomFragment('createRequest.jsp?randome='+randome+'&company='+company+'&opt=9','showRequests','Showing All Fields');
	}else if(selectedValue == "Projects" ){
		
		randome = Math.random();
		loadCustomFragment('createRequest.jsp?randome='+randome+'&company='+company+'&opt=7','showRequests','Showing All Fields');
	}else if(selectedValue == "IT buying" ){
		
		randome = Math.random();
		loadCustomFragment('createRequest.jsp?randome='+randome+'&company='+company+'&opt=3','showRequests','Showing All Fields');
	}else{
		var index;
		
		/*if(selectedValue == "IBO"){
			index = 1;
		}else if(selectedValue == "Capex"){
			index = 2;
		}else if(selectedValue == "IT buying"){
			index = 3;
		}else if(selectedValue == "Consumables"){
			index = 4;
		}else if(selectedValue == "Insurance"){
			index = 5;
		}else if(selectedValue == "Non conventional category"){
			index = 6;
		}else if(selectedValue == "Projects"){
			index = 7;
		}else if(selectedValue == "OSP"){
			index = 8;
		}else if(selectedValue == "Logistics"){
			index = 10;
		}*/

		if(selectedValue == "IBO"){
			index = 1;
		}else if(selectedValue == "Capex"){
			index = 2;
		}else if(selectedValue == "Consumables"){
			index = 4;
		}else if(selectedValue == "Insurance"){
			index = 5;
		}else if(selectedValue == "Non conventional category"){
			index = 6;
		}else if(selectedValue == "OSP"){
			index = 8;
		}else if(selectedValue == "Logistics"){
			index = 10;
		}else if(selectedValue == "TTN-IBO"){
			index = 11;
		}else if(selectedValue == "TTN-Capex"){
			index = 12;
		}else if(selectedValue == "TTN-Consumables"){
			index = 14;
		}else if(selectedValue == "TTN-Insurance"){
			index = 15;
		}else if(selectedValue == "TTN-Non conventional category"){
			index = 16;
		}else if(selectedValue == "TTN-OSP"){
			index = 18;
		}else if(selectedValue == "TTN-Logistics"){
			index = 20;
		}else if(selectedValue == "TTN-IT buying"){
			index = 13;
		}else if(selectedValue == "TTN-Projects"){
			index = 17;
		}else if(selectedValue == "TTN-Group Company related buying"){
			index = 19;
		}
		loadCustomFragment('createRequest.jsp?randome='+randome+'&company='+company+'&opt='+index,'showRequests','Showing All Fields');
	}
	

	
}

function loadCustomFragment(fragment_url, element_id, for_what) {
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
	var processingRequest = '<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="table table-bordered table-hover"><img src="../images/loading.gif" valign="absmiddle">&nbsp;&nbsp;'
	+ for_what + ' Loading...</span></div></td></tr></table>';
	//$("#"+element_id).html(processingRequest);
	element.innerHTML = processingRequest;
	try {
		xmlhttp.open("GET", fragment_url);
		xmlhttp.onreadystatechange = function(){
				 
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var gotresponse = xmlhttp.responseText;
				message = gotresponse;
				//alert(message);
				//$("#"+element_id).html(message);
				element.innerHTML = message;
				
				
			}
		}
		xmlhttp.send(null);
		
		doSome();
		
	}// display an error in case of failure
	catch (e) {
		alert("Can't connect to server:\n" + e.toString());
		
	}
	
}

function doSome(){setTimeout(function(){
			project();
			freezcpx();
			setSelectedIndex();
		},1000)}


function attachmentFile(attachDetails, str,formName,priceId){			
	var url	= "../uploadMD/uploadFile.jsp?attachment="+attachDetails+"&str="+str+"&formName="+formName+"&priceId="+priceId;
	window.open(url,"File","width=600,height=165,resizable=yes,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");	
}


function onLoadDetail(str,formName,priceId){
	//alert("ooo");
	//alert("str..."+str);
	//alert("formName..."+formName); 
	if(str == '0'){
		//alert("hhhhhh..."+formName);
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment("../common/dirListingMD.jsp?attachment=additional&str="+str+"&formName="+formName+"&priceId="+priceId,"attachment1","Attachment");
	}else 	{
		//alert("nnnnn..."+formName);
	//	loadFragment("../common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment("../common/dirListingMD.jsp?attachment=additional&str=1&formName="+formName+"&priceId="+priceId,"attachment1","Attachment");
	}
}


