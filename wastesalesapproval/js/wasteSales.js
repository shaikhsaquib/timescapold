function validate(status,frmName,id) {
	//var frmObj = eval("document.forms."+frmName);
	eval("document.getElementById('"+id+"')").disabled = true;
	var frmObj = eval("document."+frmName);
	var alfa = "abcdefghijklmnopqrstuvwxyz";
	var sign = "+-";

	var reference	 = document.getElementById("reference").value;
	var wsaPeriod = document.getElementById("wsaPeriod");
	var  selPeriod ="";
	var valid;
	var url;

	for (var i = 0; i < wsaPeriod.length; i++){
		if(wsaPeriod[i].selected == true)	{			
			selPeriod = wsaPeriod[i].value+","+selPeriod;			
		}
	}
	
	var createdDate = document.getElementById("createdDate").value;	
	/*if (document.getElementById("createdDate").disabled == true){
		document.getElementById("createdDate").disabled=false;	
		createdDate = document.getElementById("createdDate").value;	
	}	*/

	var realisationHeaderOnQurter = document.getElementById("realisationHeaderOnQurter").value;
	var branch	= document.getElementById("branch").value;

	var headerRealisation	= document.getElementById("headerRealisation").value;

	var headerRealisationOnQnty = document.getElementById('realisationHeaderOnQurter').value; 
	var headerEstimatedReal	 = document.getElementById('realisationOnQnty').innerHTML; 
	var headerOnTopQurter = document.getElementById('headerOnTopQurter').value;
	var headerRealisationOnQnty = document.getElementById('estimatedReal').innerHTML; 
	var previousRealisation = document.getElementById("previousRealisation").value;
	var currentRealisation	= document.getElementById("currentRealisation").value; 
	var IncreaseRealisation  = document.getElementById("IncreaseRealisation").value; 
	
	selPeriod  = headerRealisationOnQnty;
	
	var PeriodRate1 = document.getElementById('PeriodRate4').value;;
	var PeriodRate2 = document.getElementById('PeriodRate3').value;
	var PeriodRate3 = document.getElementById('PeriodRate2').value;
	var PeriodRate4 = document.getElementById('PeriodRate1').value;

	
	var currPeriodRate5 = document.getElementById('currPeriodRate').innerHTML;
	
	var pwmQ1FinalRate	= document.getElementById("field1").value; 

	if (isNaN(pwmQ1FinalRate) || pwmQ1FinalRate==""){
		pwmQ1FinalRate="0.00";	
	}

	var pwmQ1FinalRate1 = parseFloat(pwmQ1FinalRate).toFixed(2);
	document.getElementById("field1").value = pwmQ1FinalRate1;


	var pwmQ2FinalRate	= document.getElementById("field2").value; 

	if (isNaN(pwmQ2FinalRate) || pwmQ2FinalRate==""){
		pwmQ2FinalRate="0.00";	
	}

	var pwmQ2FinalRate1 = parseFloat(pwmQ2FinalRate).toFixed(2);
	document.getElementById("field2").value = pwmQ2FinalRate1;

	var pwmQ3FinalRate	= document.getElementById("field3").value;

	if (isNaN(pwmQ3FinalRate) || pwmQ3FinalRate==""){
		pwmQ3FinalRate="0.00";	
	}

	var pwmQ3FinalRate1 = parseFloat(pwmQ3FinalRate).toFixed(2);
	document.getElementById("field3").value = pwmQ3FinalRate1;

	var pwmQ4FinalRate	= document.getElementById("field4").value;

	if (isNaN(pwmQ4FinalRate) || pwmQ4FinalRate==""){
		pwmQ4FinalRate="0.00";	
	}

	var pwmQ4FinalRate1 = parseFloat(pwmQ4FinalRate).toFixed(2);
	document.getElementById("field4").value = pwmQ4FinalRate1;

	var pwmQ5FinalRate	= document.getElementById("field5").value; 

	if (isNaN(pwmQ5FinalRate) || pwmQ5FinalRate==""){
		pwmQ5FinalRate="0.00";	
	}

	var pwmQ5FinalRate1 = parseFloat(pwmQ5FinalRate).toFixed(2);
	document.getElementById("field5").value = pwmQ5FinalRate1;
	
	var pwmPercentFinalRate	= document.getElementById("finalPWM").value;
	
//	document.getElementById("finalPWM").disabled = false;	
	
	var towQ1FinalRate = document.getElementById("field6").value; 
	if (isNaN(towQ1FinalRate) || towQ1FinalRate==""){
		towQ1FinalRate="0.00";	
	}


	var towQ1FinalRate1 = parseFloat(towQ1FinalRate).toFixed(2);
	document.getElementById("field6").value = towQ1FinalRate1;

	var towQ2FinalRate = document.getElementById("field7").value;
	if (isNaN(towQ2FinalRate) || towQ2FinalRate==""){
		towQ2FinalRate="0.00";	
	}

	var towQ2FinalRate1 = parseFloat(towQ2FinalRate).toFixed(2);
	document.getElementById("field7").value = towQ2FinalRate1;

	var towQ3FinalRate = document.getElementById("field8").value;
	if (isNaN(towQ3FinalRate) || towQ3FinalRate==""){
		towQ3FinalRate="0.00";	
	}
	var towQ3FinalRate1 = parseFloat(towQ3FinalRate).toFixed(2);
	document.getElementById("field8").value = towQ3FinalRate1;

	var towQ4FinalRate = document.getElementById("field9").value; 
	if (isNaN(towQ4FinalRate) || towQ4FinalRate==""){
		towQ4FinalRate="0.00";	
	}
	var towQ4FinalRate1 = parseFloat(towQ4FinalRate).toFixed(2);
	document.getElementById("field9").value = towQ4FinalRate1;

	var towQ5FinalRate = document.getElementById("field10").value; 
	if (isNaN(towQ5FinalRate) || towQ5FinalRate==""){
		towQ5FinalRate="0.00";	
	}
	var towQ5FinalRate1 = parseFloat(towQ5FinalRate).toFixed(2);
	document.getElementById("field10").value = towQ5FinalRate1;
	
	var towPercentFinalRate	= document.getElementById("finalTOW").value; 
	
//	document.getElementById("finalTOW").disabled = false;	
	
	var rspQ1FinalRate 	= document.getElementById("field11").value;
	if (isNaN(rspQ1FinalRate) || rspQ1FinalRate==""){
		rspQ1FinalRate="0.00";	
	}
	var rspQ1FinalRate1 = parseFloat(rspQ1FinalRate).toFixed(2);
	document.getElementById("field11").value = rspQ1FinalRate1;

	var rspQ2FinalRate	= document.getElementById("field12").value;
	if (isNaN(rspQ2FinalRate) || rspQ2FinalRate==""){
		rspQ2FinalRate="0.00";	
	}
	var rspQ2FinalRate1 = parseFloat(rspQ2FinalRate).toFixed(2);
	document.getElementById("field12").value = rspQ2FinalRate1;

	var rspQ3FinalRate	= document.getElementById("field13").value;
	if (isNaN(rspQ3FinalRate) || rspQ3FinalRate==""){
		rspQ3FinalRate="0.00";	
	}
	var rspQ3FinalRate1 = parseFloat(rspQ3FinalRate).toFixed(2);
	document.getElementById("field13").value = rspQ3FinalRate1;

	var rspQ4FinalRate	= document.getElementById("field14").value;
	if (isNaN(rspQ4FinalRate) || rspQ4FinalRate==""){
		rspQ4FinalRate="0.00";	
	}
	var rspQ4FinalRate1 = parseFloat(rspQ4FinalRate).toFixed(2);
	document.getElementById("field14").value = rspQ4FinalRate1;

	var rspQ5FinalRate	= document.getElementById("field15").value;
	if (isNaN(rspQ5FinalRate) || rspQ5FinalRate==""){
		rspQ5FinalRate="0.00";	
	}
	var rspQ5FinalRate1 = parseFloat(rspQ5FinalRate).toFixed(2);
	document.getElementById("field15").value = rspQ5FinalRate1;
	
	var rspPercentFinalRate = document.getElementById("finalRSP").value;
	
	//document.getElementById("finalRSP").disabled = false;
	
	var psQ1FinalRate = document.getElementById("field16").value;
	if (isNaN(psQ1FinalRate) || psQ1FinalRate==""){
		psQ1FinalRate="0.00";	
	}
	var psQ1FinalRate1 = parseFloat(psQ1FinalRate).toFixed(2);
	document.getElementById("field16").value = psQ1FinalRate1;

	var psQ2FinalRate = document.getElementById("field17").value;
	if (isNaN(psQ2FinalRate) || psQ2FinalRate==""){
		psQ2FinalRate="0.00";	
	}
	var psQ2FinalRate1 = parseFloat(psQ2FinalRate).toFixed(2);
	document.getElementById("field17").value = psQ2FinalRate1;

	var psQ3FinalRate = document.getElementById("field18").value;

	if (isNaN(psQ3FinalRate) || psQ3FinalRate==""){
		psQ3FinalRate="0.00";	
	}
	var psQ3FinalRate1 = parseFloat(psQ3FinalRate).toFixed(2);
	document.getElementById("field18").value = psQ3FinalRate1;

	var psQ4FinalRate = document.getElementById("field19").value;

	if (isNaN(psQ4FinalRate) || psQ4FinalRate==""){
		psQ4FinalRate="0.00";	
	}

	var psQ4FinalRate1 = parseFloat(psQ4FinalRate).toFixed(2);
	document.getElementById("field19").value = psQ4FinalRate1;

	var psQ5FinalRate = document.getElementById("field20").value;

	if (isNaN(psQ5FinalRate) || psQ5FinalRate==""){
		psQ5FinalRate="0.00";	
	}

	var psQ5FinalRate1 = parseFloat(psQ5FinalRate).toFixed(2);
	document.getElementById("field20").value = psQ5FinalRate1;

	var psPercentFinalRate = document.getElementById("finalPS").value;
	
	//document.getElementById("finalPS").disabled = false;
	
	var apQ1FinalRate = document.getElementById("field21").value;
	if (isNaN(apQ1FinalRate) || apQ1FinalRate==""){
		apQ1FinalRate="0.00";	
	}

	var apQ1FinalRate1 = parseFloat(apQ1FinalRate).toFixed(2);
	document.getElementById("field21").value = apQ1FinalRate1;

	var apQ2FinalRate = document.getElementById("field22").value;
	if (isNaN(apQ2FinalRate) || apQ2FinalRate==""){
		apQ2FinalRate="0.00";	
	}
	var apQ2FinalRate1 = parseFloat(apQ2FinalRate).toFixed(2);
	document.getElementById("field22").value = apQ2FinalRate1;

	var apQ3FinalRate = document.getElementById("field23").value;
	if (isNaN(apQ3FinalRate) || apQ3FinalRate==""){
		apQ3FinalRate="0.00";	
	}
	var apQ3FinalRate1 = parseFloat(apQ3FinalRate).toFixed(2);
	document.getElementById("field23").value = apQ3FinalRate1;

	var apQ4FinalRate = document.getElementById("field24").value;
	if (isNaN(apQ4FinalRate) || apQ4FinalRate==""){
		apQ4FinalRate="0.00";	
	}
	var apQ4FinalRate1 = parseFloat(apQ4FinalRate).toFixed(2);
	document.getElementById("field24").value = apQ4FinalRate1;

	var apQ5FinalRate	= document.getElementById("field25").value;
	if (isNaN(apQ5FinalRate) || apQ5FinalRate==""){
		apQ5FinalRate="0.00";	
	}
	var apQ5FinalRate1 = parseFloat(apQ5FinalRate).toFixed(2);
	document.getElementById("field25").value = apQ5FinalRate1;

	
	var apPercentFinalRate	 = document.getElementById("finalAP").value;
	
	//document.getElementById("finalAP").disabled = false;
	
	var npRateQ1	 = document.getElementById("npRate1").value;
	var npRateQ2	 = document.getElementById("npRate2").value;
	var npRateQ3	 = document.getElementById("npRate3").value;
	var npRateQ4	 = document.getElementById("npRate4").value;
	var npRateQ5 = document.getElementById("npRate5").value;
	
	var npRateQ1Header	= document.getElementById('PeriodRate4').value;
	var npRateQ2Header	= document.getElementById('PeriodRate3').value;
	var npRateQ3Header	= document.getElementById('PeriodRate2').value;
	var npRateQ4Header	= document.getElementById('PeriodRate1').value;
	var npRateQ5Header	= document.getElementById('currPeriodRate').innerHTML;

	var pwmQ1Index	= document.getElementById("pwm1").value;
//	document.getElementById("pwm1").disabled = false;
	var pwmQ2Index	= document.getElementById("pwm2").value;
//	document.getElementById("pwm2").disabled = false;
	
	var pwmQ3Index	= document.getElementById("pwm3").value;
//	document.getElementById("pwm3").disabled = false;
	var pwmQ4Index	= document.getElementById("pwm4").value;
//	document.getElementById("pwm4").disabled = false;
	
	var pwmQ5Index	= document.getElementById("pwm5").value;
//	document.getElementById("pwm5").disabled = false;
	var towQ1Index	= document.getElementById("tow1").value;
//	document.getElementById("tow1").disabled = false;
	
	var towQ2Index	= document.getElementById("tow2").value;
//	document.getElementById("tow2").disabled = false;
	var towQ3Index	= document.getElementById("tow3").value;
//	document.getElementById("tow3").disabled = false;
	
	var towQ4Index = document.getElementById("tow4").value;
//	document.getElementById("tow4").disabled = false;
	var towQ5Index	= document.getElementById("tow5").value;
//	document.getElementById("tow5").disabled = false;
	
	var rspQ1Index = document.getElementById("resp1").value;
//	document.getElementById("resp1").disabled = false;
	var rspQ2Index	= document.getElementById("resp2").value;
//	document.getElementById("resp2").disabled = false;
	
	var rspQ3Index	= document.getElementById("resp3").value;
//	document.getElementById("resp3").disabled = false;
	var rspQ4Index	= document.getElementById("resp4").value;
//	document.getElementById("resp4").disabled = false;
	
	var rspQ5Index	= document.getElementById("resp5").value;
//	document.getElementById("resp5").disabled = false;
	var psQ1Index	= document.getElementById("ps1").value;
//	document.getElementById("ps1").disabled = false;
	
	var psQ2Index	= document.getElementById("ps2").value;
//	document.getElementById("ps2").disabled = false;
	var psQ3Index	= document.getElementById("ps3").value;
//	document.getElementById("ps3").disabled = false;
	
	var psQ4Index	= document.getElementById("ps4").value;
//	document.getElementById("ps4").disabled = false;
	var psQ5Index	= document.getElementById("ps5").value;
//	document.getElementById("ps5").disabled = false;
	
	var apQ1Index	= document.getElementById("ap1").value;
//	document.getElementById("ap1").disabled = false;
	var apQ2Index	= document.getElementById("ap2").value;
//	document.getElementById("ap2").disabled = false;
	
	var apQ3Index	= document.getElementById("ap3").value;
//	document.getElementById("ap3").disabled = false;
	var apQ4Index	= document.getElementById("ap4").value;
//	document.getElementById("ap4").disabled = false;
	
	var apQ5Index	= document.getElementById("ap5").value;
//	document.getElementById("ap5").disabled = false;

	var approvals	 = document.getElementById("zonalHeadEmailid").value;
	var highlightsForTender	= document.getElementById('editor').value;


	if(status == "inProcess" || status == "inReview"){
		
		stat = checkNull("Reference", reference);
		if(!stat){
			enable(id);
			document.getElementById('reference').focus();
			return;
		}
		stat = checkNull("Period", selPeriod);
		if(!stat){
			enable(id);
			document.getElementById('wsaPeriod').focus();
			return;
		}		
		stat = checkNull("Date", createdDate);
		if(!stat){
			enable(id);
			document.getElementById('createdDate').focus();
			return;
		}

		if(branch == '0'){
			alert("Please select Branch");
			document.getElementById('branch').focus();
			enable(id);
			return;
		}
		stat = checkNull("Branch", branch);
		if(!stat){
			document.getElementById('branch').focus();
			enable(id);
			return;
		}

		if(realisationHeaderOnQurter == '0' || realisationHeaderOnQurter == ''){
			alert("Please select Header realisation");
			document.getElementById('headerRealisation').focus();
			enable(id);
			return;
		}

		stat = checkNull("Header realisation Period", headerRealisation);
		if(!stat){
			document.getElementById('headerRealisation').focus();
			enable(id);
			return;
		}


		stat = checkNull("Previous Realisation", previousRealisation);
		if(!stat){
			document.getElementById('previousRealisation').focus();
			enable(id);
			return;
		}
		stat = checkNull("Current Realisation", currentRealisation);
		if(!stat){
			document.getElementById('currentRealisation').focus();
			enable(id);
			return;
		}

		if(PeriodRate1 == "-" || PeriodRate1 == "")
		{
			alert("Please select or enter Period.");
			document.getElementById('selPeriodRate3').focus();
			enable(id);
			return;

		}

		if(PeriodRate2 == "-" || PeriodRate2 == "")
		{
			alert("Please select or enter Period.");
			document.getElementById('selPeriodRate2').focus();
			enable(id);
			return;

		}

		if(PeriodRate3 == "-" || PeriodRate3 == "")
		{
			alert("Please select or enter Period.");
			document.getElementById('selPeriodRate1').focus();
			enable(id);
			return;

		}

		if(PeriodRate4 == "-" || PeriodRate4 == "")
		{
			alert("Please select or enter Period.");
			document.getElementById('selPeriodRate0').focus();
			enable(id);
			return;

		}


		for(var i = 1; i <26; i++){
			if(document.getElementById("field"+i).value == ""){
				alert("This field is required.")
				document.getElementById("field"+i).focus();
				enable(id);
				return;
			}

			var txtField=	document.getElementById("field"+i).value;
			valid = checkChar("Field", txtField, sign);
			if(!valid){
				document.getElementById("field"+i).focus();
				document.getElementById("field"+i).value = "";
				enable(id);
				return;
			}
		}

		valid = checkChar("NP Rate", npRateQ1, alfa);
		if(!valid){
			document.getElementById('npRate1').focus();
			document.getElementById('npRate1').value = "";
			enable(id);
			return;
		}
		stat = checkNull("NP Rate", npRateQ1);
		if(!stat)	{ 
			document.getElementById('npRate1').focus();
			enable(id);
			return;
		}
		valid = checkChar("NP Rate", npRateQ2, alfa);
		if(!valid){
			document.getElementById('npRate2').focus();
			document.getElementById('npRate2').value = "";
			enable(id);
			return;
		}
		stat = checkNull("NP Rate", npRateQ2);
		if(!stat){
			document.getElementById('npRate2').focus();
			enable(id);
			return;
		}
		valid = checkChar("NP Rate", npRateQ3, alfa);
		if(!valid){
			document.getElementById('npRate3').focus();
			document.getElementById('npRate3').value = "";
			enable(id);
			return;
		}
		stat = checkNull("NP Rate", npRateQ3);
		if(!stat){
			document.getElementById('npRate3').focus();
			enable(id);
			return;
		}
		valid = checkChar("NP Rate", npRateQ4, alfa);
		if(!valid){
			document.getElementById('npRate4').focus();
			document.getElementById('npRate4').value = "";
			enable(id);
			return;
		}
		stat = checkNull("NP Rate", npRateQ4);
		if(!stat){
			document.getElementById('npRate4').focus();
			enable(id);
			return;
		}
		valid = checkChar("NP Rate", npRateQ5, alfa);
		if(!valid){
			document.getElementById('npRate5').focus();
			document.getElementById('npRate5').value = "";
			enable(id);
			return;
		}
		stat = checkNull("NP Rate", npRateQ5);
		if(!stat){
			document.getElementById('npRate5').focus();
			enable(id);
			return;
		}
		if(approvals == '0'){
			alert("Please select Regional Head.");
			document.getElementById('zonalHeadEmailid').focus();
			enable(id);
			return;
		}
		stat = checkNull("highlights For Tender", highlightsForTender);
		if(!stat){
			document.getElementById('editor').focus();
			enable(id);
			return;
		}
		var hiddDirectoryCompulsarySize = document.getElementById("hiddDirectorySizecompulsory").value;
		//		alert("hiddDirectoryCompulsarySize--"+hiddDirectoryCompulsarySize);


		var hiddDirectoryAdditionalSize = document.getElementById("hiddDirectorySizeadditional").value;
		//alert("hiddDirectoryAdditionalSize--"+hiddDirectoryAdditionalSize);

		var compAttachmentName	 = "";
		if(hiddDirectoryCompulsarySize > '0'){
			for(ii=0; ii<hiddDirectoryCompulsarySize; ii++){
				compAttachmentName = document.getElementById('hiddFilesName1compulsory'+ii).value;
			}
		}else{
			alert("Please select atleast one Compulsory attachement.");
			enable(id);
			return;
		}
		if(hiddDirectoryAdditionalSize > '0'){
			for(ii=0; ii<hiddDirectoryAdditionalSize; ii++){
				addiAttachmentName	= document.getElementById('hiddFilesName1additional'+ii).value;
			}
		}
		if(status == "inProcess")
		{
			document.getElementById('frmAction').value = 'UI';

		}else if(status == "inReview"){

			document.getElementById('frmAction').value = 'I';
		}
	
		

	}else if(status == 'draft'){
			
		document.getElementById('frmAction').value = 'D';


		var valid = checkChar("NP Rate", npRateQ1, alfa);
		if(!valid){
			document.getElementById('npRate1').focus();
			document.getElementById('npRate1').value = "";
			enable(id);
			return;
		}

	
		valid = checkChar("NP Rate", npRateQ2, alfa);
		if(!valid){
			document.getElementById('npRate2').focus();
			document.getElementById('npRate2').value = "";
			enable(id);
			return;
		}
		
		valid = checkChar("NP Rate", npRateQ3, alfa);
		if(!valid){
			document.getElementById('npRate3').focus();
			document.getElementById('npRate3').value = "";
			enable(id);
			return;
		}
		
		valid = checkChar("NP Rate", npRateQ4, alfa);
		if(!valid){
			document.getElementById('npRate4').focus();
			document.getElementById('npRate4').value = "";
			enable(id);
			return;
		}
		
		valid = checkChar("NP Rate", npRateQ5, alfa);
		if(!valid){
			document.getElementById('npRate5').focus();
			document.getElementById('npRate5').value = "";
			enable(id);
			return;
		}

	}
	if(frmName == 'frmCreateWasteSalesProcess'){
		url = "../user/processWasteSalesSubmit.jsp";

	}else if(frmName == 'frmViewRequest'){

		if(status == 'inProcess'){
			var selPeriod1 = document.getElementById('headerOnTopQurter').value;
			if(selPeriod1 == "-" || selPeriod1 == "")
			{
				alert("Please select or enter Period.");
				document.getElementById('wsaPeriod').focus();
				enable(id);
				return;

			}else
			{
				document.getElementById('headerOnTopQurter').value  = headerEstimatedReal;		
			}
		}
		url = "../common/WSRequestDetailsSubmit.jsp";


	}

	frmObj.action = url;
	frmObj.submit( );
}

