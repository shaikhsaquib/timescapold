function showMyCols(){
	
	frmObj = document.frmCreateRequest;
	
	if(frmObj.gatePassType[1].checked){

			gatePassType=frmObj.gatePassType[1].value;
			document.getElementById("showThisDate").style.display = 'none';
	}else{
			gatePassType="";
			document.getElementById("showThisDate").style.display = 'block';
	}

	ownership = frmObj.ownership.value;
	itemCategory = frmObj.itemCategory.value;


	if(gatePassType=="N" && ownership=="Company's Own" && itemCategory=="Capital Item"){

		cells = document.getElementsByName("showThis");
		for(j = 0; j < cells.length; j++){
			cells[j].style.display = 'block';
		}

	}else{

		cells = document.getElementsByName("showThis");

		for(j = 0; j < cells.length; j++) {
			cells[j].style.display = 'none';
		}
	}
}

function hideCols(){
	//frmObj = document.frmCreateRequest;

	cells = document.getElementsByName("showThis");

	for(j = 0; j < cells.length; j++) {
		cells[j].style.display = 'block';
	}

	document.getElementById("showThisDate").style.display = 'block';
}

function showMyeditCols(){
	
	frmObj = document.frmEditRequest;
	
	type = frmObj.reqType.value;

	if(frmObj.gatePassType[1].checked){

			gatePassType=frmObj.gatePassType[1].value;
		//	alert(gatePassType);
			document.getElementById("showThisDate").style.display = 'none';
	}else{
			gatePassType="";
			document.getElementById("showThisDate").style.display = 'block';
	} 

	
	ownership = frmObj.ownership.value;
	itemCategory = frmObj.itemCategory.value;
	
	
	if(gatePassType=="N" && ownership=="Company's Own" && itemCategory=="Capital Item"){

		cells = document.getElementsByName("showThis");
		for(j = 0; j < cells.length; j++){
			cells[j].style.display = 'block';
		}

	}else{

		cells = document.getElementsByName("showThis");

		for(j = 0; j < cells.length; j++) {
			cells[j].style.display = 'none';
		}
		}
}

function hideEditCols(){

	cells = document.getElementsByName("showThis");

	for(j = 0; j < cells.length; j++) {
		cells[j].style.display = 'none';
	}

	document.getElementById("showThisDate").style.display = 'block';
}


function clearMyForm()
{	
	frmObj = document.frmCreateRequest;
	frmObj.reset();
}

function validate()
{	
	var valid;
	var val;
	var monthName = new Array( "0", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	

	gatePassType = document.getElementsByName("gatePassType");

	if(!gatePassType[0].checked && !gatePassType[1].checked ){
		alert("Please select the gatepass type!!");
		return;
	}
	
	gatepassValue = gatePassType[0].checked ? "R" : "N";

	frmObj = document.frmCreateRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var alfa = "abcdefghijklmnopqrstuvwxyz";
//	var allowNum = "0123456789.";
	//checkNull();

	val = frmObj.fromAddress.value;
	valid = checkNull("From Address",val);
	if(!valid){
		frmObj.fromAddress.focus();
		return;
	}

	/*--------------Party's Name Field check begins------*/
	  
	  val = frmObj.partyName.value;
	  valid = checkNull("party Name",val);
	if(!valid){
		frmObj.partyName.focus();
		return;
	}
	
	valid = checkJunk("party Name", val);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}

	valid = checkNum("party Name", val, num);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}
	
/*--------------Party's Name Field check ends--------------*/


/*--------------Party's Address Field check begins------*/
	  
	val = frmObj.partyAddress.value;
	valid = checkNull("party Address",val);
	if(!valid){
		frmObj.partyAddress.focus();
		return;
	}
	
	/*
	valid = checkJunk("partyAddress", val);
	if(!valid){
		frmObj.partyAddress.focus();
		frmObj.partyAddress.value = "";
		return;
	}
	*/

/*--------------Party's Address Field check ends--------------*/

	