function enable(id)
{
	eval("document.getElementById('"+id+"')").disabled = false;
	return true;
}

function calRealisation(field1 ,field2 ,field3,field4) {

	var previousRealisation = document.getElementById(field1).value;
	var currentRealisation =   document.getElementById(field2).value;
	var res = "";
	var percentage = "0.00";
	var  midResult= "";

	if (isNaN(previousRealisation)){
		alert("Please enter only numbers .");
		document.getElementById(field1).value="0.00";
		document.getElementById(field1).focus();
		return ;
	}
	if (isNaN(currentRealisation)){
		alert("Please enter only numbers .");
		document.getElementById(field2).value="0.00";
		document.getElementById(field2).focus();
		return ;
	}	

	if(previousRealisation != '' && previousRealisation !=null && currentRealisation !='' && currentRealisation!=null){
		res = parseFloat(currentRealisation).toFixed(2) - parseFloat(previousRealisation).toFixed(2);		
		midResult =  res.toFixed(2) /  parseFloat(previousRealisation).toFixed(2) ;
		percentage =  midResult * 100;		

		if(field4 == 1){
			document.getElementById(field3).value =  (isNaN(  res.toFixed(2)) ? "0.00" :  res.toFixed(2)) + " ("+  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2))+ "%)";
		}else {
		document.getElementById(field3).value = (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));
		}
	}else {
		if(previousRealisation == '' || previousRealisation ==null ){
			previousRealisation = 0;
		}
		if(currentRealisation == '' || currentRealisation ==null ){
			currentRealisation = 0;
		}
		res = parseFloat(currentRealisation).toFixed(2) - parseFloat(previousRealisation).toFixed(2);
		midResult =  res.toFixed(2) /  parseFloat(previousRealisation).toFixed(2) ;
		percentage =  midResult.toFixed(2) * 100;
		if(field4==1){
			document.getElementById(field3).value =  (isNaN(  res.toFixed(2)) ? "0.00" :  res.toFixed(2)) + " ("+  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2))+ "%)";
		}else {
			document.getElementById(field3).value = (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));
			}
	}
}

function indexCal2(field1 ,field2,field3) {
	var index = "";
	var  percentage ="";
	var  midResult= "";
	var finalRate = document.getElementById(field1).value;
	var npRate =   document.getElementById(field2).value;


	if (isNaN(finalRate)){	
		document.getElementById(field1).value="0.00";
		document.getElementById(field1).focus();
		return ;
	}


	if (isNaN(npRate)){
		document.getElementById(field2).value="0.00";
		document.getElementById(field2).focus();
		return ;
	}	
	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(field3).value =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));

}

//function indexCal(field1 ,field2,field3,field4,field5 ,npValue,wasteValue1,wasteValue2,wasteValue3 ,wasteValue4,wasteValue5) {
function indexCal(field1 ,field2,field3,field4,field5 ,npValue,wasteValue1,wasteValue2,wasteValue3 ,wasteValue4) {
	
	var index = "";
	var  percentage ="";
	var  midResult= "";
	var finalRate = document.getElementById(field1).value;
	var npRate =   document.getElementById(npValue).value;

	if (isNaN(npRate)){
		alert("Please enter only numbers .");
		document.getElementById(npValue).value="";
		document.getElementById(npValue).focus();
		return ;
	}

	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(wasteValue1).value =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));

	finalRate= document.getElementById(field2).value;
	percentage = "";
	midResult= "";
	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(wasteValue2).value =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));

	finalRate= document.getElementById(field3).value;
	percentage = "";
	midResult= "";
	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(wasteValue3).value =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));

	finalRate= document.getElementById(field4).value;
	percentage = "";
	midResult= "";
	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(wasteValue4).value =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));

	/*finalRate= document.getElementById(field5).value;
	percentage = "";
	midResult= "";
	midResult =   parseFloat(finalRate).toFixed(2) /  parseInt(npRate) ;		
	percentage =  midResult.toFixed(10) * 1000;					
	document.getElementById(wasteValue5).value  =  (isNaN( percentage.toFixed(2)) ? "0.00" :  percentage.toFixed(2));*/
}