/*--------------Represented By Field check begins------*/
	  
	  val = frmObj.partyPersonName.value;
	  valid = checkNull("party Person Name",val);
	if(!valid){
		frmObj.partyPersonName.focus();
		return;
	}
	
	valid = checkJunk("party Person Name", val);
	if(!valid){
		frmObj.partyPersonName.focus();
		frmObj.partyPersonName.value = "";
		return;
	}

	valid = checkNum("party Person Name", val, num);
	if(!valid){
		frmObj.partyPersonName.focus();
		frmObj.partyPersonName.value = "";
		return;
	}
	
/*--------------Represented By Field check ends--------------*/

/*--------------Mobile number Dropdown check begins------*/

	var mobileNumber= frmObj.mobileNumber.value;

	valid = checkNull("mobile Number",mobileNumber);

	if(!valid){
		frmObj.mobileNumber.focus();
		return;
	}

	valid = checkChar("mobile Number", mobileNumber, alfa);
	if(!valid){
		frmObj.mobileNumber.focus();
		frmObj.mobileNumber.value = "";
		return;
	}

/*--------------Mobile number check ends--------------*/

/*--------------Vehicle number Dropdown check begins------*/

	/*var vehicleNumber= frmObj.vehicleNumber.value;

	valid = checkNull("vehicle Number",vehicleNumber);

	if(!valid){
		frmObj.vehicleNumber.focus();
		return;
	}

	valid = checkChar("vehicle Number", vehicleNumber, alfa);
	if(!valid){
		frmObj.vehicleNumber.focus();
		frmObj.vehicleNumber.value = "";
		return;
	}*/

/*--------------Vehicle number check ends--------------*/


/*--------------Ownership Dropdown check begins------*/

	var ownership= frmObj.ownership.value;

	if(ownership=="0"){
		alert("Please select Ownership!!");
		frmObj.ownership.focus();
		return;
	
	}

/*--------------Ownership Dropdown check ends--------------*/



/*--------------Item Category Dropdown check begins------*/

	var itemCategory= frmObj.itemCategory.value;

	if(itemCategory=="0"){
		alert("Please select Item Category !!");
		frmObj.itemCategory.focus();
		return;
	
	}

/*--------------Item Category Dropdown check ends--------------*/

	//returnDate = trim(frmObj.returnDate.value);
	
	returnDate		= frmObj.returnDate.value;
	currentSysdate		= frmObj.currentSysdate.value;
	
	fromDate	=	dateFormat(currentSysdate);//new Date();
	fmtToDate 	=  dateFormat(returnDate);
	
	dayDiff = validatePeriod(fromDate, fmtToDate);
	if(dayDiff > 365)
	{
		alert("Return Date cannot be greater than 365 days !!");
		frmObj.returnDate.focus();
		return;
	}
		
	if(gatepassValue=='R' && returnDate==''){

		alert("Please select the Probable Date of Return!!");
		frmObj.returnDate.focus();
		return;
	
	}

	materialDesc = document.getElementsByName("materialDesc");
	quantity = document.getElementsByName("quantity");
	remarks = document.getElementsByName("remarks");


	transferNoteNo = document.getElementsByName("transferNoteNo");
	assetransferdate = document.getElementsByName("assetransferdate");
	locations = document.getElementsByName("location");

	flag = 0;

	for(j = 0; j < materialDesc.length; j++) {

		if(trim(materialDesc[j].value)!=''){

			flag++;

			if(trim(quantity[j].value)=='' || trim(remarks[j].value)=='' ){

				alert("Please fill the values in a respective row!!");
				materialDesc[j].focus();
				return;
			}

			if(gatepassValue=="N" && ownership=="Company's Own" && itemCategory=="Capital Item"){
			
				if(trim(transferNoteNo[j].value)=='' || trim(assetransferdate[j].value)==''|| locations[j].value=='0'){
					alert("Please fill the values in a respective row!!");
					materialDesc[j].focus();
					return;
				}
			}
		}
	}

	if(flag==0)
	{
		alert("Please enter at least one material details!");
		materialDesc[0].focus();
		return;
	}


	
/*--------------Authorised By Dropdown check begins------*/

	var authorisedBy= frmObj.authorisedBy.value;
	//alert(authorisedBy);
	var reviewedBy= frmObj.reviewedBy.value;

	var reviewerOptList= frmObj.reviewerOptList.value;
	//alert(reviewedBy);

	if(authorisedBy=="0"){
		alert("Please select Authorised By !!");
		frmObj.authorisedBy.focus();
		return;
	
	}

	
	if(reviewerOptList == "Y" && reviewedBy=="0"){
	alert("Please select Recommender emailId !!");
		frmObj.reviewedBy.focus();
		return;
	}

	if(authorisedBy == reviewedBy)
	{
		alert("'Recommended By' and 'Authorised By' Should Be Different!!");
		frmObj.reviewedBy.focus();
		return;
	}


/*--------------Authorised By Dropdown check ends--------------*/


/*--------------Reviewed By Dropdown check begins------*/

	
	/*if(reviewedBy=="0"){
		alert("Please select Reviewed By !!");
		frmObj.reviewedBy.focus();
		return;
	
	}*/

	

/*--------------Reviewed By Dropdown check ends--------------*/

	frmObj.action = "../user/createRequestSubmit.jsp";
	frmObj.submit();
}



function onClickCheck(rows)
{
	frmObj = document.frmViewRequests;
	
 // alert(rows);
  var count= 0;
  var val1= 0;

  var count1= 0;
  var val2= 0;

  var count2= 0;

  for (var ii=0; ii < rows; ii++)
      {
		if(rows=='1')
		  {
			
			 var quanReturn = frmObj.quantityReturn.value;
			 
			 var quantity = frmObj.quantity.value;
			
			 count = parseInt(frmObj.quantity.value);
			 
			 count1 = parseInt(frmObj.quantityReturn.value);

			 if(quanReturn!="" ){
						var result = quantity - quanReturn;
						
						document.getElementById("pendingQuantity" + ii).value = result;
						document.getElementById("quantityReturn1" +ii).value = quanReturn;
						/*if(result==0){
						document.getElementById("securityRemarks" +ii).disabled = true;
						}*/
						 }

			 if(quanReturn > quantity){
				   alert("Quantity Retun cannot be greater than Quantity");
				   frmObj.quanReturn.focus();
				   return;
					}
		  }
		  else{
			 
					var quanReturn = frmObj.quantityReturn[ii].value;

					var quantity = frmObj.quantity[ii].value;

					//alert("AAA"+quantity);
					

					val1 = parseInt(frmObj.quantity[ii].value);
					
					count = val1+count;

					val2 = parseInt(frmObj.quantityReturn[ii].value);

					count1 = val2+count1;

					if(quanReturn!="" ){
					var result = parseInt(quantity) - parseInt(quanReturn);

					document.getElementById("pendingQuantity" + ii).value = result;

					document.getElementById("quantityReturn1" +ii).value = quanReturn;

					/*if(result==0){
						document.getElementById("securityRemarks" +ii).disabled = true;
						}*/
						 }

				   if(parseInt(quanReturn) > parseInt(quantity)){
				   alert("Quantity Retun cannot be greater than Quantity");
				   frmObj.quanReturn.focus();
				   return;
					}
				}
	
	  }

	  document.getElementById("totalQuantity").value = count;
	  

	  document.getElementById("totalReturnQuan").value = count1;

	   var totalQuantity = parseInt(frmObj.totalQuantity.value);

	   var  totalReturnQuan = parseInt(frmObj.totalReturnQuan.value);

	   count2 = totalQuantity - totalReturnQuan;

	   document.getElementById("totalPendingQuan").value = count2;
   
}