function attachmentFile(attachDetails, str){			
	var url			= "../upload/uploadFile.jsp?attachment="+attachDetails+"&str="+str;
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}

function deleteFile(fileName,dirPath,str){
	//var url = "../common/deleteFile.jsp?fileName="+fileName+"&dirPath="+dirPath+"&id=delete&requestStr="+str;
	//var url = "../common/deleteFile.jsp?id=delete";
		var url = "../common/deleteFile.jsp?fileName="+fileName+"&id=delete";
	window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=no");
}

function showCurrentFile(fileName, emailid,str,attachment){

	var url			= "/timescape/sapep/collaboration/workflow/wastesalesapproval/common/popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str="+str+"&attachment="+attachment;
	//var url			= "../includes/popupNew.jsp?str=1";
	window.location.href = url;
}

function onLoadDetail(str){	
	if(str == '0'){
		loadFragment("../common/dirListing.jsp?attachment=compulsory&str="+str,"attachment","Attachment");
		loadFragment("../common/dirListing.jsp?attachment=additional&str="+str,"attachment1","Attachment");
	}else 	{
		loadFragment("../common/dirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
		loadFragment("../common/dirListing.jsp?attachment=additional&str=1","attachment1","Attachment");
	}
}

function showDetails(requestId){									
	var frmObj	= document.forms.viewAllWasteSalesRequest;
	frmObj.action = "../common/processWSRequestDetails.jsp?requestId="+requestId;
	frmObj.submit( );
}


function showFormDetails(id)
{	
	var frmObj							= document.frmCreateWasteSalesProcess;
	var asssignzone					= document.getElementById("asssignLoc").value;

	if(asssignzone=='0')
	{
		alert("Please select proper Zone.");
		document.getElementById('asssignLoc').focus();
		return;

	}
		
	loadFragment("../user/showProcessWasteSalesRequest.jsp?asssignzone="+asssignzone,"showdata","Details");
}


function showFormDetails1(id)
{	
	var frmObj							= document.viewAllWasteSalesRequest;
	var asssignzone					= document.getElementById("asssignZone").value;

	if(asssignzone=='0')
	{
		alert("Please select proper Zone.");
		document.getElementById('asssignLoc').focus();
		return;

	}
		
	loadFragment("../approvals/showWasteDisposalNote.jsp?asssignzone="+asssignzone,"showdata","Details");
}


function showAttachmentFile(str, requestId, userEmailId, status){	
	
	//loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment","Attachment");
	loadFragment("../common/showDirListing.jsp?attachment=compulsory&str=1","attachment","Attachment");
	loadFragment("../common/showDirListing.jsp?attachment=additional&str=1","attachment1","Attachment");
	//loadFragment("../common/showDirListing.jsp?attachment=additional&str=1&requestId="+requestId+"&userEmailId="+userEmailId+"&status="+status,"attachment1","Attachment");
}

function unCheck(field){
	
	var val = 0;

	if(document.getElementById(field).checked){		
		document.getElementById(field).checked=false;	
	}

	var rowSize = document.getElementById("listSize").value;
	for(var i=0; i<rowSize; i++)
	{
		var aprTxt = 'approve'+i;
		if(document.getElementById(aprTxt).checked){		
			val++;
		}
	}
	//if(rowSize == val || val > 0){
	//	alert("rowSize---"+rowSize);
	/*if(rowSize == val){
		$("#reference").show().focus().attr("readonly", false);
		$("#approvalNote").show();
		$("#approvalNoteP").hide();

		$("#approvalNote1").show();
		$("#approvalNote1P").hide();
	}else{
		$("#approvalNote").hide();
		$("#approvalNoteP").show();

		$("#approvalNote1").hide();
		$("#approvalNote1P").show();
	}*/

	
}

function holdReview (id){
	eval("document.getElementById('"+id+"')").disabled = true;
	var reference =  document.getElementById("reference").value;
	var counter =  document.getElementById("listSize").value;
	var  counterApprovedBy= document.getElementById("counterApprovedBy").value;
	var counterSupportedBy =  document.getElementById("counterSupportedBy").value;
	var cities = ""; ; 
	var pwm ="";
	var tow ="";
	var re ="";
	var pg ="";
	var ap ="";
	var status ="";
	var appReviewRemark ="";
	var remark ="";
	var supportedBy ="";
	var approvedBy ="";
	count1=0;

	approvalNote = $("#approvalNote").val();
	approvalNote1 = $("#approvalNote1").val();

	if(approvalNote == "")
	{
		alert("Please enter the Approval Note.");
		$("#approvalNote").show().focus();
		enable(id);
		return ;
	}

	if(approvalNote1 == "")
	{
		alert("Please enter the Approval Note.");
		$("#approvalNote1").show().focus();
		enable(id);
		return ;
	}

	for (ii=0; ii < counter; ii++){
	

		if (document.getElementById("approve"+ii).checked == false && document.getElementById("review"+ii).checked == false)
		{
			//alert("Please select the action ie. Approve or Review.");
			//return false;
		}

		if (document.getElementById("approve"+ii).checked){ 		
			if (document.getElementById("approve"+ii).value == ''  || document.getElementById("approve"+ii).value ==  null){
				status = status+"NA,";
			}else {
				status = status+document.getElementById("approve"+ii).value+",";
				count1++;
			}
			
		}else{
			if (document.getElementById("review"+ii).checked){ 
				if(document.getElementById("remark"+ii).value == '' ||document.getElementById("remark"+ii).value==null)	{
					alert("Please enter remark");
					document.getElementById("remark"+ii).focus();
					enable(id);
					return false;
				}else {
					status  =status+ document.getElementById("review"+ii).value+",";
					count1++;
				}
			}
		}

		
	}

	if(count1 == 0)
	{
		alert("Please approve atleast one waste sales request to hold the document.");
		enable(id);
		return false;
	}

	for (jj = 0 ; jj < counterSupportedBy ; jj++)	{

	var chkSupportedBy = document.getElementById("supportedBy"+jj).value;
	var zonalEmailid = document.getElementById("zonalEmailid").value;

	if(chkSupportedBy == zonalEmailid)
	{
		alert("Your emailid is not valid in supportedBy."); 
		document.getElementById("supportedBy"+jj).focus();
		enable(id);
		return false;
	}

	if(chkSupportedBy == "0")
	{
			//alert("Please select or enter Approval Name.");
			//document.getElementById("supportedBy"+jj).focus();
			//return false;
	}else
		{
			supportedBy  = supportedBy+document.getElementById("supportedBy"+jj).value+",";
		}
	}

	for (kk=0 ; kk < counterApprovedBy ; kk++){

	var chkApprovedBy = document.getElementById("approvedBy"+kk).value;

	var zonalEmailid = document.getElementById("zonalEmailid").value;

	if(chkApprovedBy == zonalEmailid)
	{
		alert("Your emailid is not valid in approvedBy.");		
		document.getElementById("approvedBy"+jj).focus();
		enable(id);
		return false;
	}

	if(chkApprovedBy == "0")
		{
				//alert("Please select or enter Approval Name.");
				//document.getElementById("approvedBy"+kk).focus();
				//return false;
		}else
			{
			approvedBy  = approvedBy+document.getElementById("approvedBy"+kk).value+",";
		}
	}


	document.forms.viewAllWasteSalesRequest.action = "../approvals/holdWDNoteSubmit.jsp";
	document.forms.viewAllWasteSalesRequest.submit();
}


function submitReview (id){

	eval("document.getElementById('"+id+"')").disabled = true;
	var reference =  document.getElementById("reference").value;
	var counter =  document.getElementById("listSize").value;
	var  counterApprovedBy= document.getElementById("counterApprovedBy").value;
	var counterSupportedBy =  document.getElementById("counterSupportedBy").value;
	var cities = ""; ; 
	var pwm ="";
	var tow ="";
	var re ="";
	var pg ="";
	var ap ="";
	var status ="";
	var appReviewRemark ="";
	var remark ="";
	var supportedBy ="";
	var approvedBy ="";

	approvalNote = $("#approvalNote").val();
	approvalNote1 = $("#approvalNote1").val();

	if(approvalNote == "")
	{
		alert("Please enter the Approval Note.");
		$("#approvalNote").show().focus();
		enable(id);
		return ;
	}

	if(approvalNote1 == "")
	{
		alert("Please enter the Approval Note.");
		$("#approvalNote1").show().focus();
		enable(id);
		return ;
	}
	var apprCont = 0;

	for (ii=0; ii < counter; ii++){
	
		/*if (document.getElementById("approve"+ii).checked == false && document.getElementById("review"+ii).checked == false) //change by kavita 14-03-2016
		if (document.getElementById("approve"+ii).checked == false )
		{
			alert("Please select the action ie. Approve or Review.");
			return false;
		}*/

		if (document.getElementById("approve"+ii).checked){ 		
			if (document.getElementById("approve"+ii).value == ''  || document.getElementById("approve"+ii).value ==  null){
				status = status+"NA,";
			}else {
				status = status+document.getElementById("approve"+ii).value+",";
				apprCont = apprCont+1;
			}
		}else{
			if (document.getElementById("review"+ii).checked){ 
				if(document.getElementById("remark"+ii).value == '' ||document.getElementById("remark"+ii).value==null)	{
					alert("Please enter remark");					 //change by kavita 14-03-2016
					document.getElementById("remark"+ii).focus(); 
					enable(id);
					return false;
				}else {
					status  =status+ document.getElementById("review"+ii).value+",";
					apprCont = apprCont+1;
				}
			}
		}
	}

	if(apprCont == 0)
	{
		alert("Please approve atleast one waste sales request to submit the document.");
		enable(id);
		return false;
	}
	//added on 23032016

	if(counter == apprCont || apprCont > 0)
	{
		$("#reference").show().focus().attr("readonly", false);
		$("#approvalNote").show();
		$("#approvalNoteP").hide();

		$("#approvalNote1").show();
		$("#approvalNote1P").hide();
	}else{
		$("#approvalNote").hide();
		$("#approvalNoteP").show();

		$("#approvalNote1").hide();
		$("#approvalNote1P").show();
	}

	//added on 23032016

	for (jj = 0 ; jj < counterSupportedBy ; jj++)	{

	var chkSupportedBy = document.getElementById("supportedBy"+jj).value;
	var zonalEmailid = document.getElementById("zonalEmailid").value;

	if(chkSupportedBy == zonalEmailid)
	{
		alert("Your emailid can not be selected in Supported By."); 
		document.getElementById("supportedBy"+jj).focus();
		enable(id);
		return false;
	}

	if(chkSupportedBy == "0")
	{
			alert("Please select or enter Supported By and Approved By.");
			document.getElementById("supportedBy"+jj).focus();
			enable(id);
			return false;
	}else
		{
			supportedBy  = supportedBy+document.getElementById("supportedBy"+jj).value+",";
		}
	}


	for (kk=0 ; kk < counterApprovedBy ; kk++){

	var chkApprovedBy = document.getElementById("approvedBy"+kk).value;

	var zonalEmailid = document.getElementById("zonalEmailid").value;

	if(chkApprovedBy == zonalEmailid)
	{
		alert("Your emailid can not be selected in Approved By.");
		document.getElementById("approvedBy"+jj).focus();
		enable(id);
		return false;
	}

	if(chkApprovedBy == "0")
		{
				alert("Please select or enter Approved By.");
				document.getElementById("approvedBy"+kk).focus();
				enable(id);
				return false;
		}else
			{
			approvedBy  = approvedBy+document.getElementById("approvedBy"+kk).value+",";
		}
	}

	val = confirm("Do you want to edit a Reference and Approval Note? ");
	if(val){
		enable(id);
		return;
	}
	else{
		document.forms.viewAllWasteSalesRequest.action = "../approvals/wasteDisposalNoteSubmit.jsp";
		document.forms.viewAllWasteSalesRequest.submit();		
	}

}

function showAppForm(requestId, status){

	var frmObj	= document.forms.viewAllApprovalRequest;
//	frmObj.action = "../common/viewWasteDisposalNote.jsp?requestId="+requestId;
	frmObj.action = "../approvals/view.jsp?requestId="+requestId+"&status="+status;
	frmObj.submit( );
}


function showApprovalForm(requestId,docId,stat)
{

	//alert("docId---"+docId);
	
	if(docId == 'DOC1001')
	{
		url = "../common/viewApprovalWasteDisposalNote.jsp?requestId="+requestId;

	}else if(docId == 'DOC1002' || docId == 'DOC1003' || docId == 'DOC1004')
	{
		url =  "../approvals/viewDisposalApprovalRequests.jsp?requestId="+requestId+"&stat="+stat+"&docId="+docId;
	}

	var frmObj	= document.forms.viewAllApprovalRequest;
	frmObj.action = url;
	frmObj.submit( );
}

function submitApprovals(){

	if(document.getElementById("reference").disabled == true){
		document.getElementById("reference").disabled = false;
	}
	var counter =  document.getElementById("listSize").value;	
	var status ="";

	for (ii=0; ii < counter; ii++){
			if (document.getElementById("approve"+ii).checked){ 		
			if (document.getElementById("approve"+ii).value == ''  || document.getElementById("approve"+ii).value ==  null){
				status = status+"NA,";
			}else {
				status = status+document.getElementById("approve"+ii).value+",";
			}
		}else{
			if (document.getElementById("review"+ii).checked){ 
				if(document.getElementById("remark"+ii).value == '' ||document.getElementById("remark"+ii).value==null)	{
					alert("Please enter remark. ");
					document.getElementById("remark"+ii).focus();
					enable(id);
					return;
				}else {
					status  =status+ document.getElementById("review"+ii).value+",";
				}
			}
		}
}
	
	document.forms.viewAllWasteSalesRequest.action = "../approvals/viewWasteDisposalNoteSubmit.jsp";
	document.forms.viewAllWasteSalesRequest.submit( );
}

function showAttachedFile(fileName, emailid,str,requestId,attachment){
	

		var url			= "../includes/popupNew.jsp?fileName="+fileName+"&str=1&attachment="+attachment;

	//var url			= "popup.jsp?fileName="+fileName+"&emailid="+emailid+"&str=1&requestNo="+requestId+"&attachment="+attachment;
	//var url			= "popupNew.jsp?str=1";
	//frmObj.action = url;
	//frmObj.submit( );
	window.location.href = url;

	//window.open(url,"File","width=500,height=165, resizable=no,status=no,toolbar=no,location=no,menubar=no,scrollbars=yes");	
}



function submitZonalApprovals(){

	if(document.getElementById("reference").disabled == true){
		document.getElementById("reference").disabled = false;
	}

	approvalNote = $("#approvalNote").val();
	approvalNote1 = $("#approvalNote1").val();
	
	var counter =  document.getElementById("listSize").value;	
	var status ="";
	var apprCont = 0;
	for (ii=0; ii < counter; ii++){

		
		if (document.getElementById("approve"+ii).checked == false && document.getElementById("review"+ii).checked == false)
		{
			alert("Please select the action ie. Approve or Review.");
			enable(id);
			return false;
		}

		//document.getElementById("approve"+ii).disabled = true;
		//document.getElementById("review"+ii).disabled = true;

		if (document.getElementById("approve"+ii).checked){ 		
			if (document.getElementById("approve"+ii).value == ''  || document.getElementById("approve"+ii).value ==  null){
				status = status+"NA,";
			}else {
				status = status+document.getElementById("approve"+ii).value+",";
				apprCont = apprCont+1;
			}
		}else{
			if (document.getElementById("review"+ii).checked){ 
				if(document.getElementById("remark"+ii).value == '' ||document.getElementById("remark"+ii).value==null)	{
					alert("Please enter remark. ");
					document.getElementById("remark"+ii).focus();
					enable(id);
					return;
				}else {
					status  =status+ document.getElementById("review"+ii).value+",";
				}
			}
		}
}

if(counter == apprCont || apprCont > 0)
	{
		$("#reference").show().focus().attr("readonly", false);
		$("#approvalNote").show();
		$("#approvalNoteP").hide();

		$("#approvalNote1").show();
		$("#approvalNote1P").hide();
	}else{
		$("#approvalNote").hide();
		$("#approvalNoteP").show();

		$("#approvalNote1").hide();
		$("#approvalNote1P").show();
	}

	val = confirm("Do you want to edit a Reference and Approval Note?");
	if(val){
		enable(id);
		return;
	}
	else{
		document.forms.viewAllWasteSalesRequest.action = "../approvals/viewWasteDisposalNoteSubmit.jsp";
		document.forms.viewAllWasteSalesRequest.submit( );
	}	
}

function submitForApprovals(id){

	eval("document.getElementById('"+id+"')").disabled = true;


	if(document.getElementById("reference").disabled == true){
		document.getElementById("reference").disabled = false;
	}
	var counter =  document.getElementById("listSize").value;	
	var status ="";

	for (ii=0; ii < counter; ii++){
			if (document.getElementById("approve"+ii).checked){ 		
			if (document.getElementById("approve"+ii).value == ''  || document.getElementById("approve"+ii).value ==  null){
				status = status+"NA,";
			}else {
				status = status+document.getElementById("approve"+ii).value+",";
			}
		}else{
			if (document.getElementById("review"+ii).checked){ 
				if(document.getElementById("remark"+ii).value == '' ||document.getElementById("remark"+ii).value==null)	{
					alert("Please enter remark. ");
					document.getElementById("remark"+ii).focus();
					enable(id);
					return;
				}else {
					status  =status+ document.getElementById("review"+ii).value+",";
				}
			}
		}
} 
	
	document.forms.viewAllWasteSalesRequest.action = "../approvals/viewApprovalsWasteDisposalNoteSubmit.jsp";
	document.forms.viewAllWasteSalesRequest.submit( );
}



function closedApprovals(){
	var frmObj	= document.forms.viewAllWasteSalesRequest;
	frmObj.action = "../user/viewWSApprovals.jsp";
	frmObj.submit( );
}


function test(a,b){
	alert("hii");
	var frmObj	= document.frmCreateWasteSalesProcess;
	url = "../user/processWasteSalesSubmit.jsp"

	frmObj.action = url;
	frmObj.submit( );
}


function abc(){
	alert("hii");
	var frmObj	= document.frmCreateWasteSalesProcess;
	var stat =  document.getElementById("asssignLoc1").value;	
	alert("stat-----------"+stat);
	//url = "../user/processWasteSalesSubmit.jsp"

	
}



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