function validateEditRequest()
{	
	var valid;
	var val;
	var monthName = new Array( "0", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
	

	gatePassType = document.getElementsByName("gatePassType");

	if(!gatePassType[0].checked && !gatePassType[1].checked ){
		alert("Please select the gatepass type!!");
		return;
	}
	
	gatepassValue = gatePassType[0].checked ? "R" : "N";

	frmObj = document.frmEditRequest;
	var junk = "@!~+%<>?`;:#$%^&*()=|[]{}/\\";
	var num = "0123456789";
	var alfa = "abcdefghijklmnopqrstuvwxyz";
//	var allowNum = "0123456789.";
	//checkNull();

	val = frmObj.fromAddress.value;
	valid = checkNull("From Address",val);
	if(!valid){
		frmObj.fromAddress.focus();
		return;
	}

	/*--------------Party's Name Field check begins------*/
	  
	  val = frmObj.partyName.value;
	  valid = checkNull("party Name",val);
	if(!valid){
		frmObj.partyName.focus();
		return;
	}
	
	valid = checkJunk("party Name", val);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}

	valid = checkNum("party Name", val, num);
	
	if(!valid){
		frmObj.partyName.focus();
		//frmObj.partyName.value = "";
		return;
	}
	
/*--------------Party's Name Field check ends--------------*/


/*--------------Party's Address Field check begins------*/
	  
	val = frmObj.partyToAddress.value;
	valid = checkNull("party To Address",val);
	if(!valid){
		frmObj.partyToAddress.focus();
		return;
	}
	
	/*
	valid = checkJunk("partyAddress", val);
	if(!valid){
		frmObj.partyAddress.focus();
		frmObj.partyAddress.value = "";
		return;
	}
	*/

/*--------------Party's Address Field check ends--------------*/

	

/*--------------Represented By Field check begins------*/
	  
	  val = frmObj.partyPersonName.value;
	  valid = checkNull("party Person Name",val);
	if(!valid){
		frmObj.partyPersonName.focus();
		return;
	}
	
	valid = checkJunk("party Person Name", val);
	if(!valid){
		frmObj.partyPersonName.focus();
		frmObj.partyPersonName.value = "";
		return;
	}

	valid = checkNum("party Person Name", val, num);
	if(!valid){
		frmObj.partyPersonName.focus();
		frmObj.partyPersonName.value = "";
		return;
	}
	
/*--------------Represented By Field check ends--------------*/

/*--------------Mobile number Dropdown check begins------*/

	var mobileNumber= frmObj.mobileNumber.value;
	
	valid = checkNull("mobile Number",mobileNumber);

	if(!valid){
		frmObj.mobileNumber.focus();
		return;
	}

	valid = checkChar("mobile Number", mobileNumber, alfa);
	if(!valid){
		frmObj.mobileNumber.focus();
		frmObj.mobileNumber.value = "";
		return;
	}

/*--------------Mobile number check ends--------------*/



/*--------------Ownership Dropdown check begins------*/

	var ownership= frmObj.ownership.value;

	if(ownership=="0"){
		alert("Please select Ownership!!");
		frmObj.ownership.focus();
		return;
	
	}

/*--------------Ownership Dropdown check ends--------------*/



/*--------------Item Category Dropdown check begins------*/

	var itemCategory= frmObj.itemCategory.value;

	if(itemCategory=="0"){
		alert("Please select Item Category !!");
		frmObj.itemCategory.focus();
		return;
	
	}

/*--------------Item Category Dropdown check ends--------------*/

	//returnDate = trim(frmObj.returnDate.value);
	
	returnDate		= frmObj.returnDate.value;
	currentSysdate		= frmObj.currentSysdate.value;
	
	fromDate	=	dateFormat(currentSysdate);//new Date();
	fmtToDate 	=  dateFormat(returnDate);
	
	dayDiff = validatePeriod(fromDate, fmtToDate);

	if(dayDiff > 365 && gatepassValue=='R')
	{
		alert("Return Date cannot be greater than 365 days !!");
		frmObj.returnDate.focus();
		return;
	}
		
	if(gatepassValue=='R' && returnDate==''){

		alert("Please select the Probable Date of Return!!");
		frmObj.returnDate.focus();
		return;
	
	}

	materialDesc = document.getElementsByName("materialDesc");
	quantity = document.getElementsByName("quantity");
	remarks = document.getElementsByName("remarks");


	transferNoteNo = document.getElementsByName("transferNoteNo");
	assetransferdate = document.getElementsByName("assetransferdate");
	locations = document.getElementsByName("location");

	flag = 0;

	for(j = 0; j < materialDesc.length; j++) {

		if(trim(materialDesc[j].value)!=''){

			flag++;

			if(trim(quantity[j].value)=='' || trim(remarks[j].value)=='' ){

				alert("Please fill the values in a respective row!!");
				materialDesc[j].focus();
				return;
			}

			if(gatepassValue=="N" && ownership=="Company's Own" && itemCategory=="Capital Item"){
			
				if(trim(transferNoteNo[j].value)=='' || trim(assetransferdate[j].value)==''|| locations[j].value=='0'){
					alert("Please fill the values in a respective row!!");
					materialDesc[j].focus();
					return;
				}
			}
		}
	}

	if(flag==0)
	{
		alert("Please enter at least one material details!");
		materialDesc[0].focus();
		return;
	}


	
/*--------------Authorised By Dropdown check begins------*/

	var authorisedBy= frmObj.authorisedBy.value;
	//alert(authorisedBy);
	var reviewedBy= frmObj.reviewedBy.value;

	var reviewerOptList= frmObj.reviewerOptList.value;
	//alert(reviewedBy);

	if(authorisedBy=="0"){
		alert("Please select Authorised By !!");
		frmObj.authorisedBy.focus();
		return;
	
	}

	
	if(reviewerOptList == "Y" && reviewedBy=="0"){
	alert("Please select Recommender emailId !!");
		frmObj.reviewedBy.focus();
		return;
	}

	if(authorisedBy == reviewedBy)
	{
		alert("'Recommended By' and 'Authorised By' Should Be Different!!");
		frmObj.reviewedBy.focus();
		return;
	}


	frmObj.action = "../user/editRequestSubmit.jsp";
	frmObj.submit();
}


function reviewEditRequest()
{
	frmObj = document.frmViewRequests;
	
	var reviewedBy= frmObj.reviewedBy.value;
	
	var authorisedBy= frmObj.authorisedBy.value;

	if(authorisedBy=="0")
	{
		alert("Please select Authorised By !!");
		frmObj.authorisedBy.focus();
		return;
		
	}

	if(authorisedBy == reviewedBy)
	{
		alert("'Recommended By' and 'Authorised By' Should Be Different!!");
		frmObj.authorisedBy.focus();
		return;
	}

	frmObj.action = "../user/editReviewRequestSubmit.jsp";
	frmObj.submit();
}
function validatePeriod(date1, date2) {

    // The number of milliseconds in one day
    var ONE_DAY = 1000 * 60 * 60 * 24;

    // Convert both dates to milliseconds
    var date1_ms = date1.getTime();
    var date2_ms = date2.getTime();
    // Calculate the difference in milliseconds
	//alert(date1_ms);
	//alert(date2_ms);
    var difference_ms = Math.abs(date1_ms - date2_ms);
	//alert(difference_ms);
    // Convert back to days and return
    return Math.round(difference_ms/ONE_DAY)
}


function getDataOnClick(outWardNumber,gatepassValue){

	frmObj = document.frmCreateRequest;

	if(outWardNumber == "0")
	{
					
	loadURL("../user/viewOutwardRefNumber.jsp?outReferenceNum="+outWardNumber+"&gatepassValue="+gatepassValue, "showRequests", "Requests");

	}

	cells = document.getElementsByName("showThis");

	for(j = 0; j < cells.length; j++) {
		cells[j].style.display = 'block';
	}

	//document.getElementById("showThisDate").style.display = 'none';
	
}

function getData()
{

	frmObj = document.frmCreateRequest;
	
	var alfa = "abcdefghijklmnopqrstuvwxyz";

	gatePassType = document.getElementsByName("gatePassType");

	gatepassValue = gatePassType[0].checked ? "R" : "N";

	outWardNumber = frmObj.outReferenceNum.value;

	//alert("outReferenceNum----"+outWardNumber);

	//alert("gatepassValue----"+gatepassValue);

	if(outWardNumber == '' || outWardNumber == 0)
	{
		alert("Please select the Outward Number!!");
		frmObj.outReferenceNum.focus();
		return;
	
	}	

	valid = checkChar("Outward Number", outWardNumber, alfa);

	if(!valid)
	{
		frmObj.outReferenceNum.focus();
		frmObj.outReferenceNum.value = "0";
		return;
	}
	
	loadURL("../user/viewOutwardRefNumber.jsp?outReferenceNum="+outWardNumber+"&gatepassValue="+gatepassValue, "showRequests", "Requests");

}

function loadURL(fragment_url, element_id, for_what){

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

	processingRequest='<table width="100%" height="100%"><tr><td align="center"><div align="center"><span class="style3"><img src="../images/loading.gif" >&nbsp;&nbsp;'+for_what+' Loading...</span></div></td></tr></table>';
       
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
